import { create } from 'zustand';
import { supabase, TABLES, Profile, Favorite, Annotation, UserPreferences } from '../services/supabase';
import { User } from '../types';

interface AuthState {
  user: User | null;
  profile: Profile | null;
  isLoading: boolean;
  isAuthenticated: boolean;
  
  favorites: Favorite[];
  annotations: Annotation[];
  preferences: UserPreferences | null;
  
  signUp: (email: string, password: string, displayName: string) => Promise<{ error: string | null }>;
  signIn: (email: string, password: string) => Promise<{ error: string | null }>;
  signOut: () => Promise<void>;
  
  fetchProfile: () => Promise<void>;
  fetchFavorites: () => Promise<void>;
  fetchAnnotations: () => Promise<void>;
  fetchPreferences: () => Promise<void>;
  
  addFavorite: (movieId: string, notes?: string) => Promise<{ error: string | null }>;
  removeFavorite: (movieId: string) => Promise<{ error: string | null }>;
  
  addAnnotation: (movieId: string, sceneId: string, content: string, hotspots: any[]) => Promise<{ error: string | null }>;
  
  updatePreferences: (genres: string[], directors: string[]) => Promise<{ error: string | null }>;
  
  initializeAuth: () => Promise<void>;
}

export const useAuthStore = create<AuthState>((set, get) => ({
  user: null,
  profile: null,
  isLoading: true,
  isAuthenticated: false,
  
  favorites: [],
  annotations: [],
  preferences: null,
  
  signUp: async (email: string, password: string, displayName: string) => {
    try {
      const { data, error } = await supabase.auth.signUp({
        email,
        password,
        options: {
          data: {
            displayName,
          },
        },
      });
      
      if (error) {
        return { error: error.message };
      }
      
      if (data.user) {
        set({ user: { id: data.user.id, email: data.user.email!, displayName, createdAt: new Date() } });
      }
      
      return { error: null };
    } catch (error: any) {
      return { error: error.message };
    }
  },
  
  signIn: async (email: string, password: string) => {
    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });
      
      if (error) {
        return { error: error.message };
      }
      
      if (data.user) {
        const user: User = {
          id: data.user.id,
          email: data.user.email!,
          displayName: data.user.user_metadata?.displayName || 'User',
          createdAt: new Date(),
        };
        
        set({ user, isAuthenticated: true });
        await get().fetchProfile();
        await get().fetchFavorites();
        await get().fetchAnnotations();
        await get().fetchPreferences();
      }
      
      return { error: null };
    } catch (error: any) {
      return { error: error.message };
    }
  },
  
  signOut: async () => {
    try {
      await supabase.auth.signOut();
      set({
        user: null,
        profile: null,
        isAuthenticated: false,
        favorites: [],
        annotations: [],
        preferences: null,
      });
    } catch (error) {
      console.error('Sign out error:', error);
    }
  },
  
  fetchProfile: async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;
      
      const { data, error } = await supabase
        .from(TABLES.PROFILES)
        .select('*')
        .eq('id', user.id)
        .single();
      
      if (data) {
        set({ profile: data });
      }
    } catch (error) {
      console.error('Fetch profile error:', error);
    }
  },
  
  fetchFavorites: async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;
      
      const { data, error } = await supabase
        .from(TABLES.FAVORITES)
        .select('*')
        .eq('user_id', user.id)
        .order('added_at', { ascending: false });
      
      if (data) {
        set({ favorites: data });
      }
    } catch (error) {
      console.error('Fetch favorites error:', error);
    }
  },
  
  fetchAnnotations: async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;
      
      const { data, error } = await supabase
        .from(TABLES.ANNOTATIONS)
        .select('*')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false });
      
      if (data) {
        set({ annotations: data });
      }
    } catch (error) {
      console.error('Fetch annotations error:', error);
    }
  },
  
  fetchPreferences: async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;
      
      const { data, error } = await supabase
        .from(TABLES.PREFERENCES)
        .select('*')
        .eq('user_id', user.id)
        .single();
      
      if (data) {
        set({ preferences: data });
      }
    } catch (error) {
      console.error('Fetch preferences error:', error);
    }
  },
  
  addFavorite: async (movieId: string, notes?: string) => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return { error: 'Not authenticated' };
      
      const { error } = await supabase
        .from(TABLES.FAVORITES)
        .insert({
          user_id: user.id,
          movie_id: movieId,
          notes: notes || null,
        });
      
      if (error) {
        return { error: error.message };
      }
      
      await get().fetchFavorites();
      return { error: null };
    } catch (error: any) {
      return { error: error.message };
    }
  },
  
  removeFavorite: async (movieId: string) => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return { error: 'Not authenticated' };
      
      const { error } = await supabase
        .from(TABLES.FAVORITES)
        .delete()
        .eq('user_id', user.id)
        .eq('movie_id', movieId);
      
      if (error) {
        return { error: error.message };
      }
      
      await get().fetchFavorites();
      return { error: null };
    } catch (error: any) {
      return { error: error.message };
    }
  },
  
  addAnnotation: async (movieId: string, sceneId: string, content: string, hotspots: any[]) => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return { error: 'Not authenticated' };
      
      const { error } = await supabase
        .from(TABLES.ANNOTATIONS)
        .insert({
          user_id: user.id,
          movie_id: movieId,
          scene_id: sceneId,
          content,
          hotspots,
        });
      
      if (error) {
        return { error: error.message };
      }
      
      await get().fetchAnnotations();
      return { error: null };
    } catch (error: any) {
      return { error: error.message };
    }
  },
  
  updatePreferences: async (genres: string[], directors: string[]) => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return { error: 'Not authenticated' };
      
      const { error } = await supabase
        .from(TABLES.PREFERENCES)
        .upsert({
          user_id: user.id,
          favorite_genres: genres,
          favorite_directors: directors,
        });
      
      if (error) {
        return { error: error.message };
      }
      
      await get().fetchPreferences();
      return { error: null };
    } catch (error: any) {
      return { error: error.message };
    }
  },
  
  initializeAuth: async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      
      if (user) {
        const userData: User = {
          id: user.id,
          email: user.email!,
          displayName: user.user_metadata?.displayName || 'User',
          createdAt: new Date(),
        };
        
        set({ user: userData, isAuthenticated: true, isLoading: false });
        
        await get().fetchProfile();
        await get().fetchFavorites();
        await get().fetchAnnotations();
        await get().fetchPreferences();
      } else {
        set({ isLoading: false });
      }
    } catch (error) {
      console.error('Initialize auth error:', error);
      set({ isLoading: false });
    }
  },
}));
