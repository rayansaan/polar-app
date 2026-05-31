export interface Actor {
  id: string;
  name: string;
  role: string;
  photoUrl: string;
}

export interface Hotspot {
  id: string;
  type: 'mise-en-scene' | 'lumiere' | 'son' | 'montage' | 'costume' | 'acting';
  title: string;
  description: string;
  timestamp: string;
}

export interface KeyScene {
  id: string;
  title: string;
  timestamp: string;
  duration: string;
  intensity: number;
  thumbnailUrl: string;
  hotspots: Hotspot[];
}

export interface Movie {
  id: string;
  title: string;
  originalTitle?: string;
  year: number;
  director: string;
  writers: string[];
  duration: string;
  genre: string[];
  synopsis: string;
  directorBio: string;
  directorPhoto: string;
  anecdote: string;
  inspiration: string;
  nominations: string[];
  platforms: string[];
  posterUrl: string;
  heroUrl: string;
  cast: Actor[];
  keyScenes: KeyScene[];
  locations: string[];
  type: 'film' | 'series';
  popularity: number;
}

export interface Article {
  id: string;
  title: string;
  subtitle: string;
  category: 'analysis' | 'news' | 'interview' | 'review';
  readTime: number;
  imageUrl: string;
  tags: string[];
  date: string;
}

export interface Location {
  id: string;
  city: string;
  country: string;
  x: number;
  y: number;
  movies?: string[];
  description: string;
}

export type TabType = 'about' | 'cast' | 'keyscenes';
export type BrowseCategory = 'newest' | 'popular' | 'interviews';
