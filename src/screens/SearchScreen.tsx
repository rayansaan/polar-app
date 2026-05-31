import React, { useState, useMemo } from 'react';
import { Link } from 'react-router-dom';
import { movies } from '../data';
import styles from './SearchScreen.module.css';

type ContentType = 'all' | 'film' | 'series';

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
        m.director.toLowerCase().includes(q);
      return matchesType && matchesQuery;
    });
  }, [query, type]);

  const isSearchActive = query.trim().length > 0;

  return (
    <div className={styles.screen}>
      <div className={styles.searchHeader}>
        <div className={styles.searchBar}>
          <span className={styles.searchIcon}>◈</span>
          <input
            type="text"
            placeholder="Films, réalisateurs..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className={styles.input}
          />
          {query && (
            <button className={styles.clear} onClick={() => setQuery('')}>✕</button>
          )}
        </div>

        <div className={styles.segmentControl}>
          {(['all', 'film', 'series'] as ContentType[]).map((t) => (
            <button
              key={t}
              className={`${styles.segment} ${type === t ? styles.segmentActive : ''}`}
              onClick={() => setType(t)}
            >
              {t === 'all' ? 'TOUT' : t === 'film' ? 'FILMS' : 'SÉRIES'}
            </button>
          ))}
        </div>
      </div>

      <div className={styles.content}>
        {!isSearchActive ? (
          <div className={styles.browse}>
            <div className={styles.browseSection}>
              <h3 className={styles.browseTitle}>NEWEST</h3>
              <div className={styles.browseList}>
                {movies.slice(0, 3).map((m) => (
                  <Link key={m.id} to={`/movie/${m.id}`} className={styles.browseItem}>
                    <img src={m.posterUrl} alt={m.title} className={styles.browseThumb} />
                    <div className={styles.browseInfo}>
                      <span className={styles.browseName}>{m.title}</span>
                      <span className={styles.browseMeta}>{m.year}</span>
                    </div>
                  </Link>
                ))}
              </div>
            </div>

            <div className={styles.browseSection}>
              <h3 className={styles.browseTitle}>POPULAR</h3>
              <div className={styles.browseList}>
                {movies.slice(3, 6).map((m) => (
                  <Link key={m.id} to={`/movie/${m.id}`} className={styles.browseItem}>
                    <img src={m.posterUrl} alt={m.title} className={styles.browseThumb} />
                    <div className={styles.browseInfo}>
                      <span className={styles.browseName}>{m.title}</span>
                      <span className={styles.browseMeta}>{m.year}</span>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          </div>
        ) : (
          <div className={styles.results}>
            <p className={styles.resultsCount}>{results.length} RÉSULTAT{results.length > 1 ? 'S' : ''}</p>
            {results.map((m) => (
              <Link key={m.id} to={`/movie/${m.id}`} className={styles.resultCard}>
                <img src={m.posterUrl} alt={m.title} className={styles.resultThumb} />
                <div className={styles.resultInfo}>
                  <span className={styles.resultName}>{m.title}</span>
                  <span className={styles.resultMeta}>{m.year} · {m.director}</span>
                  <div className={styles.resultTags}>
                    {m.genre.slice(0, 2).map((g) => (
                      <span key={g} className={styles.resultTag}>{g}</span>
                    ))}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};
