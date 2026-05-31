import React from 'react';
import { Link } from 'react-router-dom';
import { useEnrichedMovies } from '../hooks/useEnrichedMovie';
import { useFavorites } from '../hooks/useFavorites';
import { useGenreStats } from '../hooks/useGenreStats';
import { Separator } from '../components/ui/separator';
import { Badge } from '../components/ui/badge';
import { Film, Eye, BookOpen, Heart } from 'lucide-react';

export const ProfileScreen: React.FC = () => {
  const [favorites] = useFavorites();
  const { movies: allMovies } = useEnrichedMovies(50, 0);
  const favMovies = allMovies.filter((m) => favorites.includes(m.id));
  const recentlyViewed = allMovies.slice(0, 8);
  const genreStats = useGenreStats();

  return (
    <div className="min-h-screen pb-20 lg:pb-0">
      {/* Header profil */}
      <header className="px-4 lg:px-8 pt-6 pb-6">
        <div className="flex items-center gap-4">
          <div className="w-16 h-16 rounded-full bg-polar-ink flex items-center justify-center text-polar-white text-xl font-bold">
            P
          </div>
          <div>
            <h1 className="text-xl font-bold text-polar-ink">Profil</h1>
            <p className="text-sm text-polar-ink-3">Analyste cinéphile</p>
          </div>
        </div>
      </header>

      {/* Stats */}
      <div className="px-4 lg:px-8 mb-6">
        <div className="grid grid-cols-3 gap-3">
          <div className="bg-polar-surface border border-polar-border p-4 text-center">
            <Eye className="w-5 h-5 mx-auto mb-2 text-polar-ink-3" aria-hidden="true" />
            <span className="block text-2xl font-bold text-polar-ink">{favorites.length}</span>
            <span className="text-[10px] uppercase tracking-wider text-polar-ink-3">Films vus</span>
          </div>
          <div className="bg-polar-surface border border-polar-border p-4 text-center">
            <BookOpen className="w-5 h-5 mx-auto mb-2 text-polar-ink-3" aria-hidden="true" />
            <span className="block text-2xl font-bold text-polar-ink">12</span>
            <span className="text-[10px] uppercase tracking-wider text-polar-ink-3">Analyses</span>
          </div>
          <div className="bg-polar-surface border border-polar-border p-4 text-center">
            <Film className="w-5 h-5 mx-auto mb-2 text-polar-ink-3" aria-hidden="true" />
            <span className="block text-2xl font-bold text-polar-ink">4</span>
            <span className="text-[10px] uppercase tracking-wider text-polar-ink-3">Listes</span>
          </div>
        </div>
      </div>

      <Separator className="mx-4 lg:mx-8 bg-polar-border" />

      {/* Genres favoris */}
      <section className="px-4 lg:px-8 py-6">
        <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink mb-4">
          Genres favoris
        </h2>
        <div className="space-y-3">
          {genreStats.map(({ genre, percentage }) => (
            <div key={genre} className="flex items-center gap-3">
              <span className="text-xs text-polar-ink-2 w-28 shrink-0">{genre}</span>
              <div className="flex-1 h-2 bg-polar-white border border-polar-border">
                <div
                  className="h-full bg-polar-ink transition-all duration-1000"
                  style={{ width: `${percentage}%` }}
                />
              </div>
            </div>
          ))}
        </div>
      </section>

      <Separator className="mx-4 lg:mx-8 bg-polar-border" />

      {/* Récemment consultés */}
      <section className="px-4 lg:px-8 py-6">
        <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink mb-4">
          Récemment consultés
        </h2>
        <div className="grid grid-cols-4 lg:grid-cols-8 gap-2">
          {recentlyViewed.map((m) => (
            <Link key={m.id} to={`/movie/${m.id}`} className="group">
              <div className="aspect-[2/3] overflow-hidden bg-polar-surface border border-polar-border">
                {m.posterUrl ? (
                  <img
                    src={m.posterUrl}
                    alt={m.title}
                    className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                    loading="lazy"
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center">
                    <Film className="w-6 h-6 text-polar-ink-3" />
                  </div>
                )}
              </div>
              <p className="mt-1.5 text-[10px] text-polar-ink truncate">{m.title}</p>
            </Link>
          ))}
        </div>
      </section>

      <Separator className="mx-4 lg:mx-8 bg-polar-border" />

      {/* Favoris */}
      {favMovies.length > 0 && (
        <section className="px-4 lg:px-8 py-6">
          <div className="flex items-center gap-2 mb-4">
            <Heart className="w-4 h-4 text-polar-pink" aria-hidden="true" />
            <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink">
              Favoris
            </h2>
          </div>
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-3">
            {favMovies.map((m) => (
              <Link key={m.id} to={`/movie/${m.id}`} className="group flex gap-3 p-2 bg-polar-surface border border-polar-border hover:border-polar-ink-3 transition-colors">
                <div className="w-12 h-16 shrink-0 overflow-hidden bg-polar-white">
                  {m.posterUrl ? (
                    <img src={m.posterUrl} alt={m.title} className="w-full h-full object-cover" loading="lazy" />
                  ) : (
                    <div className="w-full h-full flex items-center justify-center">
                      <Film className="w-4 h-4 text-polar-ink-3" />
                    </div>
                  )}
                </div>
                <div className="min-w-0 py-0.5">
                  <p className="text-xs font-medium text-polar-ink truncate">{m.title}</p>
                  <p className="text-[10px] text-polar-ink-3 mt-0.5">{m.year} · {m.director}</p>
                  <div className="flex flex-wrap gap-1 mt-1">
                    {m.genre.slice(0, 1).map((g) => (
                      <Badge key={g} variant="secondary" className="text-[8px]">{g}</Badge>
                    ))}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>
      )}
    </div>
  );
};
