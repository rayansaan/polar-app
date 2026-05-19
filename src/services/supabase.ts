import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://qpyqdvpncpohelzdfdop.supabase.co';
const supabaseKey = 'sb_publishable_V16UH9xS5oIFtWmdzbax6Q_1Ik-sr9B';

export const supabase = createClient(supabaseUrl, supabaseKey);

export const TABLES = {
  PROFILES: 'profiles',
  FAVORITES: 'favorites',
  ANNOTATIONS: 'annotations',
  PREFERENCES: 'preferences',
  WATCHLIST: 'watchlist',
  RATINGS: 'ratings',
};

export type Profile = {
  id: string;
  display_name: string | null;
  avatar_url: string | null;
  created_at: string;
};

export type Favorite = {
  id: string;
  user_id: string;
  movie_id: string;
  notes: string | null;
  added_at: string;
};

export type Annotation = {
  id: string;
  user_id: string;
  movie_id: string;
  scene_id: string;
  content: string | null;
  hotspots: any | null;
  created_at: string;
};

export type UserPreferences = {
  id: string;
  user_id: string;
  favorite_genres: string[];
  favorite_directors: string[];
};

export type WatchlistItemDB = {
  id: string;
  user_id: string;
  movie_id: string;
  status: 'à_voir' | 'vu' | 'en_cours';
  priority: number;
  notes: string | null;
  added_at: string;
};

export type RatingDB = {
  id: string;
  user_id: string;
  movie_id: string;
  rating: number;
  review: string | null;
  created_at: string;
};
