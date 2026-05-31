import React from 'react';
import styles from './BrandBar.module.css';

interface Props {
  label: string;
}

export const BrandBar: React.FC<Props> = ({ label }) => {
  return (
    <div className={styles.brandBar}>
      <div className={styles.cross}>+</div>
      <div className={styles.line}>
        <span className={styles.text}>{label}</span>
      </div>
      <div className={styles.cross}>+</div>
    </div>
  );
};
