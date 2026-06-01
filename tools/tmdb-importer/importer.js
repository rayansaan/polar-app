import { createClient } from '@supabase/supabase-js';
import axios from 'axios';

console.log('🎬 Polar TMDB Importer v1.0');
console.log('');

// ===== CONFIGURATION =====
const CONFIG = {
  TMDB_API_KEY: '106f51e20c9abaeec709f99ad73c7991',
  SUPABASE_URL: 'https://pqyqdvpncpohelzdfdop.supabase.co',
  SUPABASE_SERVICE_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBxeXFkdnBuY3BvaGVsemRmZG9wIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTg4NzczNSwiZXhwIjoyMDg3NDYzNzM1fQ.KLt9wdzvfl4WKZtk_zJEXKEFtGw07nc8KUye2bov0TM',
  DELAY_MS: 350
};

// ===== SETUP =====
const supabase = createClient(CONFIG.SUPABASE_URL, CONFIG.SUPABASE_SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false }
});

const TMDB_BASE = 'https://api.themoviedb.org/3';
const IMG_BASE = 'https://image.tmdb.org/t/p';

// Parse args
const targetCount = parseInt(process.argv[2]) || 50;
const updateExisting = process.argv.includes('--update');

console.log(`📊 Nombre de films: ${targetCount}`);
console.log(`🔄 Mode: ${updateExisting ? 'Update' : 'Skip'}`);
console.log('');

// ===== HELPERS =====
const sleep = (ms) => new Promise(r => setTimeout(r, ms));

async function tmdb(endpoint, params = {}) {
  const qs = new URLSearchParams({ api_key: CONFIG.TMDB_API_KEY, language: 'fr-FR', ...params });
  const { data } = await axios.get(`${TMDB_BASE}${endpoint}?${qs}`, { timeout: 10000 });
  await sleep(CONFIG.DELAY_MS);
  return data;
}

const img = (path, size = 'w500') => path ? `${IMG_BASE}/${size}${path}` : '';

// ===== CHECK TABLES =====
async function checkTables() {
  console.log('🔧 Vérification des tables...');
  try {
    const { error } = await supabase.from('movies').select('id').limit(1);
    if (error && error.code === '42P01') {
      console.log('❌ Tables manquantes !');
      console.log('⚠️  Exécute d\'abord le fichier full-setup.sql dans Supabase SQL Editor');
      process.exit(1);
    }
    console.log('✅ Tables OK');
  } catch (err) {
    console.error('❌ Erreur connexion Supabase:', err.message);
    process.exit(1);
  }
}

// ===== MAIN =====
async function main() {
  await checkTables();
  
  const stats = { imported: 0, updated: 0, skipped: 0, failed: 0 };
  const movies = [];
  
  let page = 1;
  while (stats.imported + stats.updated < targetCount && page <= 10) {
    console.log(`\n📄 Page ${page}...`);
    const { results } = await tmdb('/movie/popular', { page: page.toString() });
    
    for (const movie of results) {
      if (stats.imported + stats.updated >= targetCount) break;
      
      const year = parseInt(movie.release_date?.split('-')[0]) || 0;
      if (year > 2025) { stats.skipped++; continue; }
      
      try {
        // Check existing
        const { data: existing } = await supabase
          .from('tmdb_cache')
          .select('movie_id')
          .eq('tmdb_id', movie.id)
          .single();
        
        if (existing && !updateExisting) {
          stats.skipped++;
          continue;
        }
        
        // Fetch details
        const [details, credits, similar] = await Promise.all([
          tmdb(`/movie/${movie.id}`),
          tmdb(`/movie/${movie.id}/credits`),
          tmdb(`/movie/${movie.id}/similar`).then(d => (d.results || []).slice(0, 6))
        ]);
        
        const director = credits.crew?.find(p => p.job === 'Director');
        const writers = credits.crew?.filter(p => ['Writer', 'Screenplay'].includes(p.job)).map(p => p.name) || [];
        
        const movieData = {
          title: movie.title,
          original_title: movie.original_title,
          year,
          director: director?.name || 'Inconnu',
          writers,
          duration: details.runtime ? `${Math.floor(details.runtime / 60)}h${details.runtime % 60}min` : 'N/A',
          genre: details.genres?.map(g => g.name) || [],
          synopsis: details.overview || '',
          director_photo: img(director?.profile_path, 'w200'),
          poster_url: img(details.poster_path, 'w500'),
          hero_url: img(details.backdrop_path, 'original'),
          popularity: Math.round(movie.popularity) || 0,
          tmdb_id: movie.id,
          rating: details.vote_average,
          vote_count: details.vote_count,
          tagline: details.tagline,
          runtime: details.runtime,
          release_date: details.release_date,
          original_language: details.original_language
        };
        
        const cast = credits.cast?.slice(0, 10).map((a, i) => ({
          tmdb_person_id: a.id,
          name: a.name,
          character: a.character,
          profile_path: img(a.profile_path, 'w200'),
          order_index: i
        })) || [];
        
        const similars = similar.map(s => ({
          similar_tmdb_id: s.id,
          title: s.title,
          poster_path: img(s.poster_path, 'w200'),
          release_year: s.release_date ? parseInt(s.release_date.split('-')[0]) : null
        }));
        
        let movieId;
        
        if (existing && updateExisting) {
          // UPDATE
          movieId = existing.movie_id;
          await supabase.from('movies').update({
            title: movieData.title, original_title: movieData.original_title, year: movieData.year,
            director: movieData.director, writers: movieData.writers, duration: movieData.duration,
            genre: movieData.genre, synopsis: movieData.synopsis, director_photo: movieData.director_photo,
            poster_url: movieData.poster_url, hero_url: movieData.hero_url, popularity: movieData.popularity
          }).eq('id', movieId);
          
          await supabase.from('tmdb_cache').update({
            backdrop_url: movieData.hero_url, poster_url: movieData.poster_url,
            rating: movieData.rating, vote_count: movieData.vote_count,
            tagline: movieData.tagline, overview: movieData.synopsis,
            runtime: movieData.runtime, release_date: movieData.release_date,
            original_language: movieData.original_language
          }).eq('movie_id', movieId);
          
          await supabase.from('tmdb_cast').delete().eq('movie_id', movieId);
          await supabase.from('tmdb_similar').delete().eq('movie_id', movieId);
          
          stats.updated++;
          console.log(`🔄 ${movie.title}`);
        } else if (!existing) {
          // INSERT
          const { data: inserted, error: insertErr } = await supabase.from('movies').insert({
            title: movieData.title, original_title: movieData.original_title, year: movieData.year,
            director: movieData.director, writers: movieData.writers, duration: movieData.duration,
            genre: movieData.genre, synopsis: movieData.synopsis, director_photo: movieData.director_photo,
            poster_url: movieData.poster_url, hero_url: movieData.hero_url, popularity: movieData.popularity,
            director_bio: '', anecdote: '', inspiration: '', nominations: [], platforms: [], locations: []
          }).select().single();
          
          if (insertErr || !inserted) {
            throw new Error(insertErr?.message || 'Insert returned null');
          }
          
          movieId = inserted.id;
          
          await supabase.from('tmdb_cache').insert({
            movie_id: movieId, tmdb_id: movieData.tmdb_id, backdrop_url: movieData.hero_url,
            poster_url: movieData.poster_url, rating: movieData.rating, vote_count: movieData.vote_count,
            tagline: movieData.tagline, overview: movieData.synopsis, runtime: movieData.runtime,
            release_date: movieData.release_date, original_language: movieData.original_language
          });
          
          stats.imported++;
          console.log(`✅ ${movie.title}`);
        }
        
        // Insert cast and similar
        if (cast.length > 0) {
          await supabase.from('tmdb_cast').insert(cast.map(c => ({ ...c, movie_id: movieId })));
        }
        if (similars.length > 0) {
          await supabase.from('tmdb_similar').insert(similars.map(s => ({ ...s, movie_id: movieId })));
        }
        
        movies.push({ title: movie.title, year, status: existing ? 'updated' : 'imported' });
        
      } catch (err) {
        stats.failed++;
        console.log(`❌ ${movie.title}: ${err.message}`);
      }
    }
    
    page++;
  }
  
  // Summary
  console.log('\n' + '='.repeat(50));
  console.log('✨ TERMINÉ !');
  console.log('='.repeat(50));
  console.log(`✅ Importés: ${stats.imported}`);
  console.log(`🔄 Mis à jour: ${stats.updated}`);
  console.log(`⏭️  Ignorés: ${stats.skipped}`);
  console.log(`❌ Échoués: ${stats.failed}`);
  console.log('');
  
  if (movies.length > 0) {
    console.log('🎬 Films:');
    movies.forEach(m => console.log(`   ${m.status === 'imported' ? '✅' : '🔄'} ${m.title} (${m.year})`));
  }
}

main().catch(err => {
  console.error('💥 Erreur fatale:', err);
  process.exit(1);
});
