import { supabase } from '../lib/supabase';
import { demoMovies } from '../data/demoMovies';
import type { EnrichedMovie } from '../types/enriched';

let useDemoData = false;

export async function getMoviesWithFallback(limit: number = 10, offset: number = 0): Promise<EnrichedMovie[]> {
  try {
    // Essayer de récupérer depuis Supabase
    const { data: movies, error } = await supabase
      .from('movies')
      .select(`
        *,
        tmdb_cache:tmdb_cache(*)
      `)
      .order('popularity', { ascending: false })
      .range(offset, offset + limit - 1);

    if (error) {
      console.warn('Erreur Supabase, utilisation des données démo:', error.message);
      useDemoData = true;
      return demoMovies.slice(offset, offset + limit);
    }

    if (!movies || movies.length === 0) {
      console.log('Aucun film dans Supabase, utilisation des données démo');
      useDemoData = true;
      return demoMovies.slice(offset, offset + limit);
    }

    // Mapper les films Supabase
    return movies.map((m: any) => {
      const tmdbCache = m.tmdb_cache?.[0];
      return {
        id: m.id,
        title: m.title,
        originalTitle: m.original_title || undefined,
        year: m.year,
        director: m.director,
        writers: m.writers || [],
        duration: m.duration,
        genre: m.genre || [],
        synopsis: tmdbCache?.overview || m.synopsis || '',
        directorBio: m.director_bio,
        directorPhoto: m.director_photo,
        anecdote: m.anecdote,
        inspiration: m.inspiration,
        nominations: m.nominations || [],
        platforms: m.platforms || [],
        posterUrl: tmdbCache?.poster_url || m.poster_url || '',
        heroUrl: tmdbCache?.backdrop_url || m.hero_url || '',
        cast: [],
        keyScenes: [],
        locations: m.locations || [],
        type: (m.type as 'film' | 'series') || 'film',
        popularity: m.popularity || 0,
        tmdbId: tmdbCache?.tmdb_id,
        tmdbRating: tmdbCache?.rating,
        tmdbVoteCount: tmdbCache?.vote_count,
        tmdbTagline: tmdbCache?.tagline,
      };
    });
  } catch (err) {
    console.warn('Erreur connexion, utilisation des données démo:', err);
    useDemoData = true;
    return demoMovies.slice(offset, offset + limit);
  }
}

export async function getMovieWithFallback(movieId: string): Promise<EnrichedMovie | null> {
  // Si c'est un ID démo
  if (movieId.startsWith('demo-')) {
    return demoMovies.find(m => m.id === movieId) || null;
  }

  try {
    const { data: movie, error } = await supabase
      .from('movies')
      .select(`*, tmdb_cache:tmdb_cache(*)`)
      .eq('id', movieId)
      .single();

    if (error || !movie) {
      return null;
    }

    const tmdbCache = movie.tmdb_cache?.[0];
    return {
      id: movie.id,
      title: movie.title,
      originalTitle: movie.original_title || undefined,
      year: movie.year,
      director: movie.director,
      writers: movie.writers || [],
      duration: movie.duration,
      genre: movie.genre || [],
      synopsis: tmdbCache?.overview || movie.synopsis || '',
      directorBio: movie.director_bio,
      directorPhoto: movie.director_photo,
      anecdote: movie.anecdote,
      inspiration: movie.inspiration,
      nominations: movie.nominations || [],
      platforms: movie.platforms || [],
      posterUrl: tmdbCache?.poster_url || movie.poster_url || '',
      heroUrl: tmdbCache?.backdrop_url || movie.hero_url || '',
      cast: [],
      keyScenes: [],
      locations: movie.locations || [],
      type: (movie.type as 'film' | 'series') || 'film',
      popularity: movie.popularity || 0,
      tmdbId: tmdbCache?.tmdb_id,
      tmdbRating: tmdbCache?.rating,
      tmdbVoteCount: tmdbCache?.vote_count,
      tmdbTagline: tmdbCache?.tagline,
    };
  } catch {
    return null;
  }
}

export function isUsingDemoData(): boolean {
  return useDemoData;
}

export function clearDemoFlag(): void {
  useDemoData = false;
}
