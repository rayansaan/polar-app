import { useState, useRef, useMemo } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { movies } from '../data';
import { useFavorites } from '../hooks/useFavorites';
import { Badge } from '../components/ui/badge';
import { Button } from '../components/ui/button';
import type { TabType } from '../types';
import { ArrowLeft, Heart, Clock, Calendar, User, Play, Lightbulb, Award, Tv } from 'lucide-react';

export const MovieDetailScreen: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState<TabType>('about');
  const [activeScene, setActiveScene] = useState(0);
  const [openHotspot, setOpenHotspot] = useState<string | null>(null);
  const [favorites, toggleFavorite] = useFavorites();
  const [heroCompact, setHeroCompact] = useState(false);

  const movie = movies.find((m) => m.id === id);
  const contentRef = useRef<HTMLDivElement>(null);

  // Stabiliser le waveform avec useMemo
  const waveformBars = useMemo(() => {
    return movie?.keyScenes.map((scene) => {
      const bars = [];
      const count = 20;
      for (let i = 0; i < count; i++) {
        const height = Math.max(4, (scene.intensity / 100) * 40 * (0.5 + Math.random() * 0.5));
        bars.push(height);
      }
      return { scene, bars };
    }) || [];
  }, [movie?.id]); // Se recalcule seulement quand le film change

  if (!movie) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-polar-ink-3">Film non trouvé</p>
      </div>
    );
  }

  const isFav = favorites.includes(movie.id);

  const handleScroll = () => {
    if (contentRef.current) {
      setHeroCompact(contentRef.current.scrollTop > 100);
    }
  };

  const tabs: { id: TabType; label: string }[] = [
    { id: 'about', label: 'Résumé' },
    { id: 'cast', label: 'Casting' },
    { id: 'keyscenes', label: 'Scènes clés' },
  ];

  return (
    <div className="min-h-screen animate-fade-in">
      {/* Mobile header */}
      <div className="lg:hidden fixed top-0 left-0 right-0 z-10 flex items-center justify-between px-4 h-14">
        <button
          type="button"
          onClick={() => navigate(-1)}
          className="w-9 h-9 flex items-center justify-center bg-polar-surface/80 backdrop-blur border border-polar-border"
        >
          <ArrowLeft className="w-4 h-4" aria-hidden="true" />
        </button>
        <button
          type="button"
          onClick={() => toggleFavorite(movie.id)}
          className={`w-9 h-9 flex items-center justify-center border transition-colors ${
            isFav
              ? 'bg-polar-pink text-white border-polar-pink'
              : 'bg-polar-surface/80 backdrop-blur border-polar-border'
          }`}
        >
          <Heart className={`w-4 h-4 ${isFav ? 'fill-current' : ''}`} aria-hidden="true" />
        </button>
      </div>

      <div
        ref={contentRef}
        onScroll={handleScroll}
        className="h-full overflow-y-auto lg:overflow-visible lg:h-auto">
        <div className="lg:flex lg:gap-8 lg:px-8 lg:py-6">
          {/* Left column - Poster + info */}
          <div className="lg:w-[300px] lg:shrink-0">
            {/* Mobile hero */}
            <div className="lg:hidden relative">
              <div className={`relative transition-all duration-500 ${heroCompact ? 'h-48' : 'h-[50vh]'}`}>
                <img
                  src={movie.heroUrl}
                  alt={movie.title}
                  className="w-full h-full object-cover"
                  loading="eager"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-polar-bg via-transparent to-transparent" />
              </div>
              <div className="absolute bottom-0 left-0 right-0 px-4 pb-4">
                <h1 className="text-2xl font-bold text-white drop-shadow-lg">{movie.title}</h1>
                <div className="flex items-center gap-3 mt-1 text-white/80 text-sm">
                  <span className="flex items-center gap-1"><Calendar className="w-3 h-3" aria-hidden="true" />{movie.year}</span>
                  <span className="flex items-center gap-1"><Clock className="w-3 h-3" aria-hidden="true" />{movie.duration}</span>
                </div>
              </div>
            </div>

            {/* Desktop poster + info */}
            <div className="hidden lg:block sticky top-6">
              <div className="aspect-[2/3] overflow-hidden bg-polar-surface border border-polar-border mb-4">
                <img src={movie.posterUrl} alt={movie.title} className="w-full h-full object-cover" loading="eager" />
              </div>
              <Button
                variant={isFav ? 'accent' : 'secondary'}
                className="w-full mb-4"
                onClick={() => toggleFavorite(movie.id)}
              >
                <Heart className={`w-4 h-4 mr-2 ${isFav ? 'fill-current' : ''}`} aria-hidden="true" />
                {isFav ? 'Dans vos favoris' : 'Ajouter aux favoris'}
              </Button>
              <div className="space-y-2">
                <div className="flex items-center gap-2 text-xs text-polar-ink-3">
                  <Calendar className="w-3.5 h-3.5" aria-hidden="true" />
                  {movie.year}
                </div>
                <div className="flex items-center gap-2 text-xs text-polar-ink-3">
                  <Clock className="w-3.5 h-3.5" aria-hidden="true" />
                  {movie.duration}
                </div>
                <div className="flex items-center gap-2 text-xs text-polar-ink-3">
                  <User className="w-3.5 h-3.5" aria-hidden="true" />
                  {movie.director}
                </div>
              </div>
            </div>
          </div>

          {/* Right column - Content */}
          <div className="flex-1 min-w-0">
            {/* Desktop title */}
            <div className="hidden lg:block mb-6">
              <h1 className="text-3xl font-bold text-polar-ink">{movie.title}</h1>
              <div className="flex items-center gap-2 mt-2">
                {movie.genre.map((g) => (
                  <Badge key={g} variant="secondary">{g}</Badge>
                ))}
              </div>
            </div>

            {/* Tabs */}
            <div className="flex border-b border-polar-border mt-4 lg:mt-0 px-4 lg:px-0" role="tablist">
              {tabs.map((tab) => (
                <button
                  key={tab.id}
                  type="button"
                  role="tab"
                  aria-selected={activeTab === tab.id}
                  onClick={() => {
                    setActiveTab(tab.id);
                    setOpenHotspot(null);
                  }}
                  className={`px-4 py-3 text-xs font-medium uppercase tracking-wider border-b-2 transition-colors ${
                    activeTab === tab.id
                      ? 'border-polar-ink text-polar-ink'
                      : 'border-transparent text-polar-ink-3 hover:text-polar-ink-2'
                  }`}
                >
                  {tab.label}
                </button>
              ))}
            </div>

            {/* Tab content */}
            <div className="px-4 lg:px-0 py-6">
              {activeTab === 'about' && (
                <div className="space-y-6">
                  <p className="text-sm leading-relaxed text-polar-ink-2">{movie.synopsis}</p>

                  <div className="flex gap-4 p-4 bg-polar-surface border border-polar-border">
                    <img
                      src={movie.directorPhoto}
                      alt={movie.director}
                      className="w-14 h-14 rounded-full object-cover shrink-0"
                      loading="lazy"
                    />
                    <div>
                      <span className="text-sm font-semibold text-polar-ink">{movie.director}</span>
                      <p className="text-xs text-polar-ink-3 mt-1 leading-relaxed">{movie.directorBio}</p>
                    </div>
                  </div>

                  <div>
                    <div className="flex items-center gap-2 mb-2">
                      <Lightbulb className="w-4 h-4 text-polar-ink-3" aria-hidden="true" />
                      <h3 className="text-xs font-bold uppercase tracking-wider text-polar-ink">Anecdote</h3>
                    </div>
                    <p className="text-sm text-polar-ink-2 leading-relaxed">{movie.anecdote}</p>
                  </div>

                  <div>
                    <div className="flex items-center gap-2 mb-2">
                      <Play className="w-4 h-4 text-polar-ink-3" aria-hidden="true" />
                      <h3 className="text-xs font-bold uppercase tracking-wider text-polar-ink">Inspiration</h3>
                    </div>
                    <p className="text-sm text-polar-ink-2 leading-relaxed">{movie.inspiration}</p>
                  </div>

                  <div>
                    <div className="flex items-center gap-2 mb-2">
                      <Award className="w-4 h-4 text-polar-ink-3" aria-hidden="true" />
                      <h3 className="text-xs font-bold uppercase tracking-wider text-polar-ink">Nominations</h3>
                    </div>
                    <div className="flex flex-wrap gap-2">
                      {movie.nominations.map((n) => (
                        <Badge key={n} variant="outline">{n}</Badge>
                      ))}
                    </div>
                  </div>

                  <div>
                    <div className="flex items-center gap-2 mb-2">
                      <Tv className="w-4 h-4 text-polar-ink-3" aria-hidden="true" />
                      <h3 className="text-xs font-bold uppercase tracking-wider text-polar-ink">Plateformes</h3>
                    </div>
                    <div className="flex flex-wrap gap-2">
                      {movie.platforms.map((p) => (
                        <Badge key={p} variant="secondary">{p}</Badge>
                      ))}
                    </div>
                  </div>
                </div>
              )}

              {activeTab === 'cast' && (
                <div className="grid grid-cols-2 lg:grid-cols-3 gap-3">
                  {movie.cast.map((actor) => (
                    <div key={actor.id} className="bg-polar-surface border border-polar-border p-3 text-center">
                      <img
                        src={actor.photoUrl}
                        alt={actor.name}
                        className="w-16 h-16 rounded-full object-cover mx-auto mb-2"
                        loading="lazy"
                      />
                      <span className="text-sm font-medium text-polar-ink block">{actor.name}</span>
                      <span className="text-xs text-polar-ink-3">{actor.role}</span>
                    </div>
                  ))}
                </div>
              )}

              {activeTab === 'keyscenes' && (
                <div className="space-y-6">
                  <div className="grid grid-cols-2 lg:grid-cols-4 gap-2">
                    {movie.keyScenes.map((scene, idx) => (
                      <button
                        key={scene.id}
                        type="button"
                        onClick={() => {
                          setActiveScene(idx);
                          setOpenHotspot(null);
                        }}
                        className={`relative overflow-hidden border transition-colors text-left ${
                          activeScene === idx
                            ? 'border-polar-ink'
                            : 'border-polar-border hover:border-polar-ink-3'
                        }`}
                      >
                        <img
                          src={scene.thumbnailUrl}
                          alt={scene.title}
                          className="w-full aspect-video object-cover"
                          loading="lazy"
                        />
                        <div className="p-2">
                          <span className="text-[10px] text-polar-ink-3 uppercase tracking-wider">{scene.timestamp}</span>
                          <p className="text-xs font-medium text-polar-ink mt-0.5 line-clamp-2">{scene.title}</p>
                        </div>
                      </button>
                    ))}
                  </div>

                  <div className="bg-polar-surface border border-polar-border p-4">
                    <div className="flex items-center justify-between mb-3">
                      <span className="text-sm font-semibold text-polar-ink">
                        {movie.keyScenes[activeScene]?.title}
                      </span>
                      <span className="text-xs text-polar-ink-3">
                        Intensité: {movie.keyScenes[activeScene]?.intensity}%
                      </span>
                    </div>
                    <svg className="w-full h-12" viewBox="0 0 300 50">
                      {waveformBars[activeScene]?.bars.map((height, i) => (
                        <rect
                          key={i}
                          x={i * 15}
                          y={(50 - height) / 2}
                          width="10"
                          height={height}
                          fill="#e5267a"
                          rx="0.5"
                        />
                      ))}
                    </svg>
                  </div>

                  <div className="space-y-2">
                    {movie.keyScenes[activeScene]?.hotspots.map((hotspot) => (
                      <div
                        key={hotspot.id}
                        className="border border-polar-border bg-polar-surface overflow-hidden"
                      >
                        <button
                          type="button"
                          onClick={() =>
                            setOpenHotspot(openHotspot === hotspot.id ? null : hotspot.id)
                          }
                          className="w-full flex items-center justify-between p-3 text-left"
                          aria-expanded={openHotspot === hotspot.id}
                        >
                          <div className="flex items-center gap-3">
                            <Badge variant="outline" className="text-[9px]">{hotspot.type}</Badge>
                            <span className="text-sm font-medium text-polar-ink">{hotspot.title}</span>
                          </div>
                          <span className="text-xs text-polar-ink-3">{hotspot.timestamp}</span>
                        </button>
                        {openHotspot === hotspot.id && (
                          <div className="px-3 pb-3">
                            <p className="text-xs text-polar-ink-2 leading-relaxed">{hotspot.description}</p>
                          </div>
                        )}
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
