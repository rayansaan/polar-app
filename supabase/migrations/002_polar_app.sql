-- Migration 002: Tables pour l'application PōLAR

-- Table movies
CREATE TABLE movies (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  original_title TEXT,
  year INTEGER NOT NULL,
  director TEXT NOT NULL,
  writers TEXT[] DEFAULT '{}',
  duration TEXT NOT NULL,
  genre TEXT[] DEFAULT '{}',
  synopsis TEXT NOT NULL,
  director_bio TEXT NOT NULL,
  director_photo TEXT NOT NULL,
  anecdote TEXT NOT NULL,
  inspiration TEXT NOT NULL,
  nominations TEXT[] DEFAULT '{}',
  platforms TEXT[] DEFAULT '{}',
  poster_url TEXT NOT NULL,
  hero_url TEXT NOT NULL,
  locations TEXT[] DEFAULT '{}',
  type TEXT DEFAULT 'film',
  popularity INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table cast_members
CREATE TABLE cast_members (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  movie_id TEXT REFERENCES movies(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  role TEXT NOT NULL,
  photo_url TEXT NOT NULL,
  order_index INTEGER DEFAULT 0
);

-- Table key_scenes
CREATE TABLE key_scenes (
  id TEXT PRIMARY KEY,
  movie_id TEXT REFERENCES movies(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  timestamp TEXT NOT NULL,
  duration TEXT NOT NULL,
  intensity INTEGER NOT NULL CHECK (intensity BETWEEN 0 AND 100),
  thumbnail_url TEXT NOT NULL,
  order_index INTEGER DEFAULT 0
);

-- Table hotspots
CREATE TABLE hotspots (
  id TEXT PRIMARY KEY,
  scene_id TEXT REFERENCES key_scenes(id) ON DELETE CASCADE,
  type TEXT NOT NULL CHECK (type IN ('mise-en-scene', 'lumiere', 'son', 'montage', 'costume', 'acting')),
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  timestamp TEXT NOT NULL
);

-- Table articles
CREATE TABLE articles (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  subtitle TEXT NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('analysis', 'news', 'interview', 'review')),
  read_time INTEGER NOT NULL,
  image_url TEXT NOT NULL,
  tags TEXT[] DEFAULT '{}',
  date TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table locations
CREATE TABLE locations (
  id TEXT PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL,
  x NUMERIC NOT NULL,
  y NUMERIC NOT NULL,
  description TEXT NOT NULL
);

-- Table location_movies (many-to-many)
CREATE TABLE location_movies (
  location_id TEXT REFERENCES locations(id) ON DELETE CASCADE,
  movie_id TEXT REFERENCES movies(id) ON DELETE CASCADE,
  PRIMARY KEY (location_id, movie_id)
);

-- Table favorites (user-specific)
CREATE TABLE favorites (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  movie_id TEXT REFERENCES movies(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, movie_id)
);

-- Enable RLS on new tables
ALTER TABLE movies ENABLE ROW LEVEL SECURITY;
ALTER TABLE cast_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE key_scenes ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotspots ENABLE ROW LEVEL SECURITY;
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;
ALTER TABLE location_movies ENABLE ROW LEVEL SECURITY;
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;

-- Policies for public read access (movies, cast, scenes, hotspots, articles, locations)
CREATE POLICY "Public can view movies"
  ON movies FOR SELECT USING (true);

CREATE POLICY "Public can view cast"
  ON cast_members FOR SELECT USING (true);

CREATE POLICY "Public can view key_scenes"
  ON key_scenes FOR SELECT USING (true);

CREATE POLICY "Public can view hotspots"
  ON hotspots FOR SELECT USING (true);

CREATE POLICY "Public can view articles"
  ON articles FOR SELECT USING (true);

CREATE POLICY "Public can view locations"
  ON locations FOR SELECT USING (true);

CREATE POLICY "Public can view location_movies"
  ON location_movies FOR SELECT USING (true);

-- Policies for favorites (user-specific)
CREATE POLICY "Users can view own favorites"
  ON favorites FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own favorites"
  ON favorites FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own favorites"
  ON favorites FOR DELETE USING (auth.uid() = user_id);
