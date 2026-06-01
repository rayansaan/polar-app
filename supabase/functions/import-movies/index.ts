// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.0'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// TMDB API configuration
const TMDB_BASE_URL = 'https://api.themoviedb.org/3'
const TMDB_IMAGE_BASE_URL = 'https://image.tmdb.org/t/p'

// Delay function for rate limiting
const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms))

// Fetch from TMDB API
async function tmdbFetch(apiKey: string, endpoint: string, params: Record<string, string> = {}) {
  const queryParams = new URLSearchParams({
    api_key: apiKey,
    language: 'fr-FR',
    ...params
  })
  
  const url = `${TMDB_BASE_URL}${endpoint}?${queryParams}`
  console.log(`🎬 TMDB API: ${endpoint}`)
  
  const response = await fetch(url)
  if (!response.ok) {
    throw new Error(`TMDB API error: ${response.status} ${response.statusText}`)
  }
  
  await delay(350) // Rate limiting
  return response.json()
}

// Get image URL
function getImageUrl(path: string | null, size: string = 'w500'): string | null {
  if (!path) return null
  return `${TMDB_IMAGE_BASE_URL}/${size}${path}`
}

// Main handler
Deno.serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Get environment variables
    const supabaseUrl = Deno.env.get('SUPABASE_URL')
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
    const tmdbApiKey = Deno.env.get('TMDB_API_KEY')

    if (!supabaseUrl || !supabaseServiceKey || !tmdbApiKey) {
      throw new Error('Missing environment variables')
    }

    // Parse request body
    const { count = 50, updateExisting = true } = await req.json().catch(() => ({}))

    console.log(`🚀 Starting import: ${count} movies, updateExisting: ${updateExisting}`)

    // Create Supabase client with service role
    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false }
    })

    const results = {
      imported: 0,
      updated: 0,
      skipped: 0,
      failed: 0,
      movies: [] as Array<{ title: string; status: string; year: number }>
    }

    // Fetch popular movies from TMDB
    let page = 1
    let processedCount = 0

    while (processedCount < count && page <= 10) {
      console.log(`📄 Fetching page ${page}...`)
      const popularData = await tmdbFetch(tmdbApiKey, '/movie/popular', { page: page.toString() })
      const popularMovies = popularData.results || []

      if (popularMovies.length === 0) break

      for (const popularMovie of popularMovies) {
        if (processedCount >= count) break

        const movieYear = parseInt(popularMovie.release_date?.split('-')[0]) || 0
        
        // Filter: only released movies (year <= 2025)
        if (movieYear > 2025) {
          console.log(`⏭️ Skipping (not released): ${popularMovie.title} (${movieYear})`)
          results.skipped++
          continue
        }

        // Filter: minimum popularity
        if (popularMovie.popularity < 10) {
          console.log(`⏭️ Skipping (low popularity): ${popularMovie.title}`)
          results.skipped++
          continue
        }

        console.log(`🎬 Processing: ${popularMovie.title} (${movieYear})`)

        try {
          // Check if movie already exists
          const { data: existingCache } = await supabase
            .from('tmdb_cache')
            .select('movie_id, tmdb_id')
            .eq('tmdb_id', popularMovie.id)
            .single()

          // Get full details from TMDB
          const [details, credits, similar] = await Promise.all([
            tmdbFetch(tmdbApiKey, `/movie/${popularMovie.id}`),
            tmdbFetch(tmdbApiKey, `/movie/${popularMovie.id}/credits`),
            tmdbFetch(tmdbApiKey, `/movie/${popularMovie.id}/similar`).then(d => (d.results || []).slice(0, 6))
          ])

          // Get director and writers
          const director = credits.crew?.find((person: any) => person.job === 'Director')
          const writers = credits.crew
            ?.filter((person: any) => person.job === 'Writer' || person.job === 'Screenplay')
            .map((person: any) => person.name) || []

          const movieData = {
            title: popularMovie.title,
            original_title: popularMovie.original_title,
            year: movieYear,
            director: director?.name || 'Inconnu',
            writers: writers,
            duration: details.runtime ? `${Math.floor(details.runtime / 60)}h${details.runtime % 60}min` : 'N/A',
            genre: details.genres?.map((g: any) => g.name) || [],
            synopsis: details.overview || '',
            director_bio: '',
            director_photo: director?.profile_path ? getImageUrl(director.profile_path, 'w200') : '',
            anecdote: '',
            inspiration: '',
            nominations: [],
            platforms: [],
            poster_url: getImageUrl(details.poster_path, 'w500') || '',
            hero_url: getImageUrl(details.backdrop_path, 'original') || '',
            locations: [],
            popularity: Math.round(popularMovie.popularity) || 0,
            tmdb_id: popularMovie.id,
            rating: details.vote_average,
            vote_count: details.vote_count,
            tagline: details.tagline,
            runtime: details.runtime,
            release_date: details.release_date,
            original_language: details.original_language,
            cast: credits.cast?.slice(0, 10).map((actor: any) => ({
              id: actor.id,
              name: actor.name,
              character: actor.character,
              profile_path: getImageUrl(actor.profile_path, 'w200')
            })) || [],
            similar: similar.map((s: any) => ({
              id: s.id,
              title: s.title,
              poster_path: getImageUrl(s.poster_path, 'w200'),
              release_year: s.release_date ? parseInt(s.release_date.split('-')[0]) : null
            }))
          }

          let movieId: string

          if (existingCache && updateExisting) {
            // UPDATE existing movie
            movieId = existingCache.movie_id
            
            // Update movies table
            const { error: updateError } = await supabase
              .from('movies')
              .update({
                title: movieData.title,
                original_title: movieData.original_title,
                year: movieData.year,
                director: movieData.director,
                writers: movieData.writers,
                duration: movieData.duration,
                genre: movieData.genre,
                synopsis: movieData.synopsis,
                director_photo: movieData.director_photo,
                poster_url: movieData.poster_url,
                hero_url: movieData.hero_url,
                popularity: movieData.popularity,
                updated_at: new Date().toISOString()
              })
              .eq('id', movieId)

            if (updateError) throw updateError

            // Update TMDB cache
            const { error: cacheError } = await supabase
              .from('tmdb_cache')
              .update({
                backdrop_url: movieData.hero_url,
                poster_url: movieData.poster_url,
                rating: movieData.rating,
                vote_count: movieData.vote_count,
                tagline: movieData.tagline,
                overview: movieData.synopsis,
                runtime: movieData.runtime,
                release_date: movieData.release_date,
                original_language: movieData.original_language,
                updated_at: new Date().toISOString()
              })
              .eq('movie_id', movieId)

            if (cacheError) throw cacheError

            // Delete old cast and insert new
            await supabase.from('tmdb_cast').delete().eq('movie_id', movieId)
            if (movieData.cast.length > 0) {
              const castInserts = movieData.cast.map((actor, index) => ({
                movie_id: movieId,
                tmdb_person_id: actor.id,
                name: actor.name,
                character: actor.character,
                profile_path: actor.profile_path,
                order_index: index
              }))
              await supabase.from('tmdb_cast').insert(castInserts)
            }

            // Delete old similar and insert new
            await supabase.from('tmdb_similar').delete().eq('movie_id', movieId)
            if (movieData.similar.length > 0) {
              const similarInserts = movieData.similar.map(s => ({
                movie_id: movieId,
                similar_tmdb_id: s.id,
                title: s.title,
                poster_path: s.poster_path,
                release_year: s.release_year
              }))
              await supabase.from('tmdb_similar').insert(similarInserts)
            }

            results.updated++
            results.movies.push({ title: movieData.title, status: 'updated', year: movieData.year })
            console.log(`🔄 Updated: ${movieData.title}`)

          } else if (existingCache && !updateExisting) {
            // SKIP
            results.skipped++
            results.movies.push({ title: movieData.title, status: 'skipped', year: movieData.year })
            console.log(`⏭️ Skipped (exists): ${movieData.title}`)

          } else {
            // INSERT new movie
            const { data: newMovie, error: insertError } = await supabase
              .from('movies')
              .insert({
                title: movieData.title,
                original_title: movieData.original_title,
                year: movieData.year,
                director: movieData.director,
                writers: movieData.writers,
                duration: movieData.duration,
                genre: movieData.genre,
                synopsis: movieData.synopsis,
                director_bio: movieData.director_bio,
                director_photo: movieData.director_photo,
                anecdote: movieData.anecdote,
                inspiration: movieData.inspiration,
                nominations: movieData.nominations,
                platforms: movieData.platforms,
                poster_url: movieData.poster_url,
                hero_url: movieData.hero_url,
                locations: movieData.locations,
                type: 'film',
                popularity: movieData.popularity
              })
              .select()
              .single()

            if (insertError || !newMovie) throw insertError || new Error('Failed to insert movie')

            movieId = newMovie.id

            // Insert TMDB cache
            const { error: cacheError } = await supabase
              .from('tmdb_cache')
              .insert({
                movie_id: movieId,
                tmdb_id: movieData.tmdb_id,
                backdrop_url: movieData.hero_url,
                poster_url: movieData.poster_url,
                rating: movieData.rating,
                vote_count: movieData.vote_count,
                tagline: movieData.tagline,
                overview: movieData.synopsis,
                runtime: movieData.runtime,
                release_date: movieData.release_date,
                original_language: movieData.original_language,
                origin_country: []
              })

            if (cacheError) throw cacheError

            // Insert cast
            if (movieData.cast.length > 0) {
              const castInserts = movieData.cast.map((actor, index) => ({
                movie_id: movieId,
                tmdb_person_id: actor.id,
                name: actor.name,
                character: actor.character,
                profile_path: actor.profile_path,
                order_index: index
              }))
              await supabase.from('tmdb_cast').insert(castInserts)
            }

            // Insert similar movies
            if (movieData.similar.length > 0) {
              const similarInserts = movieData.similar.map(s => ({
                movie_id: movieId,
                similar_tmdb_id: s.id,
                title: s.title,
                poster_path: s.poster_path,
                release_year: s.release_year
              }))
              await supabase.from('tmdb_similar').insert(similarInserts)
            }

            results.imported++
            results.movies.push({ title: movieData.title, status: 'imported', year: movieData.year })
            console.log(`✅ Imported: ${movieData.title}`)
          }

          processedCount++

        } catch (error) {
          console.error(`❌ Failed: ${popularMovie.title}`, error.message)
          results.failed++
          results.movies.push({ title: popularMovie.title, status: 'failed', year: movieYear })
        }

        await delay(500)
      }

      page++
    }

    console.log('✅ Import complete:', results)

    return new Response(
      JSON.stringify(results),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      }
    )

  } catch (error) {
    console.error('💥 Fatal error:', error)
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 500,
      }
    )
  }
})
