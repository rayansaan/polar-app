import React, { useState, useRef } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { movies } from '../data';
import { useFavorites } from '../hooks/useFavorites';
import type { TabType } from '../types';
import styles from './MovieDetailScreen.module.css';

export const MovieDetailScreen: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState<TabType>('about');
  const [heroCompact, setHeroCompact] = useState(false);
  const [activeScene, setActiveScene] = useState(0);
  const [openHotspot, setOpenHotspot] = useState<string | null>(null);
  const [favorites, toggleFavorite] = useFavorites();

  const movie = movies.find((m) => m.id === id);
  const contentRef = useRef<HTMLDivElement>(null);

  if (!movie) return <div className={styles.notFound}>Film non trouvé</div>;

  const isFav = favorites.includes(movie.id);

  const handleScroll = () => {
    if (contentRef.current) {
      const scrollY = contentRef.current.scrollTop;
      setHeroCompact(scrollY > 100);
    }
  };

  const waveformBars = movie.keyScenes.map((scene) => {
    const bars = [];
    const count = 20;
    for (let i = 0; i < count; i++) {
      const height = Math.max(4, (scene.intensity / 100) * 40 * (0.5 + Math.random() * 0.5));
      bars.push(height);
    }
    return { scene, bars };
  });

  return (
    <div className={styles.overlay}>
      <div className={styles.header}>
        <button className={styles.backButton} onClick={() => navigate(-1)}>
          ←
        </button>
        <button
          className={`${styles.favButton} ${isFav ? styles.favActive : ''}`}
          onClick={() => toggleFavorite(movie.id)}
        >
          {isFav ? '✦' : '✧'}
        </button>
      </div>

      <div
        className={styles.content}
        ref={contentRef}
        onScroll={handleScroll}
      >
        <div
          className={`${styles.hero} ${heroCompact ? styles.heroCompact : ''}`}
        >
          <img src={movie.heroUrl} alt={movie.title} className={styles.heroImage} />
          <div className={styles.heroOverlay}></div>
          <div className={styles.heroContent}>
            <h1 className={styles.heroTitle}>{movie.title}</h1>
            <div className={styles.heroMeta}>
              <span>{movie.year}</span>
              <span>{movie.duration}</span>
              <span>{movie.director}</span>
            </div>
          </div>
        </div>

        <div className={styles.tabs}>
          {(['about', 'cast', 'keyscenes'] as TabType[]).map((tab) => (
            <button
              key={tab}
              className={`${styles.tab} ${activeTab === tab ? styles.tabActive : ''}`}
              onClick={() => setActiveTab(tab)}
            >
              {tab === 'about' ? 'ABOUT' : tab === 'cast' ? 'CASTING' : 'KEY SCENES'}
            </button>
          ))}
        </div>

        <div className={styles.tabContent}>
          {activeTab === 'about' && (
            <div className={styles.about}>
              <p className={styles.synopsis}>{movie.synopsis}</p>

              <div className={styles.director}>
                <img src={movie.directorPhoto} alt={movie.director} className={styles.directorPhoto} />
                <div className={styles.directorInfo}>
                  <span className={styles.directorName}>{movie.director}</span>
                  <p className={styles.directorBio}>{movie.directorBio}</p>
                </div>
              </div>

              <div className={styles.section}>
                <h3 className={styles.sectionTitle}>ANECDOTE</h3>
                <p className={styles.sectionText}>{movie.anecdote}</p>
              </div>

              <div className={styles.section}>
                <h3 className={styles.sectionTitle}>INSPIRATION</h3>
                <p className={styles.sectionText}>{movie.inspiration}</p>
              </div>

              <div className={styles.section}>
                <h3 className={styles.sectionTitle}>NOMINATIONS</h3>
                <div className={styles.nominations}>
                  {movie.nominations.map((n) => (
                    <span key={n} className={styles.nomination}>{n}</span>
                  ))}
                </div>
              </div>

              <div className={styles.section}>
                <h3 className={styles.sectionTitle}>PLATEFORMES</h3>
                <div className={styles.platforms}>
                  {movie.platforms.map((p) => (
                    <span key={p} className={styles.platform}>{p}</span>
                  ))}
                </div>
              </div>
            </div>
          )}

          {activeTab === 'cast' && (
            <div className={styles.cast}>
              <div className={styles.castGrid}>
                {movie.cast.map((actor) => (
                  <div key={actor.id} className={styles.castItem}>
                    <img src={actor.photoUrl} alt={actor.name} className={styles.castPhoto} />
                    <span className={styles.castName}>{actor.name}</span>
                    <span className={styles.castRole}>{actor.role}</span>
                  </div>
                ))}
              </div>
            </div>
          )}

          {activeTab === 'keyscenes' && (
            <div className={styles.keyScenes}>
              <div className={styles.sceneList}>
                {movie.keyScenes.map((scene, idx) => (
                  <div
                    key={scene.id}
                    className={`${styles.sceneCard} ${activeScene === idx ? styles.sceneActive : ''}`}
                    onClick={() => {
                      setActiveScene(idx);
                      setOpenHotspot(null);
                    }}
                  >
                    <img src={scene.thumbnailUrl} alt={scene.title} className={styles.sceneThumb} />
                    <div className={styles.sceneInfo}>
                      <span className={styles.sceneTimestamp}>{scene.timestamp}</span>
                      <span className={styles.sceneTitle}>{scene.title}</span>
                    </div>
                  </div>
                ))}
              </div>

              <div className={styles.waveformContainer}>
                <svg className={styles.waveform} viewBox="0 0 300 50">
                  {waveformBars[activeScene]?.bars.map((height, i) => (
                    <rect
                      key={i}
                      x={i * 15}
                      y={(50 - height) / 2}
                      width="10"
                      height={height}
                      fill="var(--pink)"
                      rx="0.5"
                    />
                  ))}
                </svg>
                <div className={styles.scrubber}>
                  <div className={styles.scrubberTrack}></div>
                  <div
                    className={styles.scrubberHandle}
                    style={{
                      left: `${(activeScene / (movie.keyScenes.length - 1)) * 100}%`,
                    }}
                  />
                </div>
              </div>

              <div className={styles.hotspots}>
                {movie.keyScenes[activeScene]?.hotspots.map((hotspot) => (
                  <div
                    key={hotspot.id}
                    className={`${styles.hotspot} ${openHotspot === hotspot.id ? styles.hotspotOpen : ''}`}
                    onClick={() =>
                      setOpenHotspot(openHotspot === hotspot.id ? null : hotspot.id)
                    }
                  >
                    <div className={styles.hotspotHeader}>
                      <span className={styles.hotspotType}>{hotspot.type}</span>
                      <span className={styles.hotspotTime}>{hotspot.timestamp}</span>
                    </div>
                    <h4 className={styles.hotspotTitle}>{hotspot.title}</h4>
                    {openHotspot === hotspot.id && (
                      <p className={styles.hotspotDesc}>{hotspot.description}</p>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
