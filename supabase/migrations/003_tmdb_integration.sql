-- Migration: TMDB Integration
-- Crée les tables pour stocker les données enrichies depuis TMDB

-- Cache des données TMDB par film
create table if not exists tmdb_cache (
    id uuid default gen_random_uuid() primary key,
    movie_id text not null references movies(id) on delete cascade,
    tmdb_id integer not null unique,
    backdrop_url text,
    poster_url text,
    rating numeric(3,1),
    vote_count integer,
    tagline text,
    overview text,
    runtime integer,
    release_date date,
    original_language text,
    origin_country text[],
    updated_at timestamp with time zone default now(),
    unique(movie_id)
);

-- Cast TMDB (remplace le cast local)
create table if not exists tmdb_cast (
    id uuid default gen_random_uuid() primary key,
    movie_id text not null references movies(id) on delete cascade,
    tmdb_person_id integer,
    name text not null,
    character text,
    profile_path text,
    order_index integer default 0,
    created_at timestamp with time zone default now()
);

-- Films similaires
create table if not exists tmdb_similar (
    id uuid default gen_random_uuid() primary key,
    movie_id text not null references movies(id) on delete cascade,
    similar_tmdb_id integer not null,
    title text,
    poster_path text,
    release_year integer,
    created_at timestamp with time zone default now(),
    unique(movie_id, similar_tmdb_id)
);

-- Index pour performances
create index if not exists idx_tmdb_cache_movie on tmdb_cache(movie_id);
create index if not exists idx_tmdb_cast_movie on tmdb_cast(movie_id);
create index if not exists idx_tmdb_similar_movie on tmdb_similar(movie_id);
