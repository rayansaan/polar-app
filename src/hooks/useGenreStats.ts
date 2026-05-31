import { useMemo } from 'react';

const genrePercentages: Record<string, number> = {
  'Science-Fiction': 85,
  'Thriller': 72,
  'Drame': 68,
  'Aventure': 45,
};

export function useGenreStats() {
  const stats = useMemo(() => {
    return Object.entries(genrePercentages).map(([genre, percentage]) => ({
      genre,
      percentage,
    }));
  }, []);

  return stats;
}
