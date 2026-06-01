import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useEnrichedMovies } from '../hooks/useEnrichedMovie';
import { articles } from '../data';
import { SortDropdown, type SortOption } from '../components/SortDropdown';
import { Skeleton } from '../components/ui/skeleton';
import { Badge } from '../components/ui/badge';
import { Separator } from '../components/ui/separator';
import { Clock, ArrowRight, Film, ChevronDown } from 'lucide-react';

const ITEMS_PER_PAGE = 10;

export const FeedScreen: React.FC = () => {
  const [sortBy, setSortBy] = useState<SortOption>('random');
  const [displayCount, setDisplayCount] = useState(ITEMS_PER_PAGE);
  const { movies, loading, error } = useEnrichedMovies(50, 0, sortBy);

  // Reset display count when sort changes
  useEffect(() => {
    setDisplayCount(ITEMS_PER_PAGE);
  }, [sortBy]);

  const displayedMovies = movies.slice(0, displayCount);
  const hasMore = displayCount < movies.length;

  const handleLoadMore = () => {
    setDisplayCount((prev) => Math.min(prev + ITEMS_PER_PAGE, movies.length));
  };

  return (
    <div className="min-h-screen pb-20 lg:pb-0">
      {/* Header */}
      <header className="px-4 lg:px-8 pt-6 pb-4">
        <div className="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4">
          <div>
            <h1 className="text-2xl lg:text-3xl font-bold tracking-tight text-polar-ink">
              À la une
            </h1>
            <p className="text-sm text-polar-ink-3 mt-1">
              Découvrez notre sélection de films analysés
            </p>
          </div>
          
          <div className="flex items-center gap-3">
            {!loading && movies.length > 0 && (
              <span className="text-xs text-polar-ink-3">
                {displayedMovies.length} / {movies.length} films
              </span>
            )}
            <SortDropdown value={sortBy} onChange={setSortBy} />
          </div>
        </div>
      </header>

      {/* Movies Grid */}
      <section className="px-4 lg:px-8 mb-8">
        {loading ? (
          /* Skeleton Grid */
          <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-3">
            {Array.from({ length: ITEMS_PER_PAGE }).map((_, i) => (
              <Skeleton key={i} variant="card" />
            ))}
          </div>
        ) : error ? (
          <div className="bg-polar-surface border border-polar-border p-8 text-center">
            <p className="text-polar-ink-3">{error}</p>
          </div>
        ) : movies.length === 0 ? (
          <div className="bg-polar-surface border border-polar-border p-8 text-center">
            <Film className="w-12 h-12 text-polar-ink-3 mx-auto mb-4" />
            <h3 className="text-lg font-bold text-polar-ink mb-2">Aucun film disponible</h3>
            <p className="text-sm text-polar-ink-3">
              Les films seront bientôt disponibles.
            </p>
          </div>
        ) : (
          <>
            <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-3">
              {displayedMovies.map((movie) => (
                <Link
                  key={movie.id}
                  to={`/movie/${movie.id}`}
                  className="group"
                >
                  <div className="relative overflow-hidden bg-polar-surface border border-polar-border aspect-[2/3]">
                    {movie.posterUrl ? (
                      <img
                        src={movie.posterUrl}
                        alt={movie.title}
                        className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                        loading="lazy"
                      />
                    ) : (
                      <div className="w-full h-full flex flex-col items-center justify-center bg-polar-surface">
                        <Film className="w-8 h-8 text-polar-ink-3 mb-2" />
                        <span className="text-xs text-polar-ink-3 text-center px-2">{movie.title}</span>
                      </div>
                    )}
                    <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                    <div className="absolute bottom-0 left-0 right-0 p-3 opacity-0 group-hover:opacity-100 transition-opacity">
                      <p className="text-white/70 text-xs">
                        {movie.year} · {movie.director}
                      </p>
                    </div>
                  </div>
                  <div className="mt-2">
                    <h3 className="text-xs font-medium text-polar-ink truncate">
                      {movie.title}
                    </h3>
                    <p className="text-[10px] text-polar-ink-3">
                      {movie.year}
                    </p>
                  </div>
                </Link>
              ))}
            </div>

            {/* Load More Button */}
            {hasMore && (
              <div className="mt-8 text-center">
                <button
                  type="button"
                  onClick={handleLoadMore}
                  className="inline-flex items-center gap-2 px-6 py-3 bg-polar-surface border border-polar-border text-sm font-medium text-polar-ink hover:border-polar-ink-3 transition-colors"
                >
                  Charger plus
                  <ChevronDown className="w-4 h-4" />
                </button>
                <p className="text-xs text-polar-ink-3 mt-2">
                  {displayedMovies.length} sur {movies.length} films
                </p>
              </div>
            )}
          </>
        )}
      </section>

      <Separator className="mx-4 lg:mx-8 bg-polar-border" />

      {/* Analyses Section */}
      <section className="px-4 lg:px-8 py-6">
        <div className="flex items-center justify-between mb-5">
          <div>
            <h2 className="text-lg font-bold text-polar-ink">Analyses</h2>
            <p className="text-xs text-polar-ink-3 mt-0.5">
              Plongées critiques et décryptages
            </p>
          </div>
          <Link
            to="/search"
            className="text-xs font-medium text-polar-ink-2 hover:text-polar-ink flex items-center gap-1 transition-colors"
          >
            Tout voir
            <ArrowRight className="w-3 h-3" aria-hidden="true" />
          </Link>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
          {articles.map((article) => (
            <Link
              key={article.id}
              to={`/movie/${article.id.replace('article-', 'demo-')}`}
              className="group flex gap-4 p-3 bg-polar-surface border border-polar-border hover:border-polar-ink-3 transition-colors"
            >
              <div className="flex-shrink-0 w-24 h-24 lg:w-32 lg:h-28 overflow-hidden bg-polar-white">
                <img
                  src={article.imageUrl}
                  alt={article.title}
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                  loading="lazy"
                />
              </div>
              <div className="flex-1 min-w-0 py-0.5">
                <div className="flex flex-wrap gap-1.5 mb-2">
                  {article.tags.map((tag) => (
                    <Badge key={tag} variant="secondary" className="text-[9px]">
                      {tag}
                    </Badge>
                  ))}
                </div>
                <h3 className="font-semibold text-sm text-polar-ink leading-snug group-hover:text-polar-ink-2 transition-colors">
                  {article.title}
                </h3>
                <p className="text-xs text-polar-ink-3 mt-1 line-clamp-2">
                  {article.subtitle}
                </p>
                <div className="flex items-center gap-3 mt-2.5 text-[10px] text-polar-ink-3 uppercase tracking-wider">
                  <span className="flex items-center gap-1">
                    <Clock className="w-3 h-3" aria-hidden="true" />
                    {article.readTime} min
                  </span>
                  <span>{article.category}</span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </section>
    </div>
  );
};

export default FeedScreen;
