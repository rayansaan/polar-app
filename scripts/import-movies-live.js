import { createClient } from '@supabase/supabase-js';
import axios from 'axios';

// Configuration
const TMDB_API_KEY = '106f51e20c9abaeec709f99ad73c7991';
const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p';

// Supabase avec Service Role Key (accès complet)
const SUPABASE_URL = 'https://pqyqdvpncpohelzdfdop.supabase.co';
const SUPABASE_SERVICE_ROLE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBxeXFkdnBuY3BvaGVsemRmZG9wIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTg4NzczNSwiZXhwIjoyMDg3NDYzNzM1fQ.KLt9wdzvfl4WKZtk_zJEXKEFtGw07nc8KUye2bov0TM';

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false }
});

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
  console.log(`🎬 TMDB: ${endpoint}`);
  
  try {
    const response = await axios.get(url, { timeout: 10000 });
    await delay(350); // Rate limiting
    return response.data;
  } catch (error) {
    console.error(`❌ TMDB Error: ${error.response?.status} ${error.response?.statusText}`);
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

// Check if tables exist, create them if not
async function ensureTablesExist() {
  console.log('🔧 Vérification des tables...');
  
  try {
    // Try to query movies table
    const { error } = await supabase.from('movies').select('id').limit(1);
    
    if (error && error.code === '42P01') {
      console.log('📦 Tables non trouvées, création...');
      
      // Create tables using SQL
      const { error: createError } = await supabase.rpc('exec_sql', {
        sql: `
          CREATE TABLE IF NOT EXISTS movies (
            id TEXT PRIMARY KEY DEFAULT gen_random_uuid()::text,
            title TEXT NOT NULL,
            original_title TEXT,
            year INTEGER NOT NULL,
            director TEXT NOT NULL DEFAULT '',
            writers TEXT[] DEFAULT '{}',
            duration TEXT NOT NULL DEFAULT '',
            genre TEXT[] DEFAULT '{}',
            synopsis TEXT NOT NULL DEFAULT '',
            director_bio TEXT NOT NULL DEFAULT '',
            director_photo TEXT NOT NULL DEFAULT '',
            anecdote TEXT NOT NULL DEFAULT '',
            inspiration TEXT NOT NULL DEFAULT '',
            nominations TEXT[] DEFAULT '{}',
            platforms TEXT[] DEFAULT '{}',
            poster_url TEXT NOT NULL DEFAULT '',
            hero_url TEXT NOT NULL DEFAULT '',
            locations TEXT[] DEFAULT '{}',
            type TEXT DEFAULT 'film',
            popularity INTEGER DEFAULT 0,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
          );

          CREATE TABLE IF NOT EXISTS tmdb_cache (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            movie_id TEXT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
            tmdb_id INTEGER NOT NULL UNIQUE,
            backdrop_url TEXT,
            poster_url TEXT,
            rating NUMERIC(3,1),
            vote_count INTEGER,
            tagline TEXT,
            overview TEXT,
            runtime INTEGER,
            release_date DATE,
            original_language TEXT,
            origin_country TEXT[],
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            UNIQUE(movie_id)
          );

          CREATE TABLE IF NOT EXISTS tmdb_cast (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            movie_id TEXT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
            tmdb_person_id INTEGER,
            name TEXT NOT NULL,
            character TEXT,
            profile_path TEXT,
            order_index INTEGER DEFAULT 0,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
          );

          CREATE TABLE IF NOT EXISTS tmdb_similar (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            movie_id TEXT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
            similar_tmdb_id INTEGER NOT NULL,
            title TEXT,
            poster_path TEXT,
            release_year INTEGER,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            UNIQUE(movie_id, similar_tmdb_id)
          );

          ALTER TABLE movies ENABLE ROW LEVEL SECURITY;
          ALTER TABLE tmdb_cache ENABLE ROW LEVEL SECURITY;
          ALTER TABLE tmdb_cast ENABLE ROW LEVEL SECURITY;
          ALTER TABLE tmdb_similar ENABLE ROW LEVEL SECURITY;

          CREATE POLICY IF NOT EXISTS "Public can view movies" ON movies FOR SELECT USING (true);
          CREATE POLICY IF NOT EXISTS "Public can view tmdb_cache" ON tmdb_cache FOR SELECT USING (true);
          CREATE POLICY IF NOT EXISTS "Public can view tmdb_cast" ON tmdb_cast FOR SELECT USING (true);
          CREATE POLICY IF NOT EXISTS "Public can view tmdb_similar" ON tmdb_similar FOR SELECT USING (true);

          CREATE INDEX IF NOT EXISTS idx_tmdb_cache_movie ON tmdb_cache(movie_id);
          CREATE INDEX IF NOT EXISTS idx_tmdb_cast_movie ON tmdb_cast(movie_id);
          CREATE INDEX IF NOT EXISTS idx_tmdb_similar_movie ON tmdb_similar(movie_id);
        `
      });
      
      if (createError) {
        console.error('❌ Erreur création tables:', createError);
        throw createError;
      }
      
      console.log('✅ Tables créées !');
    } else {
      console.log('✅ Tables déjà existantes');
    }
  } catch (error) {
    console.error('❌ Erreur:', error.message);
    console.log('⚠️  Essayez de créer les tables manuellement dans Supabase SQL Editor avec le fichier full-setup.sql');
  }
}

// Check if movie already exists
async function movieExists(tmdbId) {
  const { data } = await supabase
    .from('tmdb_cache')
    .select('movie_id')
    .eq('tmdb_id', tmdbId)
    .single();
  
  return data?.movie_id || null;
}

// Insert or update movie
async function insertOrUpdateMovie(movieData, updateExisting = true) {
  try {
    const existingMovieId = await movieExists(movieData.tmdb_id);
    
    if (existingMovieId && updateExisting) {
      // UPDATE
      console.log(`🔄 Mise à jour: ${movieData.title}`);
      
      // Update movies table
      await supabase.from('movies').update({
        title: movieData.title,
        original_title: movieData.original_title,
        year: movieData.year,
        director: movieData.director,
        writers: movieData.writers,
        duration: movieData.duration,
        genre: movieData.genre,
        synopsis: movieData.synopsis,
        director_photo: movieData.director_photo,
        poster_url: movieData.poster_url,
        hero_url: movieData.hero_url,
        popularity: movieData.popularity
      }).eq('id', existingMovieId);
      
      // Update cache
      await supabase.from('tmdb_cache').update({
        backdrop_url: movieData.hero_url,
        poster_url: movieData.poster_url,
        rating: movieData.rating,
        vote_count: movieData.vote_count,
        tagline: movieData.tagline,
        overview: movieData.synopsis,
        runtime: movieData.runtime,
        release_date: movieData.release_date,
        original_language: movieData.original_language,
        updated_at: new Date().toISOString()
      }).eq('movie_id', existingMovieId);
      
      // Update cast
      await supabase.from('tmdb_cast').delete().eq('movie_id', existingMovieId);
      if (movieData.cast.length > 0) {
        const castInserts = movieData.cast.map((actor, index) => ({
          movie_id: existingMovieId,
          tmdb_person_id: actor.id,
          name: actor.name,
          character: actor.character,
          profile_path: actor.profile_path,
          order_index: index
        }));
        await supabase.from('tmdb_cast').insert(castInserts);
      }
      
      // Update similar
      await supabase.from('tmdb_similar').delete().eq('movie_id', existingMovieId);
      if (movieData.similar.length > 0) {
        const similarInserts = movieData.similar.map(s => ({
          movie_id: existingMovieId,
          similar_tmdb_id: s.id,
          title: s.title,
          poster_path: s.poster_path,
          release_year: s.release_year
        }));
        await supabase.from('tmdb_similar').insert(similarInserts);
      }
      
      return { status: 'updated', id: existingMovieId };
      
    } else if (existingMovieId && !updateExisting) {
      // SKIP
      return { status: 'skipped', id: existingMovieId };
      
    } else {
      // INSERT
      console.log(`✅ Import: ${movieData.title}`);
      
      const { data: newMovie, error: insertError } = await supabase
        .from('movies')
        .insert({
          title: movieData.title,
          original_title: movieData.original_title,
          year: movieData.year,
          director: movieData.director,
          writers: movieData.writers,
          duration: movieData.duration,
          genre: movieData.genre,
          synopsis: movieData.synopsis,
          director_bio: '',
          director_photo: movieData.director_photo,
          anecdote: '',
          inspiration: '',
          nominations: [],
          platforms: [],
          poster_url: movieData.poster_url,
          hero_url: movieData.hero_url,
          locations: [],
          type: 'film',
          popularity: movieData.popularity
        })
        .select()
        .single();
      
      if (insertError || !newMovie) throw insertError || new Error('Insert failed');
      
      const movieId = newMovie.id;
      
      // Insert cache
      await supabase.from('tmdb_cache').insert({
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
        origin_country: []
      });
      
      // Insert cast
      if (movieData.cast.length > 0) {
        const castInserts = movieData.cast.map((actor, index) => ({
          movie_id: movieId,
          tmdb_person_id: actor.id,
          name: actor.name,
          character: actor.character,
          profile_path: actor.profile_path,
          order_index: index
        }));
        await supabase.from('tmdb_cast').insert(castInserts);
      }
      
      // Insert similar
      if (movieData.similar.length > 0) {
        const similarInserts = movieData.similar.map(s => ({
          movie_id: movieId,
          similar_tmdb_id: s.id,
          title: s.title,
          poster_path: s.poster_path,
          release_year: s.release_year
        }));
        await supabase.from('tmdb_similar').insert(similarInserts);
      }
      
      return { status: 'imported', id: movieId };
    }
  } catch (error) {
    console.error(`❌ Erreur ${movieData.title}:`, error.message);
    return { status: 'failed', error: error.message };
  }
}

// Main import function
async function importMovies(targetCount = 50, updateExisting = true) {
  console.log('='.repeat(60));
  console.log('🚀 IMPORT TMDB - Script Autonome');
  console.log('='.repeat(60));
  console.log(`📊 Objectif: ${targetCount} films`);
  console.log(`🔄 Mettre à jour: ${updateExisting ? 'Oui' : 'Non'}`);
  console.log('');
  
  // Ensure tables exist
  await ensureTablesExist();
  
  const results = {
    imported: 0,
    updated: 0,
    skipped: 0,
    failed: 0,
    movies: []
  };
  
  let page = 1;
  let processedCount = 0;
  
  while (processedCount < targetCount && page <= 15) {
    console.log(`\n📄 Page ${page}...`);
    const popularMovies = await getPopularMovies(page);
    
    if (popularMovies.length === 0) break;
    
    for (const popularMovie of popularMovies) {
      if (processedCount >= targetCount) break;
      
      const movieYear = parseInt(popularMovie.release_date?.split('-')[0]) || 0;
      
      // Filters
      if (movieYear > 2025) {
        console.log(`⏭️  ${popularMovie.title} (${movieYear}) - Pas encore sorti`);
        results.skipped++;
        continue;
      }
      
      if (popularMovie.popularity < 10) {
        console.log(`⏭️  ${popularMovie.title} - Popularité trop faible`);
        results.skipped++;
        continue;
      }
      
      try {
        console.log(`\n🎬 ${popularMovie.title} (${movieYear})`);
        
        // Get details
        const [details, credits, similar] = await Promise.all([
          getMovieDetails(popularMovie.id),
          getMovieCredits(popularMovie.id),
          getSimilarMovies(popularMovie.id)
        ]);
        
        // Get director and writers
        const director = credits.crew?.find(person => person.job === 'Director');
        const writers = credits.crew
          ?.filter(person => person.job === 'Writer' || person.job === 'Screenplay')
          .map(person => person.name) || [];
        
        const movieData = {
          title: popularMovie.title,
          original_title: popularMovie.original_title,
          year: movieYear,
          director: director?.name || 'Inconnu',
          writers: writers,
          duration: details.runtime ? `${Math.floor(details.runtime / 60)}h${details.runtime % 60}min` : 'N/A',
          genre: details.genres?.map(g => g.name) || [],
          synopsis: details.overview || '',
          director_photo: director?.profile_path ? getImageUrl(director.profile_path, 'w200') : '',
          popularity: Math.round(popularMovie.popularity) || 0,
          tmdb_id: popularMovie.id,
          rating: details.vote_average,
          vote_count: details.vote_count,
          tagline: details.tagline,
          runtime: details.runtime,
          release_date: details.release_date,
          original_language: details.original_language,
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
        
        const result = await insertOrUpdateMovie(movieData, updateExisting);
        results[result.status]++;
        results.movies.push({ 
          title: movieData.title, 
          status: result.status, 
          year: movieData.year 
        });
        
        if (result.status !== 'failed') {
          processedCount++;
        }
        
      } catch (error) {
        console.error(`❌ ${popularMovie.title}:`, error.message);
        results.failed++;
        results.movies.push({ 
          title: popularMovie.title, 
          status: 'failed', 
          year: movieYear 
        });
      }
      
      await delay(500);
    }
    
    page++;
  }
  
  // Summary
  console.log('\n' + '='.repeat(60));
  console.log('📊 RÉSULTAT');
  console.log('='.repeat(60));
  console.log(`✅ Importés: ${results.imported}`);
  console.log(`🔄 Mis à jour: ${results.updated}`);
  console.log(`⏭️  Ignorés: ${results.skipped}`);
  console.log(`❌ Échoués: ${results.failed}`);
  console.log(`📊 Total traités: ${results.imported + results.updated + results.skipped + results.failed}`);
  console.log('');
  console.log('🎬 Films importés:');
  results.movies
    .filter(m => m.status === 'imported')
    .forEach(m => console.log(`   ✓ ${m.title} (${m.year})`));
  
  if (results.updated > 0) {
    console.log('\n🔄 Films mis à jour:');
    results.movies
      .filter(m => m.status === 'updated')
      .forEach(m => console.log(`   ↻ ${m.title} (${m.year})`));
  }
  
  console.log('\n✨ Terminé !');
  console.log('🚀 Relancez ce script quand vous voulez avec:');
  console.log('   node scripts/import-movies-live.js [nombre] [--skip-update]');
  
  return results;
}

// Parse arguments
const args = process.argv.slice(2);
const targetCount = parseInt(args[0]) || 50;
const updateExisting = !args.includes('--skip-update');

// Run
importMovies(targetCount, updateExisting)
  .then(() => process.exit(0))
  .catch(error => {
    console.error('💥 Erreur fatale:', error);
    process.exit(1);
  });
