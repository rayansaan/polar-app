import { useState, useEffect, useCallback } from 'react';
import { getMoviesWithFallback, getMovieWithFallback } from '../services/movieService';
import type { EnrichedMovie } from '../types/enriched';

// Fisher-Yates shuffle
function shuffleArray<T>(array: T[]): T[] {
  const shuffled = [...array];
  for (let i = shuffled.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
}

type SortOption = 'random' | 'popularity' | 'year-desc' | 'year-asc' | 'rating' | 'title';

export function useEnrichedMovies(limit: number = 50, offset: number = 0, sortBy: SortOption = 'random') {
  const [movies, setMovies] = useState<EnrichedMovie[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchMovies() {
      try {
        setLoading(true);
        let data = await getMoviesWithFallback(limit, offset);
        
        // Sort movies based on option
        switch (sortBy) {
          case 'random':
            data = shuffleArray(data);
            break;
          case 'popularity':
            data.sort((a, b) => (b.popularity || 0) - (a.popularity || 0));
            break;
          case 'year-desc':
            data.sort((a, b) => b.year - a.year);
            break;
          case 'year-asc':
            data.sort((a, b) => a.year - b.year);
            break;
          case 'rating':
            data.sort((a, b) => (b.tmdbRating || 0) - (a.tmdbRating || 0));
            break;
          case 'title':
            data.sort((a, b) => a.title.localeCompare(b.title));
            break;
        }
        
        setMovies(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Erreur de chargement');
      } finally {
        setLoading(false);
      }
    }

    fetchMovies();
  }, [limit, offset, sortBy]);

  return { movies, loading, error };
}

export function useEnrichedMovie(movieId: string | undefined) {
  const [movie, setMovie] = useState<EnrichedMovie | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const refresh = useCallback(async () => {
    if (!movieId) return;
    try {
      setLoading(true);
      const data = await getMovieWithFallback(movieId);
      setMovie(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erreur de chargement');
    } finally {
      setLoading(false);
    }
  }, [movieId]);

  useEffect(() => {
    refresh();
  }, [refresh]);

  return { movie, loading, error, refresh };
}
