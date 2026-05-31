import React from 'react';
import { NavLink } from 'react-router-dom';
import styles from './BottomNav.module.css';

export const BottomNav: React.FC = () => {
  return (
    <nav className={styles.nav}>
      <NavLink to="/feed" className={({ isActive }) => isActive ? styles.active : styles.link}>
        <span className={styles.icon}>◉</span>
        <span className={styles.label}>FEED</span>
      </NavLink>
      <NavLink to="/search" className={({ isActive }) => isActive ? styles.active : styles.link}>
        <span className={styles.icon}>◈</span>
        <span className={styles.label}>RECHERCHE</span>
      </NavLink>
      <NavLink to="/map" className={({ isActive }) => isActive ? styles.active : styles.link}>
        <span className={styles.icon}>⊕</span>
        <span className={styles.label}>CARTE</span>
      </NavLink>
      <NavLink to="/profile" className={({ isActive }) => isActive ? styles.active : styles.link}>
        <span className={styles.icon}>◎</span>
        <span className={styles.label}>PROFIL</span>
      </NavLink>
    </nav>
  );
};
