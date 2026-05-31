import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { locations, movies } from '../data';
import { BrandBar } from '../components/ui/BrandBar';
import styles from './MapScreen.module.css';

export const MapScreen: React.FC = () => {
  const [activeLocation, setActiveLocation] = useState<string | null>(null);

  return (
    <div className={styles.screen}>
      <div className={styles.header}>
        <BrandBar label="CARTE DE TOURNAGE" />
      </div>

      <div className={styles.mapContainer}>
        <svg viewBox="0 0 100 60" className={styles.map}>
          {/* Simplified world map paths */}
          <path
            d="M20,15 Q25,10 30,15 T40,20 Q45,15 50,20 T60,18 Q65,22 70,20 T80,25 Q85,20 90,25"
            fill="none"
            stroke="var(--ink-3)"
            strokeWidth="0.3"
            opacity="0.3"
          />
          <path
            d="M15,25 Q20,22 25,25 T35,28 Q40,25 45,28 T55,26 Q60,30 65,28 T75,32 Q80,28 85,32"
            fill="none"
            stroke="var(--ink-3)"
            strokeWidth="0.3"
            opacity="0.3"
          />
          <path
            d="M25,35 Q30,32 35,35 T45,38 Q50,35 55,38 T65,36 Q70,40 75,38 T85,42"
            fill="none"
            stroke="var(--ink-3)"
            strokeWidth="0.3"
            opacity="0.3"
          />

          {locations.map((loc) => (
            <g key={loc.id}>
              <circle
                cx={loc.x}
                cy={loc.y}
                r="1.2"
                fill={activeLocation === loc.id ? 'var(--ink)' : 'var(--surface)'}
                stroke="var(--ink)"
                strokeWidth="0.4"
                className={styles.pin}
                onClick={() => {
                  setActiveLocation(loc.id);
                  setTimeout(() => setActiveLocation(null), 3000);
                }}
              />
              {activeLocation === loc.id && (
                <g>
                  <rect
                    x={loc.x - 12}
                    y={loc.y - 14}
                    width="24"
                    height="10"
                    fill="var(--white)"
                    stroke="var(--ink)"
                    strokeWidth="0.2"
                  />
                  <text
                    x={loc.x}
                    y={loc.y - 8}
                    textAnchor="middle"
                    fontSize="2.5"
                    fill="var(--ink)"
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

      <div className={styles.locationList}>
        {locations.map((loc) => {
          const locMovies = movies.filter((m) => m.locations.includes(loc.city));
          return (
            <div key={loc.id} className={styles.locationItem}>
              <div className={styles.locationHeader}>
                <span className={styles.locationCity}>{loc.city}</span>
                <span className={styles.locationCountry}>{loc.country}</span>
              </div>
              <p className={styles.locationDesc}>{loc.description}</p>
              <div className={styles.locationMovies}>
                {locMovies.map((m) => (
                  <Link key={m.id} to={`/movie/${m.id}`} className={styles.locMovie}>
                    {m.title} ({m.year})
                  </Link>
                ))}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};
