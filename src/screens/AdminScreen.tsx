import { useState, useEffect, useCallback } from 'react';
import { searchMovies } from '../services/tmdb';
import { linkMovieToTmdb, refreshTmdbData, getUnmappedMovies, getMappedMovies } from '../services/enrichment';
import { Input } from '../components/ui/input';
import { Button } from '../components/ui/button';
import { Badge } from '../components/ui/badge';
import { Separator } from '../components/ui/separator';
import { Search, Link2, RefreshCw, Film, CheckCircle } from 'lucide-react';
import type { TmdbMovieSearchResult } from '../types/enriched';
import { getImageUrl } from '../services/tmdb';

interface LocalMovie {
  id: string;
  title: string;
  year: number;
}

interface MappedMovie extends LocalMovie {
  tmdb_id: number;
}

export const AdminScreen: React.FC = () => {
  const [unmappedMovies, setUnmappedMovies] = useState<LocalMovie[]>([]);
  const [mappedMovies, setMappedMovies] = useState<MappedMovie[]>([]);
  const [selectedMovie, setSelectedMovie] = useState<LocalMovie | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState<TmdbMovieSearchResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [linking, setLinking] = useState(false);
  const [refreshing, setRefreshing] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  const loadMovies = useCallback(async () => {
    try {
      setLoading(true);
      const [unmapped, mapped] = await Promise.all([
        getUnmappedMovies(),
        getMappedMovies(),
      ]);
      setUnmappedMovies(unmapped);
      setMappedMovies(mapped);
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Erreur de chargement');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadMovies();
  }, [loadMovies]);

  const handleSearch = async () => {
    if (!selectedMovie || !searchQuery.trim()) return;
    try {
      setLoading(true);
      const results = await searchMovies(searchQuery, selectedMovie.year);
      setSearchResults(results);
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Erreur de recherche');
    } finally {
      setLoading(false);
    }
  };

  const handleLink = async (tmdbId: number) => {
    if (!selectedMovie) return;
    try {
      setLinking(true);
      await linkMovieToTmdb(selectedMovie.id, tmdbId);
      await refreshTmdbData(selectedMovie.id);
      setMessage(`✓ ${selectedMovie.title} lié avec succès !`);
      setSelectedMovie(null);
      setSearchResults([]);
      setSearchQuery('');
      await loadMovies();
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Erreur de liaison');
    } finally {
      setLinking(false);
    }
  };

  const handleRefresh = async (movieId: string) => {
    try {
      setRefreshing(movieId);
      await refreshTmdbData(movieId);
      setMessage('Données rafraîchies !');
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Erreur de rafraîchissement');
    } finally {
      setRefreshing(null);
    }
  };

  return (
    <div className="min-h-screen pb-20 lg:pb-0">
      <header className="px-4 lg:px-8 pt-6 pb-4">
        <div className="flex items-center gap-3">
          <Film className="w-6 h-6 text-polar-ink" />
          <div>
            <h1 className="text-2xl font-bold tracking-tight text-polar-ink">
              Administration TMDB
            </h1>
            <p className="text-sm text-polar-ink-3">
              Lier vos films à la base de données TMDB
            </p>
          </div>
        </div>
      </header>

      {message && (
        <div className="mx-4 lg:mx-8 mb-4 p-3 bg-polar-surface border border-polar-border text-sm">
          {message}
        </div>
      )}

      <div className="px-4 lg:px-8 space-y-8">
        {/* Section films non mappés */}
        <section>
          <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink mb-4">
            Films à lier ({unmappedMovies.length})
          </h2>

          {selectedMovie ? (
            <div className="bg-polar-surface border border-polar-border p-4 space-y-4">
              <div className="flex items-center justify-between">
                <div>
                  <p className="font-medium text-polar-ink">{selectedMovie.title}</p>
                  <p className="text-xs text-polar-ink-3">{selectedMovie.year}</p>
                </div>
                <button
                  type="button"
                  onClick={() => {
                    setSelectedMovie(null);
                    setSearchResults([]);
                    setSearchQuery('');
                  }}
                  className="text-xs text-polar-ink-3 hover:text-polar-ink"
                >
                  Annuler
                </button>
              </div>

              <div className="flex gap-2">
                <Input
                  type="text"
                  placeholder="Rechercher sur TMDB..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="flex-1"
                  onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
                />
                <Button
                  onClick={handleSearch}
                  disabled={loading || !searchQuery.trim()}
                >
                  <Search className="w-4 h-4" />
                </Button>
              </div>

              {searchResults.length > 0 && (
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-3">
                  {searchResults.map((result) => (
                    <div
                      key={result.id}
                      className="border border-polar-border bg-polar-white p-3 space-y-2"
                    >
                      {result.poster_path ? (
                        <img
                          src={getImageUrl(result.poster_path, 'w200')!}
                          alt={result.title}
                          className="w-full aspect-[2/3] object-cover"
                        />
                      ) : (
                        <div className="w-full aspect-[2/3] bg-polar-surface flex items-center justify-center">
                          <Film className="w-8 h-8 text-polar-ink-3" />
                        </div>
                      )}
                      <div>
                        <p className="text-xs font-medium text-polar-ink truncate">{result.title}</p>
                        <p className="text-[10px] text-polar-ink-3">
                          {result.release_date?.split('-')[0]} · ⭐ {result.vote_average.toFixed(1)}
                        </p>
                        <p className="text-[10px] text-polar-ink-3 line-clamp-2 mt-1">
                          {result.overview}
                        </p>
                      </div>
                      <Button
                        onClick={() => handleLink(result.id)}
                        disabled={linking}
                        className="w-full text-xs"
                      >
                        {linking ? (
                          'Liaison...'
                        ) : (
                          <>
                            <Link2 className="w-3 h-3 mr-1" />
                            Lier
                          </>
                        )}
                      </Button>
                    </div>
                  ))}
                </div>
              )}
            </div>
          ) : (
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-3">
              {unmappedMovies.map((movie) => (
                <button
                  key={movie.id}
                  type="button"
                  onClick={() => {
                    setSelectedMovie(movie);
                    setSearchQuery(movie.title);
                  }}
                  className="p-4 bg-polar-surface border border-polar-border hover:border-polar-ink-3 transition-colors text-left"
                >
                  <p className="text-sm font-medium text-polar-ink">{movie.title}</p>
                  <p className="text-xs text-polar-ink-3 mt-1">{movie.year}</p>
                  <Badge variant="outline" className="mt-2 text-[9px]">
                    Non lié
                  </Badge>
                </button>
              ))}
            </div>
          )}
        </section>

        <Separator className="bg-polar-border" />

        {/* Section films mappés */}
        <section>
          <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink mb-4">
            Films liés ({mappedMovies.length})
          </h2>

          <div className="grid grid-cols-2 lg:grid-cols-4 gap-3">
            {mappedMovies.map((movie) => (
              <div
                key={movie.id}
                className="p-4 bg-polar-surface border border-polar-border"
              >
                <div className="flex items-start justify-between">
                  <div>
                    <p className="text-sm font-medium text-polar-ink">{movie.title}</p>
                    <p className="text-xs text-polar-ink-3">{movie.year}</p>
                  </div>
                  <CheckCircle className="w-4 h-4 text-green-600" />
                </div>
                <p className="text-[10px] text-polar-ink-3 mt-2">
                  TMDB ID: {movie.tmdb_id}
                </p>
                <Button
                  variant="secondary"
                  onClick={() => handleRefresh(movie.id)}
                  disabled={refreshing === movie.id}
                  className="mt-3 w-full text-xs"
                >
                  {refreshing === movie.id ? (
                    'Rafraîchissement...'
                  ) : (
                    <>
                      <RefreshCw className="w-3 h-3 mr-1" />
                      Rafraîchir
                    </>
                  )}
                </Button>
              </div>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
};
