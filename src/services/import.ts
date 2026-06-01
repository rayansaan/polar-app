import { supabase } from '../lib/supabase';

const EDGE_FUNCTION_URL = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/import-movies`;

interface ImportResult {
  imported: number;
  updated: number;
  skipped: number;
  failed: number;
  movies: Array<{
    title: string;
    status: string;
    year: number;
  }>;
}

export async function importMoviesFromTMDB(
  count: number = 50,
  updateExisting: boolean = true
): Promise<ImportResult> {
  console.log('🚀 Calling edge function to import movies...');
  
  const { data: { session } } = await supabase.auth.getSession();
  
  const response = await fetch(EDGE_FUNCTION_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${session?.access_token || ''}`,
      'apikey': import.meta.env.VITE_SUPABASE_ANON_KEY,
    },
    body: JSON.stringify({ count, updateExisting }),
  });

  if (!response.ok) {
    const error = await response.json().catch(() => ({ error: 'Unknown error' }));
    throw new Error(error.error || `HTTP ${response.status}`);
  }

  return response.json();
}
