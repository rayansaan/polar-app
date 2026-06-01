const axios = require('axios');
const fs = require('fs');
const path = require('path');

// Configuration
const TMDB_API_KEY = process.env.TMDB_API_KEY || '106f51e20c9abaeec709f99ad73c7991';
const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p';

// Liste des films à enrichir (tmdb_id, title)
const moviesToEnrich = [
  { tmdbId: 603, title: 'Matrix', demoId: 'demo-matrix' },
  { tmdbId: 27205, title: 'Inception', demoId: 'demo-inception' },
  { tmdbId: 680, title: 'Pulp Fiction', demoId: 'demo-pulp-fiction' },
  { tmdbId: 238, title: 'Le Parrain', demoId: 'demo-le-parrain' },
  { tmdbId: 550, title: 'Fight Club', demoId: 'demo-fight-club' },
  { tmdbId: 278, title: 'Les Évadés', demoId: 'demo-les-evades' },
  { tmdbId: 13, title: 'Forrest Gump', demoId: 'demo-forrest-gump' },
  { tmdbId: 8587, title: 'Le Roi Lion', demoId: 'demo-le-lion' },
  { tmdbId: 597, title: 'Titanic', demoId: 'demo-titanic' },
  { tmdbId: 157336, title: 'Interstellar', demoId: 'demo-interstellar' },
  { tmdbId: 120, title: 'Le Seigneur des Anneaux', demoId: 'demo-sda' },
  { tmdbId: 11, title: 'Star Wars', demoId: 'demo-star-wars' },
  { tmdbId: 429, title: 'Le Bon la Brute et le Truand', demoId: 'demo-good-bad-ugly' },
  { tmdbId: 98, title: 'Gladiator', demoId: 'demo-gladiator' },
  { tmdbId: 274, title: 'Le Silence des Agneaux', demoId: 'demo-silence-lambs' },
  { tmdbId: 807, title: 'Se7en', demoId: 'demo-se7en' },
  { tmdbId: 18, title: 'Le Cinquième Élément', demoId: 'demo-fifth-element' },
  { tmdbId: 424, title: 'La Liste de Schindler', demoId: 'demo-schindler' },
  { tmdbId: 105, title: 'Retour vers le Futur', demoId: 'demo-back-to-future' },
  { tmdbId: 329, title: 'Jurassic Park', demoId: 'demo-jurassic-park' },
  { tmdbId: 280, title: 'Terminator 2', demoId: 'demo-terminator-2' },
  { tmdbId: 679, title: 'Aliens', demoId: 'demo-aliens' },
  { tmdbId: 694, title: 'Shining', demoId: 'demo-shining' },
  { tmdbId: 168, title: 'Reservoir Dogs', demoId: 'demo-reservoir-dogs' },
  { tmdbId: 24, title: 'Kill Bill', demoId: 'demo-kill-bill' },
  { tmdbId: 313369, title: 'La La Land', demoId: 'demo-lalaland' },
  { tmdbId: 244786, title: 'Whiplash', demoId: 'demo-whiplash' },
  { tmdbId: 496243, title: 'Parasite', demoId: 'demo-parasite' },
  { tmdbId: 530915, title: '1917', demoId: 'demo-1917' },
  { tmdbId: 438631, title: 'Dune', demoId: 'demo-dune' },
  { tmdbId: 872585, title: 'Oppenheimer', demoId: 'demo-oppenheimer' },
  { tmdbId: 346698, title: 'Barbie', demoId: 'demo-barbie' },
  { tmdbId: 324857, title: 'Spider-Man: New Generation', demoId: 'demo-spiderverse' },
  { tmdbId: 354912, title: 'Coco', demoId: 'demo-coco' },
  { tmdbId: 10681, title: 'WALL·E', demoId: 'demo-wall-e' },
  { tmdbId: 129, title: 'Le Voyage de Chihiro', demoId: 'demo-chihiro' },
];

// Delay function
const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

// Fetch from TMDB
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

// Enrich a single movie
async function enrichMovie(movieInfo) {
  console.log(`\n🎬 Enriching: ${movieInfo.title} (TMDB ID: ${movieInfo.tmdbId})`);
  
  try {
    // Get movie details
    const details = await tmdbFetch(`/movie/${movieInfo.tmdbId}`);
    
    // Get credits
    const credits = await tmdbFetch(`/movie/${movieInfo.tmdbId}/credits`);
    
    // Get similar movies
    const similar = await tmdbFetch(`/movie/${movieInfo.tmdbId}/similar`);
    
    // Get watch providers
    const providers = await tmdbFetch(`/movie/${movieInfo.tmdbId}/watch/providers`);
    
    // Process cast (top 10)
    const cast = [];
    for (const actor of credits.cast.slice(0, 10)) {
      // Get person details for bio and photo
      let personDetails = {};
      try {
        personDetails = await tmdbFetch(`/person/${actor.id}`);
      } catch (e) {
        console.log(`⚠️  Could not fetch details for ${actor.name}`);
      }
      
      cast.push({
        id: actor.id.toString(),
        name: actor.name,
        role: actor.character,
        photoUrl: getImageUrl(actor.profile_path, 'w200') || '',
        bio: personDetails.biography ? personDetails.biography.substring(0, 200) + '...' : ''
      });
    }
    
    // Process similar movies (top 5)
    const similarMovies = similar.results.slice(0, 5).map(m => ({
      id: `demo-${m.id}`,
      title: m.title,
      year: m.release_date ? parseInt(m.release_date.split('-')[0]) : 0,
      posterUrl: getImageUrl(m.poster_path, 'w500') || ''
    }));
    
    // Process watch providers (FR)
    const platforms = [];
    const frProviders = providers.results?.FR;
    if (frProviders) {
      if (frProviders.flatrate) {
        frProviders.flatrate.forEach(p => {
          platforms.push(p.provider_name);
        });
      }
    }
    
    // Get director
    const director = credits.crew.find(p => p.job === 'Director');
    
    // Get director bio
    let directorBio = '';
    if (director) {
      try {
        const directorDetails = await tmdbFetch(`/person/${director.id}`);
        directorBio = directorDetails.biography ? 
          directorDetails.biography.substring(0, 300) + '...' : '';
      } catch (e) {
        console.log(`⚠️  Could not fetch director bio for ${director.name}`);
      }
    }
    
    return {
      id: movieInfo.demoId,
      title: details.title,
      year: parseInt(details.release_date?.split('-')[0]) || 0,
      director: director?.name || 'Inconnu',
      writers: credits.crew
        .filter(p => p.job === 'Writer' || p.job === 'Screenplay')
        .map(p => p.name),
      duration: details.runtime ? `${Math.floor(details.runtime / 60)}h${details.runtime % 60}min` : 'N/A',
      genre: details.genres?.map(g => g.name) || [],
      synopsis: details.overview || '',
      directorBio: directorBio,
      directorPhoto: director ? getImageUrl(director.profile_path, 'w200') || '' : '',
      posterUrl: getImageUrl(details.poster_path, 'w500') || '',
      heroUrl: getImageUrl(details.backdrop_path, 'original') || '',
      cast: cast,
      similarMovies: similarMovies,
      platforms: platforms,
      tmdbId: details.id,
      tmdbRating: details.vote_average,
      tmdbVoteCount: details.vote_count,
      tmdbTagline: details.tagline,
    };
    
  } catch (error) {
    console.error(`❌ Failed to enrich ${movieInfo.title}:`, error.message);
    return null;
  }
}

// Main function
async function main() {
  console.log('🚀 Starting movie enrichment...\n');
  console.log(`📊 Movies to process: ${moviesToEnrich.length}`);
  
  const enrichedMovies = [];
  
  for (const movieInfo of moviesToEnrich) {
    const enriched = await enrichMovie(movieInfo);
    if (enriched) {
      enrichedMovies.push(enriched);
    }
  }
  
  // Generate output
  const output = `import type { EnrichedMovie } from '../types/enriched';\n\nexport const demoMovies: EnrichedMovie[] = ${JSON.stringify(enrichedMovies, null, 2)};\n\nexport default demoMovies;`;
  
  // Write to file
  const outputPath = path.join(__dirname, '..', '..', 'src', 'data', 'demoMovies-auto.ts');
  fs.writeFileSync(outputPath, output);
  
  console.log('\n✅ Enrichment complete!');
  console.log(`📁 Output saved to: ${outputPath}`);
  console.log(`🎬 Successfully enriched: ${enrichedMovies.length} movies`);
  
  // Summary
  console.log('\n📊 Summary:');
  enrichedMovies.forEach(m => {
    console.log(`  ✅ ${m.title} (${m.year}) - ${m.cast.length} actors, ${m.similarMovies?.length || 0} similar movies`);
  });
}

main().catch(console.error);
