import React from 'react';
import { Link } from 'react-router-dom';
import { movies, articles } from '../data';
import { BrandBar } from '../components/ui/BrandBar';
import styles from './FeedScreen.module.css';

export const FeedScreen: React.FC = () => {
  const heroMovies = movies.slice(0, 5);

  return (
    <div className={styles.screen}>
      <div className={styles.header}>
        <BrandBar label="À LA UNE" />
      </div>

      <div className={styles.heroScroll}>
        {heroMovies.map((movie) => (
          <Link
            key={movie.id}
            to={`/movie/${movie.id}`}
            className={styles.heroCard}
          >
            <img src={movie.heroUrl} alt={movie.title} className={styles.heroImage} />
            <div className={styles.heroOverlay}></div>
            <div className={styles.heroContent}>
              <h2 className={styles.heroTitle}>{movie.title}</h2>
              <p className={styles.heroMeta}>{movie.year} · {movie.director}</p>
            </div>
          </Link>
        ))}
      </div>

      <div className={styles.section}>
        <BrandBar label="ENQUÊTES" />
        <div className={styles.articleList}>
          {articles.map((article) => (
            <div key={article.id} className={styles.articleCard}>
              <img src={article.imageUrl} alt={article.title} className={styles.articleImage} />
              <div className={styles.articleContent}>
                <div className={styles.articleTags}>
                  {article.tags.map((tag) => (
                    <span key={tag} className={styles.tag}>{tag}</span>
                  ))}
                </div>
                <h3 className={styles.articleTitle}>{article.title}</h3>
                <p className={styles.articleSubtitle}>{article.subtitle}</p>
                <div className={styles.articleMeta}>
                  <span>{article.readTime} min</span>
                  <span>{article.category.toUpperCase()}</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
