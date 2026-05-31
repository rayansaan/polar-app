import { useState, useMemo } from 'react';
import { Link } from 'react-router-dom';
import { movies } from '../data';
import { Input } from '../components/ui/input';
import { Badge } from '../components/ui/badge';
import { Separator } from '../components/ui/separator';
import { Search, X, TrendingUp, Clock } from 'lucide-react';

type ContentType = 'all' | 'film' | 'series';

const filters: { value: ContentType; label: string }[] = [
  { value: 'all', label: 'Tout' },
  { value: 'film', label: 'Films' },
  { value: 'series', label: 'Séries' },
];

export const SearchScreen: React.FC = () => {
  const [query, setQuery] = useState('');
  const [type, setType] = useState<ContentType>('all');

  const results = useMemo(() => {
    if (!query.trim()) return [];
    const q = query.toLowerCase();
    return movies.filter((m) => {
      const matchesType = type === 'all' || m.type === type;
      const matchesQuery =
        m.title.toLowerCase().includes(q) ||
        m.director.toLowerCase().includes(q) ||
        m.genre.some((g) => g.toLowerCase().includes(q));
      return matchesType && matchesQuery;
    });
  }, [query, type]);

  const isSearchActive = query.trim().length > 0;
  const newest = useMemo(() => movies.slice(0, 6), []);
  const popular = useMemo(() => [...movies].sort((a, b) => (b.popularity || 0) - (a.popularity || 0)).slice(0, 6), []);

  return (
    <div className="min-h-screen pb-20 lg:pb-0">
      <header className="px-4 lg:px-8 pt-6 pb-4">
        <h1 className="text-2xl lg:text-3xl font-bold tracking-tight text-polar-ink">
          Recherche
        </h1>
      </header>

      <div className="px-4 lg:px-8 mb-6">
        <div className="relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-polar-ink-3" aria-hidden="true" />
          <Input
            type="text"
            placeholder="Films, réalisateurs, genres..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="pl-10 pr-10"
          />
          {query && (
            <button
              type="button"
              onClick={() => setQuery('')}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-polar-ink-3 hover:text-polar-ink"
            >
              <X className="w-4 h-4" aria-hidden="true" />
            </button>
          )}
        </div>

        <div className="flex gap-2 mt-3">
          {filters.map((f) => (
            <button
              key={f.value}
              type="button"
              onClick={() => setType(f.value)}
              className={`px-4 py-1.5 text-xs font-medium uppercase tracking-wider border transition-colors ${
                type === f.value
                  ? 'bg-polar-ink text-polar-white border-polar-ink'
                  : 'bg-transparent text-polar-ink-2 border-polar-border hover:border-polar-ink-2'
              }`}
            >
              {f.label}
            </button>
          ))}
        </div>
      </div>

      <div className="px-4 lg:px-8">
        {!isSearchActive ? (
          <div className="space-y-8">
            <section>
              <div className="flex items-center gap-2 mb-4">
                <Clock className="w-4 h-4 text-polar-ink-3" aria-hidden="true" />
                <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink">Nouveautés</h2>
              </div>
              <div className="grid grid-cols-3 lg:grid-cols-6 gap-3">
                {newest.map((m) => (
                  <Link key={m.id} to={`/movie/${m.id}`} className="group">
                    <div className="aspect-[2/3] overflow-hidden bg-polar-surface border border-polar-border">
                      <img
                        src={m.posterUrl}
                        alt={m.title}
                        className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                        loading="lazy"
                      />
                    </div>
                    <p className="mt-2 text-xs font-medium text-polar-ink truncate">{m.title}</p>
                    <p className="text-[10px] text-polar-ink-3">{m.year}</p>
                  </Link>
                ))}
              </div>
            </section>

            <Separator className="bg-polar-border" />

            <section>
              <div className="flex items-center gap-2 mb-4">
                <TrendingUp className="w-4 h-4 text-polar-ink-3" aria-hidden="true" />
                <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink">Populaires</h2>
              </div>
              <div className="grid grid-cols-3 lg:grid-cols-6 gap-3">
                {popular.map((m) => (
                  <Link key={m.id} to={`/movie/${m.id}`} className="group">
                    <div className="aspect-[2/3] overflow-hidden bg-polar-surface border border-polar-border">
                      <img
                        src={m.posterUrl}
                        alt={m.title}
                        className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                        loading="lazy"
                      />
                    </div>
                    <p className="mt-2 text-xs font-medium text-polar-ink truncate">{m.title}</p>
                    <p className="text-[10px] text-polar-ink-3">{m.year}</p>
                  </Link>
                ))}
              </div>
            </section>
          </div>
        ) : (
          <div>
            <p className="text-xs text-polar-ink-3 uppercase tracking-wider mb-4">
              {results.length} résultat{results.length > 1 ? 's' : ''}
            </p>
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              {results.map((m) => (
                <Link key={m.id} to={`/movie/${m.id}`} className="group">
                  <div className="aspect-[2/3] overflow-hidden bg-polar-surface border border-polar-border">
                    <img
                      src={m.posterUrl}
                      alt={m.title}
                      className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                      loading="lazy"
                    />
                  </div>
                  <div className="mt-2">
                    <p className="text-sm font-medium text-polar-ink truncate">{m.title}</p>
                    <p className="text-xs text-polar-ink-3">{m.year} · {m.director}</p>
                    <div className="flex flex-wrap gap-1 mt-1.5">
                      {m.genre.slice(0, 2).map((g) => (
                        <Badge key={g} variant="secondary" className="text-[9px]">{g}</Badge>
                      ))}
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
