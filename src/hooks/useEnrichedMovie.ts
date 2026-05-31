import { useState, useEffect, useCallback } from 'react';
import { getEnrichedMovies, getEnrichedMovie } from '../services/enrichment';
import type { EnrichedMovie } from '../types/enriched';

export function useEnrichedMovies(limit: number = 10, offset: number = 0) {
  const [movies, setMovies] = useState<EnrichedMovie[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchMovies() {
      try {
        setLoading(true);
        const data = await getEnrichedMovies(limit, offset);
        setMovies(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Erreur de chargement');
      } finally {
        setLoading(false);
      }
    }

    fetchMovies();
  }, [limit, offset]);

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
      const data = await getEnrichedMovie(movieId);
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
