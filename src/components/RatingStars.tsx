import React from 'react';
import { View, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { colors } from '../theme';

interface RatingStarsProps {
  rating: number;
  maxRating?: number;
  size?: number;
  interactive?: boolean;
  onRate?: (rating: number) => void;
}

export const RatingStars: React.FC<RatingStarsProps> = ({
  rating,
  maxRating = 10,
  size = 24,
  interactive = false,
  onRate,
}) => {
  const stars = [];
  const fullStars = Math.floor(rating / 2);
  const halfStar = rating % 2 >= 1;

  for (let i = 1; i <= 5; i++) {
    const isFilled = i <= fullStars;
    const isHalf = i === fullStars + 1 && halfStar;
    
    stars.push(
      <TouchableOpacity
        key={i}
        disabled={!interactive}
        onPress={() => onRate?.(i * 2)}
        style={styles.starContainer}
      >
        <Text style={[styles.star, { fontSize: size }, isFilled && styles.starFilled, isHalf && styles.starHalf]}>
          {isFilled ? '★' : isHalf ? '⯪' : '☆'}
        </Text>
      </TouchableOpacity>
    );
  }

  return (
    <View style={styles.container}>
      <View style={styles.starsRow}>{stars}</View>
      <Text style={styles.ratingText}>{rating.toFixed(1)}/{maxRating}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  starsRow: {
    flexDirection: 'row',
    gap: 2,
  },
  starContainer: {
    padding: 2,
  },
  star: {
    color: '#666',
  },
  starFilled: {
    color: colors.gold,
  },
  starHalf: {
    color: colors.gold,
  },
  ratingText: {
    fontSize: 14,
    color: colors.textSecondary,
    fontWeight: '600',
  },
});

export default RatingStars;
