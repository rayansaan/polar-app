import { create } from 'zustand';
import { Movie, Genre, User, Favorite, Annotation, UserPreferences } from '../types';
import { DEMO_MOVIES, DEMO_DIRECTORS, GENRES } from '../data/demoMovies';
import AsyncStorage from '@react-native-async-storage/async-storage';

interface AppState {
  user: User | null;
  isOnboardingComplete: boolean;
  isLoading: boolean;
  
  favorites: Favorite[];
  annotations: Annotation[];
  preferences: UserPreferences;
  
  searchQuery: string;
  selectedGenres: Genre[];
  selectedFilter: 'films' | 'series' | 'directors' | 'writers' | 'actors';
  
  movies: Movie[];
  filteredMovies: Movie[];
  
  setUser: (user: User | null) => void;
  setOnboardingComplete: (complete: boolean) => void;
  setSearchQuery: (query: string) => void;
  setSelectedGenres: (genres: Genre[]) => void;
  setSelectedFilter: (filter: 'films' | 'series' | 'directors' | 'writers' | 'actors') => void;
  
  addFavorite: (movieId: string, notes?: string) => void;
  removeFavorite: (movieId: string) => void;
  addAnnotation: (annotation: Annotation) => void;
  updatePreferences: (preferences: Partial<UserPreferences>) => void;
  
  filterMovies: () => void;
  getMovieById: (id: string) => Movie | undefined;
  
  initializeApp: () => Promise<void>;
}

export const useAppStore = create<AppState>((set, get) => ({
  user: null,
  isOnboardingComplete: false,
  isLoading: true,
  
  favorites: [],
  annotations: [],
  preferences: {
    favoriteGenres: [],
    favoriteDirectors: [],
  },
  
  searchQuery: '',
  selectedGenres: [],
  selectedFilter: 'films',
  
  movies: DEMO_MOVIES,
  filteredMovies: DEMO_MOVIES,
  
  setUser: (user) => set({ user }),
  setOnboardingComplete: (complete) => {
    set({ isOnboardingComplete: complete });
    AsyncStorage.setItem('@onboarding_complete', complete ? 'true' : 'false');
  },
  setSearchQuery: (query) => {
    set({ searchQuery: query });
    get().filterMovies();
  },
  setSelectedGenres: (genres) => {
    set({ selectedGenres: genres });
    get().filterMovies();
  },
  setSelectedFilter: (filter) => {
    set({ selectedFilter: filter });
    get().filterMovies();
  },
  
  addFavorite: (movieId, notes) => {
    const newFavorite: Favorite = {
      movieId,
      addedAt: new Date(),
      notes,
    };
    set((state) => ({ favorites: [...state.favorites, newFavorite] }));
  },
  
  removeFavorite: (movieId) => {
    set((state) => ({
      favorites: state.favorites.filter((f) => f.movieId !== movieId),
    }));
  },
  
  addAnnotation: (annotation) => {
    set((state) => ({ annotations: [...state.annotations, annotation] }));
  },
  
  updatePreferences: (preferences) => {
    set((state) => ({
      preferences: { ...state.preferences, ...preferences },
    }));
  },
  
  filterMovies: () => {
    const { movies, searchQuery, selectedGenres, selectedFilter } = get();
    let filtered = [...movies];
    
    if (searchQuery.trim()) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter((movie) => {
        if (selectedFilter === 'films') {
          return (
            movie.title.toLowerCase().includes(query) ||
            movie.director.toLowerCase().includes(query) ||
            movie.synopsis.toLowerCase().includes(query)
          );
        } else if (selectedFilter === 'directors') {
          return movie.director.toLowerCase().includes(query);
        } else if (selectedFilter === 'actors') {
          return movie.cast.some((c) => c.name.toLowerCase().includes(query));
        }
        return true;
      });
    }
    
    if (selectedGenres.length > 0) {
      filtered = filtered.filter((movie) =>
        movie.genres.some((g) => selectedGenres.includes(g))
      );
    }
    
    set({ filteredMovies: filtered });
  },
  
  getMovieById: (id) => {
    return get().movies.find((m) => m.id === id);
  },
  
  initializeApp: async () => {
    try {
      const onboardingComplete = await AsyncStorage.getItem('@onboarding_complete');
      const favoritesData = await AsyncStorage.getItem('@favorites');
      const preferencesData = await AsyncStorage.getItem('@preferences');
      
      set({
        isOnboardingComplete: onboardingComplete === 'true',
        favorites: favoritesData ? JSON.parse(favoritesData) : [],
        preferences: preferencesData ? JSON.parse(preferencesData) : {
          favoriteGenres: [],
          favoriteDirectors: [],
        },
        isLoading: false,
      });
      
      get().filterMovies();
    } catch (error) {
      console.error('Error initializing app:', error);
      set({ isLoading: false });
    }
  },
}));
