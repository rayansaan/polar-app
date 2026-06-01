import { useState } from 'react';
import { Link } from 'react-router-dom';
import { useEnrichedMovies } from '../hooks/useEnrichedMovie';
import { articles } from '../data';
import { Badge } from '../components/ui/badge';
import { Separator } from '../components/ui/separator';
import { Clock, ArrowRight, Film } from 'lucide-react';

export const FeedScreen: React.FC = () => {
  const [limit, setLimit] = useState(10);
  const { movies, loading, error } = useEnrichedMovies(limit, 0);

  return (
    <div className="min-h-screen pb-20 lg:pb-0">
      {/* Header */}
      <header className="px-4 lg:px-8 pt-6 pb-4">
        <h1 className="text-2xl lg:text-3xl font-bold tracking-tight text-polar-ink">
          À la une
        </h1>
        <p className="text-sm text-polar-ink-3 mt-1">
          Les analyses et films du moment
        </p>
      </header>

      {/* Hero - Mobile horizontal scroll / Desktop grid */}
      <section className="mb-8">
        {loading ? (
          <div className="px-4 lg:px-8">
            <div className="h-64 bg-polar-surface border border-polar-border animate-pulse" />
          </div>
        ) : error ? (
          <div className="px-4 lg:px-8 text-sm text-polar-ink-3">{error}</div>
        ) : movies.length === 0 ? (
          <div className="px-4 lg:px-8">
            <div className="bg-polar-surface border border-polar-border p-8 text-center">
              <Film className="w-12 h-12 text-polar-ink-3 mx-auto mb-4" />
              <h3 className="text-lg font-bold text-polar-ink mb-2">Aucun film dans la base</h3>
              <p className="text-sm text-polar-ink-3 mb-4">
                Importez des films depuis TMDB pour les voir apparaître ici.
              </p>
              <div className="bg-polar-white border border-polar-border p-4 text-left text-xs font-mono">
                <p className="font-bold mb-2">Pour importer des films :</p>
                <ol className="list-decimal list-inside space-y-1 text-polar-ink-3">
                  <li>Ouvrez un terminal dans le dossier <code className="bg-polar-surface px-1">tools/tmdb-importer</code></li>
                  <li>Exécutez : <code className="bg-polar-surface px-1">npm install</code></li>
                  <li>Créez un fichier <code className="bg-polar-surface px-1">.env</code> avec votre clé Supabase</li>
                  <li>Exécutez : <code className="bg-polar-surface px-1">node importer.js 50</code></li>
                </ol>
              </div>
            </div>
          </div>
        ) : (
          <div className="flex lg:grid lg:grid-cols-5 gap-3 px-4 lg:px-8 overflow-x-auto lg:overflow-visible snap-x snap-mandatory pb-2 -mx-4 lg:mx-0 px-4 lg:px-8">
            {movies.slice(0, 5).map((movie, idx) => (
              <Link
                key={movie.id}
                to={`/movie/${movie.id}`}
                className={`relative flex-shrink-0 snap-start group ${idx === 0 ? 'w-[280px] lg:w-auto lg:col-span-2 lg:row-span-2' : 'w-[140px] lg:w-auto'}`}
              >
                <div className={`relative overflow-hidden bg-polar-surface border border-polar-border ${idx === 0 ? 'aspect-[3/4] lg:aspect-auto lg:h-full' : 'aspect-[2/3]'}`}>
                  {movie.posterUrl ? (
                    <img
                      src={movie.posterUrl}
                      alt={movie.title}
                      className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                      loading={idx < 2 ? 'eager' : 'lazy'}
                    />
                  ) : (
                    <div className="w-full h-full flex flex-col items-center justify-center bg-polar-surface">
                      <Film className="w-8 h-8 text-polar-ink-3 mb-2" />
                      <span className="text-xs text-polar-ink-3">Enrichissement en cours...</span>
                    </div>
                  )}
                  <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent" />
                  <div className="absolute bottom-0 left-0 right-0 p-3">
                    <h3 className={`font-bold text-white leading-tight ${idx === 0 ? 'text-lg lg:text-xl' : 'text-sm'}`}>
                      {movie.title}
                    </h3>
                    <p className="text-white/70 text-xs mt-0.5">
                      {movie.year} · {movie.director}
                    </p>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}
      </section>

      <Separator className="mx-4 lg:mx-8 bg-polar-border" />

      {/* Analyses section */}
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
            <article
              key={article.id}
              className="group flex gap-4 p-3 bg-polar-surface border border-polar-border hover:border-polar-ink-3 transition-colors cursor-pointer"
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
            </article>
          ))}
        </div>
      </section>

      {movies.length >= limit && (
        <div className="px-4 lg:px-8 pb-8">
          <button
            type="button"
            onClick={() => setLimit((prev) => prev + 10)}
            className="w-full py-3 bg-polar-surface border border-polar-border text-sm font-medium text-polar-ink hover:border-polar-ink-3 transition-colors"
          >
            Charger plus
          </button>
        </div>
      )}
    </div>
  );
};
