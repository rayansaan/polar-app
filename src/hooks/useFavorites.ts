import { useLocalStorage } from './useLocalStorage';

export function useFavorites(): [string[], (id: string) => void] {
  const [favorites, setFavorites] = useLocalStorage<string[]>('polar_favorites', []);

  const toggle = (id: string) => {
    setFavorites((prev) => {
      if (prev.includes(id)) {
        return prev.filter((f) => f !== id);
      }
      return [...prev, id];
    });
  };

  return [favorites, toggle];
}
