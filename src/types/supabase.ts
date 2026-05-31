export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export interface Database {
  public: {
    Tables: {
      movies: {
        Row: {
          id: string;
          title: string;
          original_title: string | null;
          year: number;
          director: string;
          writers: string[];
          duration: string;
          genre: string[];
          synopsis: string;
          director_bio: string;
          director_photo: string;
          anecdote: string;
          inspiration: string;
          nominations: string[];
          platforms: string[];
          poster_url: string;
          hero_url: string;
          locations: string[];
          type: string;
          popularity: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          title: string;
          original_title?: string | null;
          year: number;
          director: string;
          writers?: string[];
          duration: string;
          genre?: string[];
          synopsis: string;
          director_bio: string;
          director_photo: string;
          anecdote: string;
          inspiration: string;
          nominations?: string[];
          platforms?: string[];
          poster_url: string;
          hero_url: string;
          locations?: string[];
          type?: string;
          popularity?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          title?: string;
          original_title?: string | null;
          year?: number;
          director?: string;
          writers?: string[];
          duration?: string;
          genre?: string[];
          synopsis?: string;
          director_bio?: string;
          director_photo?: string;
          anecdote?: string;
          inspiration?: string;
          nominations?: string[];
          platforms?: string[];
          poster_url?: string;
          hero_url?: string;
          locations?: string[];
          type?: string;
          popularity?: number;
          created_at?: string;
        };
      };
      cast_members: {
        Row: {
          id: string;
          movie_id: string;
          name: string;
          role: string;
          photo_url: string;
          order_index: number;
        };
        Insert: {
          id?: string;
          movie_id: string;
          name: string;
          role: string;
          photo_url: string;
          order_index?: number;
        };
        Update: {
          id?: string;
          movie_id?: string;
          name?: string;
          role?: string;
          photo_url?: string;
          order_index?: number;
        };
      };
      key_scenes: {
        Row: {
          id: string;
          movie_id: string;
          title: string;
          timestamp: string;
          duration: string;
          intensity: number;
          thumbnail_url: string;
          order_index: number;
        };
        Insert: {
          id?: string;
          movie_id: string;
          title: string;
          timestamp: string;
          duration: string;
          intensity: number;
          thumbnail_url: string;
          order_index?: number;
        };
        Update: {
          id?: string;
          movie_id?: string;
          title?: string;
          timestamp?: string;
          duration?: string;
          intensity?: number;
          thumbnail_url?: string;
          order_index?: number;
        };
      };
      hotspots: {
        Row: {
          id: string;
          scene_id: string;
          type: string;
          title: string;
          description: string;
          timestamp: string;
        };
        Insert: {
          id?: string;
          scene_id: string;
          type: string;
          title: string;
          description: string;
          timestamp: string;
        };
        Update: {
          id?: string;
          scene_id?: string;
          type?: string;
          title?: string;
          description?: string;
          timestamp?: string;
        };
      };
      articles: {
        Row: {
          id: string;
          title: string;
          subtitle: string;
          category: string;
          read_time: number;
          image_url: string;
          tags: string[];
          date: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          title: string;
          subtitle: string;
          category: string;
          read_time: number;
          image_url: string;
          tags?: string[];
          date: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          title?: string;
          subtitle?: string;
          category?: string;
          read_time?: number;
          image_url?: string;
          tags?: string[];
          date?: string;
          created_at?: string;
        };
      };
      locations: {
        Row: {
          id: string;
          city: string;
          country: string;
          x: number;
          y: number;
          description: string;
        };
        Insert: {
          id?: string;
          city: string;
          country: string;
          x: number;
          y: number;
          description: string;
        };
        Update: {
          id?: string;
          city?: string;
          country?: string;
          x?: number;
          y?: number;
          description?: string;
        };
      };
      location_movies: {
        Row: {
          location_id: string;
          movie_id: string;
        };
        Insert: {
          location_id: string;
          movie_id: string;
        };
        Update: {
          location_id?: string;
          movie_id?: string;
        };
      };
      favorites: {
        Row: {
          id: string;
          user_id: string;
          movie_id: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          movie_id: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          movie_id?: string;
          created_at?: string;
        };
      };
      watchlist: {
        Row: {
          id: string;
          user_id: string;
          movie_id: string;
          status: string;
          priority: number;
          notes: string | null;
          added_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          movie_id: string;
          status: string;
          priority?: number;
          notes?: string | null;
          added_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          movie_id?: string;
          status?: string;
          priority?: number;
          notes?: string | null;
          added_at?: string;
        };
      };
      ratings: {
        Row: {
          id: string;
          user_id: string;
          movie_id: string;
          rating: number;
          review: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          movie_id: string;
          rating: number;
          review?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          movie_id?: string;
          rating?: number;
          review?: string | null;
          created_at?: string;
        };
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      [_ in never]: never;
    };
    Enums: {
      [_ in never]: never;
    };
  };
}
