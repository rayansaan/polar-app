import React from 'react';
import { movies } from '../data';
import { useFavorites } from '../hooks/useFavorites';
import { BrandBar } from '../components/ui/BrandBar';
import styles from './ProfileScreen.module.css';

export const ProfileScreen: React.FC = () => {
  const [favorites] = useFavorites();
  const favMovies = movies.filter((m) => favorites.includes(m.id));
  const recentlyViewed = movies.slice(0, 4);

  return (
    <div className={styles.screen}>
      <div className={styles.header}>
        <BrandBar label="PROFIL" />
      </div>

      <div className={styles.stats}>
        <div className={styles.statCard}>
          <span className={styles.statValue}>{favorites.length}</span>
          <span className={styles.statLabel}>FILMS VUS</span>
        </div>
        <div className={styles.statCard}>
          <span className={styles.statValue}>12</span>
          <span className={styles.statLabel}>ANALYSES</span>
        </div>
        <div className={styles.statCard}>
          <span className={styles.statValue}>4</span>
          <span className={styles.statLabel}>THÉORIES</span>
        </div>
      </div>

      <div className={styles.section}>
        <BrandBar label="GENRES FAVORIS" />
        <div className={styles.genres}>
          {['Science-Fiction', 'Thriller', 'Drame', 'Aventure'].map((genre) => (
            <div key={genre} className={styles.genre}>
              <span className={styles.genreName}>{genre}</span>
              <div className={styles.genreBar}>
                <div
                  className={styles.genreFill}
                  style={{ width: `${Math.floor(Math.random() * 60 + 40)}%` }}
                />
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className={styles.section}>
        <BrandBar label="RÉCEMMENT CONSULTÉS" />
        <div className={styles.historyGrid}>
          {recentlyViewed.map((m) => (
            <div key={m.id} className={styles.historyItem}>
              <img src={m.posterUrl} alt={m.title} className={styles.historyThumb} />
              <span className={styles.historyTitle}>{m.title}</span>
            </div>
          ))}
        </div>
      </div>

      {favMovies.length > 0 && (
        <div className={styles.section}>
          <BrandBar label="FAVORIS" />
          <div className={styles.favList}>
            {favMovies.map((m) => (
              <div key={m.id} className={styles.favItem}>
                <img src={m.posterUrl} alt={m.title} className={styles.favThumb} />
                <div className={styles.favInfo}>
                  <span className={styles.favName}>{m.title}</span>
                  <span className={styles.favMeta}>{m.year} · {m.director}</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
};
