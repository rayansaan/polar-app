export type Genre = 
  | 'Thriller'
  | 'Polar'
  | 'Noir'
  | 'Psychologique'
  | 'Action'
  | 'Drama'
  | 'Espionnage'
  | 'Néo-noir'
  | 'Crime'
  | 'Mystère'
  | 'Horror'
  | 'Sci-Fi'
  | 'Romance'
  | 'Fantasy'
  | 'Comedy'
  | 'War'
  | 'Biopic'
  | 'Supernatural'
  | 'Romance';

export interface CastMember {
  id: string;
  name: string;
  character: string;
  avatar?: number;
}

export interface StreamingPlatform {
  name: string;
  logo: number;
  url: string;
}

export interface Hotspot {
  id: string;
  x: number;
  y: number;
  title: string;
  annotation: string;
}

export interface Scene {
  id: string;
  timestamp: number;
  image: number;
  title: string;
  description: string;
  hotspots: Hotspot[];
}

export interface Movie {
  id: string;
  title: string;
  originalTitle: string;
  year: number;
  duration: number;
  synopsis: string;
  poster: number;
  backdrop: number;
  genres: Genre[];
  director: string;
  writers: string[];
  cast: CastMember[];
  imdbRating: number;
  polarRating: number;
  streaming?: StreamingPlatform[];
  scenes: Scene[];
  keywords: string[];
}

export interface User {
  id: string;
  email: string;
  displayName: string;
  avatar?: string;
  createdAt: Date;
}

export interface Favorite {
  movieId: string;
  addedAt: Date;
  notes?: string;
}

export interface Annotation {
  id: string;
  sceneId: string;
  movieId: string;
  content: string;
  hotspots: Hotspot[];
  createdAt: Date;
}

export interface UserPreferences {
  favoriteGenres: Genre[];
  favoriteDirectors: string[];
}

export type FilterType = 'films' | 'series' | 'directors' | 'writers' | 'actors';

export interface GraphNode {
  id: string;
  type: 'movie' | 'person' | 'genre';
  label: string;
  image?: number;
}

export interface GraphEdge {
  source: string;
  target: string;
  label?: string;
}
