import type { TmdbMovieSearchResult, TmdbMovieDetails, TmdbCreditsResponse, TmdbSimilarMovie, TmdbSearchResponse } from '../types/enriched';

const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p';
const API_KEY = import.meta.env.VITE_TMDB_API_KEY;

async function tmdbFetch<T>(endpoint: string): Promise<T> {
  const response = await fetch(`${TMDB_BASE_URL}${endpoint}?api_key=${API_KEY}&language=fr-FR`);
  if (!response.ok) {
    throw new Error(`TMDB API error: ${response.status} ${response.statusText}`);
  }
  return response.json();
}

export function getImageUrl(path: string | null, size: string = 'w500'): string | null {
  if (!path) return null;
  return `${TMDB_IMAGE_BASE_URL}/${size}${path}`;
}

export async function searchMovies(query: string, year?: number): Promise<TmdbMovieSearchResult[]> {
  let endpoint = `/search/movie?query=${encodeURIComponent(query)}`;
  if (year) {
    endpoint += `&year=${year}`;
  }
  const data = await tmdbFetch<TmdbSearchResponse>(endpoint);
  return data.results || [];
}

export async function getMovieDetails(tmdbId: number): Promise<TmdbMovieDetails> {
  return tmdbFetch<TmdbMovieDetails>(`/movie/${tmdbId}`);
}

export async function getMovieCredits(tmdbId: number): Promise<TmdbCreditsResponse> {
  return tmdbFetch<TmdbCreditsResponse>(`/movie/${tmdbId}/credits`);
}

export async function getSimilarMovies(tmdbId: number): Promise<TmdbSimilarMovie[]> {
  const data = await tmdbFetch<{ results: TmdbSimilarMovie[] }>(`/movie/${tmdbId}/similar`);
  return (data.results || []).slice(0, 6);
}
