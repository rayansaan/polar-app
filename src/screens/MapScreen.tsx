import { useState } from 'react';
import { Link } from 'react-router-dom';
import { locations } from '../data';
import { useEnrichedMovies } from '../hooks/useEnrichedMovie';
import { MapPin, Film } from 'lucide-react';

export const MapScreen: React.FC = () => {
  const [activeLocation, setActiveLocation] = useState<string | null>(null);
  const { movies, loading } = useEnrichedMovies(50, 0);

  return (
    <div className="min-h-screen pb-20 lg:pb-0">
      <header className="px-4 lg:px-8 pt-6 pb-4">
        <h1 className="text-2xl lg:text-3xl font-bold tracking-tight text-polar-ink">
          Carte de tournage
        </h1>
        <p className="text-sm text-polar-ink-3 mt-1">
          Explorez les lieux de tournage à travers le monde
        </p>
      </header>

      <div className="lg:flex lg:gap-6 lg:px-8">
        {/* Carte */}
        <div className="px-4 lg:px-0 lg:flex-1 mb-6 lg:mb-0">
          <div className="bg-polar-surface border border-polar-border p-4 lg:p-6">
            <svg viewBox="0 0 100 60" className="w-full h-auto">
              <path
                d="M20,15 Q25,10 30,15 T40,20 Q45,15 50,20 T60,18 Q65,22 70,20 T80,25 Q85,20 90,25"
                fill="none"
                stroke="#9a8e82"
                strokeWidth="0.3"
                opacity="0.3"
              />
              <path
                d="M15,25 Q20,22 25,25 T35,28 Q40,25 45,28 T55,26 Q60,30 65,28 T75,32 Q80,28 85,32"
                fill="none"
                stroke="#9a8e82"
                strokeWidth="0.3"
                opacity="0.3"
              />
              <path
                d="M25,35 Q30,32 35,35 T45,38 Q50,35 55,38 T65,36 Q70,40 75,38 T85,42"
                fill="none"
                stroke="#9a8e82"
                strokeWidth="0.3"
                opacity="0.3"
              />

              {locations.map((loc) => (
                <g key={loc.id}>
                  <circle
                    cx={loc.x}
                    cy={loc.y}
                    r="1.2"
                    fill={activeLocation === loc.id ? '#312117' : '#edeae4'}
                    stroke="#312117"
                    strokeWidth="0.4"
                    className="cursor-pointer transition-colors hover:fill-polar-pink"
                    tabIndex={0}
                    role="button"
                    aria-label={`Voir les films tournés à ${loc.city}`}
                    onClick={() => setActiveLocation(loc.id)}
                    onKeyDown={(e) => {
                      if (e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        setActiveLocation(loc.id);
                      }
                    }}
                  />
                  {activeLocation === loc.id && (
                    <g>
                      <rect
                        x={loc.x - 12}
                        y={loc.y - 14}
                        width="24"
                        height="10"
                        fill="#f5f3ee"
                        stroke="#312117"
                        strokeWidth="0.2"
                      />
                      <text
                        x={loc.x}
                        y={loc.y - 8}
                        textAnchor="middle"
                        fontSize="2.5"
                        fill="#312117"
                        fontFamily="sans-serif"
                      >
                        {loc.city}
                      </text>
                    </g>
                  )}
                </g>
              ))}
            </svg>
          </div>
        </div>

        {/* Liste */}
        <div className="px-4 lg:px-0 lg:w-[380px]">
          <h2 className="text-sm font-bold uppercase tracking-wider text-polar-ink mb-4">
            Lieux
          </h2>
          {loading ? (
            <div className="space-y-3">
              {Array.from({ length: 4 }).map((_, i) => (
                <div key={i} className="h-20 bg-polar-surface border border-polar-border animate-pulse" />
              ))}
            </div>
          ) : (
            <div className="space-y-3">
              {locations.map((loc) => {
                const locMovies = movies.filter((m) => m.locations.includes(loc.city));
                const isActive = activeLocation === loc.id;
                return (
                  <div
                    key={loc.id}
                    className={`p-3 border transition-colors cursor-pointer ${
                      isActive
                        ? 'bg-polar-ink text-polar-white border-polar-ink'
                        : 'bg-polar-surface border-polar-border hover:border-polar-ink-3'
                    }`}
                    onClick={() => setActiveLocation(isActive ? null : loc.id)}
                    role="button"
                    tabIndex={0}
                    aria-expanded={isActive}
                    onKeyDown={(e) => {
                      if (e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        setActiveLocation(isActive ? null : loc.id);
                      }
                    }}
                  >
                    <div className="flex items-start justify-between">
                      <div className="flex items-center gap-2">
                        <MapPin className={`w-4 h-4 ${isActive ? 'text-polar-white' : 'text-polar-ink-3'}`} aria-hidden="true" />
                        <div>
                          <span className={`text-sm font-medium block ${isActive ? 'text-polar-white' : 'text-polar-ink'}`}>
                            {loc.city}
                          </span>
                          <span className={`text-xs ${isActive ? 'text-polar-white/70' : 'text-polar-ink-3'}`}>
                            {loc.country}
                          </span>
                        </div>
                      </div>
                      <span className={`text-xs ${isActive ? 'text-polar-white/70' : 'text-polar-ink-3'}`}>
                        {locMovies.length} film{locMovies.length > 1 ? 's' : ''}
                      </span>
                    </div>
                    <p className={`text-xs mt-2 ${isActive ? 'text-polar-white/80' : 'text-polar-ink-3'}`}>
                      {loc.description}
                    </p>
                    {isActive && locMovies.length > 0 && (
                      <div className="mt-3 pt-3 border-t border-polar-white/20 space-y-1">
                        {locMovies.map((m) => (
                          <Link
                            key={m.id}
                            to={`/movie/${m.id}`}
                            className="flex items-center gap-2 text-xs text-polar-white/90 hover:text-polar-white"
                          >
                            <Film className="w-3 h-3" aria-hidden="true" />
                            {m.title} ({m.year})
                          </Link>
                        ))}
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
