import { useState, useEffect, useCallback } from 'react';
import { searchMovies } from '../services/tmdb';
import { linkMovieToTmdb, refreshTmdbData, getUnmappedMovies, getMappedMovies } from '../services/enrichment';
import { importMoviesFromTMDB } from '../services/import';
import { Input } from '../components/ui/input';
import { Button } from '../components/ui/button';
import { Badge } from '../components/ui/badge';
import { Separator } from '../components/ui/separator';
import { Search, Link2, RefreshCw, Film, CheckCircle, Download, Loader2 } from 'lucide-react';
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
  
  // Auto import states
  const [importCount, setImportCount] = useState(50);
  const [updateExisting, setUpdateExisting] = useState(true);
  const [importing, setImporting] = useState(false);
  const [importResult, setImportResult] = useState<{
    imported: number;
    updated: number;
    skipped: number;
    failed: number;
    movies: Array<{ title: string; status: string; year: number }>;
  } | null>(null);

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

  const handleAutoImport = async () => {
    try {
      setImporting(true);
      setImportResult(null);
      setMessage('Import en cours... Cela peut prendre quelques minutes.');
      
      const result = await importMoviesFromTMDB(importCount, updateExisting);
      setImportResult(result);
      setMessage(`✅ Import terminé ! ${result.imported} importés, ${result.updated} mis à jour, ${result.skipped} ignorés, ${result.failed} échoués`);
      
      // Reload movies list
      await loadMovies();
    } catch (err) {
      setMessage(err instanceof Error ? err.message : 'Erreur lors de l\'import');
    } finally {
      setImporting(false);
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
        {/* Section Import Automatique */}
        <section className="bg-polar-surface border border-polar-border p-6 space-y-4">
          <div className="flex items-center gap-3">
            <Download className="w-5 h-5 text-polar-ink" />
            <div>
              <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink">
                Import Automatique TMDB
              </h2>
              <p className="text-xs text-polar-ink-3 mt-1">
                Importer automatiquement les films populaires depuis TMDB
              </p>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label className="block text-xs font-medium text-polar-ink mb-2">
                Nombre de films
              </label>
              <Input
                type="number"
                min={1}
                max={100}
                value={importCount}
                onChange={(e) => setImportCount(Math.min(100, Math.max(1, parseInt(e.target.value) || 50)))}
                className="w-full"
              />
            </div>

            <div className="flex items-end">
              <label className="flex items-center gap-2 cursor-pointer">
                <input
                  type="checkbox"
                  checked={updateExisting}
                  onChange={(e) => setUpdateExisting(e.target.checked)}
                  className="w-4 h-4 rounded border-polar-border"
                />
                <span className="text-sm text-polar-ink">Mettre à jour les films existants</span>
              </label>
            </div>

            <div className="flex items-end">
              <Button
                onClick={handleAutoImport}
                disabled={importing}
                className="w-full"
              >
                {importing ? (
                  <>
                    <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                    Import en cours...
                  </>
                ) : (
                  <>
                    <Download className="w-4 h-4 mr-2" />
                    Lancer l'import
                  </>
                )}
              </Button>
            </div>
          </div>

          {importResult && (
            <div className="mt-4 p-4 bg-polar-white border border-polar-border space-y-3">
              <h3 className="text-sm font-semibold text-polar-ink">Résultat de l'import</h3>
              <div className="grid grid-cols-4 gap-4 text-center">
                <div className="p-2 bg-green-50 border border-green-200 rounded">
                  <p className="text-2xl font-bold text-green-600">{importResult.imported}</p>
                  <p className="text-xs text-green-700">Importés</p>
                </div>
                <div className="p-2 bg-blue-50 border border-blue-200 rounded">
                  <p className="text-2xl font-bold text-blue-600">{importResult.updated}</p>
                  <p className="text-xs text-blue-700">Mis à jour</p>
                </div>
                <div className="p-2 bg-yellow-50 border border-yellow-200 rounded">
                  <p className="text-2xl font-bold text-yellow-600">{importResult.skipped}</p>
                  <p className="text-xs text-yellow-700">Ignorés</p>
                </div>
                <div className="p-2 bg-red-50 border border-red-200 rounded">
                  <p className="text-2xl font-bold text-red-600">{importResult.failed}</p>
                  <p className="text-xs text-red-700">Échoués</p>
                </div>
              </div>
              
              {importResult.movies.length > 0 && (
                <div className="mt-3 max-h-60 overflow-y-auto">
                  <table className="w-full text-xs">
                    <thead className="bg-polar-surface">
                      <tr>
                        <th className="text-left p-2 text-polar-ink-3">Film</th>
                        <th className="text-left p-2 text-polar-ink-3">Année</th>
                        <th className="text-left p-2 text-polar-ink-3">Statut</th>
                      </tr>
                    </thead>
                    <tbody>
                      {importResult.movies.map((movie, idx) => (
                        <tr key={idx} className="border-b border-polar-border">
                          <td className="p-2 text-polar-ink">{movie.title}</td>
                          <td className="p-2 text-polar-ink-3">{movie.year}</td>
                          <td className="p-2">
                            <span className={`inline-block px-2 py-1 rounded text-[10px] font-medium ${
                              movie.status === 'imported' ? 'bg-green-100 text-green-700' :
                              movie.status === 'updated' ? 'bg-blue-100 text-blue-700' :
                              movie.status === 'skipped' ? 'bg-yellow-100 text-yellow-700' :
                              'bg-red-100 text-red-700'
                            }`}>
                              {movie.status === 'imported' ? 'Importé' :
                               movie.status === 'updated' ? 'Mis à jour' :
                               movie.status === 'skipped' ? 'Ignoré' : 'Échoué'}
                            </span>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          )}
        </section>

        <Separator className="bg-polar-border" />

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
