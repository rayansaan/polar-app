import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://qpyqdvpncpohelzdfdop.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFweXFkdnBuY3BvaGVsemRmZG9wIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4ODc3MzUsImV4cCI6MjA4NzQ2MzczNX0.YwFnf0jl2hFN03r6tv3CSjpHuoZ34PLWypmvscZzXAM';

export const supabase = createClient(supabaseUrl, supabaseKey);

export const TABLES = {
  PROFILES: 'profiles',
  FAVORITES: 'favorites',
  ANNOTATIONS: 'annotations',
  PREFERENCES: 'preferences',
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
