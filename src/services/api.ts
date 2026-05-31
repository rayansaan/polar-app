import { supabase } from '../lib/supabase';
import type { Movie, Article, Location } from '../types';

export async function getMovies(): Promise<Movie[]> {
  const { data, error } = await supabase
    .from('movies')
    .select('*')
    .order('popularity', { ascending: false });

  if (error) throw error;
  return (data as Movie[]) || [];
}

export async function getMovieById(id: string): Promise<Movie | null> {
  const { data, error } = await supabase
    .from('movies')
    .select('*')
    .eq('id', id)
    .single();

  if (error) throw error;
  return data as Movie;
}

export async function getArticles(): Promise<Article[]> {
  const { data, error } = await supabase
    .from('articles')
    .select('*')
    .order('date', { ascending: false });

  if (error) throw error;
  return (data as Article[]) || [];
}

export async function getLocations(): Promise<Location[]> {
  const { data, error } = await supabase
    .from('locations')
    .select('*');

  if (error) throw error;
  return (data as Location[]) || [];
}

export async function toggleFavorite(userId: string, movieId: string) {
  const { data: existing } = await supabase
    .from('favorites')
    .select('*')
    .eq('user_id', userId)
    .eq('movie_id', movieId)
    .single();

  if (existing) {
    const { error } = await supabase
      .from('favorites')
      .delete()
      .eq('user_id', userId)
      .eq('movie_id', movieId);
    if (error) throw error;
    return false;
  } else {
    const { error } = await supabase
      .from('favorites')
      .insert({ user_id: userId, movie_id: movieId } as any);
    if (error) throw error;
    return true;
  }
}

export async function getFavorites(userId: string): Promise<string[]> {
  const { data, error } = await supabase
    .from('favorites')
    .select('movie_id')
    .eq('user_id', userId);

  if (error) throw error;
  return (data as any[] || []).map((f) => f.movie_id);
}
