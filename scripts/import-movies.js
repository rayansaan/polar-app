import { createClient } from '@supabase/supabase-js';
import axios from 'axios';
import * as cheerio from 'cheerio';

// Configuration
const TMDB_API_KEY = '106f51e20c9abaeec709f99ad73c7991';
const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p';
const SUPABASE_URL = 'https://pqyqdvpncpohelzdfdop.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFweXFkdnBuY3BvaGVsemRmZG9wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4ODc3MzUsImV4cCI6MjA4NzQ2MzczNX0.YwFnf0jl2hFN03r6tv3CSjpHuoZ34PLWypmvscZzXAM';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Delay function
const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

// TMDB API helper
async function tmdbFetch(endpoint, params = {}) {
  const queryParams = new URLSearchParams({
    api_key: TMDB_API_KEY,
    language: 'fr-FR',
    ...params
  });
  
  const url = `${TMDB_BASE_URL}${endpoint}?${queryParams}`;
  console.log(`🎬 TMDB API: ${endpoint}`);
  
  try {
    const response = await axios.get(url);
    await delay(350); // Respect rate limits
    return response.data;
  } catch (error) {
    console.error(`❌ TMDB Error ${endpoint}:`, error.response?.status, error.response?.statusText);
    throw error;
  }
}

// Get image URL
function getImageUrl(path, size = 'w500') {
  if (!path) return null;
  return `${TMDB_IMAGE_BASE_URL}/${size}${path}`;
}

// Fetch popular movies
async function getPopularMovies(page = 1) {
  const data = await tmdbFetch('/movie/popular', { page: page.toString() });
  return data.results || [];
}

// Fetch movie details
async function getMovieDetails(tmdbId) {
  return tmdbFetch(`/movie/${tmdbId}`);
}

// Fetch movie credits
async function getMovieCredits(tmdbId) {
  return tmdbFetch(`/movie/${tmdbId}/credits`);
}

// Fetch similar movies
async function getSimilarMovies(tmdbId) {
  const data = await tmdbFetch(`/movie/${tmdbId}/similar`);
  return (data.results || []).slice(0, 6);
}

// Try to scrape Wikipedia for filming locations and trivia
async function scrapeWikipedia(movieTitle, year) {
  console.log(`🔍 Wikipedia search: ${movieTitle}`);
  
  try {
    // Search for the Wikipedia page
    const searchQuery = encodeURIComponent(`${movieTitle} film ${year}`);
    const searchUrl = `https://fr.wikipedia.org/w/api.php?action=opensearch&search=${searchQuery}&limit=1&namespace=0&format=json&origin=*`;
    
    const searchResponse = await axios.get(searchUrl, { timeout: 5000 });
    const searchResults = searchResponse.data;
    
    if (!searchResults[1] || searchResults[1].length === 0) {
      // Try English Wikipedia
      const enSearchUrl = `https://en.wikipedia.org/w/api.php?action=opensearch&search=${encodeURIComponent(movieTitle + ' film')}&limit=1&namespace=0&format=json&origin=*`;
      const enSearchResponse = await axios.get(enSearchUrl, { timeout: 5000 });
      const enResults = enSearchResponse.data;
      
      if (!enResults[1] || enResults[1].length === 0) {
        return { locations: [], anecdotes: '', inspiration: '' };
      }
      
      return await scrapeWikipediaPage(enResults[3][0], 'en');
    }
    
    return await scrapeWikipediaPage(searchResults[3][0], 'fr');
  } catch (error) {
    console.log(`⚠️ Wikipedia error for ${movieTitle}:`, error.message);
    return { locations: [], anecdotes: '', inspiration: '' };
  }
}

// Scrape a specific Wikipedia page
async function scrapeWikipediaPage(url, lang) {
  try {
    const response = await axios.get(url, { 
      timeout: 10000,
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
      }
    });
    
    const $ = cheerio.load(response.data);
    const locations = [];
    let anecdotes = '';
    let inspiration = '';
    
    // Try to find filming locations section
    const sectionTitles = ['Tournage', 'Production', 'Réalisation', 'Filming locations', 'Production', 'Filming'];
    
    $('h2, h3').each((i, elem) => {
      const text = $(elem).text().trim();
      
      if (sectionTitles.some(title => text.includes(title))) {
        let nextElem = $(elem).next();
        let sectionText = '';
        
        while (nextElem.length && !nextElem.is('h2, h3')) {
          sectionText += nextElem.text() + ' ';
          nextElem = nextElem.next();
        }
        
        // Extract location mentions
        const locationMatches = sectionText.match(/[A-Z][a-zÀ-ÿ]+(?:\s[A-Z][a-zÀ-ÿ]+)*/g);
        if (locationMatches) {
          const filteredLocations = locationMatches.filter(loc => 
            loc.length > 3 && 
            !['Tournage', 'Production', 'Réalisation', 'Film', 'Movie'].includes(loc)
          );
          locations.push(...filteredLocations.slice(0, 5));
        }
        
        if (text.includes('Tournage') || text.includes('Production') || text.includes('Filming')) {
          anecdotes = sectionText.substring(0, 500);
        }
      }
    });
    
    return {
      locations: [...new Set(locations)].slice(0, 5),
      anecdotes: anecdotes,
      inspiration: ''
    };
  } catch (error) {
    console.log(`⚠️ Error scraping ${url}:`, error.message);
    return { locations: [], anecdotes: '', inspiration: '' };
  }
}

// Check if movie already exists
async function movieExists(tmdbId) {
  const { data } = await supabase
    .from('tmdb_cache')
    .select('movie_id')
    .eq('tmdb_id', tmdbId)
    .single();
  
  return !!data;
}

// Insert movie into database
async function insertMovie(movieData) {
  try {
    // Insert into movies table
    const { data: movie, error: movieError } = await supabase
      .from('movies')
      .insert({
        title: movieData.title,
        original_title: movieData.original_title,
        year: movieData.year,
        director: movieData.director,
        writers: movieData.writers || [],
        duration: movieData.duration,
        genre: movieData.genre || [],
        synopsis: movieData.synopsis || '',
        director_bio: movieData.director_bio || '',
        director_photo: movieData.director_photo || '',
        anecdote: movieData.anecdote || '',
        inspiration: movieData.inspiration || '',
        nominations: movieData.nominations || [],
        platforms: movieData.platforms || [],
        poster_url: movieData.poster_url || '',
        hero_url: movieData.hero_url || '',
        locations: movieData.locations || [],
        type: 'film',
        popularity: movieData.popularity || 0
      })
      .select()
      .single();
    
    if (movieError) {
      console.error('❌ Error inserting movie:', movieError);
      return null;
    }
    
    const movieId = movie.id;
    
    // Insert TMDB cache
    const { error: cacheError } = await supabase
      .from('tmdb_cache')
      .insert({
        movie_id: movieId,
        tmdb_id: movieData.tmdb_id,
        backdrop_url: movieData.hero_url,
        poster_url: movieData.poster_url,
        rating: movieData.rating,
        vote_count: movieData.vote_count,
        tagline: movieData.tagline,
        overview: movieData.synopsis,
        runtime: movieData.runtime,
        release_date: movieData.release_date,
        original_language: movieData.original_language,
        origin_country: movieData.origin_country || [],
        updated_at: new Date().toISOString()
      });
    
    if (cacheError) {
      console.error('❌ Error inserting TMDB cache:', cacheError);
    }
    
    // Insert cast
    if (movieData.cast && movieData.cast.length > 0) {
      const castInserts = movieData.cast.map((actor, index) => ({
        movie_id: movieId,
        tmdb_person_id: actor.id,
        name: actor.name,
        character: actor.character,
        profile_path: actor.profile_path,
        order_index: index
      }));
      
      const { error: castError } = await supabase.from('tmdb_cast').insert(castInserts);
      if (castError) {
        console.error('❌ Error inserting cast:', castError);
      }
    }
    
    // Insert similar movies
    if (movieData.similar && movieData.similar.length > 0) {
      const similarInserts = movieData.similar.map(similar => ({
        movie_id: movieId,
        similar_tmdb_id: similar.id,
        title: similar.title,
        poster_path: similar.poster_path,
        release_year: similar.release_year
      }));
      
      const { error: similarError } = await supabase.from('tmdb_similar').insert(similarInserts);
      if (similarError) {
        console.error('❌ Error inserting similar movies:', similarError);
      }
    }
    
    return movieId;
  } catch (error) {
    console.error('❌ Fatal error inserting movie:', error);
    return null;
  }
}

// Main import function
async function importMovies(targetCount = 50) {
  console.log('🚀 Starting movie import...\n');
  
  const importedMovies = [];
  const failedMovies = [];
  let page = 1;
  
  while (importedMovies.length < targetCount && page <= 10) {
    console.log(`\n📄 Fetching popular movies page ${page}...`);
    const popularMovies = await getPopularMovies(page);
    
    if (popularMovies.length === 0) break;
    
    for (const popularMovie of popularMovies) {
      if (importedMovies.length >= targetCount) break;
      
      console.log(`\n🎬 Processing: ${popularMovie.title} (${popularMovie.release_date?.split('-')[0]})`);
      
      try {
        // Check if already exists
        if (await movieExists(popularMovie.id)) {
          console.log(`⏭️  Already exists, skipping...`);
          continue;
        }
        
        // Get full details
        const details = await getMovieDetails(popularMovie.id);
        const credits = await getMovieCredits(popularMovie.id);
        const similar = await getSimilarMovies(popularMovie.id);
        
        // Get director
        const director = credits.crew?.find(person => person.job === 'Director');
        
        // Get writers
        const writers = credits.crew
          ?.filter(person => person.job === 'Writer' || person.job === 'Screenplay')
          .map(person => person.name) || [];
        
        // Scrape Wikipedia for extra info
        const wikiData = await scrapeWikipedia(
          popularMovie.title, 
          parseInt(popularMovie.release_date?.split('-')[0])
        );
        
        // Prepare movie data
        const movieData = {
          title: popularMovie.title,
          original_title: popularMovie.original_title,
          year: parseInt(popularMovie.release_date?.split('-')[0]) || 0,
          director: director?.name || 'Inconnu',
          writers: writers,
          duration: details.runtime ? `${Math.floor(details.runtime / 60)}h${details.runtime % 60}min` : 'N/A',
          genre: details.genres?.map(g => g.name) || [],
          synopsis: details.overview || '',
          director_bio: '',
          director_photo: director?.profile_path ? getImageUrl(director.profile_path, 'w200') : '',
          anecdote: wikiData.anecdotes,
          inspiration: wikiData.inspiration,
          nominations: [],
          platforms: [],
          poster_url: getImageUrl(details.poster_path, 'w500') || '',
          hero_url: getImageUrl(details.backdrop_path, 'original') || '',
          locations: wikiData.locations,
          popularity: popularMovie.popularity || 0,
          tmdb_id: popularMovie.id,
          rating: details.vote_average,
          vote_count: details.vote_count,
          tagline: details.tagline,
          runtime: details.runtime,
          release_date: details.release_date,
          original_language: details.original_language,
          origin_country: details.origin_country || [],
          cast: credits.cast?.slice(0, 10).map(actor => ({
            id: actor.id,
            name: actor.name,
            character: actor.character,
            profile_path: getImageUrl(actor.profile_path, 'w200')
          })) || [],
          similar: similar.map(s => ({
            id: s.id,
            title: s.title,
            poster_path: getImageUrl(s.poster_path, 'w200'),
            release_year: s.release_date ? parseInt(s.release_date.split('-')[0]) : null
          }))
        };
        
        // Insert into database
        const movieId = await insertMovie(movieData);
        
        if (movieId) {
          importedMovies.push({
            id: movieId,
            title: movieData.title,
            tmdbId: movieData.tmdb_id
          });
          console.log(`✅ Imported: ${movieData.title} (ID: ${movieId})`);
        } else {
          failedMovies.push({ title: movieData.title, reason: 'Database insertion failed' });
        }
        
      } catch (error) {
        console.error(`❌ Failed to process ${popularMovie.title}:`, error.message);
        failedMovies.push({ title: popularMovie.title, reason: error.message });
      }
      
      // Delay between movies
      await delay(500);
    }
    
    page++;
  }
  
  // Summary
  console.log('\n' + '='.repeat(60));
  console.log('📊 IMPORT SUMMARY');
  console.log('='.repeat(60));
  console.log(`✅ Successfully imported: ${importedMovies.length} movies`);
  console.log(`❌ Failed: ${failedMovies.length} movies`);
  
  if (failedMovies.length > 0) {
    console.log('\n❌ Failed movies:');
    failedMovies.forEach(m => console.log(`  - ${m.title}: ${m.reason}`));
  }
  
  console.log('\n🎬 Imported movies:');
  importedMovies.forEach(m => console.log(`  - ${m.title}`));
  
  return { imported: importedMovies, failed: failedMovies };
}

// Run the import
importMovies(50)
  .then(() => {
    console.log('\n✨ Import complete!');
    process.exit(0);
  })
  .catch(error => {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
  });
