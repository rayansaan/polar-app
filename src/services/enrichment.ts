import { supabase } from '../lib/supabase';
import { getMovieDetails, getMovieCredits, getSimilarMovies, getImageUrl } from './tmdb';
import type { EnrichedMovie } from '../types/enriched';

export async function linkMovieToTmdb(movieId: string, tmdbId: number): Promise<void> {
  const { error } = await supabase
    .from('tmdb_cache')
    .insert({
      movie_id: movieId,
      tmdb_id: tmdbId,
    });

  if (error) throw error;
}

export async function refreshTmdbData(movieId: string): Promise<void> {
  // Récupérer le tmdb_id lié
  const { data: cache, error: cacheError } = await supabase
    .from('tmdb_cache')
    .select('tmdb_id')
    .eq('movie_id', movieId)
    .single();

  if (cacheError || !cache) {
    throw new Error('Film non lié à TMDB');
  }

  const tmdbId = cache.tmdb_id;

  // Récupérer les données TMDB en parallèle
  const [details, credits, similar] = await Promise.all([
    getMovieDetails(tmdbId),
    getMovieCredits(tmdbId),
    getSimilarMovies(tmdbId),
  ]);

  // Mettre à jour le cache
  const { error: updateError } = await supabase
    .from('tmdb_cache')
    .update({
      backdrop_url: getImageUrl(details.backdrop_path, 'original'),
      poster_url: getImageUrl(details.poster_path, 'w500'),
      rating: details.vote_average,
      vote_count: details.vote_count,
      tagline: details.tagline,
      overview: details.overview,
      runtime: details.runtime,
      release_date: details.release_date,
      original_language: details.original_language,
      origin_country: details.origin_country,
      updated_at: new Date().toISOString(),
    })
    .eq('movie_id', movieId);

  if (updateError) throw updateError;

  // Supprimer l'ancien cast
  await supabase.from('tmdb_cast').delete().eq('movie_id', movieId);

  // Insérer le nouveau cast (top 10)
  if (credits.cast?.length > 0) {
    const castInserts = credits.cast.slice(0, 10).map((actor) => ({
      movie_id: movieId,
      tmdb_person_id: actor.id,
      name: actor.name,
      character: actor.character,
      profile_path: getImageUrl(actor.profile_path, 'w200'),
      order_index: actor.order,
    }));

    const { error: castError } = await supabase.from('tmdb_cast').insert(castInserts as any);

    if (castError) throw castError;
  }

  // Supprimer les anciens films similaires
  await supabase.from('tmdb_similar').delete().eq('movie_id', movieId);

  // Insérer les nouveaux films similaires
  if (similar.length > 0) {
    const similarInserts = similar.map((movie) => ({
      movie_id: movieId,
      similar_tmdb_id: movie.id,
      title: movie.title,
      poster_path: getImageUrl(movie.poster_path, 'w200'),
      release_year: movie.release_date ? parseInt(movie.release_date.split('-')[0]) : null,
    }));

    const { error: similarError } = await supabase.from('tmdb_similar').insert(similarInserts as any);

    if (similarError) throw similarError;
  }
}

export async function getEnrichedMovie(movieId: string): Promise<EnrichedMovie | null> {
  // Récupérer le film local
  const { data: localMovie, error: localError } = await supabase
    .from('movies')
    .select('*')
    .eq('id', movieId)
    .single();

  if (localError || !localMovie) return null;

  // Récupérer les données éditoriales (cast local, scènes)
  const [{ data: castData }, { data: scenesData }] = await Promise.all([
    supabase.from('cast_members').select('*').eq('movie_id', movieId),
    supabase.from('key_scenes').select('*').eq('movie_id', movieId),
  ]);

  // Récupérer les hotspots pour chaque scène
  const scenesWithHotspots = await Promise.all(
    (scenesData || []).map(async (scene) => {
      const { data: hotspots } = await supabase
        .from('hotspots')
        .select('*')
        .eq('scene_id', scene.id);
      return {
        id: scene.id,
        title: scene.title,
        timestamp: scene.timestamp,
        duration: scene.duration,
        intensity: scene.intensity,
        thumbnailUrl: scene.thumbnail_url,
        hotspots: (hotspots || []).map((h) => ({
          id: h.id,
          type: h.type,
          title: h.title,
          description: h.description,
          timestamp: h.timestamp,
        })),
      };
    })
  );

  // Récupérer les données TMDB
  const { data: tmdbCache } = await supabase
    .from('tmdb_cache')
    .select('*')
    .eq('movie_id', movieId)
    .single();

  let tmdbCast = null;
  let tmdbSimilar = null;

  if (tmdbCache) {
    const [{ data: cast }, { data: similar }] = await Promise.all([
      supabase.from('tmdb_cast').select('*').eq('movie_id', movieId).order('order_index'),
      supabase.from('tmdb_similar').select('*').eq('movie_id', movieId),
    ]);
    tmdbCast = cast;
    tmdbSimilar = similar;
  }

  // Construire le film enrichi
  const movie: EnrichedMovie = {
    id: localMovie.id,
    title: localMovie.title,
    originalTitle: localMovie.original_title || undefined,
    year: localMovie.year,
    director: localMovie.director,
    writers: localMovie.writers || [],
    duration: localMovie.duration,
    genre: localMovie.genre || [],
    synopsis: tmdbCache?.overview || localMovie.synopsis || '',
    directorBio: localMovie.director_bio,
    directorPhoto: localMovie.director_photo,
    anecdote: localMovie.anecdote,
    inspiration: localMovie.inspiration,
    nominations: localMovie.nominations || [],
    platforms: localMovie.platforms || [],
    posterUrl: tmdbCache?.poster_url || '',
    heroUrl: tmdbCache?.backdrop_url || '',
    cast: tmdbCast
      ? tmdbCast.map((actor) => ({
          id: actor.id,
          name: actor.name,
          role: actor.character || '',
          photoUrl: actor.profile_path || '',
        }))
      : (castData || []).map((actor) => ({
          id: actor.id,
          name: actor.name,
          role: actor.role,
          photoUrl: actor.photo_url,
        })),
    keyScenes: scenesWithHotspots,
    locations: localMovie.locations || [],
    type: (localMovie.type as 'film' | 'series') || 'film',
    popularity: localMovie.popularity || 0,
    tmdbId: tmdbCache?.tmdb_id,
    tmdbRating: tmdbCache?.rating,
    tmdbVoteCount: tmdbCache?.vote_count,
    tmdbTagline: tmdbCache?.tagline || undefined,
    tmdbBackdropUrl: tmdbCache?.backdrop_url || undefined,
    tmdbPosterUrl: tmdbCache?.poster_url || undefined,
    tmdbRuntime: tmdbCache?.runtime || undefined,
    tmdbOverview: tmdbCache?.overview || undefined,
    tmdbSimilarMovies: tmdbSimilar
      ? tmdbSimilar.map((s) => ({
          id: s.similar_tmdb_id,
          title: s.title,
          posterPath: s.poster_path,
          releaseYear: s.release_year,
        }))
      : undefined,
  };

  return movie;
}

export async function getEnrichedMovies(limit: number = 10, offset: number = 0): Promise<EnrichedMovie[]> {
  // Récupérer les films avec leurs données TMDB en UNE requête
  const { data: movies, error } = await supabase
    .from('movies')
    .select(`
      *,
      tmdb_cache:tmdb_cache(*),
      cast_members:cast_members(*),
      key_scenes:key_scenes(*)
    `)
    .order('popularity', { ascending: false })
    .range(offset, offset + limit - 1);

  if (error || !movies) return [];

  // Récupérer les hotspots pour toutes les scènes
  const sceneIds = movies.flatMap((m: any) => m.key_scenes?.map((s: any) => s.id) || []);
  
  let hotspotsMap = new Map<string, any[]>();
  if (sceneIds.length > 0) {
    const { data: allHotspots } = await supabase
      .from('hotspots')
      .select('*')
      .in('scene_id', sceneIds);
    
    (allHotspots || []).forEach((h) => {
      if (!hotspotsMap.has(h.scene_id)) {
        hotspotsMap.set(h.scene_id, []);
      }
      hotspotsMap.get(h.scene_id)!.push({
        id: h.id,
        type: h.type,
        title: h.title,
        description: h.description,
        timestamp: h.timestamp,
      });
    });
  }

  return movies.map((m: any) => {
    const tmdbCache = m.tmdb_cache?.[0];
    const scenesData = m.key_scenes || [];

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
      posterUrl: tmdbCache?.poster_url || '',
      heroUrl: tmdbCache?.backdrop_url || '',
      cast: [], // Pas de cast dans le batch pour perf
      keyScenes: scenesData.map((s: any) => ({
        id: s.id,
        title: s.title,
        timestamp: s.timestamp,
        duration: s.duration,
        intensity: s.intensity,
        thumbnailUrl: s.thumbnail_url,
        hotspots: hotspotsMap.get(s.id) || [],
      })),
      locations: m.locations || [],
      type: (m.type as 'film' | 'series') || 'film',
      popularity: m.popularity || 0,
      tmdbId: tmdbCache?.tmdb_id,
      tmdbRating: tmdbCache?.rating,
      tmdbVoteCount: tmdbCache?.vote_count,
      tmdbTagline: tmdbCache?.tagline,
      tmdbBackdropUrl: tmdbCache?.backdrop_url,
      tmdbPosterUrl: tmdbCache?.poster_url,
      tmdbRuntime: tmdbCache?.runtime,
      tmdbOverview: tmdbCache?.overview,
    };
  });
}

export async function getUnmappedMovies(): Promise<{ id: string; title: string; year: number }[]> {
  // Récupérer tous les IDs mappés
  const { data: mapped } = await supabase
    .from('tmdb_cache')
    .select('movie_id');

  const mappedIds = (mapped || []).map((m) => m.movie_id);

  if (mappedIds.length === 0) {
    const { data } = await supabase.from('movies').select('id, title, year');
    return (data || []) as { id: string; title: string; year: number }[];
  }

  const { data, error } = await supabase
    .from('movies')
    .select('id, title, year')
    .not('id', 'in', `(${mappedIds.join(',')})`);

  if (error) throw error;
  return (data || []) as { id: string; title: string; year: number }[];
}

export async function getMappedMovies(): Promise<{ id: string; title: string; year: number; tmdb_id: number }[]> {
  const { data, error } = await supabase
    .from('movies')
    .select(`
      id,
      title,
      year,
      tmdb_cache:tmdb_cache(tmdb_id)
    `);

  if (error) throw error;

  return (data || [])
    .filter((m: any) => m.tmdb_cache?.length > 0)
    .map((m: any) => ({
      id: m.id,
      title: m.title,
      year: m.year,
      tmdb_id: m.tmdb_cache[0].tmdb_id,
    }));
}
