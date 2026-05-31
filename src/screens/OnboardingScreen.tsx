import React from 'react';
import { useNavigate } from 'react-router-dom';
import styles from './OnboardingScreen.module.css';

export const OnboardingScreen: React.FC<{ onComplete: () => void }> = ({ onComplete }) => {
  const navigate = useNavigate();

  const handleStart = () => {
    onComplete();
    navigate('/feed');
  };

  return (
    <div className={styles.screen}>
      <div className={styles.grid}></div>
      <div className={styles.cornerTopLeft}></div>
      <div className={styles.cornerTopRight}></div>
      <div className={styles.cornerBottomLeft}></div>
      <div className={styles.cornerBottomRight}></div>

      <div className={styles.carousel}>
        <div className={`${styles.card} ${styles.sideLeft}`}></div>
        <div className={`${styles.card} ${styles.center}`}></div>
        <div className={`${styles.card} ${styles.sideRight}`}></div>
      </div>

      <div className={styles.content}>
        <div className={styles.logo}>PōLAR</div>
        <p className={styles.tagline}>L'analyse cinématographique en profondeur.</p>
        <button className={styles.button} onClick={handleStart}>
          ENTRER
        </button>
      </div>
    </div>
  );
};
