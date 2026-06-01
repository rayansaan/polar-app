import axios from 'axios';
import * as cheerio from 'cheerio';
import fs from 'fs';
import path from 'path';

// Configuration
const TMDB_API_KEY = '106f51e20c9abaeec709f99ad73c7991';
const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p';

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
    const response = await axios.get(url, { timeout: 10000 });
    await delay(350);
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

// Generate UUID
function generateUUID() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    const r = Math.random() * 16 | 0;
    const v = c === 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

// Escape SQL string
function escapeSql(str) {
  if (!str) return '';
  return str.replace(/'/g, "''").replace(/\\/g, '\\\\');
}

// Generate SQL for a movie
function generateMovieSQL(movieData) {
  const movieId = generateUUID();
  const cacheId = generateUUID();
  
  let sql = `-- Movie: ${movieData.title}\n`;
  sql += `BEGIN;\n\n`;
  
  // Insert movie
  sql += `INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)\n`;
  sql += `VALUES ('${movieId}', '${escapeSql(movieData.title)}', ${movieData.original_title ? `'${escapeSql(movieData.original_title)}'` : 'NULL'}, ${movieData.year}, '${escapeSql(movieData.director)}', ARRAY[${movieData.writers.map(w => `'${escapeSql(w)}'`).join(', ')}], '${escapeSql(movieData.duration)}', ARRAY[${movieData.genre.map(g => `'${escapeSql(g)}'`).join(', ')}], '${escapeSql(movieData.synopsis)}', '${escapeSql(movieData.director_bio)}', '${escapeSql(movieData.director_photo)}', '${escapeSql(movieData.anecdote)}', '${escapeSql(movieData.inspiration)}', ARRAY[]::text[], ARRAY[]::text[], '${escapeSql(movieData.poster_url)}', '${escapeSql(movieData.hero_url)}', ARRAY[${movieData.locations.map(l => `'${escapeSql(l)}'`).join(', ')}], 'film', ${movieData.popularity}, NOW());\n\n`;
  
  // Insert TMDB cache
  sql += `INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)\n`;
  sql += `VALUES ('${cacheId}', '${movieId}', ${movieData.tmdb_id}, ${movieData.hero_url ? `'${escapeSql(movieData.hero_url)}'` : 'NULL'}, ${movieData.poster_url ? `'${escapeSql(movieData.poster_url)}'` : 'NULL'}, ${movieData.rating || 'NULL'}, ${movieData.vote_count || 'NULL'}, ${movieData.tagline ? `'${escapeSql(movieData.tagline)}'` : 'NULL'}, '${escapeSql(movieData.synopsis)}', ${movieData.runtime || 'NULL'}, ${movieData.release_date ? `'${movieData.release_date}'` : 'NULL'}, ${movieData.original_language ? `'${movieData.original_language}'` : 'NULL'}, ARRAY[]::text[], NOW());\n\n`;
  
  // Insert cast
  if (movieData.cast && movieData.cast.length > 0) {
    movieData.cast.forEach((actor, index) => {
      const castId = generateUUID();
      sql += `INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)\n`;
      sql += `VALUES ('${castId}', '${movieId}', ${actor.id}, '${escapeSql(actor.name)}', ${actor.character ? `'${escapeSql(actor.character)}'` : 'NULL'}, ${actor.profile_path ? `'${escapeSql(actor.profile_path)}'` : 'NULL'}, ${index}, NOW());\n`;
    });
    sql += `\n`;
  }
  
  // Insert similar movies
  if (movieData.similar && movieData.similar.length > 0) {
    movieData.similar.forEach(similar => {
      const similarId = generateUUID();
      sql += `INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)\n`;
      sql += `VALUES ('${similarId}', '${movieId}', ${similar.id}, ${similar.title ? `'${escapeSql(similar.title)}'` : 'NULL'}, ${similar.poster_path ? `'${escapeSql(similar.poster_path)}'` : 'NULL'}, ${similar.release_year || 'NULL'}, NOW());\n`;
    });
    sql += `\n`;
  }
  
  sql += `COMMIT;\n\n`;
  
  return { sql, movieId, title: movieData.title };
}

// Main import function
async function generateSQL(targetCount = 50) {
  console.log('🚀 Generating SQL for movie import...\n');
  
  const sqlStatements = [];
  const importedMovies = [];
  const failedMovies = [];
  let page = 1;
  
  // Add header
  let finalSQL = `-- ==========================================\n`;
  finalSQL += `-- POLAR APP - MOVIE IMPORT SQL\n`;
  finalSQL += `-- Generated: ${new Date().toISOString()}\n`;
  finalSQL += `-- Target: ${targetCount} popular movies from TMDB\n`;
  finalSQL += `-- ==========================================\n\n`;
  finalSQL += `-- WARNING: Run this in Supabase SQL Editor\n`;
  finalSQL += `-- This will insert ${targetCount} movies with TMDB data\n\n`;
  finalSQL += `-- First, clear existing data if needed:\n`;
  finalSQL += `-- DELETE FROM tmdb_similar; DELETE FROM tmdb_cast; DELETE FROM tmdb_cache; DELETE FROM movies;\n\n`;
  
  while (importedMovies.length < targetCount && page <= 10) {
    console.log(`\n📄 Fetching popular movies page ${page}...`);
    const popularMovies = await getPopularMovies(page);
    
    if (popularMovies.length === 0) break;
    
    for (const popularMovie of popularMovies) {
      if (importedMovies.length >= targetCount) break;
      
      console.log(`\n🎬 Processing: ${popularMovie.title} (${popularMovie.release_date?.split('-')[0]})`);
      
      try {
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
          anecdote: '',
          inspiration: '',
          locations: [],
          popularity: popularMovie.popularity || 0,
          tmdb_id: popularMovie.id,
          rating: details.vote_average,
          vote_count: details.vote_count,
          tagline: details.tagline,
          runtime: details.runtime,
          release_date: details.release_date,
          original_language: details.original_language,
          origin_country: details.origin_country || [],
          poster_url: getImageUrl(details.poster_path, 'w500') || '',
          hero_url: getImageUrl(details.backdrop_path, 'original') || '',
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
        
        // Generate SQL
        const { sql, movieId, title } = generateMovieSQL(movieData);
        sqlStatements.push(sql);
        
        importedMovies.push({ id: movieId, title, tmdbId: movieData.tmdb_id });
        console.log(`✅ Generated SQL for: ${title}`);
        
      } catch (error) {
        console.error(`❌ Failed to process ${popularMovie.title}:`, error.message);
        failedMovies.push({ title: popularMovie.title, reason: error.message });
      }
      
      await delay(500);
    }
    
    page++;
  }
  
  // Combine all SQL
  finalSQL += sqlStatements.join('');
  
  // Add footer
  finalSQL += `-- ==========================================\n`;
  finalSQL += `-- IMPORT SUMMARY\n`;
  finalSQL += `-- Successfully processed: ${importedMovies.length} movies\n`;
  finalSQL += `-- Failed: ${failedMovies.length} movies\n`;
  finalSQL += `-- ==========================================\n`;
  
  // Write to file
  const outputPath = path.join(process.cwd(), 'movies-import.sql');
  fs.writeFileSync(outputPath, finalSQL);
  
  console.log('\n' + '='.repeat(60));
  console.log('📊 GENERATION SUMMARY');
  console.log('='.repeat(60));
  console.log(`✅ Successfully generated SQL for: ${importedMovies.length} movies`);
  console.log(`❌ Failed: ${failedMovies.length} movies`);
  console.log(`\n📁 SQL file saved to: ${outputPath}`);
  console.log(`📏 File size: ${(fs.statSync(outputPath).size / 1024).toFixed(2)} KB`);
  
  if (failedMovies.length > 0) {
    console.log('\n❌ Failed movies:');
    failedMovies.forEach(m => console.log(`  - ${m.title}: ${m.reason}`));
  }
  
  console.log('\n🎬 Movies to be imported:');
  importedMovies.forEach(m => console.log(`  - ${m.title}`));
  
  console.log('\n✅ Next steps:');
  console.log('1. Open Supabase Dashboard');
  console.log('2. Go to SQL Editor');
  console.log('3. Copy the content of movies-import.sql');
  console.log('4. Run the SQL');
  console.log('5. Check your app - movies should appear!');
  
  return { imported: importedMovies, failed: failedMovies, filePath: outputPath };
}

// Run the generation
generateSQL(50)
  .then(() => {
    console.log('\n✨ SQL generation complete!');
    process.exit(0);
  })
  .catch(error => {
    console.error('\n💥 Fatal error:', error);
    process.exit(1);
  });
