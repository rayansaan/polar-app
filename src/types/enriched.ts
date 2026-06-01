// Types pour les données enrichies TMDB

export interface TmdbMovieSearchResult {
  id: number;
  title: string;
  original_title: string;
  poster_path: string | null;
  backdrop_path: string | null;
  release_date: string;
  vote_average: number;
  vote_count: number;
  overview: string;
}

export interface TmdbMovieDetails {
  id: number;
  title: string;
  original_title: string;
  poster_path: string | null;
  backdrop_path: string | null;
  release_date: string;
  runtime: number;
  tagline: string;
  overview: string;
  vote_average: number;
  vote_count: number;
  original_language: string;
  origin_country: string[];
  genres: { id: number; name: string }[];
}

export interface TmdbCastMember {
  id: number;
  name: string;
  character: string;
  profile_path: string | null;
  order: number;
}

export interface TmdbSimilarMovie {
  id: number;
  title: string;
  poster_path: string | null;
  release_date: string;
}

export interface TmdbCrewMember {
  id: number;
  name: string;
  job: string;
  department: string;
}

export interface TmdbCreditsResponse {
  cast: TmdbCastMember[];
  crew: TmdbCrewMember[];
}

export interface TmdbSearchResponse {
  results: TmdbMovieSearchResult[];
  total_results: number;
  page: number;
  total_pages: number;
}

export interface EnrichedMovie {
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
  cast: {
    id: string;
    name: string;
    role: string;
    photoUrl: string;
    bio?: string;
  }[];
  similarMovies?: {
    id: string;
    title: string;
    year: number;
    posterUrl: string;
  }[];
  keyScenes: {
    id: string;
    title: string;
    timestamp: string;
    duration: string;
    intensity: number;
    thumbnailUrl: string;
    hotspots: {
      id: string;
      type: string;
      title: string;
      description: string;
      timestamp: string;
    }[];
  }[];
  locations: string[];
  type: 'film' | 'series';
  popularity: number;
  // Champs TMDB
  tmdbId?: number;
  tmdbRating?: number;
  tmdbVoteCount?: number;
  tmdbTagline?: string;
  tmdbBackdropUrl?: string;
  tmdbPosterUrl?: string;
  tmdbRuntime?: number;
  tmdbOverview?: string;
  tmdbSimilarMovies?: {
    id: number;
    title: string;
    posterPath: string | null;
    releaseYear: number;
  }[];
}
