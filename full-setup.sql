-- ==========================================
-- POLAR APP - FULL SETUP WITH MOVIES
-- Generated: 2026-06-01T10:26:14.908Z
-- ==========================================

-- Drop existing tables if they exist (optional - uncomment if needed)
-- DROP TABLE IF EXISTS tmdb_similar CASCADE;
-- DROP TABLE IF EXISTS tmdb_cast CASCADE;
-- DROP TABLE IF EXISTS tmdb_cache CASCADE;
-- DROP TABLE IF EXISTS movies CASCADE;

-- ==========================================
-- CREATE TABLES
-- ==========================================

-- Main movies table
CREATE TABLE IF NOT EXISTS movies (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  original_title TEXT,
  year INTEGER NOT NULL,
  director TEXT NOT NULL,
  writers TEXT[] DEFAULT '{}',
  duration TEXT NOT NULL,
  genre TEXT[] DEFAULT '{}',
  synopsis TEXT NOT NULL,
  director_bio TEXT NOT NULL DEFAULT '',
  director_photo TEXT NOT NULL DEFAULT '',
  anecdote TEXT NOT NULL DEFAULT '',
  inspiration TEXT NOT NULL DEFAULT '',
  nominations TEXT[] DEFAULT '{}',
  platforms TEXT[] DEFAULT '{}',
  poster_url TEXT NOT NULL DEFAULT '',
  hero_url TEXT NOT NULL DEFAULT '',
  locations TEXT[] DEFAULT '{}',
  type TEXT DEFAULT 'film',
  popularity INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- TMDB cache table
CREATE TABLE IF NOT EXISTS tmdb_cache (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  movie_id TEXT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
  tmdb_id INTEGER NOT NULL UNIQUE,
  backdrop_url TEXT,
  poster_url TEXT,
  rating NUMERIC(3,1),
  vote_count INTEGER,
  tagline TEXT,
  overview TEXT,
  runtime INTEGER,
  release_date DATE,
  original_language TEXT,
  origin_country TEXT[],
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(movie_id)
);

-- TMDB cast table
CREATE TABLE IF NOT EXISTS tmdb_cast (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  movie_id TEXT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
  tmdb_person_id INTEGER,
  name TEXT NOT NULL,
  character TEXT,
  profile_path TEXT,
  order_index INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- TMDB similar movies table
CREATE TABLE IF NOT EXISTS tmdb_similar (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  movie_id TEXT NOT NULL REFERENCES movies(id) ON DELETE CASCADE,
  similar_tmdb_id INTEGER NOT NULL,
  title TEXT,
  poster_path TEXT,
  release_year INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(movie_id, similar_tmdb_id)
);

-- Enable Row Level Security
ALTER TABLE movies ENABLE ROW LEVEL SECURITY;
ALTER TABLE tmdb_cache ENABLE ROW LEVEL SECURITY;
ALTER TABLE tmdb_cast ENABLE ROW LEVEL SECURITY;
ALTER TABLE tmdb_similar ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY IF NOT EXISTS "Public can view movies"
  ON movies FOR SELECT USING (true);

CREATE POLICY IF NOT EXISTS "Public can view tmdb_cache"
  ON tmdb_cache FOR SELECT USING (true);

CREATE POLICY IF NOT EXISTS "Public can view tmdb_cast"
  ON tmdb_cast FOR SELECT USING (true);

CREATE POLICY IF NOT EXISTS "Public can view tmdb_similar"
  ON tmdb_similar FOR SELECT USING (true);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_tmdb_cache_movie ON tmdb_cache(movie_id);
CREATE INDEX IF NOT EXISTS idx_tmdb_cast_movie ON tmdb_cast(movie_id);
CREATE INDEX IF NOT EXISTS idx_tmdb_similar_movie ON tmdb_similar(movie_id);

-- ==========================================
-- INSERT MOVIES DATA
-- ==========================================

-- Movie: Le Réveil de la Momie
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 'Le Réveil de la Momie', 'Lee Cronin''s The Mummy', 2026, 'Lee Cronin', ARRAY['Lee Cronin'], '2h13min', ARRAY['Horreur', 'Mystère'], 'Une jeune fille disparue dans le désert égyptien réapparaît mystérieusement huit ans plus tard. Mais les retrouvailles tournent vite au cauchemar. Alors que son comportement devient de plus en plus inquiétant, sa famille se lance dans une course contre la montre pour comprendre l’origine du mal. Ce qu’ils vont découvrir dépasse tout ce qu’ils imaginaient.', '', 'https://image.tmdb.org/t/p/w200/qRJgpkLTXE1EkmmHvmD4AnvrFap.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/f77yGBGOjainowvlGHU70CCQrjV.jpg', 'https://image.tmdb.org/t/p/original/xugEpZk9YQ0DIz1aFvH5HGkqpZK.jpg', ARRAY[], 'film', 583.1981, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('efc81292-0cf3-4468-9ebe-348d37897375', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1304313, 'https://image.tmdb.org/t/p/original/xugEpZk9YQ0DIz1aFvH5HGkqpZK.jpg', 'https://image.tmdb.org/t/p/w500/f77yGBGOjainowvlGHU70CCQrjV.jpg', 8.1, 1465, 'Certains sommeils ne devraient jamais être troublés.', 'Une jeune fille disparue dans le désert égyptien réapparaît mystérieusement huit ans plus tard. Mais les retrouvailles tournent vite au cauchemar. Alors que son comportement devient de plus en plus inquiétant, sa famille se lance dans une course contre la montre pour comprendre l’origine du mal. Ce qu’ils vont découvrir dépasse tout ce qu’ils imaginaient.', 133, '2026-04-15', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('be4e5c90-cac8-40e9-8abd-324dcece0ff6', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1007683, 'Jack Reynor', 'Charlie Cannon', 'https://image.tmdb.org/t/p/w200/ti7IuuwBP66kntCCp6t38xzOcT4.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('532d0ebe-c69c-4260-9c71-cf0d7b9671d8', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1425019, 'Laia Costa', 'Larissa Cannon', 'https://image.tmdb.org/t/p/w200/kSbdpHWLlfzvOfZKJ0dgP0ieVL6.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('351aee68-3435-41a5-bef7-26f27eef3f51', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1952051, 'May Calamawy', 'Detective Dalia Zaki', 'https://image.tmdb.org/t/p/w200/5S3nNkH5p85xK7k7AaXBZ0ouyOR.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('48f195b9-fe4a-441d-ad28-9ba93abf0bbe', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 3524429, 'Natalie Grace', 'Katie Cannon', 'https://image.tmdb.org/t/p/w200/uoJRUulO6A9By4IhNrDdiKevAOj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5ef3db34-5e33-4a65-a1aa-ca03115dae57', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 2886183, 'Shylo Molina', 'Sebastián Cannon', 'https://image.tmdb.org/t/p/w200/rIhBsRY6c7B4ClLOJbc4qEWter1.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('18de28a5-b60f-44c8-afed-3cd421721292', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 3768556, 'Billie Roy', 'Maud Cannon', 'https://image.tmdb.org/t/p/w200/criWuHntMq5c6Duv505NApONwUu.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1295ace6-28ed-4e81-9858-479c5ccead4f', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1029593, 'Veronica Falcón', 'Carmen Santiago', 'https://image.tmdb.org/t/p/w200/8zRSwWfrDnHleSRDtIeHYuAVmFK.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a8164fe6-36b7-435a-9373-c058b6fd7e27', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1743875, 'Hayat Kamille', 'The Magician', 'https://image.tmdb.org/t/p/w200/ftzaSEGIEn5uLHy8U7uQrXC7SZc.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a8699d18-7706-43f3-97f2-5f7cd40d382e', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 1850319, 'مي الغيطي', 'Layla Khalil', 'https://image.tmdb.org/t/p/w200/dFpkIOfCrUVIASpN5wutX1OaYls.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('058349ed-092b-43e3-b175-c0058e2593dc', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 3543561, 'Emily Mitchell', 'Young Katie Cannon', 'https://image.tmdb.org/t/p/w200/ehxuJhPwCo0M84SdD6k6cYsKFfs.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('860423d3-2cd9-4ccd-a2da-c581cac30cd1', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 791, 'Fog', 'https://image.tmdb.org/t/p/w200/3Yz96T2B6MUN1Lug9zv8yjBZwo0.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('10ad5530-0ef7-485b-8c07-ee089592a7ec', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 609396, 'Kuntilanak Kesurupan', 'https://image.tmdb.org/t/p/w200/7rRcyL9c4WXE2t1FT40MkpK3ju5.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c653f920-fe2c-40d6-bfc6-1377d7c74d9d', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5b8f3ac0-e069-4f53-bb28-8d21b96283b6', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 806, '666, La Malédiction', 'https://image.tmdb.org/t/p/w200/gvioI0mQrIYK0FyIKJF23tfp3kS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('46112a6c-8d89-435c-8bb3-e07867d3eba4', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 256457, 'মিশর রহস্য', 'https://image.tmdb.org/t/p/w200/22NlvhCvIfIuoztBLIWjzwUSvts.jpg', 2013, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('665a6287-a951-4dab-ae0e-45172df54126', 'ec2eba7e-bf15-47d3-9c31-5d1d96c7d008', 807, 'Seven', 'https://image.tmdb.org/t/p/w200/to6jUaLJonMuKW2YovtWfQKtLYP.jpg', 1995, NOW());

COMMIT;

-- Movie: Obsession
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('a866b872-6753-495e-9c25-91b85ce007b0', 'Obsession', 'Obsession', 2026, 'Curry Barker', ARRAY['Curry Barker'], '1h48min', ARRAY['Horreur'], 'Et si vous pouviez réaliser votre rêve le plus fou ? Un jeune introverti met la main sur un objet magique capable d’exaucer n’importe quel souhait. Son crush de toujours tombe alors raide dingue de lui… jusqu’à l’obsession la plus totale. Faites attention à ce que vous souhaitez !', '', 'https://image.tmdb.org/t/p/w200/4rn1gS0tbVghrT4kQ4tiLLV0Q19.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/mDCR1frpUvGfIKksuM440VLb7X9.jpg', 'https://image.tmdb.org/t/p/original/rZfmzpixLKLR3Hg2u0WgC7XLFl8.jpg', ARRAY[], 'film', 501.5672, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('607f60ca-fb9b-44c4-ac0a-6225264df69f', 'a866b872-6753-495e-9c25-91b85ce007b0', 1339713, 'https://image.tmdb.org/t/p/original/rZfmzpixLKLR3Hg2u0WgC7XLFl8.jpg', 'https://image.tmdb.org/t/p/w500/mDCR1frpUvGfIKksuM440VLb7X9.jpg', 8, 395, 'Votre relation est toxique ? La leur est mortelle.', 'Et si vous pouviez réaliser votre rêve le plus fou ? Un jeune introverti met la main sur un objet magique capable d’exaucer n’importe quel souhait. Son crush de toujours tombe alors raide dingue de lui… jusqu’à l’obsession la plus totale. Faites attention à ce que vous souhaitez !', 108, '2026-05-13', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('37e016f8-20d5-4c3c-bd8c-f39fb220379d', 'a866b872-6753-495e-9c25-91b85ce007b0', 1561370, 'Michael Johnston', 'Baron ''Bear'' Bailey', 'https://image.tmdb.org/t/p/w200/fbpcCkBzu43kMdlXxEAMuLhseL8.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bed292f4-5ff2-4fcf-af61-2d744bde40b1', 'a866b872-6753-495e-9c25-91b85ce007b0', 2638587, 'Inde Navarrette', 'Nikki Freeman', 'https://image.tmdb.org/t/p/w200/hmW22IiOwH0ukCynzSEpWIFjNPg.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e2912307-fb59-4aac-998e-bb8fd01643b8', 'a866b872-6753-495e-9c25-91b85ce007b0', 2823609, 'Cooper Tomlinson', 'Ian', 'https://image.tmdb.org/t/p/w200/AbWgkjy3wT9Z9OidWdpZZdoONXa.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('20936bf6-e633-4f72-80fe-fd062576474d', 'a866b872-6753-495e-9c25-91b85ce007b0', 1519711, 'Megan Lawless', 'Sarah Harper', 'https://image.tmdb.org/t/p/w200/5HJ5NvEXxQAQCr8KJb3vaByS4AZ.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('73ba82f8-fe79-4bac-b5e9-7d273552b617', 'a866b872-6753-495e-9c25-91b85ce007b0', 28637, 'Andy Richter', 'Carter', 'https://image.tmdb.org/t/p/w200/qazhLkyKOsPmdOQSaUWWbbUjs9q.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f1b010cf-3a8a-497c-8dc4-bfa38b00102b', 'a866b872-6753-495e-9c25-91b85ce007b0', 3095494, 'Haley Fitzgerald', 'Viola', 'https://image.tmdb.org/t/p/w200/tdwhaT8jpQ7tIZDUxtlOPzy1HKJ.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e44908a8-3aba-4640-b234-51528c7d1af4', 'a866b872-6753-495e-9c25-91b85ce007b0', 1352948, 'Darin Toonder', 'Harry', 'https://image.tmdb.org/t/p/w200/bD7Y9T7Y6XwDXjGJ8Suabyt1ZGo.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c17e889c-3b49-4778-9bde-fc88d94ebcfc', 'a866b872-6753-495e-9c25-91b85ce007b0', 4030428, 'Anthony Pavone', 'Reggie', 'https://image.tmdb.org/t/p/w200/hxiqY9gHgwXGYnXSD11Wacm5Nmi.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cd08c415-1fec-4605-ac9a-00c547e0da84', 'a866b872-6753-495e-9c25-91b85ce007b0', 3592074, 'Justice', 'Joe', 'https://image.tmdb.org/t/p/w200/YFxKf2HHJvyavQf54NO5wXFOJX.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cbfefec6-341b-4207-86e2-1ebe58d6fbbd', 'a866b872-6753-495e-9c25-91b85ce007b0', 5618033, 'Anthony Casabianca', 'Chris', 'https://image.tmdb.org/t/p/w200/xNJUKqKQhMeyZ74erQvETr3AqV0.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d6038ce0-e6ba-419a-81c5-8e0ca6c26411', 'a866b872-6753-495e-9c25-91b85ce007b0', 8852, 'Prince des ténèbres', 'https://image.tmdb.org/t/p/w200/t45gnyhKHykEj3kf12rgpL6bscP.jpg', 1987, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d7a19148-0791-48fc-9076-4f1864e8e9a6', 'a866b872-6753-495e-9c25-91b85ce007b0', 1356355, 'Cin Daveti', 'https://image.tmdb.org/t/p/w200/lVhbGXvRPLalnoGU5mgUC9DAqVB.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('32e4b203-37ae-48af-90bb-6027bbc9d036', 'a866b872-6753-495e-9c25-91b85ce007b0', 986859, 'Houndz from Hell', 'https://image.tmdb.org/t/p/w200/gyDlE8w2METkIR0itVkAuF25RJ0.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3d737e1c-684d-46bc-8a2e-10e8c6820b48', 'a866b872-6753-495e-9c25-91b85ce007b0', 8973, 'Le Maître des illusions', 'https://image.tmdb.org/t/p/w200/mV3nUHTH18E0tSUFUnuyrwBMH2V.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7266ac4c-6bb6-46d9-adbb-ad252e519285', 'a866b872-6753-495e-9c25-91b85ce007b0', 986990, 'Jack Be Nimble', 'https://image.tmdb.org/t/p/w200/DSgTrmgkZYm8WwT45vUwcGDcUg.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d09efe42-59fe-4703-bd6b-6ce65c360a9b', 'a866b872-6753-495e-9c25-91b85ce007b0', 9064, 'Hellraiser 2 : Les Écorchés', 'https://image.tmdb.org/t/p/w200/ri6BfqkQjvznrMPbhCdNonng1Qn.jpg', 1988, NOW());

COMMIT;

-- Movie: Jack Ryan de Tom Clancy : Guerre Fantôme
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e3a55ff8-2716-4c7c-95df-6eee23cbdede', 'Jack Ryan de Tom Clancy : Guerre Fantôme', 'Tom Clancy''s Jack Ryan: Ghost War', 2026, 'Andrew Bernstein', ARRAY['Aaron Rabin', 'John Krasinski'], '1h43min', ARRAY['Action', 'Thriller'], 'Jack Ryan doit malgré lui replonger dans le monde de l''espionnage quand une opération secrète met au jour une conspiration mortelle. Tandis que chaque seconde compte, il est rejoint par Mike November et James Greer de la CIA, ainsi que par Emma Marlowe, agent chevronné du MI6. Ils affrontent une unité clandestine dans une lutte à haut risque et aux implications personnelles.', '', 'https://image.tmdb.org/t/p/w200/5Q4t7rtpHtp0vfstpQzug1KGZgS.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/zR4RAnv4s6zpXhiqepdonAw4oF3.jpg', 'https://image.tmdb.org/t/p/original/dd31qJxOarrHyGZwYsCzOjobQzP.jpg', ARRAY[], 'film', 368.4056, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('cc2ffa6a-b96d-4111-88ae-7047e07822a3', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 1380291, 'https://image.tmdb.org/t/p/original/dd31qJxOarrHyGZwYsCzOjobQzP.jpg', 'https://image.tmdb.org/t/p/w500/zR4RAnv4s6zpXhiqepdonAw4oF3.jpg', 7.167, 425, 'Jack Ryan est de retour.', 'Jack Ryan doit malgré lui replonger dans le monde de l''espionnage quand une opération secrète met au jour une conspiration mortelle. Tandis que chaque seconde compte, il est rejoint par Mike November et James Greer de la CIA, ainsi que par Emma Marlowe, agent chevronné du MI6. Ils affrontent une unité clandestine dans une lutte à haut risque et aux implications personnelles.', 103, '2026-05-20', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a1f60e5a-ef6c-4e3c-aca6-92752304d887', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 17697, 'John Krasinski', 'Jack Ryan', 'https://image.tmdb.org/t/p/w200/pmVGDb6Yl6OyFcHVGbu1EYNfyFK.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8294a6f9-f5d7-484d-82bb-3cc4359388de', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 17859, 'Wendell Pierce', 'James Greer', 'https://image.tmdb.org/t/p/w200/r6yKahL6Z8l9aUX5qvWxTmWl8Nm.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7be348d7-595b-4c2f-a3fd-979d2865f777', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 23459, 'Sienna Miller', 'Emma Marlowe', 'https://image.tmdb.org/t/p/w200/ygv1xVsgLlfCG1DJD0cuRmZqM1V.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('60430600-c5b2-46fc-abe1-d1f5e6fd21f6', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 50217, 'Michael Kelly', 'Mike November', 'https://image.tmdb.org/t/p/w200/6MI8HhX1GWbcrWG8DiHffzmqaVm.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a3ed4357-14f2-4d48-a3dd-7c708fefde32', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 66587, 'Max Beesley', 'Liam Crown', 'https://image.tmdb.org/t/p/w200/kUBoZ4cMo1i6ojBci0VMznmbn9y.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('68abe9e6-a6d0-4ff5-934c-43db248ea1a2', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 1660452, 'Betty Gabriel', 'Elizabeth Wright', 'https://image.tmdb.org/t/p/w200/n67i3H3VM5quDQfcS591EbotPby.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8791d76c-1adb-4a62-96fc-db3315053529', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 30710, 'JJ Feild', 'Andrew Spear', 'https://image.tmdb.org/t/p/w200/8YIIH6ebWmIhWWJC3RGe16Z1biK.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('28ae0e13-1f37-45cd-b045-fce953118548', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 80149, 'Douglas Hodge', 'Nigel Cooke', 'https://image.tmdb.org/t/p/w200/tENL3Uxt07Rn21o0y0eolwTnkoZ.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('38602a1f-54a3-43a8-bbd3-3467d0793ead', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 109874, 'Dominic Mafham', 'MI6 Chief Arnold', 'https://image.tmdb.org/t/p/w200/9IgOMf8JOu3m3tz7yHbXCn5nMCJ.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1b66212b-e141-46ac-a011-7e8b2e2734b4', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 2303015, 'Alex Brockdorff', 'Mark Whitaker', 'https://image.tmdb.org/t/p/w200/8sf9EUU4oLOhIdJKdAPyZ5Psvch.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ac6832b1-6782-4b27-bbd2-452a012606d1', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 682, 'L''Homme au pistolet d''or', 'https://image.tmdb.org/t/p/w200/rWWtStXei0hjNElbtM0J28trLcO.jpg', 1974, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6d9f7e72-5685-4a02-ac7b-6b4e9303535b', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 956, 'Mission : Impossible 3', 'https://image.tmdb.org/t/p/w200/wlesOljZycfrbBCdJLdmumSiNYT.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('fde6be3c-97b2-4d06-9a55-64c403c41cb6', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 7442, 'Les Nuits avec mon ennemi', 'https://image.tmdb.org/t/p/w200/mngI4Le3f5fudZj4qApeMWwBOFJ.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9e8aff48-8e40-43aa-a325-2015acccc5b4', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 7459, 'Speed Racer', 'https://image.tmdb.org/t/p/w200/hpCPT2V1UjBSOqxbTrPGsYLDRgC.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('460d70c0-45e6-4515-a317-601a940c9ee3', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 2124, 'Color of Night', 'https://image.tmdb.org/t/p/w200/wkkmt0u8Qz48Wa8CCgPtpiqzImP.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9f45f32f-07a7-4a0c-bd77-818faf5de2f4', 'e3a55ff8-2716-4c7c-95df-6eee23cbdede', 258654, 'Un paraíso para los malditos', 'https://image.tmdb.org/t/p/w200/uAxUy8jxLuThQEkyviIxfN62Ejq.jpg', 2013, NOW());

COMMIT;

-- Movie: The Punisher : One Last Kill
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('a69e53ca-8b15-4903-b3e0-e15887ffbc76', 'The Punisher : One Last Kill', 'The Punisher: One Last Kill', 2026, 'Reinaldo Marcus Green', ARRAY['Reinaldo Marcus Green', 'Jon Bernthal'], '0h51min', ARRAY['Action', 'Drame', 'Crime'], 'Alors que Frank Castle cherche un sens à sa vie au-delà de la vengeance, il replonge contre toute attente au cœur du combat.', '', 'https://image.tmdb.org/t/p/w200/w47y7ptzGc4jNyHuXflqkDRruQ8.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/74VbBYHmpjgeES1zkRo1DwHkWnE.jpg', 'https://image.tmdb.org/t/p/original/qO55CD8tgVL1T4WKn6zYFFiD6lL.jpg', ARRAY[], 'film', 314.4766, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e94d42a4-7393-4e4e-8c8f-f0af353cfc40', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 1439930, 'https://image.tmdb.org/t/p/original/qO55CD8tgVL1T4WKn6zYFFiD6lL.jpg', 'https://image.tmdb.org/t/p/w500/74VbBYHmpjgeES1zkRo1DwHkWnE.jpg', 8.401, 1357, NULL, 'Alors que Frank Castle cherche un sens à sa vie au-delà de la vengeance, il replonge contre toute attente au cœur du combat.', 51, '2026-05-12', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0b77eb61-c975-49d9-9616-d8653bd4bb92', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 19498, 'Jon Bernthal', 'Frank Castle', 'https://image.tmdb.org/t/p/w200/o0t6EVkJOrFAjESDilZUlf46IbQ.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fe8852c7-b89c-4b96-9d3b-a8f66528923b', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 212154, 'Deborah Ann Woll', 'Karen Page', 'https://image.tmdb.org/t/p/w200/btTnyvRLXOH0pz2SLBwyKbmnFhX.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4b05077c-9787-4c48-9a49-fd9faf734ad1', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 555252, 'Jason R. Moore', 'Curtis Hoyle', 'https://image.tmdb.org/t/p/w200/5VJ0dTa1aZRf3mQJrHJ56Pf42dP.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cddfbffa-9712-4c96-a770-efe06c201adf', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 80415, 'Judith Light', 'Ma', 'https://image.tmdb.org/t/p/w200/zwgc0ZT8LNIfW7gDbuOFKNtTGIj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ded2e6b3-ddbc-4d71-a0f0-e63b982c3d9c', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 968851, 'Kelli Barrett', 'Maria Castle', 'https://image.tmdb.org/t/p/w200/oFY6w4H6zEx1FDOXEXmCINnlcap.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7747df58-ee36-45e9-9c84-5f502fa0cc68', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 74957, 'Andre Royo', 'Dre', 'https://image.tmdb.org/t/p/w200/tJzftaUtVvZs2RkFt2iQlQ5QWEh.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b095df94-1fd5-447d-b172-2ad0fa087547', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 1218156, 'John Douglas Thompson', 'Old Vet', 'https://image.tmdb.org/t/p/w200/ieN9RkPSnsdaXWjarOhXkl4Jofm.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1997c759-b067-4d50-9625-78e722da97d8', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 6194326, 'Colton Hill', 'Colton Hill', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b1c3dd5f-cbf3-4e94-92b1-ba3a32e7295b', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 6194324, 'Nick Koumalatsos', 'Nick Koumalatsos', 'https://image.tmdb.org/t/p/w200/oy3dWuITzLcBn1yyyzfYSMVpHK2.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ea93b310-c73a-4c61-8e80-0631172eda49', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 5243473, 'Addie Bernthal', 'Lisa', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('73d01dc2-a255-4e93-8525-80965c2638aa', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 11006, 'Cours après moi shérif', 'https://image.tmdb.org/t/p/w200/tCNGaZ3wRk5f0ZtikPSjVOSAnYk.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('af07fb3a-de93-42e0-b891-c4136d49b1a8', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 441715, '仮面ライダー対じごく大使', 'https://image.tmdb.org/t/p/w200/4CaPxi9194eP4PodKT9zfu91Yhy.jpg', 1972, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bfd83c8d-f706-4010-96dd-a51d3d26ca8c', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 11253, 'Hellboy II : Les Légions d''or maudites', 'https://image.tmdb.org/t/p/w200/jZpAA1xTEg3epKSbE1o75vtab01.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('dd9cf9a2-9afd-48e4-acac-5c21dc48f165', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 11443, 'Génération sacrifiée', 'https://image.tmdb.org/t/p/w200/2jAWIYA99TaQvxz3i7sGmpOD51f.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f0ac714e-e049-4393-bf4a-dff7c56387b6', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 11636, 'New Police Story', 'https://image.tmdb.org/t/p/w200/j0WLhJpaVS0t0HTmeq1C7bAlxGM.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('77f4bab5-7762-4093-b8a9-b48bac0ad447', 'a69e53ca-8b15-4903-b3e0-e15887ffbc76', 11645, 'Ran', 'https://image.tmdb.org/t/p/w200/oEYHiurGitubeMjspRZ16H3hyoe.jpg', 1985, NOW());

COMMIT;

-- Movie: Projet Dernière Chance
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 'Projet Dernière Chance', 'Project Hail Mary', 2026, 'Phil Lord', ARRAY['Drew Goddard'], '2h35min', ARRAY['Science-Fiction', 'Aventure'], 'Le professeur de sciences Ryland Grace se réveille à bord d’un vaisseau spatial, à des années-lumière de la Terre, sans aucun souvenir de qui il est ni de la façon dont il est arrivé là. À mesure que sa mémoire lui revient, il commence à découvrir sa mission : résoudre l’énigme d’une mystérieuse substance qui provoque l’extinction du Soleil. Il doit faire appel à ses connaissances scientifiques et ses idées peu orthodoxes pour sauver toute vie sur Terre mais une amitié inattendue pourrait signifier qu’il n’aura pas à accomplir cette tâche seul.', '', 'https://image.tmdb.org/t/p/w200/2MagibFHZxky3FmMubyABUnf4lw.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wzyy8ZrsuHfAt4iz4iH3rT0tdoT.jpg', 'https://image.tmdb.org/t/p/original/2I1OFQJ0L9T0dpU6FobKFWV2PxX.jpg', ARRAY[], 'film', 302.0827, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('aa31cdc5-8030-4766-a3bf-fc37f8799d57', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 687163, 'https://image.tmdb.org/t/p/original/2I1OFQJ0L9T0dpU6FobKFWV2PxX.jpg', 'https://image.tmdb.org/t/p/w500/wzyy8ZrsuHfAt4iz4iH3rT0tdoT.jpg', 8.643, 4454, 'Croyez en la dernière chance.', 'Le professeur de sciences Ryland Grace se réveille à bord d’un vaisseau spatial, à des années-lumière de la Terre, sans aucun souvenir de qui il est ni de la façon dont il est arrivé là. À mesure que sa mémoire lui revient, il commence à découvrir sa mission : résoudre l’énigme d’une mystérieuse substance qui provoque l’extinction du Soleil. Il doit faire appel à ses connaissances scientifiques et ses idées peu orthodoxes pour sauver toute vie sur Terre mais une amitié inattendue pourrait signifier qu’il n’aura pas à accomplir cette tâche seul.', 155, '2026-03-15', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ea3b8c63-e1d0-4d4d-a76f-b04a41e5738e', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 30614, 'Ryan Gosling', 'Ryland Grace', 'https://image.tmdb.org/t/p/w200/lyUyVARQKhGxaxy0FbPJCQRpiaW.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7944161a-cb8c-4fe0-9c78-375bd8da62f8', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 7152, 'Sandra Hüller', 'Eva Stratt', 'https://image.tmdb.org/t/p/w200/tORnKU1CvjgXKsaWcYLzrJ5e1ng.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('151fcc57-2a27-4023-8f33-4fe50cdf0b25', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 2096164, 'James Ortiz', 'Rocky (voice)', 'https://image.tmdb.org/t/p/w200/zYYDXniHb36mjG7xK59r9IoOKvt.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b0faae99-652f-4e05-baad-ad691592bae8', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 2320708, 'Lionel Boyce', 'Carl', 'https://image.tmdb.org/t/p/w200/hpIxX5nkfA3pWCW8rYkEUCSBVyS.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dfb06d68-7502-449f-84ac-25943e32379b', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 1454946, 'Milana Vayntrub', 'Olesya Ilyukhina', 'https://image.tmdb.org/t/p/w200/i5Cou9ExwTZvRRtl79V75CsI7oC.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b3d00ac3-498c-4446-9ea8-9450d04836b5', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 2131, 'Ken Leung', 'Yao', 'https://image.tmdb.org/t/p/w200/hpatUP6u74gkpDRmn9voNY9V43O.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('91f076a8-21fa-4eac-84c0-6c6da481ead2', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 3554544, 'Priya Kansara', 'Mary (voice)', 'https://image.tmdb.org/t/p/w200/zv9kpaQ8AVBfjI2LAAZV58NeVQg.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a4d150c2-3b07-483b-be1c-bf2c88430d42', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 1749206, 'Mia Soteriou', 'Dr. Browne', 'https://image.tmdb.org/t/p/w200/bU4Twfk4as290gPFouByj7Wjd2.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('956ad531-579c-4a23-bd05-c622ae3caea0', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 3074054, 'Annelle Olaleye', 'Olivia', 'https://image.tmdb.org/t/p/w200/V0UqW30EQaHjGhwDnb6dT0AWmz.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e4f8beca-6186-4cfd-b17b-c0978f7126f9', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 6080198, 'Maya Eva Hosein', 'Rekha', 'https://image.tmdb.org/t/p/w200/lDHbsnyUoBzmtbMevNl4F2n8B8B.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('28799764-7dbb-434f-b030-3246bc8d2062', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 782, 'Bienvenue à Gattaca', 'https://image.tmdb.org/t/p/w200/a9KIIpkR6sXGHLJiXse9A7p7l9k.jpg', 1997, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('17976175-1d75-4681-bfcb-986c5cc74510', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 840, 'Rencontres du troisième type', 'https://image.tmdb.org/t/p/w200/jznNbJ80WvvlbLdGEjNsvwycDZC.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('99f76c4a-7351-4313-9649-ef8191c7fcb7', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 841, 'Dune', 'https://image.tmdb.org/t/p/w200/nCFApKqbqRDdGc3YylVf3VsTHcg.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ebcf58aa-4a86-4f14-b19d-5def6f3402a4', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 808, 'Shrek', 'https://image.tmdb.org/t/p/w200/rJIju4i2sENrfTbAXwL9OKv2e1i.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9b91fa3d-a548-471e-81a1-b69c9e4c6bdd', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 830, 'Planète interdite', 'https://image.tmdb.org/t/p/w200/pNeL8XwQTjN0HcFdDOcq7tfQabz.jpg', 1956, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bac28366-9855-45de-860f-3719381cdeb6', 'ae288bf7-7a82-4ecd-8bd0-a6769724c6ef', 831, 'Les Survivants De l''Infini', 'https://image.tmdb.org/t/p/w200/eKVTZqBSNnoG0KBz3vhLNXQ2iT9.jpg', 1955, NOW());

COMMIT;

-- Movie: Super Mario Galaxy, le film
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 'Super Mario Galaxy, le film', 'The Super Mario Galaxy Movie', 2026, 'Aaron Horvath', ARRAY['Matthew Fogel'], '1h40min', ARRAY['Familial', 'Comédie', 'Aventure', 'Fantastique', 'Animation'], 'Mario et Luigi gèrent les tracas du royaume Champignon, se lient d''amitié avec Yoshi, tentent de réhabiliter mini-Bowser et se préparent pour l''anniversaire de Peach. Mais quand un appel à l''aide arrive de l''autre bout de la galaxie, l''équipe part découvrir des mondes nouveaux, des menaces inattendues et des personnages emblématiques, comme Rosalina et Bowser Jr.', '', 'https://image.tmdb.org/t/p/w200/6AOmWzdJas3xh0xJOk1mHPstNs2.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/aSQktALDmbunDbwkuZbZFMEWVFr.jpg', 'https://image.tmdb.org/t/p/original/9Z2uDYXqJrlmePznQQJhL6d92Rq.jpg', ARRAY[], 'film', 289.9814, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('39b9b4e0-6d61-4b6e-8793-4e92da62ea1a', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 1226863, 'https://image.tmdb.org/t/p/original/9Z2uDYXqJrlmePznQQJhL6d92Rq.jpg', 'https://image.tmdb.org/t/p/w500/aSQktALDmbunDbwkuZbZFMEWVFr.jpg', 8.094, 2189, 'La galaxie vous attend.', 'Mario et Luigi gèrent les tracas du royaume Champignon, se lient d''amitié avec Yoshi, tentent de réhabiliter mini-Bowser et se préparent pour l''anniversaire de Peach. Mais quand un appel à l''aide arrive de l''autre bout de la galaxie, l''équipe part découvrir des mondes nouveaux, des menaces inattendues et des personnages emblématiques, comme Rosalina et Bowser Jr.', 100, '2026-04-01', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fe2698e3-8303-409e-a644-a4b3a6e38902', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 73457, 'Chris Pratt', 'Mario (voice)', 'https://image.tmdb.org/t/p/w200/cRH6HPAQ98PlOwwEvhYO4CM9lwu.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1b370c36-c85a-41e2-85da-40022d20496d', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 1397778, 'Anya Taylor-Joy', 'Princess Peach (voice)', 'https://image.tmdb.org/t/p/w200/jxAbDJWvz4p1hoFpJYG5vY2dQmq.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('589ed0b3-89ef-4b9f-b24e-5a5df3e1e28a', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 95101, 'Charlie Day', 'Luigi (voice)', 'https://image.tmdb.org/t/p/w200/c0HNhjChGybnHa4eoLyqO4dDu1j.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e226ef46-c43b-4afc-a743-4ccc7706d393', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 70851, 'Jack Black', 'Bowser (voice)', 'https://image.tmdb.org/t/p/w200/59IhgCtiWI5yTfzPhsjzg7GjCjm.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a5fd90a3-0922-49ee-9873-cc7c6e14e857', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 119589, 'Donald Glover', 'Yoshi (voice)', 'https://image.tmdb.org/t/p/w200/jqVkQfeeEmdga1G0jpBwwXXwwSK.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2b367a93-e899-4547-9870-289c480beb2f', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 227564, 'Benny Safdie', 'Bowser Jr. (voice)', 'https://image.tmdb.org/t/p/w200/u10A5DpUYRB1zMF7YoGYcyvhois.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6e7b0497-de63-4f56-9333-ea0756ff2670', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 60073, 'Brie Larson', 'Rosalina (voice)', 'https://image.tmdb.org/t/p/w200/rlbQbpu3tkMAikPWM53VElMUnzR.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('715adb62-588e-4ef6-b959-823b4eac0e8e', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 298410, 'Keegan-Michael Key', 'Toad (voice)', 'https://image.tmdb.org/t/p/w200/vAR5gVXRG2Cl6WskXT99wgkAoH8.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('17d365ae-7d55-4d5d-88cf-8314b296a99f', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 83271, 'Glen Powell', 'Fox McCloud (voice)', 'https://image.tmdb.org/t/p/w200/fUnIaJkdgvQTztyR1nLeUceSzly.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9cf2db62-aab0-444a-84dc-d1574d10d487', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 40481, 'Luis Guzmán', 'Wart (voice)', 'https://image.tmdb.org/t/p/w200/kSdxUckOJj9R5VKrLUnRy14YhNV.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bd053ca1-7500-400d-a27e-2dca255fb739', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 8839, 'Casper', 'https://image.tmdb.org/t/p/w200/pVLoHNIzKRj75YikaKAcj1d96JS.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cf0cfdac-1ccb-4963-b918-71cf2f72caa7', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('52152c72-051c-40e7-8544-0580e0f2a584', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 8965, 'Les Énigmes de l''Atlantide', 'https://image.tmdb.org/t/p/w200/mYsFQt0xgBkEUOTbjA4MLRrzaKQ.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('fd76ba1a-dda1-4717-b4a3-b2d15c839303', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 8966, 'Twilight, chapitre 1 : Fascination', 'https://image.tmdb.org/t/p/w200/8phJ4i9m1tBDJbOwwQPvdeWhN2h.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('18cbefe6-fcdd-45ae-aec3-7320352f937b', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 8967, 'The Tree of Life', 'https://image.tmdb.org/t/p/w200/y47kUz3IYdoxKyscG6Bc6EPo59k.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7d4d4394-b4b1-43c7-8a6f-5c83469faa28', '192a9ea0-65c2-4c3b-8ccd-6fc846235bb0', 8986, 'La Surprise', 'https://image.tmdb.org/t/p/w200/od8SCOMLDq4iRYaHNqihQVn1SNE.jpg', 1994, NOW());

COMMIT;

-- Movie: Dhurandhar : The Revenge
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 'Dhurandhar : The Revenge', 'धुरंधर: द रिवेंज', 2026, 'Aditya Dhar', ARRAY['Aditya Dhar'], '3h49min', ARRAY['Action', 'Crime', 'Thriller'], 'Hamza Ali Mazari n’existe pas. Derrière ce nom se cache Jaskirat Singh Rangi, infiltré au cœur du monde criminel pakistanais. Sa cible : Majo, un fantôme insaisissable.', '', 'https://image.tmdb.org/t/p/w200/dIZs80xvNgA7VZClECVXIHdaATb.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/hsJG5r6etrMNwW00BVp4NC7zi67.jpg', 'https://image.tmdb.org/t/p/original/gRoZG3Z0zJxgElmTsVHOl2dNYXe.jpg', ARRAY[], 'film', 268.0668, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('83848fc8-ab5f-48f4-920f-aad39e54477c', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 1582770, 'https://image.tmdb.org/t/p/original/gRoZG3Z0zJxgElmTsVHOl2dNYXe.jpg', 'https://image.tmdb.org/t/p/w500/hsJG5r6etrMNwW00BVp4NC7zi67.jpg', 7.243, 101, 'La vengeance', 'Hamza Ali Mazari n’existe pas. Derrière ce nom se cache Jaskirat Singh Rangi, infiltré au cœur du monde criminel pakistanais. Sa cible : Majo, un fantôme insaisissable.', 229, '2026-03-18', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('134fbd7a-3627-4487-98e7-249fc25752dc', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 224223, 'Ranveer Singh', 'Hamza Ali Mazari / Jaskirat Singh Rangi', 'https://image.tmdb.org/t/p/w200/sRiwLmhduFghJo8U2coUafnDD4C.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d6a01a91-f14f-4417-88d5-f9876960ad68', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 52263, 'Arjun Rampal', 'Major Iqbal', 'https://image.tmdb.org/t/p/w200/1F81WNcVV5cW9O4D5Otk1Y2WHV9.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fc493ddd-f017-4304-83dc-99b1d48165b8', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 85519, 'R. Madhavan', 'Ajay Sanyal', 'https://image.tmdb.org/t/p/w200/gaDrAdXxIrbBRCd9cX8YvJDEuLb.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7717e420-2a67-438d-bb18-0224b59754ff', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 85881, 'Sanjay Dutt', 'SP Chaudhary Aslam', 'https://image.tmdb.org/t/p/w200/oq4pnvWhl1HxKpp0KVlSfAr3Tiu.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7cb2f4a4-9884-472d-abe0-4f6f6979ebb1', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 579817, 'Sara Arjun', 'Yalina Jamali', 'https://image.tmdb.org/t/p/w200/uyZIlCL6xwWlor6JYSmIYUiPE7M.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c3b31d26-c886-45cb-9e94-9eb9603f923d', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 4932268, 'Arjan Panwar', 'Sameer Ahmed', 'https://image.tmdb.org/t/p/w200/zWrCO7GI3tuaEvyA6fgRIMtZOsr.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c5ec9286-6d8d-4f47-bca5-d1bb11c0ea9b', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 110200, 'Rakesh Bedi', 'Jameel Jamali', 'https://image.tmdb.org/t/p/w200/dWLCiA3rqnaFPn9s0bk2MiSq5Mt.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d604c1f6-91fc-442c-aece-aade50f75a6a', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 1013936, 'Gaurav Gera', 'Mohammad Aalam', 'https://image.tmdb.org/t/p/w200/l0kOZqfKusxfPp7wvkwDfNYT64K.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2751a76b-a2b2-4ae5-a064-37e173c5aa54', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 4235042, 'Danish Iqbal', 'Dawood Ibrahim', 'https://image.tmdb.org/t/p/w200/tOKa5BhjgtXXxw3IEBq6jRybH95.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('50e153d2-0031-4696-9fca-233bd3657a41', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 4678084, 'Ankit Sagar', 'Javed Khanani', 'https://image.tmdb.org/t/p/w200/bO5OWuAhZRaYohtZnWWOMQDkEWI.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bb7fc1c3-57c9-4fe1-9325-a6c4ea0436c1', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 11022, 'Narc', 'https://image.tmdb.org/t/p/w200/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('02fb5adc-48a6-417a-9168-3abe6e29c164', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 11284, 'La Fin de Freddy : L''Ultime Cauchemar', 'https://image.tmdb.org/t/p/w200/6zNufcJuwlZiGmT7Rr3yq0NK1nU.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9e94b047-873a-44c9-8a12-4f0e7af45509', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 11494, 'Wilderness', 'https://image.tmdb.org/t/p/w200/sLtUVG7ORbTJueTmIWpO4YeHayS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('af35c0c7-ea85-4296-9a91-ba6540a3fa10', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 11439, 'The Ghost Writer', 'https://image.tmdb.org/t/p/w200/q8nGQLowTVgvyGsSLoXvrOBntGC.jpg', 2010, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9599a77a-7e39-4869-9003-f22762f2b1e8', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 11595, '48 heures de plus', 'https://image.tmdb.org/t/p/w200/25fqd9IXlGgco8Yy7Lv7WQuiWPJ.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('afc6b5bb-a951-4b8c-a2c0-3fb3d4725c6a', 'c7d1ea7b-024c-4c81-947b-2fe749e8ceb8', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());

COMMIT;

-- Movie: Backrooms
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('42afb0fe-0098-4b34-89ab-ac5f36670cd6', 'Backrooms', 'Backrooms', 2026, 'Kane Parsons', ARRAY['Will Soodik'], '1h50min', ARRAY['Horreur', 'Mystère', 'Science-Fiction'], 'Un jeune cinéaste bascule dans une autre dimension vide et labyrinthique, qui semble abriter des êtres d''un autre monde.', '', 'https://image.tmdb.org/t/p/w200/1G9mbCXR3uSMx6giddQCrC1lOAj.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/thQQ3BBBhGDtWm3UTtabhyDJd8U.jpg', 'https://image.tmdb.org/t/p/original/mCpwRayjXMFzKHbjbzc5JRKfq1O.jpg', ARRAY[], 'film', 273.5711, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('11ce09bb-58c2-4658-8f37-74487f4e5394', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 1083381, 'https://image.tmdb.org/t/p/original/mCpwRayjXMFzKHbjbzc5JRKfq1O.jpg', 'https://image.tmdb.org/t/p/w500/thQQ3BBBhGDtWm3UTtabhyDJd8U.jpg', 6.8, 171, NULL, 'Un jeune cinéaste bascule dans une autre dimension vide et labyrinthique, qui semble abriter des êtres d''un autre monde.', 110, '2026-05-27', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1ed7d9e0-3f6c-4fa9-bc4b-af8f5b39e0a5', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 5294, 'Chiwetel Ejiofor', 'Clark', 'https://image.tmdb.org/t/p/w200/kq5DDnqqofoRI0t6ddtRlsJnNPT.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('577cc94c-f1d6-43bc-a092-3aed4dab78f2', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 1576786, 'Renate Reinsve', 'Mary Kline', 'https://image.tmdb.org/t/p/w200/zbsTMhTXHtw84lA9Y9sOjdqYINF.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5e34ab68-dbf9-4aa4-b0eb-14bd5e332eaa', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 45407, 'Mark Duplass', 'Phil', 'https://image.tmdb.org/t/p/w200/lRDf99rAfcdqt8Cqk4LsIT7XSD2.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3bccb1b4-0c82-4bbc-8374-98b7960e0fe1', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 1512452, 'Finn Bennett', 'Robert ''Bobby'' Franklin', 'https://image.tmdb.org/t/p/w200/lPq5n7WreNVtt53obM5hmnAjxeK.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('43859e01-00a6-4a86-9444-55b52d503b1d', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 1709431, 'Lukita Maxwell', 'Kathrine ''Kat'' Taylor', 'https://image.tmdb.org/t/p/w200/g5g6XxUAtSdPfsJrSoFkl7vH51d.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c8cf5e79-c4b3-4c3f-9096-4d680f775982', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 212934, 'Avan Jogia', 'Naren Warne', 'https://image.tmdb.org/t/p/w200/7BX0Lg39bHlgtvWZpszTr1YjTAW.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('153224b2-5150-48b6-8894-693ea40661bc', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 5725467, 'Ember Ambrose', 'Young Mary', 'https://image.tmdb.org/t/p/w200/w7h6l4ltuWaMYanGgzwyhAHGL2y.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('349e0262-230a-4211-a20d-a19b7314fb1a', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 72482, 'Krista Kosonen', 'Nora Kline', 'https://image.tmdb.org/t/p/w200/7iW2mxbxBgV5sX2y0fSY78lewW4.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d535dd59-a16d-4415-a735-50ce2edf7a91', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 4848549, 'Robert Bobroczkyi', 'Pirate Clark', 'https://image.tmdb.org/t/p/w200/3SK7NuuBKR5PSJwsQ7HO4qHIM9C.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('61ca61dd-8fc3-4682-9e3e-0f5957fe6704', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 85503, 'Patrick Baynham', 'Bearded Still Life', 'https://image.tmdb.org/t/p/w200/oa7qvjQOVCAiZimvn2uriwPypxe.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b35ac958-d9ae-435a-9a9c-bc3ae37f4093', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 11024, 'Scooby-Doo 2 : Les Monstres se déchaînent', 'https://image.tmdb.org/t/p/w200/uM8lgzmMz0Y2Aqw51kE1F3bUr6q.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cb6c7aef-9da6-4985-9d09-cf9b88af8650', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 441918, 'ネットから削除された禁断動画9', 'https://image.tmdb.org/t/p/w200/3nCgQMF4YnPlsHdc4rqiuG4RWeq.jpg', 2013, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c8a046df-e3d8-4b99-b365-68a9cc3dde2a', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 11587, 'L''Exorciste, la suite', 'https://image.tmdb.org/t/p/w200/1S7igWeo7Ty16FRGWkAZEyDxqar.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a4b8cb68-da41-433a-b586-0b50d7fd6659', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 11629, 'Legion of the Dead', 'https://image.tmdb.org/t/p/w200/7altpm0i6xJYN6nT6oN7Thh2TAw.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('fc639308-eb08-491e-b58a-8763acdf10ef', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 1173214, 'Mama Casserole', 'https://image.tmdb.org/t/p/w200/xvORHniAae8OfHn1k994RwWbASy.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8fe53900-739f-4ae6-b682-47fa1c98cd06', '42afb0fe-0098-4b34-89ab-ac5f36670cd6', 265018, 'Indigenous', 'https://image.tmdb.org/t/p/w200/m4ZzYr8gmjJl56b7v4LxA3tVcc8.jpg', 2014, NOW());

COMMIT;

-- Movie: கர
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('236ba505-69b4-4d82-9f15-f014040deab9', 'கர', 'கர', 2026, 'Vignesh Raja', ARRAY['Alfred Prakash', 'Vignesh Raja'], '2h41min', ARRAY['Crime', 'Drame', 'Thriller'], '', '', 'https://image.tmdb.org/t/p/w200/aUaNkljAVaAAve5UC7jMBXT3zwP.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/uIrFdMWlJFdc1jPBP9bxeaISCDj.jpg', 'https://image.tmdb.org/t/p/original/jatqtz0VlQRiugmHktbKQpuf5EV.jpg', ARRAY[], 'film', 328.9697, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('d4a7d61d-5ac3-4b18-981c-b0f692d1a8fe', '236ba505-69b4-4d82-9f15-f014040deab9', 1433117, 'https://image.tmdb.org/t/p/original/jatqtz0VlQRiugmHktbKQpuf5EV.jpg', 'https://image.tmdb.org/t/p/w500/uIrFdMWlJFdc1jPBP9bxeaISCDj.jpg', 6.5, 8, NULL, '', 161, '2026-04-30', 'ta', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f84b8a82-6225-477b-a6c0-7dfaeb109620', '236ba505-69b4-4d82-9f15-f014040deab9', 550165, 'Dhanush', 'Karasaami', 'https://image.tmdb.org/t/p/w200/7bI9oy1BXIk58hsOK8WfN5g0i1P.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('61044b0b-4a90-4c20-9131-6566b8257dd0', '236ba505-69b4-4d82-9f15-f014040deab9', 2191938, 'Mamitha Baiju', 'Selli', 'https://image.tmdb.org/t/p/w200/tGEFW7uGdYrvZ2f3FP8JH5Yh5L2.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('67d34397-f456-4b0d-939a-25824fab9cd7', '236ba505-69b4-4d82-9f15-f014040deab9', 93194, 'K. S. Ravikumar', 'Kanthasaami', 'https://image.tmdb.org/t/p/w200/8dUdM3sFvL4aXnDtLJJCkDMNEbo.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dfc9de16-20a3-4a79-8cb3-f3bbe7132926', '236ba505-69b4-4d82-9f15-f014040deab9', 930731, 'Suraj Venjaramoodu', 'Bharathan', 'https://image.tmdb.org/t/p/w200/2FUs0wmR3eHBd8g4GVbCmhkUzeI.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f0804d04-e126-4290-954c-5d631c533db4', '236ba505-69b4-4d82-9f15-f014040deab9', 120949, 'Karunas', 'Kasi Maayan', 'https://image.tmdb.org/t/p/w200/dnh00MeOyiWFQ21l5az3UVJ5rhp.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('365f9bd7-94de-4217-bc89-4c2fec7af908', '236ba505-69b4-4d82-9f15-f014040deab9', 141704, 'Jayaram', 'Muthu Selvan', 'https://image.tmdb.org/t/p/w200/cc1SfVFctuYH353NgxXNBoAFX2d.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ba66fd54-c1fe-4dee-9b3b-a5d5d30d3cf9', '236ba505-69b4-4d82-9f15-f014040deab9', 130114, 'M. S. Bhaskar', 'Kangayya', 'https://image.tmdb.org/t/p/w200/jyamX33xAwz2ZWCgh29qkg9exb8.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('96cdc6e2-cc34-4104-b4f9-571e55ada8e0', '236ba505-69b4-4d82-9f15-f014040deab9', 1325660, 'Prithvi Pandiarajan', 'Murugesan', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ca42f49c-4809-436d-8b63-4c5094027e9f', '236ba505-69b4-4d82-9f15-f014040deab9', 1960294, 'Sreeja Ravi', 'Dhanam', 'https://image.tmdb.org/t/p/w200/fzSMF0kJTVh7cfdkDJvUFQK2Tlk.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('81f02f36-c656-4b4a-a259-e0953795fcb3', '236ba505-69b4-4d82-9f15-f014040deab9', 4160017, 'Dhanesh Koliyat', 'Chittarkottai Manager', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('202918db-ea00-4476-8b80-6abbeb389a6e', '236ba505-69b4-4d82-9f15-f014040deab9', 8848, 'Braquage à l''anglaise', 'https://image.tmdb.org/t/p/w200/dvQMKvrn93F3jUDWY5x6AfPMVFe.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cf1732e3-c8f4-41e6-9e6b-9c10badbfbed', '236ba505-69b4-4d82-9f15-f014040deab9', 13681, 'Les Saisons du cœur', 'https://image.tmdb.org/t/p/w200/bmWg3uVn700inqOiadxeFTmiqmV.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6ad609af-ee4e-4e35-8d28-cbc145a944d4', '236ba505-69b4-4d82-9f15-f014040deab9', 949, 'Heat', 'https://image.tmdb.org/t/p/w200/e0xv5Y7UVrhKEVy1g3URMLLVDYB.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('313b3e38-c266-4a23-b238-c7ec6e826e07', '236ba505-69b4-4d82-9f15-f014040deab9', 609242, 'Le Braquage du siècle', 'https://image.tmdb.org/t/p/w200/221zUcu4MGHIKbGJVzQ5DLje9nP.jpg', 2020, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('909d0f20-2bb3-4687-850f-79fc117204c9', '236ba505-69b4-4d82-9f15-f014040deab9', 2457, 'Les Enfants du Paradis', 'https://image.tmdb.org/t/p/w200/pmYOsWz9F7qNQaT9MNe0n0JKsR4.jpg', 1945, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cd98060a-87e2-4e77-824d-a916700d20c2', '236ba505-69b4-4d82-9f15-f014040deab9', 434783, 'Ben Tumbling', NULL, 1985, NOW());

COMMIT;

-- Movie: Aventures croisées
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('6ad966fe-8f39-4546-8389-ca8c52bc514f', 'Aventures croisées', 'Swapped', 2026, 'Nathan Greno', ARRAY['Christian Magalhaes', 'Robert Snow', 'John Whittington'], '1h42min', ARRAY['Aventure', 'Animation', 'Familial', 'Fantastique'], 'Un petit animal des bois et un oiseau majestueux, ennemis jurés de la Vallée, qui échangent soudainement leurs corps et doivent faire équipe, en se mettant dans la peau  de l''autre, pour survivre à la plus folle aventure de leur vie.', '', 'https://image.tmdb.org/t/p/w200/eFE9odW9uzWAGomGFmmusxJT1Ee.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/gz64ZUKg4C4g1yfGD0o5opcBOKy.jpg', 'https://image.tmdb.org/t/p/original/zMwhWailP1WY7sb6AoE6b8ugoy.jpg', ARRAY[], 'film', 265.3704, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('dc500dc8-15e0-49f8-abef-1b90d8775acb', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 1007757, 'https://image.tmdb.org/t/p/original/zMwhWailP1WY7sb6AoE6b8ugoy.jpg', 'https://image.tmdb.org/t/p/w500/gz64ZUKg4C4g1yfGD0o5opcBOKy.jpg', 8.984, 1506, 'Transforme ton destin.', 'Un petit animal des bois et un oiseau majestueux, ennemis jurés de la Vallée, qui échangent soudainement leurs corps et doivent faire équipe, en se mettant dans la peau  de l''autre, pour survivre à la plus folle aventure de leur vie.', 102, '2026-05-01', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7e108693-2ff1-49e1-873d-cdd32171d551', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 135651, 'Michael B. Jordan', 'Ollie (voice)', 'https://image.tmdb.org/t/p/w200/sMBpav8cK7t7Nk0yf4tuNOqNUyW.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fa895c68-2b31-4837-ac23-a1d41727ae1d', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 36594, 'Juno Temple', 'Ivy (voice)', 'https://image.tmdb.org/t/p/w200/nvsPrM4OKHVCDivgMx4FF6PgE5f.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('feaf0b04-2c20-409b-bdc7-a7bb2b8d1f11', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 56903, 'Tracy Morgan', 'Boogle / Firewolf (voice)', 'https://image.tmdb.org/t/p/w200/ec0OJVbs6NZKMbS1yiCAJKjeoJf.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e34ce40b-8457-4407-98b2-f6896b3557bc', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 5726, 'Cedric the Entertainer', 'Caloo (voice)', 'https://image.tmdb.org/t/p/w200/s6UrY5uofyxXsU5PydWBoLFReK0.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e8253728-09df-4555-bcfe-282f6e4e4385', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 95517, 'Justina Machado', 'Calli (voice)', 'https://image.tmdb.org/t/p/w200/j5FaJXoyhMHlqv1l6TBdt1CH1oO.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a94b5a6a-5572-4a38-b228-05da622c4022', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 41565, 'Nate Torrence', 'Lodd (voice)', 'https://image.tmdb.org/t/p/w200/yT9o149xPygdY0NsF9sNgiQwuru.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('06d03d7b-53a2-40c1-8197-b07bc15a1cef', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 4663666, 'Camden Brooks', 'Young Ollie (voice)', 'https://image.tmdb.org/t/p/w200/ge9FgIjRERhyylebW2Np9YwkqqR.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8549e763-c30a-4a4d-9cb4-cba3090f22f8', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 1934645, 'Táta Vega', 'Grandma / Mrs. Dung Beetle (voice)', 'https://image.tmdb.org/t/p/w200/9SdaK2vly0Gx5yvI5rrTszh31vt.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c58e05ce-29f1-4ce5-b369-35fd0ec3b4e3', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 3411764, 'Ambika Mod', 'Violet (voice)', 'https://image.tmdb.org/t/p/w200/jN9HhFYPNMYIupFt6GzGnHAW88c.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34bdf75c-5538-44b4-87e1-dd663420449a', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 1627501, 'Lolly Adefope', 'Lily (voice)', 'https://image.tmdb.org/t/p/w200/qPS57Mw1vjydSSfSYoMw8u81waI.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('21d4030a-2771-4390-bd90-f760abbdf487', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 11282, 'Harold et Kumar chassent le burger', 'https://image.tmdb.org/t/p/w200/pDWbZ5vccuKBoVCaXHAexTld6Cr.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f45f7d6d-a6db-483d-bd9f-fa30f284f339', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 1172265, 'Les Voyages de Tereza', 'https://image.tmdb.org/t/p/w200/jZMmK4mwjw0oo2YeS24nIKHtKhL.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6fa4fd60-17a1-4c61-b587-d1212d07b8d1', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 11455, 'Faut Trouver Le Joint', 'https://image.tmdb.org/t/p/w200/lKXINU3ApbhFPQJ3pqgMzGPCYnH.jpg', 1978, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3142a715-8aa9-49a3-baeb-636858d886b8', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 11967, 'Young Guns', 'https://image.tmdb.org/t/p/w200/1693VrRivfykC8oimhouWzVXYp5.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ca5a08f2-f4f3-4d6f-bedc-6a2de4aa004a', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 617535, 'Телёнок', 'https://image.tmdb.org/t/p/w200/b92DMSsEItolc1d298DZkcMxMa5.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e3ae18d3-d7d4-406f-935f-9001a20d6c54', '6ad966fe-8f39-4546-8389-ca8c52bc514f', 617572, 'Mezcaliente', 'https://image.tmdb.org/t/p/w200/hhxUkdrYimwVmjSzHTTyglBquI3.jpg', 2015, NOW());

COMMIT;

-- Movie: Your Heart Will Be Broken
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('456b495d-95cb-4f36-b53e-982f5174cc6f', 'Your Heart Will Be Broken', 'Твоё сердце будет разбито', 2026, 'Mikhail Vaynberg', ARRAY[], '2h14min', ARRAY['Romance', 'Drame'], 'Polina, une lycéenne, est sauvée du harcèlement dans son nouveau lycée et conclut un pacte avec Bars, le principal harceleur : il doit faire semblant d''être son petit ami et la protéger, et elle doit obéir à tout ce qu''il lui dit. Au fil de ce jeu, le couple développe de véritables sentiments, mais sa famille et ses camarades de classe ont de bonnes raisons de vouloir séparer les amoureux.', '', 'https://image.tmdb.org/t/p/w200/m2gtdkNGGMkE6LUevQpA7xvYq6p.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/iGpMm603GUKH2SiXB2S5m4sZ17t.jpg', 'https://image.tmdb.org/t/p/original/1x9e0qWonw634NhIsRdvnneeqvN.jpg', ARRAY[], 'film', 255.3572, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('157e1169-6e8e-47a0-876b-fdc8c1405dcf', '456b495d-95cb-4f36-b53e-982f5174cc6f', 1523145, 'https://image.tmdb.org/t/p/original/1x9e0qWonw634NhIsRdvnneeqvN.jpg', 'https://image.tmdb.org/t/p/w500/iGpMm603GUKH2SiXB2S5m4sZ17t.jpg', 6.762, 82, NULL, 'Polina, une lycéenne, est sauvée du harcèlement dans son nouveau lycée et conclut un pacte avec Bars, le principal harceleur : il doit faire semblant d''être son petit ami et la protéger, et elle doit obéir à tout ce qu''il lui dit. Au fil de ce jeu, le couple développe de véritables sentiments, mais sa famille et ses camarades de classe ont de bonnes raisons de vouloir séparer les amoureux.', 134, '2026-03-26', 'ru', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c5d61871-e50b-4ed2-ab73-1421334a1ffa', '456b495d-95cb-4f36-b53e-982f5174cc6f', 5598110, 'Даниэль Вегас', 'Барс', 'https://image.tmdb.org/t/p/w200/t9AFZX1rpTt59npITX2GY3JgySd.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('03a399c2-0610-4d8e-a3b1-a6b7c5bc7ea2', '456b495d-95cb-4f36-b53e-982f5174cc6f', 5037367, 'Вероника Журавлёва', 'Полина', 'https://image.tmdb.org/t/p/w200/bvlry6DeiYkm0onAZhonlpl4J7.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('23821095-08e7-4c25-b35e-5c61e06913fd', '456b495d-95cb-4f36-b53e-982f5174cc6f', 4508505, 'Иван Трушин', 'Лэйм', 'https://image.tmdb.org/t/p/w200/8DWSEUJnxlr7kTP0O8iOSnsqbcs.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('027df62e-ec5b-4032-a3ec-085bebefaf2d', '456b495d-95cb-4f36-b53e-982f5174cc6f', 2007622, 'Максим Сапрыкин', 'Леха', 'https://image.tmdb.org/t/p/w200/u6c2wEvtqhXHyYRqd2LXKsyHr5a.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('961d6cbb-514a-4c7b-9fdb-c2004cd803d6', '456b495d-95cb-4f36-b53e-982f5174cc6f', 5654199, 'Аля Майер', 'Дилара', NULL, 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b1ca36e9-84ce-4caf-b785-9b549072d852', '456b495d-95cb-4f36-b53e-982f5174cc6f', 558048, 'Евгения Лоза', 'мама Полины', 'https://image.tmdb.org/t/p/w200/ruLILWf9x0gxg8o9W9Yj9LCI0us.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2ce2f27b-a186-47ef-8882-713a561e2e53', '456b495d-95cb-4f36-b53e-982f5174cc6f', 1565264, 'Павел Кузьмин', 'отчим Полины', 'https://image.tmdb.org/t/p/w200/uIIS1FLF4zMxR0Sj53a4wc9tGU6.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9aafc051-f576-47d9-9ac6-83a10697ced0', '456b495d-95cb-4f36-b53e-982f5174cc6f', 4465638, 'Александра Тихонова', 'Саша', 'https://image.tmdb.org/t/p/w200/iZL6tYLqs5uhvqE4SM7GwJHxUz3.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bffe7f9f-52de-4c7d-ac6a-b34ba4fb138f', '456b495d-95cb-4f36-b53e-982f5174cc6f', 2887356, 'Маргарита Дьяченкова', 'Лика', 'https://image.tmdb.org/t/p/w200/a3c2BqkxkZBlJNKFtZTjxZUiLvZ.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3ff979f0-e63a-41f3-8e2a-3047aac0c740', '456b495d-95cb-4f36-b53e-982f5174cc6f', 5654204, 'Антон Соломатин', 'Власов', 'https://image.tmdb.org/t/p/w200/rsiqKjHvpQGmDvba4TMpe8Rt8hj.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('af36895f-11e2-4834-a64d-bfe39113dde7', '456b495d-95cb-4f36-b53e-982f5174cc6f', 789, 'Trains étroitement surveillés', 'https://image.tmdb.org/t/p/w200/yzNCrmtT6o8gLlsYkXN9NlGNQkk.jpg', 1966, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9706424e-059f-4804-a91c-2dfdc87721bd', '456b495d-95cb-4f36-b53e-982f5174cc6f', 796, 'Sexe intentions', 'https://image.tmdb.org/t/p/w200/tkShoPdnzijP1VdADBLghgephTC.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('23e70001-7bdf-4510-b5ae-7730ada0fafa', '456b495d-95cb-4f36-b53e-982f5174cc6f', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0895b6f0-1178-49eb-859a-ebc2c56f4638', '456b495d-95cb-4f36-b53e-982f5174cc6f', 845, 'L''Inconnu du Nord-Express', 'https://image.tmdb.org/t/p/w200/6oSfav2yXyP009cBKoNEH0UYF10.jpg', 1951, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('98c64c25-7e4b-4db9-97d6-df98affb1f9e', '456b495d-95cb-4f36-b53e-982f5174cc6f', 805, 'Rosemary''s Baby', 'https://image.tmdb.org/t/p/w200/yKtdS5oaHEtBUD1Gq4rdOezzWp6.jpg', 1968, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f83e591f-14f2-4312-917b-d6ecb44f650e', '456b495d-95cb-4f36-b53e-982f5174cc6f', 815, 'La Ferme des Animaux', 'https://image.tmdb.org/t/p/w200/vFQo4DdhgHBr0Jy06VpzCYaZaPI.jpg', 1999, NOW());

COMMIT;

-- Movie: Matrix
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('257f89da-aee9-4368-91c3-a98ba7050547', 'Matrix', 'The Matrix', 1999, 'Lana Wachowski', ARRAY['Lana Wachowski', 'Lilly Wachowski'], '2h15min', ARRAY['Action', 'Science-Fiction'], 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l''un des pirates les plus recherchés du cyber‐espace. À cheval entre deux mondes, Neo est assailli par d''étranges songes et des messages cryptés provenant d''un certain Morpheus. Celui‐ci l''exhorte à aller au‐delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu''est‐ce que la Matrice ? Nul ne le sait, et aucun homme n''est encore parvenu à en percer les défenses. Mais Morpheus est persuadé que Neo est l''Élu, le libérateur mythique de l''humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents…', '', 'https://image.tmdb.org/t/p/w200/5KuRHnoH8UkSCFHMKf4YjKOvzOM.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/pEoqbqtLc4CcwDUDqxmEDSWpWTZ.jpg', 'https://image.tmdb.org/t/p/original/tlm8UkiQsitc8rSuIAscQDCnP8d.jpg', ARRAY[], 'film', 257.5238, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('61ad4e57-743e-438c-bbc6-8e745ef2c4d0', '257f89da-aee9-4368-91c3-a98ba7050547', 603, 'https://image.tmdb.org/t/p/original/tlm8UkiQsitc8rSuIAscQDCnP8d.jpg', 'https://image.tmdb.org/t/p/w500/pEoqbqtLc4CcwDUDqxmEDSWpWTZ.jpg', 8.246, 27909, 'Croire à l''incroyable.', 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l''un des pirates les plus recherchés du cyber‐espace. À cheval entre deux mondes, Neo est assailli par d''étranges songes et des messages cryptés provenant d''un certain Morpheus. Celui‐ci l''exhorte à aller au‐delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu''est‐ce que la Matrice ? Nul ne le sait, et aucun homme n''est encore parvenu à en percer les défenses. Mais Morpheus est persuadé que Neo est l''Élu, le libérateur mythique de l''humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents…', 135, '1999-03-31', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4d455f2a-aa97-4b94-b5a6-f78ce2628136', '257f89da-aee9-4368-91c3-a98ba7050547', 6384, 'Keanu Reeves', 'Neo', 'https://image.tmdb.org/t/p/w200/kEoUZKEG7dzbCESDjd0CKAN1r0n.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c5365be3-3581-4c93-8b72-63eb71981cb3', '257f89da-aee9-4368-91c3-a98ba7050547', 2975, 'Laurence Fishburne', 'Morpheus', 'https://image.tmdb.org/t/p/w200/2GbXERENPpl5MmlqOLlPVaVtifD.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f44ab1e1-c7f3-4e52-bfc9-bae95682eab7', '257f89da-aee9-4368-91c3-a98ba7050547', 530, 'Carrie-Anne Moss', 'Trinity', 'https://image.tmdb.org/t/p/w200/xD4jTA3KmVp5Rq3aHcymL9DUGjD.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('864b4ece-1031-4174-93e9-9218128f6462', '257f89da-aee9-4368-91c3-a98ba7050547', 1331, 'Hugo Weaving', 'Agent Smith', 'https://image.tmdb.org/t/p/w200/lSC8Et0PYi5zeQb3IpPkFje7hgR.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a412bc7d-1d19-49d3-b2a8-30cf4406b4b6', '257f89da-aee9-4368-91c3-a98ba7050547', 9364, 'Gloria Foster', 'Oracle', 'https://image.tmdb.org/t/p/w200/AriGXtC9fjBOia9Zr8CZjn4o3rx.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('89d6836f-24f1-48fe-b555-f20d1011521e', '257f89da-aee9-4368-91c3-a98ba7050547', 532, 'Joe Pantoliano', 'Cypher', 'https://image.tmdb.org/t/p/w200/3OHUI3nX4SYGGItDk3xqeIvWtIf.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('957db5f8-009e-4ec0-a222-3e644dfab728', '257f89da-aee9-4368-91c3-a98ba7050547', 9372, 'Marcus Chong', 'Tank', 'https://image.tmdb.org/t/p/w200/q9HQttibTj2MoXVtLjq2kKqmPrE.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d760d961-5657-431b-9720-274adf73778b', '257f89da-aee9-4368-91c3-a98ba7050547', 7244, 'Julian Arahanga', 'Apoc', 'https://image.tmdb.org/t/p/w200/g2YkF3PWSJU1vTKuURBH0DOMblm.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c25865a9-094b-49ae-90ed-792402512eea', '257f89da-aee9-4368-91c3-a98ba7050547', 9374, 'Matt Doran', 'Mouse', 'https://image.tmdb.org/t/p/w200/4HtMShAbsZ2AyFtq5z3bOVrvw2s.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bd0aaa51-4145-424e-9e22-7c4e995f714b', '257f89da-aee9-4368-91c3-a98ba7050547', 9376, 'Belinda McClory', 'Switch', 'https://image.tmdb.org/t/p/w200/wfTCwkIDJjH5k5DtuvcjP52PrLc.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('339bdc51-aa88-4381-9462-a939ff4d63c9', '257f89da-aee9-4368-91c3-a98ba7050547', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a911535e-3a90-4995-89c2-0ce435afecf9', '257f89da-aee9-4368-91c3-a98ba7050547', 8974, 'La Guerre des mondes', 'https://image.tmdb.org/t/p/w200/eqXzeARWaOJug38Qlv59yVlC0B4.jpg', 1953, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2b1db402-89f1-4a43-ac56-b2a89c77a124', '257f89da-aee9-4368-91c3-a98ba7050547', 8982, 'L''Honneur du Dragon', 'https://image.tmdb.org/t/p/w200/fcVFC02Q0mQ31Dq0LZVAm9yflWP.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e980a892-4a7d-4c53-af4b-d3839d5dada8', '257f89da-aee9-4368-91c3-a98ba7050547', 1356421, 'Program', 'https://image.tmdb.org/t/p/w200/1ag0w5xWeQJZh3xEQmCds8fBmE5.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('860ec0f8-45ef-41fc-b027-4106f7627c23', '257f89da-aee9-4368-91c3-a98ba7050547', 9067, 'Tank Girl', 'https://image.tmdb.org/t/p/w200/5vi1BxR6pGyUNqKMrG9myM4tq2n.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9ca6f4a3-dddb-48fe-93a0-fad1f450147f', '257f89da-aee9-4368-91c3-a98ba7050547', 614933, 'Atlas', 'https://image.tmdb.org/t/p/w200/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg', 2024, NOW());

COMMIT;

-- Movie: चाँद मेरा दिल
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('52ea4af9-d057-46ac-b404-c687a93cd64f', 'चाँद मेरा दिल', 'चाँद मेरा दिल', 2026, 'Vivek Soni', ARRAY['Vivek Soni', 'Tushar Paranjape'], '2h22min', ARRAY['Romance', 'Drame'], '', '', 'https://image.tmdb.org/t/p/w200/3df8awQoznVXTrKm3ghoHUwHHM1.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/9LPkXJustudEBgPZEm9tgDx5KtC.jpg', 'https://image.tmdb.org/t/p/original/kkRpcauZoBFKnH0Qsy7J5qtwBF5.jpg', ARRAY[], 'film', 175.793, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('fca24f58-2bdd-4eac-aed8-dfb71a2bf3fc', '52ea4af9-d057-46ac-b404-c687a93cd64f', 1371023, 'https://image.tmdb.org/t/p/original/kkRpcauZoBFKnH0Qsy7J5qtwBF5.jpg', 'https://image.tmdb.org/t/p/w500/9LPkXJustudEBgPZEm9tgDx5KtC.jpg', 5.5, 2, NULL, '', 142, '2026-05-22', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ef87a099-bcac-40f4-8a55-dd2693e35397', '52ea4af9-d057-46ac-b404-c687a93cd64f', 1973077, 'Ananya Panday', 'Chandni Prasad', 'https://image.tmdb.org/t/p/w200/AgywmKnKdOJ7HvlNKBc3hADsF1S.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d723c217-0061-4a86-ba86-10cfaaae0b1e', '52ea4af9-d057-46ac-b404-c687a93cd64f', 2011444, 'Lakshya Lalwani', 'Aarav', 'https://image.tmdb.org/t/p/w200/iabAj9GCIkGnAMvzyIvdUXeCPTo.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c14741ae-cb35-47e9-b5fb-670a7a195981', '52ea4af9-d057-46ac-b404-c687a93cd64f', 4959658, 'Aastha Singh', 'Jyotsna', NULL, 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('045b1ed2-b89d-4d3b-85b0-288c3365334c', '52ea4af9-d057-46ac-b404-c687a93cd64f', 2422210, 'Paresh Pahuja', 'Kevin', 'https://image.tmdb.org/t/p/w200/eoqUy5KRCXlt0vI4vajnhfN1M8y.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a1e6191a-0c26-4a5a-b0e0-3bdf46d8f6b6', '52ea4af9-d057-46ac-b404-c687a93cd64f', 1040951, 'Manish Chaudhary', 'Aarav''s  Father', 'https://image.tmdb.org/t/p/w200/1l4vmA0IJQLieebZWOOCAFu4ra6.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('04728289-aa18-4a2c-80bc-749007717281', '52ea4af9-d057-46ac-b404-c687a93cd64f', 1047713, 'Iravati Harshe', 'Aarav''s Mother', 'https://image.tmdb.org/t/p/w200/zVDkFwUN8pj3jpEuQRWQa3sUSzp.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34806d61-e060-46fa-a91a-88dd4574f15d', '52ea4af9-d057-46ac-b404-c687a93cd64f', 2340243, 'Charu Shankar', 'Chandni''s  Mother', 'https://image.tmdb.org/t/p/w200/lh3RNfZoWSfNS4m5o0tQVVhCd3o.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d1a7a1b7-2639-4f83-9e4d-194588ed5db9', '52ea4af9-d057-46ac-b404-c687a93cd64f', 1517760, 'Atul Kumar', 'Principal', 'https://image.tmdb.org/t/p/w200/rbPFvPZgqiK21z4uyD5QhRwr7bb.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('25803733-ce09-4c30-84d6-b8ede1cb7fc6', '52ea4af9-d057-46ac-b404-c687a93cd64f', 3904560, 'Akhil Kaimal', 'Chinna', 'https://image.tmdb.org/t/p/w200/6AjpGmXuJqWpnxVzDbIQGkwYfUq.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9f2015b6-d13d-4974-b152-ed71d12fdfd1', '52ea4af9-d057-46ac-b404-c687a93cd64f', 2967857, 'Manik Papneja', 'Sameer', 'https://image.tmdb.org/t/p/w200/bjVqyExEk5n1qHLuOnbR8UbPLpY.jpg', 9, NOW());

COMMIT;

-- Movie: पति पत्नी और वो दो
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e0b68b04-f248-472f-8e0e-3578e1262f77', 'पति पत्नी और वो दो', 'पति पत्नी और वो दो', 2026, 'Mudassar Aziz', ARRAY['Mudassar Aziz'], '1h57min', ARRAY['Comédie'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/5MweEeMzPbueb65BcJpdiy0ihwU.jpg', 'https://image.tmdb.org/t/p/original/eNAFLrd1XAAD4hgdTPjewpzYU4W.jpg', ARRAY[], 'film', 167.4581, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('725de022-fa6b-48cb-a6ea-0654712a7405', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1320660, 'https://image.tmdb.org/t/p/original/eNAFLrd1XAAD4hgdTPjewpzYU4W.jpg', 'https://image.tmdb.org/t/p/w500/5MweEeMzPbueb65BcJpdiy0ihwU.jpg', 7.5, 4, NULL, '', 117, '2026-05-15', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('59f6dde9-1273-42d9-ba19-9251ed6aecbe', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1033157, 'Ayushmann Khurrana', 'Prajapati Pandey', 'https://image.tmdb.org/t/p/w200/qbdclvnDkJxPX7OQqmMY7w9ekBP.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a581c596-c8f4-467d-9144-916b986ae645', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1267400, 'Wamiqa Gabbi', 'Aparna Pandey', 'https://image.tmdb.org/t/p/w200/e1CNXkH2scGeoabOTowFJJxX2YF.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('62100b4f-06c2-45fb-a5e0-9275d8ea9647', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1143308, 'Rakul Preet Singh', 'Nilofer Khan', 'https://image.tmdb.org/t/p/w200/d5OOKtPu9NhlNVMQTAAPff29KMv.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1d87c6ea-e6e3-4802-b469-f9810459b56e', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1848952, 'Sara Ali Khan', 'Chanchal Kumari', 'https://image.tmdb.org/t/p/w200/nRtF9kNgIt9q52jy89cyZBimUPs.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('09309a13-3726-4669-b430-21f7963e6ae0', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 6500, 'Vijay Raaz', 'Dharamveer Singh', 'https://image.tmdb.org/t/p/w200/bLSjiy51UPjVnTYRDmgRUy1VOwD.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e11368fc-6c6b-4a3f-b34a-f0c86d35732b', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 545084, 'Tigmanshu Dhulia', 'MLA Gajraj Tiwari', 'https://image.tmdb.org/t/p/w200/2CRk2UX3KfqMythuLBleMwQ7bQr.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34f1b5e6-359b-4701-952f-904126ba090f', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1873664, 'Ayesha Raza Mishra', NULL, 'https://image.tmdb.org/t/p/w200/cKC6Gj5AbeoLpH0bxnSj8SEzewi.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b60d4fa7-4b5c-4293-9017-6926393c87c1', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1974138, 'Vishal Vashishtha', 'Sudhanshu Tiwari', 'https://image.tmdb.org/t/p/w200/gxvmaEsTW1HnhnHLZOb7CNQmJIp.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e633c2b7-5e39-4aac-a14b-e65771516259', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1294159, 'Durgesh Kumar', 'Mahinder', 'https://image.tmdb.org/t/p/w200/nLt1cgrxIapn7fRVwFjqnSFXc1x.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a61720c6-a78e-44f0-a780-41248bb018ca', 'e0b68b04-f248-472f-8e0e-3578e1262f77', 1662481, 'Deepika Amin', 'Bhavna Trivedi', 'https://image.tmdb.org/t/p/w200/jQYrPnGERwUKd33Ufnspt6dvXv3.jpg', 9, NOW());

COMMIT;

-- Movie: Over Your Dead Body
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('74b07e42-a942-422a-8790-a12b51ea5f02', 'Over Your Dead Body', 'Over Your Dead Body', 2026, 'Jorma Taccone', ARRAY['Nick Kocher', 'Brian McElhaney'], '1h45min', ARRAY['Action', 'Comédie', 'Thriller'], 'Un couple dysfonctionnel se rend dans une cabane isolée pour se " reconnecter " l''un envers l''autre, mais chacun a l''intention secrète de tuer l''autre.', '', 'https://image.tmdb.org/t/p/w200/x7x4NvDauuQ7HA6psLZYZ6m3zTd.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/fqXIk1BY0tJvlqwiTw2HL9gegqE.jpg', 'https://image.tmdb.org/t/p/original/sb76azrAXr9U13uEQxNP5e3fujY.jpg', ARRAY[], 'film', 160.3583, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('18edc043-8ec9-4e7b-abf7-b0430c6f176d', '74b07e42-a942-422a-8790-a12b51ea5f02', 1390300, 'https://image.tmdb.org/t/p/original/sb76azrAXr9U13uEQxNP5e3fujY.jpg', 'https://image.tmdb.org/t/p/w500/fqXIk1BY0tJvlqwiTw2HL9gegqE.jpg', 6.848, 69, NULL, 'Un couple dysfonctionnel se rend dans une cabane isolée pour se " reconnecter " l''un envers l''autre, mais chacun a l''intention secrète de tuer l''autre.', 105, '2026-04-24', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a34b0cc0-9af0-4f71-b520-4e470416ba50', '74b07e42-a942-422a-8790-a12b51ea5f02', 1372369, 'Samara Weaving', 'Lisa', 'https://image.tmdb.org/t/p/w200/7ThO37CpqkBRgrosep0ROVs2q5s.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4558154b-28cf-4b87-b554-2335b20b3c12', '74b07e42-a942-422a-8790-a12b51ea5f02', 41088, 'Jason Segel', 'Dan', 'https://image.tmdb.org/t/p/w200/aG6tVNSbl1YEjN65G3luFYnWbUM.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('780b08dd-9631-418e-83c8-925c46026bc1', '74b07e42-a942-422a-8790-a12b51ea5f02', 925, 'Paul Guilfoyle', 'Michael', 'https://image.tmdb.org/t/p/w200/c7unxeM13lF9pMhZhYwlNsSFjFe.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b20a1b62-b5c6-4eb6-b6e7-5cba006d1f58', '74b07e42-a942-422a-8790-a12b51ea5f02', 18082, 'Timothy Olyphant', 'Pete', 'https://image.tmdb.org/t/p/w200/7pHmRHE2wBNC9cBgNIRCBqFLoyZ.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('04389041-dd92-441b-8a99-cd50db417277', '74b07e42-a942-422a-8790-a12b51ea5f02', 78890, 'Keith Jardine', 'Todd', 'https://image.tmdb.org/t/p/w200/emN5dXAoqW9Naab4g3yOwxSfkvh.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d015f110-22cf-481e-a8e3-3d0b87f077de', '74b07e42-a942-422a-8790-a12b51ea5f02', 3196, 'Juliette Lewis', 'Allegra', 'https://image.tmdb.org/t/p/w200/sSGCW01aUsYlVQhuk3XSY7cl6Ww.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('47314d03-2db3-402e-a869-cdb7e4319f84', '74b07e42-a942-422a-8790-a12b51ea5f02', 3551, 'Jake Curran', 'Henry', 'https://image.tmdb.org/t/p/w200/pC6ozticiOmovaPpwqKVOMhn0b9.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('23e660f3-f2d5-4c5d-ba4b-9a252eeeb82b', '74b07e42-a942-422a-8790-a12b51ea5f02', 54024, 'Nikolai Kinski', 'Frank', 'https://image.tmdb.org/t/p/w200/hN81FHqEqFjLvU0x4Cy4Zni4n1v.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('afe24e81-0dff-4af4-90b2-42c070096d91', '74b07e42-a942-422a-8790-a12b51ea5f02', 1290648, 'Kayla Jenee Radomski', 'Renée', 'https://image.tmdb.org/t/p/w200/4bQxG6wFaIXLylc566k4YhOUfuV.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3deccea2-154a-4c49-b3a6-df1589625d69', '74b07e42-a942-422a-8790-a12b51ea5f02', 1786960, 'Danusia Samal', 'Rachel', 'https://image.tmdb.org/t/p/w200/8FqUG5hRe9MskGzXzx8ktS7b20y.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('26a6d229-73a5-49b2-a584-2aa8393a1cd2', '74b07e42-a942-422a-8790-a12b51ea5f02', 1359389, 'Маме снова 17', 'https://image.tmdb.org/t/p/w200/zkXypMK3iCECIpHo2NJZLX5pbgn.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e1f3bdd0-9976-4b74-901d-a620750da9a0', '74b07e42-a942-422a-8790-a12b51ea5f02', 11943, 'Jeremiah Johnson', 'https://image.tmdb.org/t/p/w200/yQaVbiSJBlKHCnu3Ts2LFZqiBU.jpg', 1972, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2857d43d-b236-4b7a-a89e-9e4b829ae008', '74b07e42-a942-422a-8790-a12b51ea5f02', 11007, 'Treize à la douzaine', 'https://image.tmdb.org/t/p/w200/nvPey652U3UvmS4V5dJlJxwxYiW.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2b9216d5-3f6b-42b3-bbb3-171b68f720b3', '74b07e42-a942-422a-8790-a12b51ea5f02', 11064, 'Comment claquer un million de dollars par jour', 'https://image.tmdb.org/t/p/w200/qJv3VXuVdYcPsliKfm64xKVwrF4.jpg', 1985, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('fa2c0dfa-4115-470e-a455-5af28a4f718b', '74b07e42-a942-422a-8790-a12b51ea5f02', 11859, 'Fair Game', 'https://image.tmdb.org/t/p/w200/ouLux4mXHF5b37mkwesppjad5zV.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9879cd18-87e1-416a-8258-2ac58e991848', '74b07e42-a942-422a-8790-a12b51ea5f02', 11862, 'Le Père de la mariée II', 'https://image.tmdb.org/t/p/w200/51dOseh6cExZ8YShj5298NZC2E2.jpg', 1995, NOW());

COMMIT;

-- Movie: The Mandalorian and Grogu
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('99d93698-9f50-45dd-ab9e-90e90bbb68b0', 'The Mandalorian and Grogu', 'The Mandalorian and Grogu', 2026, 'Jon Favreau', ARRAY['Jon Favreau', 'Dave Filoni', 'Noah Kloor'], '2h12min', ARRAY['Action', 'Aventure', 'Science-Fiction'], 'L''Empire maléfique est tombé et les seigneurs de guerre impériaux restent dispersés dans toute la galaxie. Alors que la nouvelle République naissante travaille pour protéger tout ce que la rébellion s''est battue, ils ont fait appel à Din Djarin et à son jeune apprenti Grogu.', '', 'https://image.tmdb.org/t/p/w200/tnx7iMVydPQXGOoLsxXl84PXtbA.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/eUOVyCSZrUH6aPfhsfd7j0bxGOl.jpg', 'https://image.tmdb.org/t/p/original/6zg7A9ICOthNR2TSXlT51KvXrsA.jpg', ARRAY[], 'film', 162.5472, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('1f811358-9d9d-4164-80e6-fd065bd46cbc', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 1228710, 'https://image.tmdb.org/t/p/original/6zg7A9ICOthNR2TSXlT51KvXrsA.jpg', 'https://image.tmdb.org/t/p/w500/eUOVyCSZrUH6aPfhsfd7j0bxGOl.jpg', 6.9, 341, NULL, 'L''Empire maléfique est tombé et les seigneurs de guerre impériaux restent dispersés dans toute la galaxie. Alors que la nouvelle République naissante travaille pour protéger tout ce que la rébellion s''est battue, ils ont fait appel à Din Djarin et à son jeune apprenti Grogu.', 132, '2026-05-20', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c0875e25-2e93-4551-9a75-45836d817096', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 1253360, 'Pedro Pascal', 'The Mandalorian', 'https://image.tmdb.org/t/p/w200/9VYK7oxcqhjd5LAH6ZFJ3XzOlID.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1906a161-0a85-453e-add8-382a743f731b', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 206905, 'Jeremy Allen White', 'Rotta (voice)', 'https://image.tmdb.org/t/p/w200/zKk4vmDeUexdevtt6wm8WdMQ1TG.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c8c1f174-0acc-4b08-8642-b7b4add57113', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 10205, 'Sigourney Weaver', 'Colonel Ward', 'https://image.tmdb.org/t/p/w200/wTSnfktNBLd6kwQxgvkqYw6vEon.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1da79f96-5db2-4289-aa59-2dcc003f36e8', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 946854, 'Brendan Wayne', 'The Mandalorian Suit Performer', 'https://image.tmdb.org/t/p/w200/klsNR0ld4NjURhhn3PYZetFkaCK.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cf07b941-f5d3-4bc1-8203-1d99a349402c', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 123812, 'Lateef Crowder', 'The Mandalorian Stunt Performer', 'https://image.tmdb.org/t/p/w200/mhGArPyh3N97t3PU4YnvLZTzHjl.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34d3ef50-a5dd-4060-ad48-c0e691855223', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 571562, 'Steve Blum', 'Zeb Orrelios (voice)', 'https://image.tmdb.org/t/p/w200/cpO0muunoigq1WHegeOEI1AIQAo.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fa8c88fe-a34a-4a2e-83d3-5f803a31a8d5', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 1323612, 'Jonny Coyne', 'Lord Janu', 'https://image.tmdb.org/t/p/w200/6PSW0qaoY3KSnWUUv6f54NOuPC0.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('064d5fba-095f-43c6-bafa-da3a58c7bdfc', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 92617, 'Matthew Willig', 'Hogsbreth', 'https://image.tmdb.org/t/p/w200/46nLaoxRvXpx8ohmG7hx2Qq00Sr.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4a62aa33-b198-48f2-8adc-c1ebb19fa0ab', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 1032, 'Martin Scorsese', 'Hugo Durant (voice)', 'https://image.tmdb.org/t/p/w200/9U9Y5GQuWX3EZy39B8nkk4NY01S.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ec6adffc-8638-442a-aa83-9fd327ea2584', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 164208, 'Hemky Madera', 'Commander Baro', 'https://image.tmdb.org/t/p/w200/net1kEEpSrr9QC9be6YRhLGuM0k.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('172f5fcb-77df-4574-ace5-524c5f8ff62f', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 841, 'Dune', 'https://image.tmdb.org/t/p/w200/nCFApKqbqRDdGc3YylVf3VsTHcg.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ce111cf2-5c6e-4fe1-9bf5-dcfa7e33f799', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 957, 'La Folle Histoire de l’espace', 'https://image.tmdb.org/t/p/w200/edjYw7tTiuJMKoANioAghvOdpqO.jpg', 1987, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3cbe4057-ed6c-4728-8829-f1a3fad3ef10', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 956, 'Mission : Impossible 3', 'https://image.tmdb.org/t/p/w200/wlesOljZycfrbBCdJLdmumSiNYT.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('78c86ffb-15e2-485e-8dd5-0cc523d1f761', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 7450, 'Titan A.E.', 'https://image.tmdb.org/t/p/w200/1UeG2ipwjM5zzAFSIdMDByP8BC2.jpg', 2000, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3a80291f-4015-4515-b1a7-1b3dcb51d55d', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 7453, 'H2G2 : Le Guide du Voyageur Galactique', 'https://image.tmdb.org/t/p/w200/4InIApI5Zx0Xf3481MUzugDdXCX.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d26d38bf-a088-4569-a094-5dd7264d28a6', '99d93698-9f50-45dd-ab9e-90e90bbb68b0', 7459, 'Speed Racer', 'https://image.tmdb.org/t/p/w200/hpCPT2V1UjBSOqxbTrPGsYLDRgC.jpg', 2008, NOW());

COMMIT;

-- Movie: The Shadow's Edge
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('682ae39d-f308-4cff-9852-2a14aaedff3b', 'The Shadow''s Edge', '捕风追影', 2025, '杨子', ARRAY['杨子'], '2h21min', ARRAY['Action', 'Crime', 'Drame', 'Thriller'], 'Un mafieux et ses 7 fils adoptifs manipulent et ridiculisent la police en piratant le système de surveillance de la ville, dans le but de récupérer une fortune en crypto-monnaie. La police doit faire appel à un ancien expert qui va s''associer avec une policière à laquelle il est lié par un secret qu''elle ignore. Une partie d''échec commence, où les cerveaux et la loyauté seront mis à l''épreuve.', '', 'https://image.tmdb.org/t/p/w200/qUOe56aOGlFI1eii9mkde0mE4Ds.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/t1PFVsGYdUHtPv0Xowoc9b4PAap.jpg', 'https://image.tmdb.org/t/p/original/4BtL2vvEufDXDP4u6xQjjQ1Y2aT.jpg', ARRAY[], 'film', 168.7615, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('8782fb42-8e1d-44b5-8b3f-22a94bf255e4', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1419406, 'https://image.tmdb.org/t/p/original/4BtL2vvEufDXDP4u6xQjjQ1Y2aT.jpg', 'https://image.tmdb.org/t/p/w500/t1PFVsGYdUHtPv0Xowoc9b4PAap.jpg', 7.422, 702, 'Il forme une nouvelle génération d’agents de la loi pour une mission dangereuse visant à sauver le monde des criminels impitoyables.', 'Un mafieux et ses 7 fils adoptifs manipulent et ridiculisent la police en piratant le système de surveillance de la ville, dans le but de récupérer une fortune en crypto-monnaie. La police doit faire appel à un ancien expert qui va s''associer avec une policière à laquelle il est lié par un secret qu''elle ignore. Une partie d''échec commence, où les cerveaux et la loyauté seront mis à l''épreuve.', 141, '2025-08-16', 'zh', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4610a518-3f3c-484f-b147-b99c67f578fc', '682ae39d-f308-4cff-9852-2a14aaedff3b', 18897, 'Jackie Chan', 'Wong Tak Chung', 'https://image.tmdb.org/t/p/w200/nraZoTzwJQPHspAVsKfgl3RXKKa.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('314bb72a-6f58-4a2a-b6ac-b6780d85e5b8', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1173805, 'Zhang Zifeng', 'He Qiuguo', 'https://image.tmdb.org/t/p/w200/3S8yEnTVqH8T3bTVf9FmtXxWcu2.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('835b4667-db46-498b-9b39-3df1bf95ff24', '682ae39d-f308-4cff-9852-2a14aaedff3b', 56861, 'Tony Leung Ka-fai', 'Fu Longsheng', 'https://image.tmdb.org/t/p/w200/il4L0QSp5STfZCB1wsvb6rSCDar.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a7119773-c8e3-42bf-bed2-80ddac7ad467', '682ae39d-f308-4cff-9852-2a14aaedff3b', 3167855, '此沙', 'Xi Meng / Xi Wang', 'https://image.tmdb.org/t/p/w200/eWytg5M0VUCb0aHEKpUDijQ7JxF.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('360a7dd7-fade-4621-a9e4-fb85e49f3412', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1625880, '文俊辉', 'Hu Feng', 'https://image.tmdb.org/t/p/w200/z1seXrQQWG7nsQVHqSWKefJQ8DO.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f659cee7-4a0b-4868-8151-e030ce68f859', '682ae39d-f308-4cff-9852-2a14aaedff3b', 4062369, '周政杰', 'Liu Jinxiao', 'https://image.tmdb.org/t/p/w200/9n4vnXt6SIrfUfDDXxz4ewxhbSf.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('29a05949-48de-4242-9349-936f22743984', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1016316, '王杍逸', 'Wu Yaolei', 'https://image.tmdb.org/t/p/w200/6xOEI8NnQuvRwe6nSDXYGAamKzO.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('de8a54f8-a5ba-49a1-8b3d-c79ef9b32324', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1516593, '郎月婷', 'Madam Wang', 'https://image.tmdb.org/t/p/w200/bdyJhQrIG7ai9B2Tp2kD2M0F32X.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cc970eb4-5d75-4be3-a85f-c3ce15d25303', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1881987, '林秋楠', 'Xin', 'https://image.tmdb.org/t/p/w200/4QerqhhsMnhTQZgmbxh6vTl37DE.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e84f4b2f-e4d0-445a-a62e-b6454e01c77f', '682ae39d-f308-4cff-9852-2a14aaedff3b', 1443375, '王振威', 'Ray', 'https://image.tmdb.org/t/p/w200/bXVR7TbR8xXBT1fAwCAgLmbubq1.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3ee9b3a1-3233-4ae4-9f0b-f2e31752c7c5', '682ae39d-f308-4cff-9852-2a14aaedff3b', 614810, 'நா நா', 'https://image.tmdb.org/t/p/w200/ax1nM3sMDDbylSLPy2ahiofdSAo.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('df0769ee-1fc7-4ea2-854a-8d1e12621f71', '682ae39d-f308-4cff-9852-2a14aaedff3b', 9064, 'Hellraiser 2 : Les Écorchés', 'https://image.tmdb.org/t/p/w200/ri6BfqkQjvznrMPbhCdNonng1Qn.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('88560d03-ac25-40f8-8df5-0cd873815f1e', '682ae39d-f308-4cff-9852-2a14aaedff3b', 8845, 'Piège en haute mer', 'https://image.tmdb.org/t/p/w200/6X5iYIfx6CcMGKQ0PM5UllxZD0d.jpg', 1992, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3ae9aa4b-f8aa-4c50-8bd3-15d60dc85678', '682ae39d-f308-4cff-9852-2a14aaedff3b', 438798, 'The Prison', 'https://image.tmdb.org/t/p/w200/8ieBJvHi6Keg5t1Rwlw650klefS.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5b3b5d39-b01a-4db5-9873-e2d03898e5e7', '682ae39d-f308-4cff-9852-2a14aaedff3b', 9355, 'Mad Max :  Au-delà du dôme du tonnerre', 'https://image.tmdb.org/t/p/w200/fHo2AJ9brsXKWbYJ2LA087UDBwZ.jpg', 1985, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('52bdff71-b3c9-4c92-b939-3104093ee911', '682ae39d-f308-4cff-9852-2a14aaedff3b', 8909, 'Wanted : Choisis ton destin', 'https://image.tmdb.org/t/p/w200/j0YQlXsfcYm5WQJS7i1XZWI5amk.jpg', 2008, NOW());

COMMIT;

-- Movie: Mortal Kombat II
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ba50b097-7e35-4a9a-b272-43ebda795ec8', 'Mortal Kombat II', 'Mortal Kombat II', 2026, 'Simon McQuoid', ARRAY['Jeremy Slater'], '1h56min', ARRAY['Action', 'Fantastique', 'Aventure'], 'Les champions plébiscités par les fans – désormais secondés par Johnny Cage en personne – s’affrontent dans un tournoi ultime, sans foi ni loi, pour tenter de renverser le règne de Shao Kahn, un tyran qui menace l’existence même de l’Earthrealm et de ses partisans.', '', 'https://image.tmdb.org/t/p/w200/tETDfHV9cd8DOeOoO5VITv2ki0t.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/yPkeeBEJdQO85AGCwi2XEIfMOxa.jpg', 'https://image.tmdb.org/t/p/original/4EAAwpylq313qrDqpCxulUrXBNF.jpg', ARRAY[], 'film', 167.7321, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('0152a32f-3b4c-446a-ac90-72700afa585b', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 931285, 'https://image.tmdb.org/t/p/original/4EAAwpylq313qrDqpCxulUrXBNF.jpg', 'https://image.tmdb.org/t/p/w500/yPkeeBEJdQO85AGCwi2XEIfMOxa.jpg', 6.762, 351, 'Prépare-toi à passer au niveau supérieur.', 'Les champions plébiscités par les fans – désormais secondés par Johnny Cage en personne – s’affrontent dans un tournoi ultime, sans foi ni loi, pour tenter de renverser le règne de Shao Kahn, un tyran qui menace l’existence même de l’Earthrealm et de ses partisans.', 116, '2026-05-06', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ecfbc290-11bc-49ee-9288-10bc40e6b5c1', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1372, 'Karl Urban', 'Johnny Cage', 'https://image.tmdb.org/t/p/w200/6CkZLwEJxfqqcJHyeXegMAvOlPh.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3f06d4d7-f032-4c7b-93cb-3f549ec300bc', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 2168270, 'Adeline Rudolph', 'Kitana', 'https://image.tmdb.org/t/p/w200/sWjjm53MeVrpQH2dxtFD3gfEt3v.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('37e44920-5906-4552-8801-629896d29975', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 136347, 'Jessica McNamee', 'Sonya Blade', 'https://image.tmdb.org/t/p/w200/sKgsW78FCDWAes0SeCp5lgq3eou.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('925dd4b6-14ff-4065-8951-fe5ce68e3822', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 189230, 'Josh Lawson', 'Kano', 'https://image.tmdb.org/t/p/w200/Am9vM77uZd9bGODugwmWtOfzx6E.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3b585a60-a24f-4320-ba76-1565c3402cb3', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1510237, 'Martyn Ford', 'Shao Kahn', 'https://image.tmdb.org/t/p/w200/fC6p8G76IJJpDjgdfuVTDAWG24s.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('56fec51b-2e5f-41da-996e-66e0c8ebf224', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1525689, 'Ludi Lin', 'Liu Kang', 'https://image.tmdb.org/t/p/w200/9Ila4K8POeuVWRO9hzyekFjvCDk.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4be9d31a-474b-43b5-acb6-0d8322769f99', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 51684, 'Mehcad Brooks', 'Jax', 'https://image.tmdb.org/t/p/w200/s7Cu6Si9n5qsH64eLBVGXaf55bE.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('95fa0f4d-7333-4d14-a8b2-65c511ee0e38', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1859934, 'Tati Gabrielle', 'Jade', 'https://image.tmdb.org/t/p/w200/txZTL1HkPVxliTilbjlwR51VIt6.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b3c0e8d3-7499-4eb8-b9ae-d387219a0272', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1610940, 'Lewis Tan', 'Cole Young', 'https://image.tmdb.org/t/p/w200/yMr3mwHHBpfbXwDDkahOzFtTCak.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('211d3cc6-2705-48e1-b7f0-e82e7775f588', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1358974, 'Max Huang', 'Kung Lao', 'https://image.tmdb.org/t/p/w200/pHntB82hNVVKZtTAUgUKr2KE1Zt.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1383b6a9-19f0-4343-abcf-0314a946dc5f', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 8840, 'Cœur de dragon', 'https://image.tmdb.org/t/p/w200/sgTitA0BNzzBc1zPx3KHuJxp8or.jpg', 1996, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('56beb014-6de8-4ba9-b14a-dde51077dc1b', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('853bd9c6-8aa3-4fc5-bf48-528dd3048662', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 8965, 'Les Énigmes de l''Atlantide', 'https://image.tmdb.org/t/p/w200/mYsFQt0xgBkEUOTbjA4MLRrzaKQ.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9e207b15-f2db-4666-a983-72862a665384', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 8982, 'L''Honneur du Dragon', 'https://image.tmdb.org/t/p/w200/fcVFC02Q0mQ31Dq0LZVAm9yflWP.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c132a449-3654-4cc0-b72e-233a12f83c94', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 1529694, 'Mahavatar Raghunandan', NULL, NULL, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bd7da76a-b285-49fe-86d4-1510f4b1d723', 'ba50b097-7e35-4a9a-b272-43ebda795ec8', 9078, 'Merlin l''enchanteur', 'https://image.tmdb.org/t/p/w200/fht7xph50bzcvtfsPkcrHRSPYcT.jpg', 1963, NOW());

COMMIT;

-- Movie: Mortal Kombat
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 'Mortal Kombat', 'Mortal Kombat', 2021, 'Simon McQuoid', ARRAY['Greg Russo', 'David Callaham'], '1h50min', ARRAY['Action', 'Fantastique', 'Aventure'], 'Lorsque les plus grands champions de la Terre sont appelés à combattre les ennemis de l''Autre Monde, ils doivent découvrir leurs véritables pouvoirs pour sauver notre planète de l''annihilation totale.', '', 'https://image.tmdb.org/t/p/w200/tETDfHV9cd8DOeOoO5VITv2ki0t.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/rxw7an9VWIlaEzTB4ETadMWSdym.jpg', 'https://image.tmdb.org/t/p/original/6ELCZlTA5lGUops70hKdB83WJxH.jpg', ARRAY[], 'film', 151.1462, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('b1bff2e3-2e3f-475e-801d-6e9af2aafb78', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 460465, 'https://image.tmdb.org/t/p/original/6ELCZlTA5lGUops70hKdB83WJxH.jpg', 'https://image.tmdb.org/t/p/w500/rxw7an9VWIlaEzTB4ETadMWSdym.jpg', 7.035, 6673, 'Viens par ici.', 'Lorsque les plus grands champions de la Terre sont appelés à combattre les ennemis de l''Autre Monde, ils doivent découvrir leurs véritables pouvoirs pour sauver notre planète de l''annihilation totale.', 110, '2021-04-07', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('980184f6-92ee-4994-b56e-78e14e2c4b7a', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 1610940, 'Lewis Tan', 'Cole Young', 'https://image.tmdb.org/t/p/w200/yMr3mwHHBpfbXwDDkahOzFtTCak.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('928b91be-4c63-4fbf-8387-38169c206a10', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 136347, 'Jessica McNamee', 'Sonya Blade', 'https://image.tmdb.org/t/p/w200/sKgsW78FCDWAes0SeCp5lgq3eou.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('631a1b14-fe1e-482c-91e4-eae922e6eb5f', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 51684, 'Mehcad Brooks', 'Jax', 'https://image.tmdb.org/t/p/w200/s7Cu6Si9n5qsH64eLBVGXaf55bE.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ae8f2a59-64db-4d8b-a770-ce5235af9e21', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 189230, 'Josh Lawson', 'Kano', 'https://image.tmdb.org/t/p/w200/Am9vM77uZd9bGODugwmWtOfzx6E.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ddcc1388-a916-4801-963f-13ef26485bfc', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 1525689, 'Ludi Lin', 'Liu Kang', 'https://image.tmdb.org/t/p/w200/9Ila4K8POeuVWRO9hzyekFjvCDk.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('607635f9-cb38-4ef1-ad44-dbb79c356573', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 1358974, 'Max Huang', 'Kung Lao', 'https://image.tmdb.org/t/p/w200/pHntB82hNVVKZtTAUgUKr2KE1Zt.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('80fa10e7-4711-4cf7-bed0-68c443ce2258', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 13275, 'Tadanobu Asano', 'Lord Raiden', 'https://image.tmdb.org/t/p/w200/3CBpfGRcPq1jEeYr51TiOiNbZzT.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('676b7f1e-c1a9-43b8-bda1-fd9006c15e33', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 101015, 'Chin Han', 'Shang Tsung', 'https://image.tmdb.org/t/p/w200/3XJXmYm6r4Hvm3izOArU58fhQrT.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6fb9f602-668a-4cb0-9999-d01d3eb2ff56', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 9195, 'Hiroyuki Sanada', 'Hanzo Hasashi / Scorpion', 'https://image.tmdb.org/t/p/w200/oyOk03ldE3wJm2CMjxTzs6rc30z.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1b557890-958b-420c-b732-7463582860ed', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 592496, 'Joe Taslim', 'Bi-Han / Sub-Zero', 'https://image.tmdb.org/t/p/w200/6S60RmKqa4p1HN0n4uaohNqjaU8.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('68cdd52f-3b22-44eb-835d-40329de1f01a', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 441669, 'Butcher the Bakers', 'https://image.tmdb.org/t/p/w200/6AXFxrot8sXHD2TfMEgE5ZkJC2k.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b90b41c5-6ad2-4c21-9797-5d296413b693', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 11494, 'Wilderness', 'https://image.tmdb.org/t/p/w200/sLtUVG7ORbTJueTmIWpO4YeHayS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('11ad7ce6-4f2c-47f8-825c-5eb49009efcb', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 11595, '48 heures de plus', 'https://image.tmdb.org/t/p/w200/25fqd9IXlGgco8Yy7Lv7WQuiWPJ.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('be719ebb-8492-47c5-a70e-476342356498', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 11596, 'Freddy sort de la nuit', 'https://image.tmdb.org/t/p/w200/oHTDAuadMvuiiTi5EPBLYz1GazE.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('fab24dcf-db2e-4f4e-a961-3a48451b8d91', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a7ff963d-a047-4650-a20a-1d6f43459200', 'bd790a5c-0e73-4aae-b7df-0d7862ea8d6d', 11625, 'Astérix et le Coup du menhir', 'https://image.tmdb.org/t/p/w200/uu0Ixw36nxrzsx03Tdfak2qN1VU.jpg', 1989, NOW());

COMMIT;

-- Movie: Nymphomaniac : Volume 2
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('807e9d4f-3772-4fad-a7da-a198713cd6e0', 'Nymphomaniac : Volume 2', 'Nymphomaniac: Vol. II', 2013, 'Lars von Trier', ARRAY['Lars von Trier'], '1h59min', ARRAY['Drame', 'Mystère'], 'La folle et poétique histoire du parcours érotique d''une femme, de sa naissance jusqu''à l''âge de 50 ans, racontée par le personnage principal, Joe, qui s''est autodiagnostiquée nymphomane. Par une froide soirée d’hiver, le vieux et charmant célibataire Seligman découvre Joe dans une ruelle, rouée de coups. Après l''avoir ramenée chez lui, il soigne ses blessures et l’interroge sur sa vie. Seligman écoute intensément Joe lui raconter en huit chapitres successifs le récit de sa vie aux multiples ramifications et facettes, riche en associations et en incidents de parcours.', '', 'https://image.tmdb.org/t/p/w200/a1zVySI0Yqqf3ORegQ1icMfvhAa.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/iLUNqgNKuWn667kXCKztSxYbT3k.jpg', 'https://image.tmdb.org/t/p/original/oQEAWIr3thvSICvoQnFEqyuf0Oz.jpg', ARRAY[], 'film', 152.8571, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('5a7481c1-4008-4cbb-9b69-6a9b31d3fbc0', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 249397, 'https://image.tmdb.org/t/p/original/oQEAWIr3thvSICvoQnFEqyuf0Oz.jpg', 'https://image.tmdb.org/t/p/w500/iLUNqgNKuWn667kXCKztSxYbT3k.jpg', 6.711, 3168, 'Oubliez l''amour', 'La folle et poétique histoire du parcours érotique d''une femme, de sa naissance jusqu''à l''âge de 50 ans, racontée par le personnage principal, Joe, qui s''est autodiagnostiquée nymphomane. Par une froide soirée d’hiver, le vieux et charmant célibataire Seligman découvre Joe dans une ruelle, rouée de coups. Après l''avoir ramenée chez lui, il soigne ses blessures et l’interroge sur sa vie. Seligman écoute intensément Joe lui raconter en huit chapitres successifs le récit de sa vie aux multiples ramifications et facettes, riche en associations et en incidents de parcours.', 119, '2013-12-25', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d980a840-e931-4915-8d3d-47d79f9ab75d', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 4273, 'Charlotte Gainsbourg', 'Joe', 'https://image.tmdb.org/t/p/w200/vyZQlwBSpARVHzn6M91ZcJTy7P8.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('40e6b015-3713-450c-8675-bbe822e7f109', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1640, 'Stellan Skarsgård', 'Seligman', 'https://image.tmdb.org/t/p/w200/mW7xmtGV4y79kQGn0zkKVGDMAmw.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0091ec71-fea7-4090-9c62-e90798ec36f2', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1137823, 'Stacy Martin', 'Young Joe', 'https://image.tmdb.org/t/p/w200/wLPh456xduwDkGgPpaf1KGH9EWz.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d42799ad-0642-4560-83d8-d288fd432052', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 10959, 'Shia LaBeouf', 'Jerôme', 'https://image.tmdb.org/t/p/w200/egvlIdeizCkSkuHVoDuuduIThFA.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d97c931c-79ed-4638-9d19-5f60f7b00bbd', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 5293, 'Willem Dafoe', 'L', 'https://image.tmdb.org/t/p/w200/ui8e4sgZAwMPi3hzEO53jyBJF9B.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('edff5478-097f-468d-8629-d0a3d1f2abaa', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1646, 'Udo Kier', 'The Waiter', 'https://image.tmdb.org/t/p/w200/lIOGDMvrVHMgPXdhicLI41tY1zf.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4851c2fc-d6ad-4b49-9eb1-f0e98652aeb2', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1642, 'Jean-Marc Barr', 'Debtor Gentleman', 'https://image.tmdb.org/t/p/w200/65aLM2ZvBjJu2JWGSrTGHqXyc8w.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('593a7dba-ec52-4181-9c69-db91b7ef09c2', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 478, 'Jamie Bell', 'K', 'https://image.tmdb.org/t/p/w200/xAfNYOJYOy5ee9PHbBF8Y6xzZ9I.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7643136d-9633-45ec-9061-2c30c28e4f3e', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1137824, 'Mia Goth', 'P', 'https://image.tmdb.org/t/p/w200/rwko7XVaKFcJH1dtAIIsrgLMzHb.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a8100bc2-d1a7-4742-90d7-34b12bff5e36', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 140493, 'Michaël Pas', 'Old Jerôme', 'https://image.tmdb.org/t/p/w200/lb88BHKoizgOKo6OfKlFFlzPqtE.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9af725a8-d712-4479-94d2-f711dadbe1dc', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e3616076-2f02-4628-b90d-fe3d20ef16a5', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 438537, 'Szatan kazał tańczyć', 'https://image.tmdb.org/t/p/w200/lOj0wvAlNrgTt33ZOaBvgbayAnH.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3513021e-0d77-45b2-9670-3e32d0abcb76', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1169448, 'Prison Babies', 'https://image.tmdb.org/t/p/w200/caPxPMEmReBziXCjolv99rJsqVv.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b8d05210-8bd7-4374-ae7e-337443cf21f3', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 438601, 'Tout le monde dit je t''aime', 'https://image.tmdb.org/t/p/w200/duZDza0xEboF9PtFWYmygRmz3SE.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5596ec49-927c-4349-884a-cd57181cb7fe', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 614743, 'Peppermint', 'https://image.tmdb.org/t/p/w200/5hQ2mBbPt3o35Sx3e4FpJJJALmA.jpg', 2020, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9106d4e4-cc2d-4b98-9a6a-c7d17f6da513', '807e9d4f-3772-4fad-a7da-a198713cd6e0', 1529694, 'Mahavatar Raghunandan', NULL, NULL, NOW());

COMMIT;

-- Movie: Le Diable s'habille en Prada
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('706f8abf-5c2c-4e9c-976f-0646857f4569', 'Le Diable s''habille en Prada', 'The Devil Wears Prada', 2006, 'David Frankel', ARRAY['Aline Brosh McKenna'], '1h50min', ARRAY['Drame', 'Comédie'], 'Fraîchement diplômée, Andrea débarque à New York et décroche le job de rêve. Mais en tant qu’assistante de la tyrannique rédactrice en chef d’un prestigieux magazine de mode, elle va vite découvrir ce que le mot « enfer » veut dire…', '', 'https://image.tmdb.org/t/p/w200/hfIjLMo8Upl6MXhn1YcoDoXeeZn.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/vTIBjWMWx1p5Wv2J3IRhEW13lrj.jpg', 'https://image.tmdb.org/t/p/original/gkh6Nt8DtY1XT4gQsyFq9XAVJlJ.jpg', ARRAY[], 'film', 155.4556, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('02b716a4-20d2-487f-9cfc-146adadf3c59', '706f8abf-5c2c-4e9c-976f-0646857f4569', 350, 'https://image.tmdb.org/t/p/original/gkh6Nt8DtY1XT4gQsyFq9XAVJlJ.jpg', 'https://image.tmdb.org/t/p/w500/vTIBjWMWx1p5Wv2J3IRhEW13lrj.jpg', 7.427, 13623, 'Un job d’enfer, une boss infernale !', 'Fraîchement diplômée, Andrea débarque à New York et décroche le job de rêve. Mais en tant qu’assistante de la tyrannique rédactrice en chef d’un prestigieux magazine de mode, elle va vite découvrir ce que le mot « enfer » veut dire…', 110, '2006-06-29', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('30e8c663-8383-4e53-80f0-7a2b6c89be23', '706f8abf-5c2c-4e9c-976f-0646857f4569', 5064, 'Meryl Streep', 'Miranda Priestly', 'https://image.tmdb.org/t/p/w200/g5cVxQBAQ3AXt3LhdBXtbbN47Uc.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8627a1c1-a20b-4779-b635-f0942318c34c', '706f8abf-5c2c-4e9c-976f-0646857f4569', 1813, 'Anne Hathaway', 'Andy Sachs', 'https://image.tmdb.org/t/p/w200/nbccV2pMoyLTCeg5DQip24Eq0Jp.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1a8b9d2e-71aa-40e1-805e-a7307a2e1549', '706f8abf-5c2c-4e9c-976f-0646857f4569', 5081, 'Emily Blunt', 'Emily', 'https://image.tmdb.org/t/p/w200/5nCSG5TL1bP1geD8aaBfaLnLLCD.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b7bce9ed-652c-4bc8-b1f6-d4ead041f255', '706f8abf-5c2c-4e9c-976f-0646857f4569', 2283, 'Stanley Tucci', 'Nigel', 'https://image.tmdb.org/t/p/w200/q4TanMDI5Rgsvw4SfyNbPBh4URr.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1ca43661-3407-4e1b-becc-1db7c3a9438d', '706f8abf-5c2c-4e9c-976f-0646857f4569', 1284159, 'Simon Baker', 'Christian Thompson', 'https://image.tmdb.org/t/p/w200/8RPbdwSOJ3DEQDQaj05zBFaUu5f.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fbb06f63-a6d2-4673-9cbf-63f29e09ffef', '706f8abf-5c2c-4e9c-976f-0646857f4569', 5090, 'Adrian Grenier', 'Nate', 'https://image.tmdb.org/t/p/w200/ghSzUkiw7OjRq0poNOlCjbXbdU6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('574136ad-7876-44f0-82fd-81df006192ad', '706f8abf-5c2c-4e9c-976f-0646857f4569', 10580, 'Tracie Thoms', 'Lily', 'https://image.tmdb.org/t/p/w200/9PKUJJtqFRbZDhme6uDzIu0mRIE.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5ffe802f-6af2-4f40-a50d-6a81b6c6ba6d', '706f8abf-5c2c-4e9c-976f-0646857f4569', 10581, 'Rich Sommer', 'Doug', 'https://image.tmdb.org/t/p/w200/cfbJ3nyiyRpSq2mLrbbrbg1k3Dh.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7cb39ff7-dd4c-4814-a565-2fa530898915', '706f8abf-5c2c-4e9c-976f-0646857f4569', 10582, 'Daniel Sunjata', 'James Holt', 'https://image.tmdb.org/t/p/w200/w3Wa0d7j2auA2R8FQvjrgfB3ozo.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a238918c-1881-4de9-9bc3-c681a9928286', '706f8abf-5c2c-4e9c-976f-0646857f4569', 24535, 'David Marshall Grant', 'Richard Sachs', 'https://image.tmdb.org/t/p/w200/81E0yZVUrojvq10qKRdSvNkq9up.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f43ee977-8f9c-4561-9657-2396375e1204', '706f8abf-5c2c-4e9c-976f-0646857f4569', 789, 'Trains étroitement surveillés', 'https://image.tmdb.org/t/p/w200/yzNCrmtT6o8gLlsYkXN9NlGNQkk.jpg', 1966, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d336082c-70e8-4802-998d-9780b38556b0', '706f8abf-5c2c-4e9c-976f-0646857f4569', 796, 'Sexe intentions', 'https://image.tmdb.org/t/p/w200/tkShoPdnzijP1VdADBLghgephTC.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0ed281f6-e2b9-4574-804c-9da170c20ed4', '706f8abf-5c2c-4e9c-976f-0646857f4569', 840, 'Rencontres du troisième type', 'https://image.tmdb.org/t/p/w200/jznNbJ80WvvlbLdGEjNsvwycDZC.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('27df8555-6515-4254-9434-80065b5b8660', '706f8abf-5c2c-4e9c-976f-0646857f4569', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('aa268e48-9dea-4e68-84a4-467407b91e4f', '706f8abf-5c2c-4e9c-976f-0646857f4569', 845, 'L''Inconnu du Nord-Express', 'https://image.tmdb.org/t/p/w200/6oSfav2yXyP009cBKoNEH0UYF10.jpg', 1951, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c3dfd9c1-deed-4f30-86f8-a7a0ba9b8b96', '706f8abf-5c2c-4e9c-976f-0646857f4569', 805, 'Rosemary''s Baby', 'https://image.tmdb.org/t/p/w200/yKtdS5oaHEtBUD1Gq4rdOezzWp6.jpg', 1968, NOW());

COMMIT;

-- Movie: Graphic Desires
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 'Graphic Desires', 'Graphic Desires', 2023, 'Andy Edwards', ARRAY['Andy Edwards'], '1h30min', ARRAY['Thriller', 'Crime'], 'Graphic Desires suit le parcours d''une jeune femme nommée Charlie, qui est une artiste numérique en pleine ascension. Elle commence à ressentir une forte attirance pour un mystérieux inconnu qu''elle découvre à travers une série d''illustrations graphiques sensuelles et troublantes. Au fil du temps, elle se retrouve de plus en plus obsédée par cet inconnu, au point de ne plus pouvoir distinguer la réalité de l''imaginaire. Charlie se retrouve alors plongée dans un monde de désirs inavoués et de sombres secrets, où chaque nouvelle illustration semble la rapprocher d''une vérité inquiétante sur sa propre vie. "Graphic Desires" explore les thèmes de l''obsession, de la dualité entre l''art et la vie, et de la fine frontière entre la réalité et la fiction. Au fur et à mesure que l''intrigue se déroule, Charlie doit faire face à des révélations choquantes qui la poussent à remettre en question sa propre identité et la nature de son désir.', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/3BjLdTWRiHc1ISIZMFvToOmghOM.jpg', 'https://image.tmdb.org/t/p/original/rHnANzYUmV3WZw3n0yWOLiR3pen.jpg', ARRAY[], 'film', 158.2495, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('0ee82964-9f57-4d3b-a23b-a69df1b244c7', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 976912, 'https://image.tmdb.org/t/p/original/rHnANzYUmV3WZw3n0yWOLiR3pen.jpg', 'https://image.tmdb.org/t/p/w500/3BjLdTWRiHc1ISIZMFvToOmghOM.jpg', 7.038, 78, NULL, 'Graphic Desires suit le parcours d''une jeune femme nommée Charlie, qui est une artiste numérique en pleine ascension. Elle commence à ressentir une forte attirance pour un mystérieux inconnu qu''elle découvre à travers une série d''illustrations graphiques sensuelles et troublantes. Au fil du temps, elle se retrouve de plus en plus obsédée par cet inconnu, au point de ne plus pouvoir distinguer la réalité de l''imaginaire. Charlie se retrouve alors plongée dans un monde de désirs inavoués et de sombres secrets, où chaque nouvelle illustration semble la rapprocher d''une vérité inquiétante sur sa propre vie. "Graphic Desires" explore les thèmes de l''obsession, de la dualité entre l''art et la vie, et de la fine frontière entre la réalité et la fiction. Au fur et à mesure que l''intrigue se déroule, Charlie doit faire face à des révélations choquantes qui la poussent à remettre en question sa propre identité et la nature de son désir.', 90, '2023-08-31', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('49a913fa-bad8-4e2b-9b69-cae7d204c142', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 1085939, 'David Wayman', 'Franklin', 'https://image.tmdb.org/t/p/w200/M5U57NeWvj143cMIQSCdOEAFpp.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b75834a9-2a68-4ffa-86c2-ffc2ccb4a98d', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 2667809, 'Sian Altman', 'Candida', 'https://image.tmdb.org/t/p/w200/49DvxTVXjkNR95dTBdVnI6fI14a.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3dd529a6-3441-4a73-bc99-c86c3dee5be6', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 3367977, 'May Kelly', 'Atlanta / Lucinda', 'https://image.tmdb.org/t/p/w200/p1HXYttPQ3RaB4oDt3EOfNPRpb4.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('025223f6-1be3-4899-8c55-a48f7d0ea722', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 3320644, 'Ocean M Harris', 'Brandon', 'https://image.tmdb.org/t/p/w200/7QwPdS5uyhuCKcSAo426JhoPDVi.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f72e59e9-d68c-4825-a332-86cf0b069701', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 1865766, 'Valis Volkova', 'Cooper', 'https://image.tmdb.org/t/p/w200/7Knlbu24ZKfOOX5OLyDDQ7klA8Z.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ea49d714-ca0d-48df-ac35-ebca5abd46b5', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 3553535, 'Jack Edwards', 'The Bleeding Cowboy', NULL, 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('32b7fa9a-6717-47ad-ac11-d3c1cd1feb81', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 3553537, 'Caidney Simone', 'Casey', NULL, 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1039bb59-dbe8-46d7-8407-89987ac42751', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 3489245, 'Eva Ray', 'Georgia', 'https://image.tmdb.org/t/p/w200/qWhxXG764l2G5ezoMvRZX5uChLG.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ed35d166-c69e-4ac0-91c4-ee558c37f3e6', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 3553539, 'Felicia Westring', 'Korinna', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('324f18f4-3a74-4af0-8cd3-dee7f44c62c3', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 1475390, 'Fahad Salman', 'Jokerman', 'https://image.tmdb.org/t/p/w200/cqCPqcZXZWrBbdNj0DtTqHmELN1.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('86078eec-9c94-4e3f-abf4-c6a5d3fa9403', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 8984, 'Harcèlement', 'https://image.tmdb.org/t/p/w200/ehBKgyIIdw3HTT1nwVe9uy4NiRJ.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a65539e0-2283-4e05-9bc1-66102d397848', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 614742, 'Writer''s Block', 'https://image.tmdb.org/t/p/w200/aqVHp8XqL8uxE7WQNrJbKCQB54P.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4a734e5d-3990-42c5-ab65-482b78bdcab0', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 438674, 'Traîné sur le bitume', 'https://image.tmdb.org/t/p/w200/aTXiGzob8DbeZSNhaSni6rfcR78.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('99752ef5-eb51-47a2-b927-018e0c754c66', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 9010, 'Silentium', 'https://image.tmdb.org/t/p/w200/uca8Pb96wSgcTuUYaT5Nb3IIAzu.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cd9e9524-b7bb-4395-b221-06147b7af99b', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 9022, 'Tous les garçons aiment Mandy Lane', 'https://image.tmdb.org/t/p/w200/uac8ntNtyN2oOrTBxolUqUfZaeX.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d78cee06-afdd-4bcf-b487-cc475d626392', '3ad84292-0ca9-4b22-93f9-e0c3f9ac51c9', 262127, 'എസ്കേപ് ഫ്രം ഉഗാണ്ട', 'https://image.tmdb.org/t/p/w200/2lHefLofYx1oXLTI002DD2bwNxG.jpg', 2013, NOW());

COMMIT;

-- Movie: Iron Lung
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('71e4d49c-e78b-40f1-bc0e-dce02186e311', 'Iron Lung', 'Iron Lung', 2026, 'Mark Fischbach', ARRAY['Mark Fischbach'], '2h5min', ARRAY['Horreur', 'Mystère', 'Science-Fiction'], 'Les étoiles ne sont plus. Les planètes ont disparu. Seuls quelques individus subsistent, à bord de stations spatiales ou de vaisseaux errants. Ils ont survécu pour assister à la fin — et lui donner un nom : « Le Rapt silencieux ». Après des années de déclin et d’infrastructures en perdition, l’Iron Consolidation fait une découverte sur une lune désolée, AT-5. Un océan de sang. L’Iron Consolidation lance immédiatement une expédition, avec l’espoir d’y trouver des ressources cruciales. Un sous-marin est construit, et un condamné y est enfermé. En raison de la pression et de la profondeur de l’océan, l’hublot frontal du sous-marin est masqué par un bouclier de métal. S’il s’en sort, il gagnera sa liberté. Sinon, un autre suivra.', '', 'https://image.tmdb.org/t/p/w200/2y59nq7vipTBdRMmMTsy1d4HeiG.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/sIwakdbMGS1krtgendTWpxTY9Hw.jpg', 'https://image.tmdb.org/t/p/original/gqGQ0zADV5FIcgMWtWX8FcGQjFp.jpg', ARRAY[], 'film', 145.7933, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('8127b472-64b5-41d8-87e9-ffbfb56d2b8b', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 1116201, 'https://image.tmdb.org/t/p/original/gqGQ0zADV5FIcgMWtWX8FcGQjFp.jpg', 'https://image.tmdb.org/t/p/w500/sIwakdbMGS1krtgendTWpxTY9Hw.jpg', 7.3, 170, NULL, 'Les étoiles ne sont plus. Les planètes ont disparu. Seuls quelques individus subsistent, à bord de stations spatiales ou de vaisseaux errants. Ils ont survécu pour assister à la fin — et lui donner un nom : « Le Rapt silencieux ». Après des années de déclin et d’infrastructures en perdition, l’Iron Consolidation fait une découverte sur une lune désolée, AT-5. Un océan de sang. L’Iron Consolidation lance immédiatement une expédition, avec l’espoir d’y trouver des ressources cruciales. Un sous-marin est construit, et un condamné y est enfermé. En raison de la pression et de la profondeur de l’océan, l’hublot frontal du sous-marin est masqué par un bouclier de métal. S’il s’en sort, il gagnera sa liberté. Sinon, un autre suivra.', 125, '2026-01-30', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c2ecd0a8-b7db-4de3-b893-1981fe82ddb8', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 1494060, 'Mark Fischbach', 'Simon', 'https://image.tmdb.org/t/p/w200/2y59nq7vipTBdRMmMTsy1d4HeiG.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('15de8851-6660-46a5-a387-a1e7de72c581', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 2602912, 'Caroline Kaplan', 'Ava', 'https://image.tmdb.org/t/p/w200/oMOswhHN3LfRtziULWTxNiYgAFj.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6ff61d1f-859a-4cb9-8c43-234f19cebddb', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 963818, 'Troy Baker', 'David', 'https://image.tmdb.org/t/p/w200/9jeUft7h20HscRCrsVQTgKHXRwJ.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b5c2713f-1ca3-45f2-94ee-acf245c19dca', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 2444615, 'Elsie Lovelock', 'SM-8 Research Lead / The Speaker (voice)', 'https://image.tmdb.org/t/p/w200/aVI0QKCJVbIPBFY99E2VLKCpaXa.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d60ed6df-5c7f-490d-a4bc-8f50960ec5d5', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 1042667, 'Elle LaMont', 'SM-8 Research Assistant / The Whisper (voice)', 'https://image.tmdb.org/t/p/w200/uR16F3g1J32HgvnlHW890ZAFnnT.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c6d42a96-966d-4282-9936-024f5584ad45', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 1298793, 'Mick Lauer', 'The Guy Who Told You to Cross the Wires (voice)', 'https://image.tmdb.org/t/p/w200/gE18SWyqRjbfuAfNi5Al2M122pL.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3a65927f-935e-49b8-b99f-15a770f21786', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 1243018, 'Dave Pettitt', 'The Father', 'https://image.tmdb.org/t/p/w200/qaohw3Q0M57lSww37pK421b7P04.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8cfdc729-d795-4138-aba8-77e4c310a2b8', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 963313, 'Holt Boggs', 'Eden Soldier', 'https://image.tmdb.org/t/p/w200/jiTZr7sqFqJIHxKxYa4uxFnW6rK.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a5b6e570-b16d-42c8-9eaa-9ccac0a79d0c', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 5972532, 'Isaac McKee', 'Young Simon', 'https://image.tmdb.org/t/p/w200/6Zetel3zXvQF7tlQcuncmfkZAzR.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d9f6bc64-fca9-4d05-bbee-16f8ef724479', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 4692741, 'Roman Parsons Crow', 'Child of Eden', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9cddd699-4db7-44c8-bed4-ed797aa001af', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 11020, 'Pique-nique à Hanging Rock', 'https://image.tmdb.org/t/p/w200/e5myKEaZHh506KekQv0DECddflz.jpg', 1975, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9bc06af3-849d-44af-855e-448e831368fa', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 441669, 'Butcher the Bakers', 'https://image.tmdb.org/t/p/w200/6AXFxrot8sXHD2TfMEgE5ZkJC2k.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c8611985-69ee-47d7-8dc1-06410aea9e72', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 11260, 'Appelez-moi Dave', 'https://image.tmdb.org/t/p/w200/rB8cemSXMwuZyrZQiXIfE17fPWd.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8db41b75-b3a9-477d-8636-162c8a9dac5e', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 11494, 'Wilderness', 'https://image.tmdb.org/t/p/w200/sLtUVG7ORbTJueTmIWpO4YeHayS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('33021c92-738f-4949-b4a2-7e3e3616d5a6', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 11587, 'L''Exorciste, la suite', 'https://image.tmdb.org/t/p/w200/1S7igWeo7Ty16FRGWkAZEyDxqar.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d19429fb-87be-425f-a34a-d1e850804b42', '71e4d49c-e78b-40f1-bc0e-dce02186e311', 11596, 'Freddy sort de la nuit', 'https://image.tmdb.org/t/p/w200/oHTDAuadMvuiiTi5EPBLYz1GazE.jpg', 1994, NOW());

COMMIT;

-- Movie: Avatar : De feu et de cendres
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('cc6ac488-cba8-411f-a7f6-328384cf52c1', 'Avatar : De feu et de cendres', 'Avatar: Fire and Ash', 2025, 'James Cameron', ARRAY['James Cameron', 'Rick Jaffa', 'Amanda Silver'], '3h18min', ARRAY['Science-Fiction', 'Aventure', 'Fantastique'], 'Après la mort de Neteyam, Jake et Neytiri affrontent leur chagrin tout en faisant face au Peuple des Cendres, une tribu Na’vi redoutable menée par la fougueuse Varang, alors que le conflit sur Pandora s’intensifie et qu’une nouvelle quête morale s’amorce.', '', 'https://image.tmdb.org/t/p/w200/9NAZnTjBQ9WcXAQEzZpKy4vdQto.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/kG3N8oQ10qiw2MsnSHFGJpQNyEy.jpg', 'https://image.tmdb.org/t/p/original/iN41Ccw4DctL8npfmYg1j5Tr1eb.jpg', ARRAY[], 'film', 154.2828, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('1641041e-d940-4f98-9501-8d56446cc1b6', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 83533, 'https://image.tmdb.org/t/p/original/iN41Ccw4DctL8npfmYg1j5Tr1eb.jpg', 'https://image.tmdb.org/t/p/w500/kG3N8oQ10qiw2MsnSHFGJpQNyEy.jpg', 7.53, 3261, 'Le monde de Pandora changera à jamais.', 'Après la mort de Neteyam, Jake et Neytiri affrontent leur chagrin tout en faisant face au Peuple des Cendres, une tribu Na’vi redoutable menée par la fougueuse Varang, alors que le conflit sur Pandora s’intensifie et qu’une nouvelle quête morale s’amorce.', 198, '2025-12-17', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ee366967-f862-498b-9baf-cd800609fb33', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 65731, 'Sam Worthington', 'Jake', 'https://image.tmdb.org/t/p/w200/mflBcox36s9ZPbsZPVOuhf6axaJ.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('17fc4cbd-2447-419e-ad26-33a5b579e1ae', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 8691, 'Zoe Saldaña', 'Neytiri', 'https://image.tmdb.org/t/p/w200/iOVbUH20il632nj2v01NCtYYeSg.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ce01824b-3591-408f-89cf-c17fbd462233', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 10205, 'Sigourney Weaver', 'Kiri', 'https://image.tmdb.org/t/p/w200/wTSnfktNBLd6kwQxgvkqYw6vEon.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6ef023c4-098b-4969-8b98-bd786e90804e', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 32747, 'Stephen Lang', 'Quaritch', 'https://image.tmdb.org/t/p/w200/gnO5VfkDgA2fsHweD0622LUY3Hu.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('810ad906-4d37-4815-b476-00b6c82f9b7c', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 566331, 'Oona Chaplin', 'Varang', 'https://image.tmdb.org/t/p/w200/uYnBSVKcFgw48Wxts01Dh5Gxlar.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('92596142-a6e1-4d46-bdef-dcb330c60861', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 1895760, 'Jack Champion', 'Spider', 'https://image.tmdb.org/t/p/w200/8PXFKzhjFJ0oYP60Bj1kA44XBjY.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('717ec443-6138-4d74-a991-c2418b470418', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 204, 'Kate Winslet', 'Ronal', 'https://image.tmdb.org/t/p/w200/surklDlLW6g2D7EqycEQwHXsoD1.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('578a6e2c-17a1-4df1-a371-031fe090d490', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 7248, 'Cliff Curtis', 'Tonowari', 'https://image.tmdb.org/t/p/w200/dfaElGoyJWseFWxXwEMLL9WTi7V.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bb56abb8-cabb-4e98-8fbf-bf9b9d5306d8', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 59231, 'Joel David Moore', 'Norm', 'https://image.tmdb.org/t/p/w200/mMVhVglj6BZFuvqAXnEibce08k7.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('676ff5b1-1567-4916-a67d-6ece5fa59c20', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 30485, 'CCH Pounder', 'Mo''at', 'https://image.tmdb.org/t/p/w200/mr6BLDN75T8DJl9dNK3hN4YwqJa.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0e4f6498-3352-4c5d-9a68-042175f165de', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 11024, 'Scooby-Doo 2 : Les Monstres se déchaînent', 'https://image.tmdb.org/t/p/w200/uM8lgzmMz0Y2Aqw51kE1F3bUr6q.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('eb9584ea-ebd0-4ddb-82b4-79efe36bf145', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 11224, 'Cendrillon', 'https://image.tmdb.org/t/p/w200/nqSJwBdvG89uHRpDDdaAy5YhogZ.jpg', 1950, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('469b9237-2014-45e1-b149-9caa9fea2752', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 11260, 'Appelez-moi Dave', 'https://image.tmdb.org/t/p/w200/rB8cemSXMwuZyrZQiXIfE17fPWd.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0b793cf8-fd8c-4dd1-a4d7-2389a00a1459', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 1533042, 'Poultrygeist 2: Dawn of the Chicken Dead', 'https://image.tmdb.org/t/p/w200/pTWLw2LfLnspJlz9XpH434IQR0X.jpg', NULL, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bbad13cb-c008-4c07-bc7e-ffc7f4ab5923', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 1172649, 'Soultribe - Ein Tanz des Lebens', 'https://image.tmdb.org/t/p/w200/nqXyPH5elH5Z4k39PfUnll3LQcm.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d474c143-d9e6-4ca7-8496-65188ecdef01', 'cc6ac488-cba8-411f-a7f6-328384cf52c1', 618354, 'Superman : L''Homme de demain', 'https://image.tmdb.org/t/p/w200/wpzb0qq2QdHXYo7ZYk5CPLfYfka.jpg', 2020, NOW());

COMMIT;

-- Movie: Jumpers
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('b76f597b-a037-43e4-99d9-f73535a8fd22', 'Jumpers', 'Hoppers', 2026, 'Daniel Chong', ARRAY['Jesse Andrews'], '1h44min', ARRAY['Aventure', 'Animation', 'Comédie', 'Familial', 'Science-Fiction'], 'Mabel, une amoureuse des animaux, utilise une nouvelle technologie pour "transférer" sa conscience dans un robot-castor réaliste et communiquer directement avec les animaux. Alors qu''elle découvre des mystères du monde animal dépassant tout ce qu''elle aurait pu imaginer, Mabel se lie d''amitié avec Roi Georges, un charismatique castor, et doit rallier tout le règne animal pour faire face à une menace humaine majeure et imminente : le maire Jerry Generazzo, un beau parleur.', '', 'https://image.tmdb.org/t/p/w200/gMYqVwLdoaPhIFyWUAQrRlGGjkE.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/gme8X6Y0b1wutuW6kB039i9NwCr.jpg', 'https://image.tmdb.org/t/p/original/u53UYu5XG2hNgWGvs3xGhAVzypl.jpg', ARRAY[], 'film', 145.8289, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('8d56f118-513c-45fe-999e-c9b34d85695f', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1327819, 'https://image.tmdb.org/t/p/original/u53UYu5XG2hNgWGvs3xGhAVzypl.jpg', 'https://image.tmdb.org/t/p/w500/gme8X6Y0b1wutuW6kB039i9NwCr.jpg', 8.167, 1316, 'Avoir l''air naturel… ou presque !', 'Mabel, une amoureuse des animaux, utilise une nouvelle technologie pour "transférer" sa conscience dans un robot-castor réaliste et communiquer directement avec les animaux. Alors qu''elle découvre des mystères du monde animal dépassant tout ce qu''elle aurait pu imaginer, Mabel se lie d''amitié avec Roi Georges, un charismatique castor, et doit rallier tout le règne animal pour faire face à une menace humaine majeure et imminente : le maire Jerry Generazzo, un beau parleur.', 104, '2026-03-04', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1ebfe3c9-d36a-4e3b-ad61-c8daa8211339', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1308818, 'Piper Curda', 'Mabel (voice)', 'https://image.tmdb.org/t/p/w200/oyitEBcracNWMuF8Frhsqkjgzuc.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3a4d0d8d-0174-4379-8326-14ca31c3843a', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 452205, 'Bobby Moynihan', 'King George (voice)', 'https://image.tmdb.org/t/p/w200/gOvwNz5joi5yWJ7dAhuF8WA2aas.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('094a1705-4385-4cde-aebb-bc7640b7ddde', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 65717, 'Jon Hamm', 'Mayor Jerry Generazzo (voice)', 'https://image.tmdb.org/t/p/w200/mrXE5fZbEDPc7BEE5G21J6qrwzi.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('20e399cf-70c7-4a97-9b29-8ae4e74baa9b', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 11074, 'Kathy Najimy', 'Dr. Sam (voice)', 'https://image.tmdb.org/t/p/w200/nqbZF7Igr0SC8Xq8y0jwmx0mLDN.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3b08cb65-cbb8-43f4-b3d9-9c451b85b3e9', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 54697, 'Dave Franco', 'Insect King (voice)', 'https://image.tmdb.org/t/p/w200/d0I1BgNBAVvLJEDSfmyNVjYWPZE.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cee54c82-144f-4dd9-bc91-a758ee5a150d', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1653235, 'Eduardo Franco', 'Loaf (voice)', 'https://image.tmdb.org/t/p/w200/FOnx5Rg8L7xvEWkBhNoXwhELd6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3e713c04-f0ba-4c8d-b8ce-9d280c42e653', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1625231, 'Aparna Nancherla', 'Nisha (voice)', 'https://image.tmdb.org/t/p/w200/vwpktqJnQCAGEfq2EKUjB8ZdnhI.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6916803e-a8a9-4c9a-8f41-c29742724171', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1798896, 'Tom Law', 'Tom Lizard (voice)', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6155c3bc-3c0a-4a80-93a8-bad2bfbb8ebc', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1429453, 'Sam Richardson', 'Conner (voice)', 'https://image.tmdb.org/t/p/w200/hUN7IIbegvL7aSqQI5KRWoqqJLm.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('72cbe837-3578-4dec-b7ee-3a74039a790f', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 1695631, 'Melissa Villaseñor', 'Ellen (voice)', 'https://image.tmdb.org/t/p/w200/144VoO4M5sU0Mn4lpTOYQFAgNVO.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('785e9a91-5761-44aa-893b-bccd747717ac', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 809, 'Shrek 2', 'https://image.tmdb.org/t/p/w200/2e8hcPLaWjLXdQLgdi5otr4Jj9L.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('deda4dc3-a303-4bde-94d0-99d5d236d1dc', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 810, 'Shrek le troisième', 'https://image.tmdb.org/t/p/w200/iV8HuZuij5CvfPl0RucGCmA6NB5.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('87ae3b02-6dfc-4fbf-89a2-3defee05b269', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 816, 'Austin Powers', 'https://image.tmdb.org/t/p/w200/sqbYNe6ILOWGLE6CBmTVi11Zbz7.jpg', 1997, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9ccd49fb-3e1e-4b6a-bf24-5efec1c5d779', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 812, 'Aladdin', 'https://image.tmdb.org/t/p/w200/7Hf6Y7WRRRVDBHn5lJghcXXp4DT.jpg', 1992, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b5a5520e-9fb2-43fa-9722-3141fcf82770', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 813, 'Y a-t-il un pilote dans l''avion ?', 'https://image.tmdb.org/t/p/w200/7pH55GUezP1isKGo16ehbmRB1pK.jpg', 1980, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5dbda778-1b95-4969-8697-aca797310f32', 'b76f597b-a037-43e4-99d9-f73535a8fd22', 817, 'Austin Powers : L''Espion qui m''a tirée', 'https://image.tmdb.org/t/p/w200/ikM7IfM2rQxv0gltOk4hllQTNvw.jpg', 1999, NOW());

COMMIT;

-- Movie: കാട്ടാളൻ
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('3144ad5c-c69d-45af-9988-b1efaecad876', 'കാട്ടാളൻ', 'കാട്ടാളൻ', 2026, 'Paul George', ARRAY['Paul George', 'Jero Jacob', 'Joby Varghese'], '1h59min', ARRAY['Action', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/53FATyQirV8BuBcrsQMGPvGKgCu.jpg', 'https://image.tmdb.org/t/p/original/wvmfToHjflWab2PHKG1vCqg2Asx.jpg', ARRAY[], 'film', 151.4169, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('b2799038-ec47-4cd6-a14c-19381b18534f', '3144ad5c-c69d-45af-9988-b1efaecad876', 1065834, 'https://image.tmdb.org/t/p/original/wvmfToHjflWab2PHKG1vCqg2Asx.jpg', 'https://image.tmdb.org/t/p/w500/53FATyQirV8BuBcrsQMGPvGKgCu.jpg', 6, 1, NULL, '', 119, '2026-05-14', 'ml', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fcff96f1-25ac-4ec9-9e70-01be05ec37d0', '3144ad5c-c69d-45af-9988-b1efaecad876', 1758913, 'Antony Varghese', 'Antony Varghese', 'https://image.tmdb.org/t/p/w200/dKRa8ghSXw6J1OTcxMziZh3l1jb.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f959ae4e-0a67-4de2-b197-364b521ed011', '3144ad5c-c69d-45af-9988-b1efaecad876', 213428, 'Sunil Varma', 'Maari', 'https://image.tmdb.org/t/p/w200/ifmUCkLgpEzbfnRjIw62otrADpI.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('77261ce8-dfbf-4236-9288-db7c67319e22', '3144ad5c-c69d-45af-9988-b1efaecad876', 1974753, 'Dushara Vijayan', 'Lucy', 'https://image.tmdb.org/t/p/w200/5C5V9qdYil7LVCp8LqctZCEsu1n.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0f319b64-3dbb-4249-9640-b5cf77b83a4a', '3144ad5c-c69d-45af-9988-b1efaecad876', 111669, 'Jagadish', 'Ali', 'https://image.tmdb.org/t/p/w200/ml3XX5bWPIdHUPvqhW2MYYZ8H7Y.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('21a2aaae-3bbc-45d5-bdf2-cba54a653a19', '3144ad5c-c69d-45af-9988-b1efaecad876', 1543640, 'Kabir Duhan Singh', 'Eddy', 'https://image.tmdb.org/t/p/w200/lAVAxFARP63oTHMYWpwHrWsXPWa.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('50b50ff8-7d24-4334-afdd-c4f549a71a7f', '3144ad5c-c69d-45af-9988-b1efaecad876', 4555786, 'Parth Tiwari', 'Roby', NULL, 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('16505e71-ff97-4d0e-bc6e-62a4ea6d7533', '3144ad5c-c69d-45af-9988-b1efaecad876', 2520756, 'Raj Tirandasu', 'Maari 95', 'https://image.tmdb.org/t/p/w200/dnuD0t8xpELhXs4tKZDRdsFureg.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4d250ed9-3edc-4a0f-82b9-da486d39659a', '3144ad5c-c69d-45af-9988-b1efaecad876', 111668, 'Siddique', 'George D’Peter', 'https://image.tmdb.org/t/p/w200/tMv7QsmYlXAXtP75D3eIxXHpgTv.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e13ca566-0c28-45da-9dd5-8c77de962a93', '3144ad5c-c69d-45af-9988-b1efaecad876', 1657965, 'Anson Paul', 'Stanley', 'https://image.tmdb.org/t/p/w200/tuuQTQFh4qMY7EOP9rgVlz0Y57y.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dc7b45f1-fc65-494b-ad90-b80e6eecc9db', '3144ad5c-c69d-45af-9988-b1efaecad876', 5549653, 'Hanan Shaah', 'Malik', NULL, 9, NOW());

COMMIT;

-- Movie: கருப்பு
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('292c9767-fafe-4622-9e7c-1eb61f56c208', 'கருப்பு', 'கருப்பு', 2026, 'RJ Balaji', ARRAY['RJ Balaji', 'Ashwin Ravichandran', 'Rahul Raj', 'T. S. Gopi Krishnan', 'Karan Aravind Kumar'], '2h31min', ARRAY['Action', 'Fantastique'], '', '', 'https://image.tmdb.org/t/p/w200/vguX29CK1j9JGOoHQOO5MGsQrT6.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/4KZXlZ5tTT6ghbW77gS4hSLkCd7.jpg', 'https://image.tmdb.org/t/p/original/1eAuwNBy34kkM3xkl202z4f1NiI.jpg', ARRAY[], 'film', 128.292, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('908faddb-92b2-4942-ad7d-410e7bb2d8e8', '292c9767-fafe-4622-9e7c-1eb61f56c208', 1367220, 'https://image.tmdb.org/t/p/original/1eAuwNBy34kkM3xkl202z4f1NiI.jpg', 'https://image.tmdb.org/t/p/w500/4KZXlZ5tTT6ghbW77gS4hSLkCd7.jpg', 7.3, 9, NULL, '', 151, '2026-05-14', 'ta', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d9e7f0de-90a8-4afa-88a4-059dfbbebfaf', '292c9767-fafe-4622-9e7c-1eb61f56c208', 85720, 'Suriya', 'Karuppasamy / Saravanan', 'https://image.tmdb.org/t/p/w200/hIFXv3gIjlNS78gJmaguEOxvfPH.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d4924a4c-e826-48ce-b3cd-ecd74a8d2850', '292c9767-fafe-4622-9e7c-1eb61f56c208', 116925, 'Trisha Krishnan', 'Preethi', 'https://image.tmdb.org/t/p/w200/jfeAV0VeAQhKONzIv1UEYbklJGn.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b40adcb1-5a33-4f51-a7a4-010bc11a80b5', '292c9767-fafe-4622-9e7c-1eb61f56c208', 1182187, 'RJ Balaji', 'Baby Kannan ''BK'' / Usilampatti Karuppaiah Gandhi ''UKG''', 'https://image.tmdb.org/t/p/w200/vguX29CK1j9JGOoHQOO5MGsQrT6.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('735ed179-1970-4578-985d-df197d06c84a', '292c9767-fafe-4622-9e7c-1eb61f56c208', 1061913, 'Indrans', 'Mattancherry Sukumaran', 'https://image.tmdb.org/t/p/w200/vs5Acy2hJ4dWoM3xRGdnFKdVXzw.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('30046a16-4560-431b-8a67-13e548f67c72', '292c9767-fafe-4622-9e7c-1eb61f56c208', 3531368, 'Anagha Maya Ravi', 'Binu Sukumaran', 'https://image.tmdb.org/t/p/w200/4eJdSUgSIHoddsnNVNJTEUKpF17.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9cd8f025-691d-452a-931f-c456b3fdde0d', '292c9767-fafe-4622-9e7c-1eb61f56c208', 1174161, 'Swasika', 'Vasanthi', 'https://image.tmdb.org/t/p/w200/7LWxyKwGH5S1ZwEEjlbBcDUJKk8.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('84b7de8e-9460-4bd7-adaa-e0ea71c994ca', '292c9767-fafe-4622-9e7c-1eb61f56c208', 223162, 'Sshivada Nair', 'Kanmani', 'https://image.tmdb.org/t/p/w200/wfXsqcfCdrQFdzxPSwNVNCsojFO.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e5172f5c-41bb-4243-af9f-8e69d0e05f35', '292c9767-fafe-4622-9e7c-1eb61f56c208', 223148, 'Natarajan Subramaniam', 'Chief Metropolitan Magistrate M.D. Rajanayagam', 'https://image.tmdb.org/t/p/w200/1sKmgVKSw8qJUzBTJGvL45wlDss.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4aaa0a2e-c5f3-494c-8c09-9e75bf26e2eb', '292c9767-fafe-4622-9e7c-1eb61f56c208', 213431, 'Supreet', 'Gowri', 'https://image.tmdb.org/t/p/w200/3HZopNIG3zeaSpbGjEvsdmoXjaR.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fb116a69-89dc-4ffb-b9bf-82ada79bc7c3', '292c9767-fafe-4622-9e7c-1eb61f56c208', 4912601, 'Poobalam Pragatheeswaran', 'Shanmugam aka Peiyi', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('be728281-a4e3-4f0e-b44b-1c0e9bfcbb96', '292c9767-fafe-4622-9e7c-1eb61f56c208', 442370, 'Prédateurs', 'https://image.tmdb.org/t/p/w200/2116LiCF1feFfYweRLjH9FeHXjw.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9a16d871-182e-4fda-882b-94d9faf623fe', '292c9767-fafe-4622-9e7c-1eb61f56c208', 15943, 'Un candidat au poil', 'https://image.tmdb.org/t/p/w200/l9mTb9ovwkhdUgOADe7SuvISfSf.jpg', 1976, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1ff801c9-cb94-419b-96b6-6b87891c1124', '292c9767-fafe-4622-9e7c-1eb61f56c208', 16311, 'Twentyman', 'https://image.tmdb.org/t/p/w200/qYGRCIFFbXAxvARQtzC4pG693dC.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('dd3972c7-652a-4060-8b5b-350a257faa77', '292c9767-fafe-4622-9e7c-1eb61f56c208', 21040, 'Protection rapprochée', 'https://image.tmdb.org/t/p/w200/fc7SP7MNJ7jGU1FkBUcMShluEen.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('50dd76a6-f5ae-46fb-85a7-37d12e605171', '292c9767-fafe-4622-9e7c-1eb61f56c208', 20968, 'सर्कार', 'https://image.tmdb.org/t/p/w200/csdv0iVY2B6TX7QbMDTBOGnoWCM.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0d509f4e-7d5c-416e-9716-fa34189ca4a3', '292c9767-fafe-4622-9e7c-1eb61f56c208', 21733, 'Dragons Forever', 'https://image.tmdb.org/t/p/w200/dVAAUBgnWsBJ870bOm204wBnc7Z.jpg', 1988, NOW());

COMMIT;

-- Movie: Apex
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 'Apex', 'Apex', 2026, 'Baltasar Kormákur', ARRAY['Jeremy Robbins'], '1h36min', ARRAY['Action', 'Thriller'], 'Alors qu''elle teste ses limites en solo dans la nature sauvage australienne, une femme en deuil se retrouve prise au piège d''un jeu tordu avec un tueur qui a fait d''elle sa proie.', '', 'https://image.tmdb.org/t/p/w200/bpWHj7MUtv0bNRuCET69UWQRa0o.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/55lEECwWtRWltEa6u3TbiljaoOd.jpg', 'https://image.tmdb.org/t/p/original/oTE4lNs4PSG5iIWjqaTdCIFJ4Bs.jpg', ARRAY[], 'film', 122.1691, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('ab5f91fa-cde3-4569-b3f7-f17a213990a7', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1318447, 'https://image.tmdb.org/t/p/original/oTE4lNs4PSG5iIWjqaTdCIFJ4Bs.jpg', 'https://image.tmdb.org/t/p/w500/55lEECwWtRWltEa6u3TbiljaoOd.jpg', 6.723, 1320, 'Traquer. Survivre.', 'Alors qu''elle teste ses limites en solo dans la nature sauvage australienne, une femme en deuil se retrouve prise au piège d''un jeu tordu avec un tueur qui a fait d''elle sa proie.', 96, '2026-04-24', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d9bc0600-bfb7-4083-b298-4431806bbafa', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 6885, 'Charlize Theron', 'Sasha', 'https://image.tmdb.org/t/p/w200/gd7ShD0yt4bsR2STeQ19KQ6hvXL.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1fd4968d-dd29-41b7-8514-872810d73486', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1303037, 'Taron Egerton', 'Ben', 'https://image.tmdb.org/t/p/w200/uCaPhyKAQIfEzAWWCYIrO2004CB.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('edc0c8d6-54c6-4fd3-a97f-091fa6446942', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 8783, 'Eric Bana', 'Tommy', 'https://image.tmdb.org/t/p/w200/l9yoDgw3YFC2gMD1HTo5djGOwSY.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('61289b2e-140f-435e-bee5-4c5b2ec86bc8', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 145245, 'Caitlin Stasey', 'Leah', 'https://image.tmdb.org/t/p/w200/uJW62qSjIyI0OP30s5U8KLlDw32.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0a017e4b-de61-4424-9830-3229248ed966', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 2933227, 'Bessie Holland', 'Cashier', 'https://image.tmdb.org/t/p/w200/pWjjlOAs61Rxy2KbAXACxL2eJ9w.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f5ead832-65e3-4f02-a750-20a97e1f804b', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1245420, 'Zachary Garred', 'Sean', 'https://image.tmdb.org/t/p/w200/zBveIZvcVCkWTcAWEV88MwpynyG.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7b55b82f-97b5-43ee-8eba-bf2d2c638d9d', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1046893, 'Matt Whelan', 'Hunter', 'https://image.tmdb.org/t/p/w200/qTIe7SblKwxR9DF6iNuVX0pEWIZ.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6dc02dc0-991e-4af4-8e2b-0346c4af4200', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1240306, 'Rob Carlton', '2nd Hunter', 'https://image.tmdb.org/t/p/w200/8K0E0FaNDiCWvx1u6Xe3MAOHEGu.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c22bcdad-6e5c-4f65-9501-8b6ec51947c1', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 126579, 'Aaron Pedersen', 'Park Ranger', 'https://image.tmdb.org/t/p/w200/3SoOwjIPULquiuo0yBWAwVamJFj.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('83b000a5-4b0e-4a2b-8821-f2412af8e439', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1928966, 'Duncan Fellows', 'Dad', 'https://image.tmdb.org/t/p/w200/kG6EGc5dR5A0mGhTpIcxK9lkL1k.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('89730fab-3729-4ac0-9471-e83b88cd1444', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 16850, 'Les Héros de Télémark', 'https://image.tmdb.org/t/p/w200/tyOCWJ7tZIO0qI6YjIWMWSU6JC3.jpg', 1965, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('740eae4e-d368-4919-9fad-f2779b1cb3d8', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 790646, 'The Toll', 'https://image.tmdb.org/t/p/w200/2BTbYZ1zdNrpFRvLFEkRUP5vCJd.jpg', 2021, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b78d7622-17c9-4b8f-ae00-7a4ee46b2816', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 13752, 'Opération Sabotage', 'https://image.tmdb.org/t/p/w200/seCc2HVqk1wm72a1wrBKtW1SoAw.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c87d5087-17ae-4969-a4da-d5f04530583f', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 1362052, 'The Sound', 'https://image.tmdb.org/t/p/w200/nH26cUZns2jyCAzKsgZkEiinTri.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bd05b42f-a023-4275-aa7a-b1a8eb146e26', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 21786, 'Cold Prey', 'https://image.tmdb.org/t/p/w200/nsNeWCwvY183boDXqCRWfuPpX41.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('551aa04e-5cb0-4c2c-a9b5-7ce173d79f4f', '0dacbb7c-bda0-4c8a-a130-9b7eb4bd69f9', 20187, 'La Sanction', 'https://image.tmdb.org/t/p/w200/bERSKJZJfFDPie46ruVO4iGJ46.jpg', 1975, NOW());

COMMIT;

-- Movie: सिस्टम
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('3043a707-1ad8-4416-9795-7f4eaa609b6a', 'सिस्टम', 'सिस्टम', 2026, 'Ashwiny Iyer Tiwari', ARRAY['Arun Sukumar', 'Harman Baweja', 'Ashwiny Iyer Tiwari', 'Tasneem Lokhandwala'], '2h4min', ARRAY['Thriller'], '', '', 'https://image.tmdb.org/t/p/w200/b7n68jbzVAN68CJSI8ubERlToli.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/8qrddM5BRcTuqjc9crJY6e3gyE6.jpg', 'https://image.tmdb.org/t/p/original/7f9ZaTwyqQOJtNWUS7xZgWQOzSt.jpg', ARRAY[], 'film', 105.014, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('eb1e2235-379f-48d6-a6ac-fe83005e3505', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 1431071, 'https://image.tmdb.org/t/p/original/7f9ZaTwyqQOJtNWUS7xZgWQOzSt.jpg', 'https://image.tmdb.org/t/p/w500/8qrddM5BRcTuqjc9crJY6e3gyE6.jpg', 7.5, 2, NULL, '', 124, '2026-05-22', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('de76409a-50c6-4163-87ce-8ef50a7a8293', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 130958, 'Sonakshi Sinha', 'Neha Rajvansh', 'https://image.tmdb.org/t/p/w200/7HaI5owaKzOb6Qdtwifp29uhHk2.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a7011d57-a95a-4d7b-8ffa-698891193f25', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 147324, 'Jyothika', 'Sarika Rawat', 'https://image.tmdb.org/t/p/w200/9rcFS99kwlSiQdY5Iv9YctJKh1F.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('04d24309-ed7e-4583-a374-d8fe81fc5f7f', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 78751, 'Ashutosh Gowariker', 'Ravi Rajvansh', 'https://image.tmdb.org/t/p/w200/s48qPtQJVXdwrVfezMIiyowl3eT.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8696b1a4-4ff8-409f-9eb6-c86f49fcf9cd', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 1682080, 'Adinath Kothare', 'Alok Rajvansh', 'https://image.tmdb.org/t/p/w200/5mpunA4RSLJhtkYHTB6UMvOfrV5.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e2f0198e-b0a5-4e6e-b4b1-3498fe6f854f', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 4160287, 'Aashriya Mishra', 'Kusum Rawat', NULL, 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ab1d2221-d03b-4665-b1fc-d513ecee067a', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 1566911, 'Gaurav Pandey', 'Akshay Rao', 'https://image.tmdb.org/t/p/w200/rH9haKecOQsjMP7BC9XRi1kl5uF.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('15655044-3193-492f-92dc-acc8fa3a6146', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 6193828, 'Sayandeep Gupta', 'Raghav Shrivastav', NULL, 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e90b1831-56eb-45bf-a55b-fd89c96e3639', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 2746527, 'Preeti Agarwal Mehta', NULL, NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ef82fa92-c400-433d-a313-7ab626d5fe3b', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 1758521, 'Vijayant Kohli', 'Vikram Bajral', 'https://image.tmdb.org/t/p/w200/dzzewlf0Z5dEkVxu4QkH86xUEx4.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0b9e5770-d7db-4709-b449-a9a46c05eeb2', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 4442105, 'Diwanshu Gambhir', 'Juggi', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('77b9216b-bb05-44dd-b2a3-b6376d4bec00', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 819, 'Sleepers', 'https://image.tmdb.org/t/p/w200/2qIFogmG9GoBt4kztCFPgVC166Q.jpg', 1996, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2c8f88d1-1a38-4f67-b6bb-8cba9286264b', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 820, 'JFK', 'https://image.tmdb.org/t/p/w200/aXBz7t4TO5Ln3u5CQLIS96Kzuvl.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6602ec9e-cfa7-4d1c-8535-990c3d9c6625', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 2652, 'Hard Candy', 'https://image.tmdb.org/t/p/w200/910U04iol8zQklyrPz6anJk8cRl.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6f2b2f45-03d4-4f59-8e70-6eeb796ec0a7', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 2721, 'Z', 'https://image.tmdb.org/t/p/w200/cN7A9OODtSQpTgMxC31vFAN8ta.jpg', 1969, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c0520d10-1af8-456c-89e0-45d2e0df0044', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 980571, 'Fractured Justice', 'https://image.tmdb.org/t/p/w200/sAJgcw31UpiMwO8CCnvEPWepefu.jpg', 2028, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5badb571-eb6e-4580-ab9b-4789c10a4761', '3043a707-1ad8-4416-9795-7f4eaa609b6a', 604, 'Matrix Reloaded', 'https://image.tmdb.org/t/p/w200/csKNmbZuo8aqPF6hejO3rmaFEqx.jpg', 2003, NOW());

COMMIT;

-- Movie: Michael
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('866a27af-5a8a-4817-8d91-5bdfc904f455', 'Michael', 'Michael', 2026, 'Antoine Fuqua', ARRAY['John Logan'], '2h8min', ARRAY['Musique', 'Drame'], 'Michael dresse le portrait cinématographique de la vie et de l’héritage de l’un des artistes les plus influents de notre époque.  Le film raconte l’histoire de Michael Jackson au-delà de la musique, depuis la découverte d’un talent hors du commun en tant que leader des Jackson Five, jusqu’à l’artiste visionnaire dont l’ambition créative a alimenté une quête incessante pour devenir le plus grand artiste au monde.  Mettant en lumière sa vie hors scène et ses performances les plus emblématiques de ses débuts en solo, le film offre au public une place au premier rang pour découvrir Michael Jackson comme jamais auparavant.', '', 'https://image.tmdb.org/t/p/w200/h58HRBCQOtWIR8zMqOIVgkHjssU.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/2sDgNilJGVFpl1x4DMzYHjk0L0f.jpg', 'https://image.tmdb.org/t/p/original/xBT0oNq6rsTFv4SxG5uGRIEOrq6.jpg', ARRAY[], 'film', 112.6836, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('5f72b6ac-e063-4096-98b4-20b5f4885379', '866a27af-5a8a-4817-8d91-5bdfc904f455', 936075, 'https://image.tmdb.org/t/p/original/xBT0oNq6rsTFv4SxG5uGRIEOrq6.jpg', 'https://image.tmdb.org/t/p/w500/2sDgNilJGVFpl1x4DMzYHjk0L0f.jpg', 7.573, 885, 'C’est ici que son histoire commence.', 'Michael dresse le portrait cinématographique de la vie et de l’héritage de l’un des artistes les plus influents de notre époque.  Le film raconte l’histoire de Michael Jackson au-delà de la musique, depuis la découverte d’un talent hors du commun en tant que leader des Jackson Five, jusqu’à l’artiste visionnaire dont l’ambition créative a alimenté une quête incessante pour devenir le plus grand artiste au monde.  Mettant en lumière sa vie hors scène et ses performances les plus emblématiques de ses débuts en solo, le film offre au public une place au premier rang pour découvrir Michael Jackson comme jamais auparavant.', 128, '2026-04-22', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('804f744e-b2de-4b75-bbb9-535878ca5fe6', '866a27af-5a8a-4817-8d91-5bdfc904f455', 3898497, 'Jaafar Jackson', 'Michael Jackson', 'https://image.tmdb.org/t/p/w200/tVSzFjQxOrLOcvnzFto0772Q9Bw.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f4028ac6-0468-4f59-add7-f02b6c9fb5ca', '866a27af-5a8a-4817-8d91-5bdfc904f455', 91671, 'Colman Domingo', 'Joseph Jackson', 'https://image.tmdb.org/t/p/w200/2tu6T9ugnf82qIMGVKWSb0dvvq5.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f8f20ee4-dc2d-49e6-9be0-a3cbe13e720f', '866a27af-5a8a-4817-8d91-5bdfc904f455', 9781, 'Nia Long', 'Katherine Jackson', 'https://image.tmdb.org/t/p/w200/heVQkCGKUuKKRjRJaZIBrEKGhYA.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2c880990-a87e-4ec0-8803-4d576648379c', '866a27af-5a8a-4817-8d91-5bdfc904f455', 4487890, 'Juliano Krue Valdi', 'Young Michael Jackson', 'https://image.tmdb.org/t/p/w200/1rQYmcxdPD1IwHpa78DcfVEu1EN.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c8cd38d4-86ae-4d2a-b300-7640b0b01fa1', '866a27af-5a8a-4817-8d91-5bdfc904f455', 996701, 'Miles Teller', 'John Branca', 'https://image.tmdb.org/t/p/w200/kDf3sW3USjEBDQ3Ua7lbwOfwty6.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('caa712df-dff8-4e94-9d25-0e588caa0b40', '866a27af-5a8a-4817-8d91-5bdfc904f455', 1990676, 'KeiLyn Durrel Jones', 'Bill Bray', 'https://image.tmdb.org/t/p/w200/4wDO3Zt9KJg9CARCEgjuVdhWa8x.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c0632007-34ea-48e5-8172-f688b4797681', '866a27af-5a8a-4817-8d91-5bdfc904f455', 1446825, 'Kendrick Sampson', 'Quincy Jones', 'https://image.tmdb.org/t/p/w200/AoZGTujNZEfabaXR5kUwmDUmxfe.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1614d325-568d-4fb5-9113-4b6e5bf29c1b', '866a27af-5a8a-4817-8d91-5bdfc904f455', 1581190, 'Joseph David-Jones', 'Jackie Jackson', 'https://image.tmdb.org/t/p/w200/qwX7ciIV8jwssmIqHv1eyzzqEvh.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('330cbf65-80aa-43b4-bca7-0c0e1b6d653e', '866a27af-5a8a-4817-8d91-5bdfc904f455', 2754193, 'Rhyan Hill', 'Tito Jackson', 'https://image.tmdb.org/t/p/w200/iPNBMJL9kKtUYmqJzbarQfQcPp4.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ee50e3d0-84ad-4192-8d91-ddcfaf1388fc', '866a27af-5a8a-4817-8d91-5bdfc904f455', 4805996, 'Jamal Henderson', 'Jermaine Jackson', 'https://image.tmdb.org/t/p/w200/8yI9c3utD4EcEteNwHlFkdR8Rhv.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1756e180-fb30-4fae-a0e3-4f0ee5dd8d4d', '866a27af-5a8a-4817-8d91-5bdfc904f455', 783, 'Gandhi', 'https://image.tmdb.org/t/p/w200/eTv0wtWoBwrkme13ja0ThSybZZe.jpg', 1982, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1571f80a-7b41-489c-b171-ff2a9a93026f', '866a27af-5a8a-4817-8d91-5bdfc904f455', 796, 'Sexe intentions', 'https://image.tmdb.org/t/p/w200/tkShoPdnzijP1VdADBLghgephTC.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c1555b92-19ef-4cda-9cd7-01549a8b8c62', '866a27af-5a8a-4817-8d91-5bdfc904f455', 838, 'American Graffiti', 'https://image.tmdb.org/t/p/w200/1bvAKQW9MuHiIGSnbuny0GGdwp1.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6ec35159-aaad-4d1a-870d-b1b73e91a22c', '866a27af-5a8a-4817-8d91-5bdfc904f455', 842, 'L''assassinat de Richard Nixon', 'https://image.tmdb.org/t/p/w200/dgRajeH7j678UA0gCWapGqkTv7L.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7747eb00-4791-4601-a87c-19507a3f6eab', '866a27af-5a8a-4817-8d91-5bdfc904f455', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('25778599-0e08-4979-a918-ab5cd462880b', '866a27af-5a8a-4817-8d91-5bdfc904f455', 980816, 'Miranda''s Victim', 'https://image.tmdb.org/t/p/w200/82lu2Rb0MoBpfyUtoVwhLiVrDlF.jpg', 2023, NOW());

COMMIT;

-- Movie: Demon Slayer : Kimetsu no Yaiba - Le film : La Forteresse infinie
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('7fba10d3-e484-4454-9c26-841a2a98412d', 'Demon Slayer : Kimetsu no Yaiba - Le film : La Forteresse infinie', '劇場版「鬼滅の刃」無限城編 第一章 猗窩座再来', 2025, 'Haruo Sotozaki', ARRAY['Hikaru Kondō', 'Koyoharu Gotōge'], '2h35min', ARRAY['Animation', 'Action', 'Fantastique'], 'L''armée des pourfendeurs de démons est attirée dans la Forteresse Infinie, où Tanjiro, Zenitsu et Inosuke  affrontent de terrifiants démons de rang supérieur dans un combat désespéré alors que la bataille finale contre Kibutsuji Muzan commence.', '', 'https://image.tmdb.org/t/p/w200/ylaWAuJB1PyAzaefqENBDEAKTLI.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wXTU3AFmlUPbqjH68MZ989uHd6k.jpg', 'https://image.tmdb.org/t/p/original/1RgPyOhN4DRs225BGTlHJqCudII.jpg', ARRAY[], 'film', 119.9525, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('92d56907-36ec-46a0-b5dc-1313d38bbe9e', '7fba10d3-e484-4454-9c26-841a2a98412d', 1311031, 'https://image.tmdb.org/t/p/original/1RgPyOhN4DRs225BGTlHJqCudII.jpg', 'https://image.tmdb.org/t/p/w500/wXTU3AFmlUPbqjH68MZ989uHd6k.jpg', 7.728, 846, NULL, 'L''armée des pourfendeurs de démons est attirée dans la Forteresse Infinie, où Tanjiro, Zenitsu et Inosuke  affrontent de terrifiants démons de rang supérieur dans un combat désespéré alors que la bataille finale contre Kibutsuji Muzan commence.', 155, '2025-07-18', 'ja', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('33b82d7e-ca51-4d1d-9569-3ddc44d81ff2', '7fba10d3-e484-4454-9c26-841a2a98412d', 1256603, 'Natsuki Hanae', '灶门炭治郎（配音）', 'https://image.tmdb.org/t/p/w200/alTb0DlcPIbcwM08WSmxFai58sd.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('64161c00-8d11-4072-a564-d1515410506a', '7fba10d3-e484-4454-9c26-841a2a98412d', 9705, 'Takahiro Sakurai', '富冈义勇（配音）', 'https://image.tmdb.org/t/p/w200/8s8owcKmpRAuhzEGjSdRpztthUg.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('83f75cd9-ff53-4df5-92ed-48ff052e1c82', '7fba10d3-e484-4454-9c26-841a2a98412d', 81244, 'Akira Ishida', '猗窝座（配音）', 'https://image.tmdb.org/t/p/w200/jnW2Gn2NlR2uwOCeyOuzypnTmkH.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e7449446-9d38-478a-94a2-b296c7ba1759', '7fba10d3-e484-4454-9c26-841a2a98412d', 119145, 'Hiro Shimono', '我妻善逸（配音）', 'https://image.tmdb.org/t/p/w200/yrSDcgFefHtWkFmLnTrcw2t0MV.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34678178-b9ee-42fa-b70d-0a2a32b53357', '7fba10d3-e484-4454-9c26-841a2a98412d', 1253008, 'Yoshimasa Hosoya', '狯岳（配音）', 'https://image.tmdb.org/t/p/w200/lUR5oN1LrqGgp25IOcI1qOH1Ud5.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b72a4376-346f-4ae0-9bca-dbf8e2950b07', '7fba10d3-e484-4454-9c26-841a2a98412d', 221773, 'Saori Hayami', '胡蝶忍（配音）', 'https://image.tmdb.org/t/p/w200/gLv9lO7dlUbIsmyJUvgegqAAXki.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7b87385b-6d86-4423-b0b2-f5d7a443e6e0', '7fba10d3-e484-4454-9c26-841a2a98412d', 93803, 'Mamoru Miyano', '童磨（配音）', 'https://image.tmdb.org/t/p/w200/nuok8ueG7k9hPZ09Tpr8e7Qn0ah.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('39fff3df-f6fe-4e0a-b255-06b95aa18805', '7fba10d3-e484-4454-9c26-841a2a98412d', 1452028, 'Reina Ueda', '栗花落香奈乎（配音）', 'https://image.tmdb.org/t/p/w200/2WV61uVU7y6XGYqNHLMpP0sApdu.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5459fb0a-a545-4439-86e7-0b75887ba03a', '7fba10d3-e484-4454-9c26-841a2a98412d', 1221114, 'Yūichi Nakamura', '庆藏（配音）', 'https://image.tmdb.org/t/p/w200/wb8behVKjBHX9XXrEydvNINCYwH.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ca81c432-6259-42cf-9222-22dcb12be1da', '7fba10d3-e484-4454-9c26-841a2a98412d', 1691384, 'Lynn', '恋雪（配音）', 'https://image.tmdb.org/t/p/w200/eJ2NqgzpnzNbT6Nt9EpDfzqNeZM.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b8c06e94-db25-4d67-92ae-0d3609e9c906', '7fba10d3-e484-4454-9c26-841a2a98412d', 441669, 'Butcher the Bakers', 'https://image.tmdb.org/t/p/w200/6AXFxrot8sXHD2TfMEgE5ZkJC2k.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c13c024d-e538-4f8a-834a-8f9ddcd621fe', '7fba10d3-e484-4454-9c26-841a2a98412d', 441715, '仮面ライダー対じごく大使', 'https://image.tmdb.org/t/p/w200/4CaPxi9194eP4PodKT9zfu91Yhy.jpg', 1972, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('29d03ad3-572a-428a-a556-abd29dcb74a8', '7fba10d3-e484-4454-9c26-841a2a98412d', 11596, 'Freddy sort de la nuit', 'https://image.tmdb.org/t/p/w200/oHTDAuadMvuiiTi5EPBLYz1GazE.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2f656149-0610-446e-8acc-6a9443097ab2', '7fba10d3-e484-4454-9c26-841a2a98412d', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ce8b163a-9eb4-46b3-a26e-16a39583a4ae', '7fba10d3-e484-4454-9c26-841a2a98412d', 442253, 'アニメ店長', 'https://image.tmdb.org/t/p/w200/ntWogeW1JlNKzjZvBG6FpYgBXns.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f1f5cabd-9794-4dc9-8893-828496cbadb7', '7fba10d3-e484-4454-9c26-841a2a98412d', 11633, 'Appleseed', 'https://image.tmdb.org/t/p/w200/kfjAm4PmCGoh7nVmUYA7elPGAlu.jpg', 2004, NOW());

COMMIT;

-- Movie: Fatale
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('59f8c077-9d19-4d34-a318-177b7f764ed6', 'Fatale', 'Damage', 1992, 'Louis Malle', ARRAY['David Hare'], '1h51min', ARRAY['Drame', 'Romance'], 'Stephen Fleming, parlementaire conservateur récemment promu secrétaire d''État, est marié depuis 25 ans à Ingrid, avec laquelle il entretient une relation pleine d''affection. Ils ont 2 enfants : Martyn, brillant journaliste politique, et Sally, adolescente à l''esprit vif et curieux. Au cours d''une réception à l''ambassade de France, Stephen fait la connaissance d''Anna Barton, la nouvelle petite amie de son fils.', '', 'https://image.tmdb.org/t/p/w200/8BKM2iXcr4b8pvx1OOcNsO9wADn.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/b9Vx5fA8UgMGRkvh8TGg4k78mg.jpg', 'https://image.tmdb.org/t/p/original/krhj4Fhb0G3QCmyBtEADxgFFmRX.jpg', ARRAY[], 'film', 125.3256, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('28978cfa-4bd1-47a0-9dca-c674af5ac87c', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11012, 'https://image.tmdb.org/t/p/original/krhj4Fhb0G3QCmyBtEADxgFFmRX.jpg', 'https://image.tmdb.org/t/p/w500/b9Vx5fA8UgMGRkvh8TGg4k78mg.jpg', 6.6, 680, 'Quand une passion devient...', 'Stephen Fleming, parlementaire conservateur récemment promu secrétaire d''État, est marié depuis 25 ans à Ingrid, avec laquelle il entretient une relation pleine d''affection. Ils ont 2 enfants : Martyn, brillant journaliste politique, et Sally, adolescente à l''esprit vif et curieux. Au cours d''une réception à l''ambassade de France, Stephen fait la connaissance d''Anna Barton, la nouvelle petite amie de son fils.', 111, '1992-12-02', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a89bd906-6696-45ce-afc5-2d6df3c78093', '59f8c077-9d19-4d34-a318-177b7f764ed6', 16940, 'Jeremy Irons', 'Dr. Stephen Fleming', 'https://image.tmdb.org/t/p/w200/w8Ct1q02Ht3sWdOSqfp3B85TzT.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('df9a9f1c-2f30-4e25-93de-c58b6bee2b67', '59f8c077-9d19-4d34-a318-177b7f764ed6', 1137, 'Juliette Binoche', 'Anna Barton', 'https://image.tmdb.org/t/p/w200/htdZZIroEyJaeHQAUTqokNfkPgl.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4bbbf558-70a8-479d-bfb4-fb9394ca7d65', '59f8c077-9d19-4d34-a318-177b7f764ed6', 8436, 'Miranda Richardson', 'Ingrid Fleming', 'https://image.tmdb.org/t/p/w200/2IEW3fxqHb4AHBl5xU8JuipJbNK.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4b736ae8-a4d7-49c0-81ee-45ab1579cde2', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11278, 'Rupert Graves', 'Martyn Fleming', 'https://image.tmdb.org/t/p/w200/6tS8XMuTS04xXTfeWFjJED6SFBF.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('313c2c74-ec09-4301-b09b-a2e36e00411c', '59f8c077-9d19-4d34-a318-177b7f764ed6', 53, 'Peter Stormare', 'Peter Wetzler', 'https://image.tmdb.org/t/p/w200/1rtpuUqBV29jDc1huUhtjGDbEwn.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('465e8c79-19b8-4039-871c-eead16339e45', '59f8c077-9d19-4d34-a318-177b7f764ed6', 67798, 'Gemma Clarke', 'Sally Fleming', 'https://image.tmdb.org/t/p/w200/98TgvalxQ5mPZycc7YxgCyOy3BN.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('64740c6f-a7ae-492b-91cf-b372bfb498fa', '59f8c077-9d19-4d34-a318-177b7f764ed6', 2481, 'Ian Bannen', 'Edward Lloyd', 'https://image.tmdb.org/t/p/w200/4WrkyylbxsSNsVlfXDctE7KDOuP.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('92a3c0c5-1923-4307-a20c-2487edf9517e', '59f8c077-9d19-4d34-a318-177b7f764ed6', 10747, 'Julian Fellowes', 'Donald Lyndsay, MP', 'https://image.tmdb.org/t/p/w200/hRWGCVNRkeu61lh3NRmfRym9yOp.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c14561db-c5df-4670-a790-739ad0f5612e', '59f8c077-9d19-4d34-a318-177b7f764ed6', 5320, 'Leslie Caron', 'Elizabeth Prideaux', 'https://image.tmdb.org/t/p/w200/8KaogFPimucFHFyUkdA0c0Bym5C.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eec04297-8cbb-449e-87e4-4805ec4a6ad2', '59f8c077-9d19-4d34-a318-177b7f764ed6', 73284, 'Tony Doyle', 'Prime Minister', 'https://image.tmdb.org/t/p/w200/zyNKcvgfIcCvMM7BVIP8e4Vx2Ks.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d3f7a83b-4bf1-498a-8337-820614c0a884', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11057, 'La Rose blanche', 'https://image.tmdb.org/t/p/w200/a2LVdGxEcmrL1FFSfonD5n4xtkK.jpg', 1982, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c8c69c4e-e4fb-4f70-8228-3b74e7cffecb', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11224, 'Cendrillon', 'https://image.tmdb.org/t/p/w200/nqSJwBdvG89uHRpDDdaAy5YhogZ.jpg', 1950, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('82ea5186-e407-4c63-8cf1-86e850b10bd0', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11628, 'Solino', 'https://image.tmdb.org/t/p/w200/jI9HBEE9OqmMZk5n91qgHmLudW.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6909cf96-878d-4df4-ba21-3fbb8095af63', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11632, 'Vanity Fair : La Foire aux vanités', 'https://image.tmdb.org/t/p/w200/c9w4c33qKscv6ypWBslBpPnePk4.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f39b1eee-8f60-45af-b8c2-07fab5b1afd7', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11648, 'La Main au collier', 'https://image.tmdb.org/t/p/w200/m0D2UmlpEr7rhlcMy7mwUa0LlXS.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('82c5ab2b-98db-4207-b9f1-ada331b88b89', '59f8c077-9d19-4d34-a318-177b7f764ed6', 11659, 'Nos meilleures années', 'https://image.tmdb.org/t/p/w200/cF3bGMMCtfHOIyAkiaJM77h2jOh.jpg', 2003, NOW());

COMMIT;

-- Movie: GOAT : Rêver plus haut
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('fbc0f66f-addc-475b-9874-baa73ed5b059', 'GOAT : Rêver plus haut', 'GOAT', 2026, 'Tyree Dillihay', ARRAY['Aaron Buchsbaum', 'Teddy Riley'], '1h40min', ARRAY['Animation', 'Comédie', 'Familial'], 'Will est un petit bouc avec de grands rêves. Lorsqu''il décroche une chance inespérée de rejoindre la ligue professionnelle de "roarball", un sport ultra-intense réservé aux bêtes les plus rapides et féroces, il entend bien saisir l’opportunité. Problème : ses nouveaux coéquipiers ne sont pas vraiment ravis d''avoir un "petit" dans l''équipe. Mais Will est prêt à tout pour changer les règles du jeu.', '', 'https://image.tmdb.org/t/p/w200/cA4rfx4HwDYmmxpJoBclTZTjcEN.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/9wwbYnU3HfAYqdjbFMhy2a8HYvr.jpg', 'https://image.tmdb.org/t/p/original/tq3h43fZy0H80vzf47MAY7R9Mxo.jpg', ARRAY[], 'film', 116.6577, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('0d218575-cf2a-4e45-b94e-01012c907ee0', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 1297842, 'https://image.tmdb.org/t/p/original/tq3h43fZy0H80vzf47MAY7R9Mxo.jpg', 'https://image.tmdb.org/t/p/w500/9wwbYnU3HfAYqdjbFMhy2a8HYvr.jpg', 8.115, 710, 'On n’est jamais trop petit pour rêver grand.', 'Will est un petit bouc avec de grands rêves. Lorsqu''il décroche une chance inespérée de rejoindre la ligue professionnelle de "roarball", un sport ultra-intense réservé aux bêtes les plus rapides et féroces, il entend bien saisir l’opportunité. Problème : ses nouveaux coéquipiers ne sont pas vraiment ravis d''avoir un "petit" dans l''équipe. Mais Will est prêt à tout pour changer les règles du jeu.', 100, '2026-02-11', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a5d88bc9-1cc0-4ceb-b805-ff5ab61c13e4', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 1474123, 'Caleb McLaughlin', 'Will Harris (voice)', 'https://image.tmdb.org/t/p/w200/4jVS3EziBn7bf97ErxkW7jsdiLM.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('42b53206-104a-4c18-8b12-8552d5406d3f', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 17773, 'Gabrielle Union', 'Jett Fillmore (voice)', 'https://image.tmdb.org/t/p/w200/toeSCybsYufRKfgz77AKy4C8axD.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('492fb529-c811-4393-a059-c4c5052cd6b5', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 1718307, 'Stephen Curry', 'Lenny Williamson (voice)', 'https://image.tmdb.org/t/p/w200/dmLZdGhZkCYktooIp8iqXhAvoWz.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a46c3fa0-c75d-4aab-a909-fa5f295534d8', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 1763709, 'Aaron Pierre', 'Mane Attraction (voice)', 'https://image.tmdb.org/t/p/w200/z2cMMZyWzv5ztT6pFdAAjB3u7CQ.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c7027b15-1fe1-48ed-974f-11a38f9682e6', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 1267240, 'Nicola Coughlan', 'Olivia Burke (voice)', 'https://image.tmdb.org/t/p/w200/shSN86O3qckxcO7YXVtaNy9ksSU.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1f6253f5-8746-4f09-9bf4-68cee4585db6', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 35029, 'David Harbour', 'Archie Everhardt (voice)', 'https://image.tmdb.org/t/p/w200/qMFtMWlYVtFVyBoBhX5IoA5sN5a.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('51bcdc1f-8df3-4d32-a59b-f14abaa08f7f', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 208519, 'Nick Kroll', 'Modo Olachenko (voice)', 'https://image.tmdb.org/t/p/w200/fNiOuEKeBtELGdhKn4lxXq4O7YP.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c81464a8-13e3-427a-a070-8350bd4ef13a', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 15899, 'Jenifer Lewis', 'Flo Everson (voice)', 'https://image.tmdb.org/t/p/w200/htrTYcoJQQpSYo6BrRehe3h46vo.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bc6677b4-9571-4c6d-a26f-511d43e38860', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 10872, 'Patton Oswalt', 'Dennis Cooper (voice)', 'https://image.tmdb.org/t/p/w200/ljQvjbPmcIAl205Lb2Mu4CW8WO7.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34647476-8cbf-4eae-b7eb-7c2c65a80359', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 2974019, 'Jelly Roll', 'Grizz (voice)', 'https://image.tmdb.org/t/p/w200/zRW0Tb9JJq7pfLZAGbXxufsgGWU.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1852f026-fbff-4156-bda8-5458fad6b804', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 784, 'Kolya', 'https://image.tmdb.org/t/p/w200/cwZuzdbdWqqdBN7auDleTkphqkS.jpg', 1996, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('29282fb8-e7b4-4a10-bff9-5f32d166bdcc', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 789, 'Trains étroitement surveillés', 'https://image.tmdb.org/t/p/w200/yzNCrmtT6o8gLlsYkXN9NlGNQkk.jpg', 1966, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('720ee0cd-347a-474f-b440-181c5beb8db2', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 980996, 'I Like Movies', 'https://image.tmdb.org/t/p/w200/phb6rDzREtNXvTXuXVuAYcJBR7F.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7e7a0d26-5fd5-4aeb-a915-1d622a8d04da', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 838, 'American Graffiti', 'https://image.tmdb.org/t/p/w200/1bvAKQW9MuHiIGSnbuny0GGdwp1.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6acc04db-cfc3-4e41-a59c-ac6e2c4ea3d5', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 808, 'Shrek', 'https://image.tmdb.org/t/p/w200/rJIju4i2sENrfTbAXwL9OKv2e1i.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2c32343d-f657-4e57-b8a2-0c1f5011a36d', 'fbc0f66f-addc-475b-9874-baa73ed5b059', 809, 'Shrek 2', 'https://image.tmdb.org/t/p/w200/2e8hcPLaWjLXdQLgdi5otr4Jj9L.jpg', 2004, NOW());

COMMIT;

-- Movie: Disforia
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('9f8a0bc5-5083-405c-97a0-7933dcb1b511', 'Disforia', 'Disforia', 2025, 'Christopher Cartagena', ARRAY['Christopher Cartagena', 'Joan-Pol Argenter', 'Imanol Ortiz López'], '1h22min', ARRAY['Horreur', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/49pzxbf1Eftz7wQZdVDVl8OM9bg.jpg', 'https://image.tmdb.org/t/p/original/gYumbUCWyUI6Mutgd7oILOCunk8.jpg', ARRAY[], 'film', 108.0813, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('800b0ecb-5ecd-4df5-a2cf-6aab17685964', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 1252051, 'https://image.tmdb.org/t/p/original/gYumbUCWyUI6Mutgd7oILOCunk8.jpg', 'https://image.tmdb.org/t/p/w500/49pzxbf1Eftz7wQZdVDVl8OM9bg.jpg', 4.833, 6, NULL, '', 82, '2025-09-20', 'es', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4fa338c3-2ff3-4854-a178-34e309aa99f3', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 2030317, 'Claudia Salas', 'Vera', 'https://image.tmdb.org/t/p/w200/jfLi59P55yQeyjfD8UVf4DilXpt.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c5e3ad02-4fe1-4627-8451-4ae73c5876b1', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 2486753, 'Fariba Sheikhan', 'Esther', 'https://image.tmdb.org/t/p/w200/bgULbaEJAtWvAOrEtvcoCMrGRsm.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5d812b4f-3f0c-402c-8604-70d4d085d4a9', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 964, 'Eloy Azorín', 'Tomás', 'https://image.tmdb.org/t/p/w200/xSBOlzQC3NwchCDRuWvPrS1pASB.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('63138083-99bd-4944-9d66-0719658f4d9a', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 4105608, 'Noah Casas', 'Say', 'https://image.tmdb.org/t/p/w200/pCLSPCIQq1Re4Qv2LtTSP6kvPXx.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0254142b-ba5d-4800-b01e-f359b95e6488', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 1479796, 'Ferran Vilajosana', 'Policía', 'https://image.tmdb.org/t/p/w200/csrmEVeZsQrDaUI2iS4KPVR40QJ.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fdca8707-07c0-44c8-8875-5579f29f4640', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 1609626, 'Kike Guaza', NULL, 'https://image.tmdb.org/t/p/w200/mx40KxmzdhXZD7V8Qs3IesYBGwe.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2842bfd1-be83-4fad-87c6-e0f05a6d9466', '9f8a0bc5-5083-405c-97a0-7933dcb1b511', 1985190, 'Aleida Torrent', NULL, 'https://image.tmdb.org/t/p/w200/GgxOPY852oFuIxjsEAFiVBFBQb.jpg', 6, NOW());

COMMIT;

-- Movie: Mortal Game
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('96a05189-ef3a-4ecc-9fe2-e460cd738909', 'Mortal Game', 'Mortal Game', 2025, 'John Lechago', ARRAY['Paco Alvarez', 'John Lechago'], '1h25min', ARRAY['Horreur', 'Action'], '', '', 'https://image.tmdb.org/t/p/w200/x9H622dXZN4fh4voNAYfipjhDbL.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/iCvucorbs3hFqWshDbLe0fHzB71.jpg', 'https://image.tmdb.org/t/p/original/hdLsZ3dCjKt5A6xDpoo3UFgcTSm.jpg', ARRAY[], 'film', 97.6395, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('6da36d3f-0bf8-4802-b5f0-a5feadcc7d20', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 1426822, 'https://image.tmdb.org/t/p/original/hdLsZ3dCjKt5A6xDpoo3UFgcTSm.jpg', 'https://image.tmdb.org/t/p/w500/iCvucorbs3hFqWshDbLe0fHzB71.jpg', 4.917, 12, NULL, '', 85, '2025-02-03', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5e0dc00d-a5bb-4909-acbb-029e55c8282c', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 3899035, 'Deniella Alexis', 'Jessie', 'https://image.tmdb.org/t/p/w200/rqKHY2kUwQNlXD3POvQLh8k6Q0L.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fc57f456-4bcf-4a28-9e72-b2b6eefa1d49', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 3871127, 'Kevin Lloyd Reid', 'Murphy', NULL, 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1832154b-2e38-48de-91b6-5c3a9809ebcc', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 1073806, 'Mark Ettlinger', 'Alexander', 'https://image.tmdb.org/t/p/w200/pCz5e6UGvFChjlqyDBJ4IxG0iCZ.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fa6d57ed-ba52-4e13-97d0-0fb3aedc3d3c', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 4945933, 'Madison Caan', 'Bailey', 'https://image.tmdb.org/t/p/w200/9RJkEsYIsFR0ktkupjIzvcWbpcI.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d312e354-b7c8-4826-9aae-4661bfec4e35', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 1529621, 'Reece Presley', 'Sam', 'https://image.tmdb.org/t/p/w200/bp3EOp7bRO5k9K83U0wf4NH878R.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('239e6182-d983-4b90-ab15-be7e8bbad7d0', '96a05189-ef3a-4ecc-9fe2-e460cd738909', 4508034, 'Joey Harlem', NULL, NULL, 5, NOW());

COMMIT;

-- Movie: Vacanze per un massacro
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e3c4acd6-dec0-443d-9239-02e006a729d1', 'Vacanze per un massacro', 'Vacanze per un massacro', 1980, 'Fernando Di Leo', ARRAY['Fernando Di Leo'], '1h29min', ARRAY['Thriller', 'Action', 'Crime'], '', '', 'https://image.tmdb.org/t/p/w200/extKHlTDlc7bHdwZgafCSIu5LmP.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/arRNmW27fs1TFsIBOwPYCfZQFJC.jpg', 'https://image.tmdb.org/t/p/original/7TJjD2X9GTEqyLVIJKLS85J2V47.jpg', ARRAY[], 'film', 92.2054, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('5bfcc6d9-63fe-411f-b658-9e313233fe7a', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 28322, 'https://image.tmdb.org/t/p/original/7TJjD2X9GTEqyLVIJKLS85J2V47.jpg', 'https://image.tmdb.org/t/p/w500/arRNmW27fs1TFsIBOwPYCfZQFJC.jpg', 4.969, 32, NULL, '', 89, '1980-03-20', 'it', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('19bf056e-faa1-4948-be0a-4b21844aa903', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 29915, 'Joe Dallesandro', 'Joe Brezzi', 'https://image.tmdb.org/t/p/w200/dtLU66GGm6Lis5ZMrseT0qei2Ii.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('22708d55-7ffb-4717-96e7-c119c5857b84', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 100420, 'Patrizia Behn', 'Liliana', 'https://image.tmdb.org/t/p/w200/ou744kaQSI2pkPM2BtErRP35mQP.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('07292e97-64e1-4b82-b9be-1fde44a911ea', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 38762, 'Gianni Macchia', 'Sergio', 'https://image.tmdb.org/t/p/w200/ysecXVh8vo4USlM1ExfkE0XlA7W.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dd32654b-c2c3-474d-b7d4-b1811004edbc', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 101577, 'Lorraine De Selle', 'Paola', 'https://image.tmdb.org/t/p/w200/jVmkHcu5DjKuPDhqqWBmZSw4A8g.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0a61db45-366c-4e32-8e5f-5a81caa0ff3d', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 119370, 'Omero Capanna', 'Killed Cardriver', 'https://image.tmdb.org/t/p/w200/kM9AC6ZSU1q2RIdgDJWKFvuAAbd.jpg', 4, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('105a08da-3acf-45fb-8f5e-0d3dee8d25d1', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 11022, 'Narc', 'https://image.tmdb.org/t/p/w200/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d396e85d-9c53-41fe-a9c6-cad81819d39c', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 11284, 'La Fin de Freddy : L''Ultime Cauchemar', 'https://image.tmdb.org/t/p/w200/6zNufcJuwlZiGmT7Rr3yq0NK1nU.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('382f640e-61bc-4e46-96c9-bc8e787166e0', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 11456, 'L''Intrus', 'https://image.tmdb.org/t/p/w200/79DoWhmWi9T02jaWmwUmXHJsEJt.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8591fab3-938d-4734-9f4f-57c281656008', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 11588, 'Memories (Inside)', 'https://image.tmdb.org/t/p/w200/65AD6BVPS9K4Ls3oUqTGGAHx7y5.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8ba447ed-c314-4fb4-b3ac-1db2a8f16a28', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 11592, 'Serial mother', 'https://image.tmdb.org/t/p/w200/ae8cy850doLF92w8a31NyerYNNw.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('84056593-ee2c-455e-940c-9816957487a0', 'e3c4acd6-dec0-443d-9239-02e006a729d1', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());

COMMIT;

-- Movie: ಮಾರ್ಕ್
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 'ಮಾರ್ಕ್', 'ಮಾರ್ಕ್', 2025, 'Vijay Kartikeyaa', ARRAY['Vijay Kartikeyaa'], '2h24min', ARRAY['Action', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/6LTDv6XHiHN0N77QIFg2tidVvhh.jpg', 'https://image.tmdb.org/t/p/original/6DfHl4CE88x7Rt9oyARQQm6bHXD.jpg', ARRAY[], 'film', 109.2945, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('915f3b42-b91c-4b71-94ab-774ef7ba4c53', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1510339, 'https://image.tmdb.org/t/p/original/6DfHl4CE88x7Rt9oyARQQm6bHXD.jpg', 'https://image.tmdb.org/t/p/w500/6LTDv6XHiHN0N77QIFg2tidVvhh.jpg', 4, 1, NULL, '', 144, '2025-12-25', 'kn', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7559217e-a4d7-4ccf-b9bf-6683a60eeefe', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 389604, 'Sudeep', 'Ajay Markendeya', 'https://image.tmdb.org/t/p/w200/8c5TYgGwbkcQkvC3ZlTU41OfYBN.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fd792745-80ca-41f4-a959-d0a630edf533', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 2345501, 'Deepshika Umapathy', NULL, 'https://image.tmdb.org/t/p/w200/f20SM61Foa1U7eO4KZRA0suam3j.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c5cbe4c6-6f84-4d31-9423-28389d19d3b8', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1135117, 'Naveen Chandra', 'Bhadra', 'https://image.tmdb.org/t/p/w200/6iEhNOOqRTOQ0JFSiv6agtqvwx9.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ddd69ba9-8d6f-4e94-bb2d-63880407f4d7', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1296632, 'Shine Tom Chacko', 'Adikeshava', 'https://image.tmdb.org/t/p/w200/lIfhgkTK8bgM5jS2R91ZvCxKIwj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6ffb6d7f-ce5f-4fe5-8832-4977549cca99', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1540764, 'Yogi Babu', 'Solomon', 'https://image.tmdb.org/t/p/w200/lTNb5POaftGHXzgN9aIegcehh89.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5ec0ad38-8f41-4e60-8d2f-add627294dd7', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 585382, 'Vikranth', NULL, 'https://image.tmdb.org/t/p/w200/ksMHimRUMXLwJqrZsgGx9TzyQiN.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5c4854c4-6370-4ac2-8bea-90f85ac46920', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 122986, 'Dev Gill', 'Devaraj', 'https://image.tmdb.org/t/p/w200/8Ta11Sdp6jCCbBEroTbnzoRxkvw.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('86e12c88-b7f3-4547-9dae-995ba38feb8e', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1124964, 'Aruldoss', NULL, 'https://image.tmdb.org/t/p/w200/gDMVbi6reJPolJm9qtqYwTWyh4p.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2d9e4879-822b-4264-8096-3f54b1eaea31', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1256447, 'Roshini Prakash', 'Sanchana', 'https://image.tmdb.org/t/p/w200/kQTusKHgUJVeXddPhlHgPfQ62ZY.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fa404e07-eed2-4833-b67f-d6da112b748b', 'ef07cb0b-bbe4-4665-a0a4-4d6ca55bab98', 1266840, 'Guru Somasundaram', 'Stephen Raj', 'https://image.tmdb.org/t/p/w200/eqjEcc6LnZI5teGwOrrArAr5vko.jpg', 9, NOW());

COMMIT;

-- Movie: Beast
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e114b99e-a445-4f98-aef1-b82a1efa71ea', 'Beast', 'Beast', 2026, 'Tyler Atkins', ARRAY['David Frigerio'], '1h54min', ARRAY['Action', 'Drame'], 'Patton James abandonne son rêve de pratiquer les arts martiaux mixtes pour subvenir aux besoins de sa femme, Luciana et de leur fils. Lorsque son frère, Malon, subit une grave blessure et doit faire face à des pressions financières, Patton décide de le venger lors d''un combat avec l''aide de l''entraîneur vétéran Sammy.', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/7NrvUI3vnW8H3rD7ExKcTL7KRcQ.jpg', 'https://image.tmdb.org/t/p/original/hlZGaey4lR9hc4rGxZRAmIEsZOc.jpg', ARRAY[], 'film', 95.786, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('89273714-222a-4c95-8cb8-bf323e0e35e9', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 1292415, 'https://image.tmdb.org/t/p/original/hlZGaey4lR9hc4rGxZRAmIEsZOc.jpg', 'https://image.tmdb.org/t/p/w500/7NrvUI3vnW8H3rD7ExKcTL7KRcQ.jpg', 6.3, 45, NULL, 'Patton James abandonne son rêve de pratiquer les arts martiaux mixtes pour subvenir aux besoins de sa femme, Luciana et de leur fils. Lorsque son frère, Malon, subit une grave blessure et doit faire face à des pressions financières, Patton décide de le venger lors d''un combat avec l''aide de l''entraîneur vétéran Sammy.', 114, '2026-04-10', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8853e0b7-d26b-4d3f-bf35-78f09922d48e', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 1229432, 'Daniel MacPherson', 'Patton', 'https://image.tmdb.org/t/p/w200/aBvJnrSlzXeU8K3glUa6XQ6nbuK.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7c631394-8cb9-403b-82fe-a2f153f7154e', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 216986, 'Luke Hemsworth', 'Gabriel', 'https://image.tmdb.org/t/p/w200/m3VkYWENQc392VMrn0B4VnW886R.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8a31cf25-b1ec-4031-94fb-585ade04a877', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 934, 'Russell Crowe', 'Sammy', 'https://image.tmdb.org/t/p/w200/uxiXuVH4vNWrKlJMVVPG1sxAJFe.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('961f39ae-628f-4b1e-805f-37bed2aaed60', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 1375499, 'Mojean Aria', 'Malon James', 'https://image.tmdb.org/t/p/w200/v5W5lpuAWSDVMokU0RKGkHDT2rj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9f1b51b9-2135-4bfe-b7df-143cc46ca772', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 1701014, 'Kelly Gale', 'Luciana', 'https://image.tmdb.org/t/p/w200/bU9w5FITuN7TUa9VxFH3whhXFkP.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ad9b85f0-f233-4599-aaca-a83190ee097a', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 2966859, 'George Burgess', 'Neal', 'https://image.tmdb.org/t/p/w200/fxTvtnpfjU5uKFKu4GoAVD1o7i0.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('db11bb3a-51dc-4106-a25e-12f4d997e9e7', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 60005, 'Nathan Phillips', 'Skipper', 'https://image.tmdb.org/t/p/w200/9t54w1XE7u7fOWQv83IP0xYAWkh.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('db946e8a-e9a9-4652-a99b-97720eb1653a', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 6135738, 'Sol Nc Carrico', 'Maddie', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('35790d87-d8ab-4d22-af2d-fcd2c1817039', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 230601, 'Bren Foster', 'Xavier Grau', 'https://image.tmdb.org/t/p/w200/qRCsPgki64JVreidPI6KAexZxpk.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b54909a5-4f33-42de-be82-65f74b72c5a8', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 5440961, 'Saphira Moran', 'Nadine', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('333ef9e0-cae2-4da6-9ce2-bb30fa805565', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 1360455, 'PFL Super Fights: Battle of the Giants', 'https://image.tmdb.org/t/p/w200/AR2x7K9RFt4uMyNL4MLePkvR8H.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('66557522-2347-4eae-b47f-4e94a8823ada', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 11690, 'Bloodsport, tous les coups sont permis', 'https://image.tmdb.org/t/p/w200/r9Jijds91tMq28MYyK9eK185los.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7584e960-ea63-428d-a4cc-279c92a28066', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 265678, 'UFC on Fox 11: Werdum vs. Browne', 'https://image.tmdb.org/t/p/w200/oTnFq0tx7DtY6d7FYS4L05ePZ29.jpg', 2014, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('63611f5a-417a-4d21-9b28-fe61ba3ec2fa', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 622152, 'UFC Fight Night 156: Shevchenko vs. Carmouche 2', 'https://image.tmdb.org/t/p/w200/legvspDrrewFfTJLqGq5cEsTGTP.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d7746f2a-2b32-4b4f-bfbe-d73a6a6bc3e0', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 1341989, 'Stadionlar Səssiz Olanda', 'https://image.tmdb.org/t/p/w200/reGmfWTc13vNHLupx8sABBqMOzT.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('331a5571-0eaa-4407-bc0e-627a54197ba3', 'e114b99e-a445-4f98-aef1-b82a1efa71ea', 980772, 'UFC Fight Night 207: Volkov vs. Rozenstruik', 'https://image.tmdb.org/t/p/w200/jjUJkSunX6jsDo1Jp00na0RTG8V.jpg', 2022, NOW());

COMMIT;

-- Movie: भूत बंगला
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('52549175-0e6a-47a6-9309-d6184e8929bc', 'भूत बंगला', 'भूत बंगला', 2026, 'Priyadarshan', ARRAY['Rohan Shankar', 'Priyadarshan', 'Abhilash Nair'], '2h43min', ARRAY['Horreur', 'Comédie'], '', '', 'https://image.tmdb.org/t/p/w200/durYQlaO6ZuQ0hLgIpuum0SAZTF.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/79RBp8afL4u4z3nVGR78z6eIvBB.jpg', 'https://image.tmdb.org/t/p/original/A2tzVTVtnTvpji96IZmleN78KKv.jpg', ARRAY[], 'film', 83.0296, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('22fd75c4-4c9f-47d3-9945-d9bcb0aa69a2', '52549175-0e6a-47a6-9309-d6184e8929bc', 1239134, 'https://image.tmdb.org/t/p/original/A2tzVTVtnTvpji96IZmleN78KKv.jpg', 'https://image.tmdb.org/t/p/w500/79RBp8afL4u4z3nVGR78z6eIvBB.jpg', 6.5, 10, NULL, '', 163, '2026-04-16', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c9813bd9-92eb-478d-9305-93fc861d91ea', '52549175-0e6a-47a6-9309-d6184e8929bc', 35070, 'Akshay Kumar', 'Arjun Acharya', 'https://image.tmdb.org/t/p/w200/sR8nASRtTpiwXqkFHjG2jdRBZ7a.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6b26780e-6552-4a88-a8f4-11c280bbc0ac', '52549175-0e6a-47a6-9309-d6184e8929bc', 1267400, 'Wamiqa Gabbi', 'Priya', 'https://image.tmdb.org/t/p/w200/e1CNXkH2scGeoabOTowFJJxX2YF.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('936e48ad-fc69-4e29-b9f7-b084b7bbd3a5', '52549175-0e6a-47a6-9309-d6184e8929bc', 85033, 'Paresh Rawal', 'Jagdish Kewalramani', 'https://image.tmdb.org/t/p/w200/haRliZNMm04QXItBGScbFh4bHSJ.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4916a15d-ec39-4710-a33b-c24b819e5794', '52549175-0e6a-47a6-9309-d6184e8929bc', 55062, 'Tabu', 'Yashoda', 'https://image.tmdb.org/t/p/w200/cvt5nvCHr1ICf5u8A2mlzLQ8LsV.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('18d58699-13fc-4359-acc9-203f0c454741', '52549175-0e6a-47a6-9309-d6184e8929bc', 545144, 'Jisshu Sengupta', 'Dr. Vasudev Acharya', 'https://image.tmdb.org/t/p/w200/6Ha4p2iQOHpnKC1uB4NKJ53kHRi.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b075d8d6-fa23-4437-b463-4248eea311f8', '52549175-0e6a-47a6-9309-d6184e8929bc', 35756, 'Rajpal Yadav', 'Sundar', 'https://image.tmdb.org/t/p/w200/aJJAU9EPiiXRsWDuy60mXE8U6lT.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5da68402-89fc-4f85-89b8-5857eb762803', '52549175-0e6a-47a6-9309-d6184e8929bc', 86019, 'Govardhan Asrani', 'Shantaram', 'https://image.tmdb.org/t/p/w200/zoZRnIHNkCRq4gKZGaQhbtPrIDj.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f15b51dd-5394-4b0b-ad8e-bd2a4da656c3', '52549175-0e6a-47a6-9309-d6184e8929bc', 1955922, 'Mithila Palkar', 'Meera', 'https://image.tmdb.org/t/p/w200/ggqPRbqWEayrM6SCj490gIwQK6t.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cf1bb6b4-f045-4942-83ab-d468ffa53ca6', '52549175-0e6a-47a6-9309-d6184e8929bc', 648087, 'Rajesh Sharma', 'Dasund Acharya', 'https://image.tmdb.org/t/p/w200/cBmZY1EICMD1q16Fx7GqpHkc6A1.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4fd99498-4a8d-4bfb-99e6-0de66f070043', '52549175-0e6a-47a6-9309-d6184e8929bc', 86018, 'Manoj Joshi', 'Govind Maharaj', 'https://image.tmdb.org/t/p/w200/u7GllU8dO2bkAvRC0i8yszogYqY.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('af701d32-489d-444c-8f0d-38633fb7dbfb', '52549175-0e6a-47a6-9309-d6184e8929bc', 791, 'Fog', 'https://image.tmdb.org/t/p/w200/3Yz96T2B6MUN1Lug9zv8yjBZwo0.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('05cc3967-a2cf-4670-a0f9-a0248863cfcc', '52549175-0e6a-47a6-9309-d6184e8929bc', 694, 'Shining', 'https://image.tmdb.org/t/p/w200/cnniZQGtjK8kh2tsjih4GtkX6bl.jpg', 1980, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('05bfd558-b629-453b-a43c-764ef399a4a1', '52549175-0e6a-47a6-9309-d6184e8929bc', 1523926, 'Maju Serem Mundur Horor', 'https://image.tmdb.org/t/p/w200/n2pGsAiCFQfoiKsigJOV10p46VO.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('aaaeaa47-97be-4415-9e9a-a73717e7bab0', '52549175-0e6a-47a6-9309-d6184e8929bc', 1342333, 'Upholstergeist', 'https://image.tmdb.org/t/p/w200/4Z8j2VfA7utfAQghwD0MmpmEsPE.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ff390816-988f-4dff-8e60-4f3e000cef7e', '52549175-0e6a-47a6-9309-d6184e8929bc', 927, 'Gremlins', 'https://image.tmdb.org/t/p/w200/5DmmWDmfEeqeXREEfV0M5AMzfNK.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c107ca5c-65cf-4c06-8cb3-516ac877bdd5', '52549175-0e6a-47a6-9309-d6184e8929bc', 791348, 'DC Showcase - Constantine: The House of Mystery', 'https://image.tmdb.org/t/p/w200/n3FQYSzptYZJRvp9yGVDxoTfE0L.jpg', 2022, NOW());

COMMIT;

-- Movie: Dhurandhar
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('4c8e1673-8e22-4fbc-a13e-07a1a030c209', 'Dhurandhar', 'धुरंधर', 2025, 'Aditya Dhar', ARRAY['Aditya Dhar'], '3h32min', ARRAY['Action', 'Crime', 'Thriller'], 'Un mystérieux voyageur s''infiltre au cœur des bas-fonds de Karachi et gravit les échelons avec une précision mortelle, dans le seul but de détruire de l''intérieur le célèbre réseau ISI-Underworld.', '', 'https://image.tmdb.org/t/p/w200/dIZs80xvNgA7VZClECVXIHdaATb.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/8FHOtUpNIk5ZPEay2N2EY5lrxkv.jpg', 'https://image.tmdb.org/t/p/original/4DfxcN4w0FuYZHQ3JAHzpHWia1U.jpg', ARRAY[], 'film', 92.8225, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('3782b9d6-30fa-4085-afeb-9ea0ffaabb0a', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 1291608, 'https://image.tmdb.org/t/p/original/4DfxcN4w0FuYZHQ3JAHzpHWia1U.jpg', 'https://image.tmdb.org/t/p/w500/8FHOtUpNIk5ZPEay2N2EY5lrxkv.jpg', 7.135, 288, NULL, 'Un mystérieux voyageur s''infiltre au cœur des bas-fonds de Karachi et gravit les échelons avec une précision mortelle, dans le seul but de détruire de l''intérieur le célèbre réseau ISI-Underworld.', 212, '2025-12-05', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b23ced62-9db7-4f41-a98f-542f95af3eee', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 224223, 'Ranveer Singh', 'Hamza Ali Mazari / Jaskirat Singh Rangi', 'https://image.tmdb.org/t/p/w200/sRiwLmhduFghJo8U2coUafnDD4C.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('53b3ebfd-7136-45f2-8197-0ac79fce1973', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 87328, 'Akshaye Khanna', 'Rehman Dakait', 'https://image.tmdb.org/t/p/w200/kRPLQ908NrKejOwG6i3ypBd9qDq.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('58802ef3-8912-4b90-85cf-66552c74b1f8', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 85519, 'R. Madhavan', 'Ajay Sanyal', 'https://image.tmdb.org/t/p/w200/gaDrAdXxIrbBRCd9cX8YvJDEuLb.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b811c3ce-5a9e-480c-9516-a8bf7488de58', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 52263, 'Arjun Rampal', 'Major Iqbal', 'https://image.tmdb.org/t/p/w200/1F81WNcVV5cW9O4D5Otk1Y2WHV9.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0b3e0c83-02fe-478f-b60c-74e213789ed5', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 85881, 'Sanjay Dutt', 'SP Chaudhary Aslam', 'https://image.tmdb.org/t/p/w200/oq4pnvWhl1HxKpp0KVlSfAr3Tiu.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('82572732-eb9d-4219-8986-d58731d808e0', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 579817, 'Sara Arjun', 'Yalina Jamali', 'https://image.tmdb.org/t/p/w200/uyZIlCL6xwWlor6JYSmIYUiPE7M.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('37b390ea-e801-460b-ac83-a909a20288ac', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 110200, 'Rakesh Bedi', 'Jameel Jamali', 'https://image.tmdb.org/t/p/w200/dWLCiA3rqnaFPn9s0bk2MiSq5Mt.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d6d56cb9-f97d-4586-85fd-0c2e3dbf53a8', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 2985214, 'Danish Pandor', 'Uzair Baloch', 'https://image.tmdb.org/t/p/w200/vDAzq7SJtVlTIj10Oa55BV3Qszm.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3dcee006-5e2f-4c49-a0b3-f1dec791fcdf', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 1013936, 'Gaurav Gera', 'Mohammad Aalam', 'https://image.tmdb.org/t/p/w200/l0kOZqfKusxfPp7wvkwDfNYT64K.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eed7fe37-a22e-425e-ac01-0d47301e1e29', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 150476, 'Naveen Kaushik', 'Donga', 'https://image.tmdb.org/t/p/w200/amxQkCtdEGOQk6z1arVfHhLxYyA.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1046fdec-c70f-4d0b-befc-2a876f797e73', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 8843, 'The Cell', 'https://image.tmdb.org/t/p/w200/d1fDHzDw1hwxu67kpBrztNCy1o6.jpg', 2000, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('29014da4-ca17-433b-9077-e6e7413f785e', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 8848, 'Braquage à l''anglaise', 'https://image.tmdb.org/t/p/w200/dvQMKvrn93F3jUDWY5x6AfPMVFe.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f831d919-a75f-4c3f-aa43-5c188a404379', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 8893, 'C''est dur d''être aimé par des cons', 'https://image.tmdb.org/t/p/w200/nOoKOLYaZmTBQ5heT3xg9dn0lOO.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a29b94e0-8021-49b3-bb54-ac48b310d0b3', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 614743, 'Peppermint', 'https://image.tmdb.org/t/p/w200/5hQ2mBbPt3o35Sx3e4FpJJJALmA.jpg', 2020, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1e99c1d8-0399-4d08-a9d8-271cb965b227', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 9064, 'Hellraiser 2 : Les Écorchés', 'https://image.tmdb.org/t/p/w200/ri6BfqkQjvznrMPbhCdNonng1Qn.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('aac211bd-9348-40e4-b7cc-6979de386abb', '4c8e1673-8e22-4fbc-a13e-07a1a030c209', 8845, 'Piège en haute mer', 'https://image.tmdb.org/t/p/w200/6X5iYIfx6CcMGKQ0PM5UllxZD0d.jpg', 1992, NOW());

COMMIT;

-- Movie: Red Latex
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('c8f484a6-ec49-4336-a73a-d479eb283cd7', 'Red Latex', 'Red Latex', 2020, 'Gerard Marcó de Mas', ARRAY['Gerard Marcó de Mas'], '1h28min', ARRAY['Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/cQkaMqjeJ0K8GyWENpYl3sE7a8l.jpg', 'https://image.tmdb.org/t/p/original/dMX6RR0SHgI43r2CsDkF5wzozOw.jpg', ARRAY[], 'film', 129.4559, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('eeda4512-c8c1-42f3-a6be-338ef400bf53', 'c8f484a6-ec49-4336-a73a-d479eb283cd7', 758308, 'https://image.tmdb.org/t/p/original/dMX6RR0SHgI43r2CsDkF5wzozOw.jpg', 'https://image.tmdb.org/t/p/w500/cQkaMqjeJ0K8GyWENpYl3sE7a8l.jpg', 5.149, 37, NULL, '', 88, '2020-02-22', 'es', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('24790f09-a3c8-401f-ab09-e422a18edb9c', 'c8f484a6-ec49-4336-a73a-d479eb283cd7', 2455665, 'Fedra Duarte', 'Mistress Gise', NULL, 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1ee61c42-a4e1-4655-8bdd-df59afa7d0ec', 'c8f484a6-ec49-4336-a73a-d479eb283cd7', 2833891, 'Nestor Napolitano', 'Quiel', NULL, 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e84ae937-71a9-462f-a330-f4baf6e90162', 'c8f484a6-ec49-4336-a73a-d479eb283cd7', 2455664, 'Valeria Rowinski', 'Julia', NULL, 2, NOW());

COMMIT;

-- Movie: Ladies First
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('b3306e50-ee9e-420f-9062-fef3bf4c37e5', 'Ladies First', 'Ladies First', 2026, 'Thea Sharrock', ARRAY['Natalie Krinsky', 'Cinco Paul', 'Katie Silberman'], '1h34min', ARRAY['Comédie', 'Fantastique'], 'Un dragueur arrogant et charismatique qui enchaîne les liaisons voit sa vie d''homme riche et puissant chamboulée quand il se réveille dans un monde parallèle dominé par les femmes.', '', 'https://image.tmdb.org/t/p/w200/levYh65v2zBLBROydIjQijBupgW.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wkI57tUgF4azrXy4QURO0diuDxD.jpg', 'https://image.tmdb.org/t/p/original/bOy625BjpCskOWnx3tD09MsKVCb.jpg', ARRAY[], 'film', 83.6047, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('20f8c4fb-19da-4f05-a35b-e844d0dcff12', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 1368881, 'https://image.tmdb.org/t/p/original/bOy625BjpCskOWnx3tD09MsKVCb.jpg', 'https://image.tmdb.org/t/p/w500/wkI57tUgF4azrXy4QURO0diuDxD.jpg', 6, 213, NULL, 'Un dragueur arrogant et charismatique qui enchaîne les liaisons voit sa vie d''homme riche et puissant chamboulée quand il se réveille dans un monde parallèle dominé par les femmes.', 94, '2026-05-21', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('653b75be-1ad4-4249-98c1-cd8901426c3c', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 6730, 'Sacha Baron Cohen', 'Damien Sachs', 'https://image.tmdb.org/t/p/w200/bGzXHu8zwWqUY5gEExSh3deQd2j.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b3f0f6f5-1afb-41c9-8869-27fc5ff1d190', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 10882, 'Rosamund Pike', 'Alex Fox', 'https://image.tmdb.org/t/p/w200/tW3pobTn2znqK1nuSUWT7Kj8CSc.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a52a549a-f477-47e7-adb2-5c296bc175e8', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 1464254, 'Tom Davis', 'Chris Black', 'https://image.tmdb.org/t/p/w200/n7JqvXrpPsbpfeelPpZ5R8HTWMG.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('690467df-e982-4962-852a-7102e2ad5da3', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 1246, 'Emily Mortimer', 'Sunny Black', 'https://image.tmdb.org/t/p/w200/oZ4CZW2eW8lL2alD1mwZrFkfACI.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('efc32241-d9be-4eba-a8f1-f14e30ffc9b8', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 1948465, 'Weruche Opia', 'Ruby', 'https://image.tmdb.org/t/p/w200/pPgIOuM9lRO1zH6eDnqDpf0w7da.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4ed7e19e-51cf-40c8-b546-c0f93ed146ca', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 4391, 'Charles Dance', 'Fred Powell', 'https://image.tmdb.org/t/p/w200/3xHwq5lchAI6mfW0aGQOEijexv6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('accd845b-f62f-4a57-a91e-50fb87ed7dbe', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 10981, 'Fiona Shaw', 'Felicity Chase', 'https://image.tmdb.org/t/p/w200/8X7fZybxtwh2nTvYk6kjRYo9RIY.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('45e5e1d0-ed04-4c4d-a602-3238798553d5', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 20766, 'Richard E. Grant', 'Pigeon Man', 'https://image.tmdb.org/t/p/w200/720dpCjuN5cEYFn43GwzZqXtpWv.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cbc3c0a4-6a13-46fc-b36d-e31cb6ce8c12', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 6231976, 'Red Tennant', 'Charlie', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8ef7605a-cd2f-4d71-af24-b43610f6f0ac', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 72309, 'Kathryn Hunter', 'Glenda Cartwright', 'https://image.tmdb.org/t/p/w200/ni98cNE8kOAj6kcpEVmIfi8iAsw.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('46fa3640-90a6-48a8-bba5-1462ffd513bb', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 8970, 'Escapade à New York', 'https://image.tmdb.org/t/p/w200/9HBA1LP7I9RYFH7TvlhirqlY5jM.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('46b37267-1e58-406c-b8ee-bd6f9fedc4a1', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 797109, '말할 수 없는 비밀', 'https://image.tmdb.org/t/p/w200/lxqqFS3W1NsyeAcUVULAxT2jld2.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('96484420-a085-490f-86e2-8a00dc8f1804', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 9038, 'Les Femmes de ses rêves', 'https://image.tmdb.org/t/p/w200/wwDYsulqWM50hPadM6In9PiB7OA.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7ec77065-ea95-41b4-a3e2-828353d4ba43', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 13637, 'Sukiyaki Western Django', 'https://image.tmdb.org/t/p/w200/6rglnNhFPDetSms0DAR2WcXKJvq.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3cedf58e-f5f1-41f5-a924-64a91ef237d1', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 13732, 'L''Auberge rouge', 'https://image.tmdb.org/t/p/w200/fsYIPEzzUc2PgyjVIykaH16XBlO.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3140ace5-78e7-4b05-9c41-e33895538e38', 'b3306e50-ee9e-420f-9062-fef3bf4c37e5', 993092, '我的麻吉4個鬼', 'https://image.tmdb.org/t/p/w200/g02M4amQMpVMmQNeoOEk2tc2e3N.jpg', 2023, NOW());

COMMIT;

-- Movie: Infiltrate
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 'Infiltrate', 'Infiltrate', 2026, 'James Mark', ARRAY['James Mark'], '1h33min', ARRAY['Action', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/8Cw8GF9wG63kF8pRRXwOx2kXGt.jpg', 'https://image.tmdb.org/t/p/original/cfDHxkco8RrslL0Vk2XPTwTVFCe.jpg', ARRAY[], 'film', 111.6802, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('8bd9da7d-167d-48db-8c41-32bc884cecb4', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 1472951, 'https://image.tmdb.org/t/p/original/cfDHxkco8RrslL0Vk2XPTwTVFCe.jpg', 'https://image.tmdb.org/t/p/w500/8Cw8GF9wG63kF8pRRXwOx2kXGt.jpg', 5.2, 15, NULL, '', 93, '2026-04-10', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f923a154-4569-462c-a8b5-234d5560a152', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 1501941, 'Orphée Ladouceur-Nguyen', 'Lily Chen', 'https://image.tmdb.org/t/p/w200/b64Q2pc8jfLObZ68iKFULhXKYT0.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4647da99-e0e1-40bc-9751-eb8bb96f9701', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 1427888, 'Alain Moussi', 'Marcel LaFleur', 'https://image.tmdb.org/t/p/w200/cIpMdm0ggxVmZIBVj7vz8Q8nPLT.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e96afd96-3a29-4a7c-bcc3-8d657599f5cd', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 73610, 'Tim Rozon', 'John', 'https://image.tmdb.org/t/p/w200/c7r0ahbhIimXSgJkqUTUjVuKM2m.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('968d4a98-c792-4f62-8405-6fe37ea3ca6a', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 3814629, 'Finn McCager Higgins', 'Romeo', 'https://image.tmdb.org/t/p/w200/nWvzmUc3xkh6dJTPgmkHc7OHJk7.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('de012a12-ab04-4a05-b93a-c67f0b0a3770', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 207713, 'Lisa Berry', 'Director Bass', 'https://image.tmdb.org/t/p/w200/tTvV9ZWKieJtWX8JK1kIzIUFWJR.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d4335b5c-c57b-48e0-8e9f-1147055a2855', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 948533, 'Paul Braunstein', 'Nikolai', 'https://image.tmdb.org/t/p/w200/5WFAZe2AGttbi0LPg2MmmswL7Gn.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6d3e4d6e-e915-4167-9575-61e7925f109b', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 30617, 'Jason Cavalier', 'Guy', 'https://image.tmdb.org/t/p/w200/nTCcnKIS8Eil9Ve2aGUz2fcf2I.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2ce5e460-76a3-46f7-8caa-4ad1cfd85c00', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 116484, 'Jonathan Goad', 'The Voice / Mr. White', 'https://image.tmdb.org/t/p/w200/6gMaCtTJH6LBACYQUVaeHMcz5SY.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f0f48d9a-3132-4dff-894c-ba58e6a03bc3', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 2284578, 'Mitra Suri', 'Juliette', 'https://image.tmdb.org/t/p/w200/yYfJcAYcupuXYa1ON7JxG6NZCqV.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('414d578e-a010-43e8-91d7-016530182bcb', '8d3e2046-ba8d-44a1-a8b5-e76fc9cd5b0e', 1793739, 'Jeff Yung', 'Tuan', 'https://image.tmdb.org/t/p/w200/9iZFECLtqhoNiXfzWYwbDz9o7Ux.jpg', 9, NOW());

COMMIT;

-- Movie: After - Chapitre 3
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('bea5760f-9917-4f88-8418-7839ed7dac7f', 'After - Chapitre 3', 'After We Fell', 2021, 'Castille Landon', ARRAY['Sharon Soboil'], '1h38min', ARRAY['Drame', 'Romance'], 'Tessa entame un nouveau chapitre de sa vie, mais alors qu’elle se prépare à emménager à Seattle pour son job de rêves, la jalousie et le comportement imprévisible d’Hardin s’intensifient et menacent leur relation. La situation se complique davantage lorsque le père de Tessa fait son retour et que des révélations choquantes sur la famille d’Hardin surgissent. Tessa et Hardin vont alors devoir décider si leur amour vaut la peine de se battre ou s’il est temps pour eux de prendre des chemins différents.', '', 'https://image.tmdb.org/t/p/w200/s1oXtmqyG9X0uDfiU5HidPB6BJx.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wAEQvm2W9BUx5ggag4ALtSAhIe6.jpg', 'https://image.tmdb.org/t/p/original/mxdiaM2tsx8M6W3zLgiPwAkhQfq.jpg', ARRAY[], 'film', 85.4975, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('b581a521-10e2-4cea-86f7-8b855b98864a', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 744275, 'https://image.tmdb.org/t/p/original/mxdiaM2tsx8M6W3zLgiPwAkhQfq.jpg', 'https://image.tmdb.org/t/p/w500/wAEQvm2W9BUx5ggag4ALtSAhIe6.jpg', 7.005, 2742, 'L''amour mis à l''épreuve. La loyauté mise en doute. Plus rien ne sera comme avant.', 'Tessa entame un nouveau chapitre de sa vie, mais alors qu’elle se prépare à emménager à Seattle pour son job de rêves, la jalousie et le comportement imprévisible d’Hardin s’intensifient et menacent leur relation. La situation se complique davantage lorsque le père de Tessa fait son retour et que des révélations choquantes sur la famille d’Hardin surgissent. Tessa et Hardin vont alors devoir décider si leur amour vaut la peine de se battre ou s’il est temps pour eux de prendre des chemins différents.', 98, '2021-09-01', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aac5a0b4-16fb-45bc-a8aa-d94a94198799', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 1753914, 'Josephine Langford', 'Tessa Young', 'https://image.tmdb.org/t/p/w200/rxQIrvUN1NGHkqSKHug1hoHTUNi.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e617d3a8-e37d-4c7e-ae60-3267cbd4066a', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 1114487, 'Hero Fiennes Tiffin', 'Hardin Scott', 'https://image.tmdb.org/t/p/w200/6zMrrZvOMH6uGwEFoK0Uo8sZvxL.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('856f2012-6032-4793-bb2b-1059489c11a1', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 86653, 'Carter Jenkins', 'Robert Freeman', 'https://image.tmdb.org/t/p/w200/fGVndWC3hgwK1uVrhiyzTUyIaxW.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aa4a2cf0-cf38-4ca4-8cf7-7b2f0703058b', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 20805, 'Louise Lombard', 'Trish Daniels', 'https://image.tmdb.org/t/p/w200/6znYbOI2Z8PfzZ6p9jHG5QdAeb2.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('17b65e1e-5f67-4370-a140-d5eef071d40b', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 2035329, 'Chance Perdomo', 'Landon Gibson', 'https://image.tmdb.org/t/p/w200/xRRDtdHhTewrKMj5cpcmEkPNmuP.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0b40e14b-698c-4474-8e88-f23901dc80e8', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 20960, 'Rob Estes', 'Ken Scott', 'https://image.tmdb.org/t/p/w200/uRex9dyCv4mt7V4mxUzZ9NmVxjH.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7f5488d9-8efc-4647-acf2-aee3b17b551b', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 20373, 'Arielle Kebbel', 'Kimberly "Kim" Vance', 'https://image.tmdb.org/t/p/w200/eFN9TTOFk4COQQsDSufChNd7GfP.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2f67c427-e581-4edf-9897-fe8cf057c4db', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 32203, 'Stephen Moyer', 'Christian Vance', 'https://image.tmdb.org/t/p/w200/rQDODAKYgDGSXAShNHMmGGOJI35.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1d09f27d-f247-4fd6-b521-966afff0c994', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 23931, 'Mira Sorvino', 'Carol Young', 'https://image.tmdb.org/t/p/w200/3CPM8yvppihiKsA1pf4x8PJe4x6.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cb14089a-255e-4082-9c1a-5ab12f1d0b93', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 1845809, 'Frances Turner', 'Karen Scott', 'https://image.tmdb.org/t/p/w200/ik2MNJFA2CzeuGtdwrpgUJaidef.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cfa19014-357e-401a-a6c3-f65c330ebb9c', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 8898, 'La Femme sans tête', 'https://image.tmdb.org/t/p/w200/7U7bn6KueKIxi8LRUoYBLMVdfv.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cf4aebc5-43e1-4d8d-bc02-24fbae8e2e2f', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 8901, 'Les Bureaux de Dieu', 'https://image.tmdb.org/t/p/w200/2WXWVf94h6TlnInTWsPTCgycLPr.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c8816ff6-3fd0-42c2-944f-11a700255952', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 8902, 'Une famille brésilienne', 'https://image.tmdb.org/t/p/w200/xKx5msZOhp71R7w9LPudDfrFQsz.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('eab94974-9103-4f43-844a-a8722cfb8c0a', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 8888, 'L''Absent', 'https://image.tmdb.org/t/p/w200/blsfrlSo19Q29kM6ckapWVXuCAh.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4188c346-f113-4404-a61d-ba63c3fb6e8f', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 8889, 'La femme de l''anarchiste', 'https://image.tmdb.org/t/p/w200/sAbmd8MNFBQKu9zUpeRQskz0dG4.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('77905179-a088-4921-8c62-2b0552b747b1', 'bea5760f-9917-4f88-8418-7839ed7dac7f', 8890, 'Clara', 'https://image.tmdb.org/t/p/w200/8h4srQUi9bY6nEW3QGtrhi6OZIy.jpg', 2008, NOW());

COMMIT;

-- Movie: Zootopie 2
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('3a19f369-c581-4ee4-86d2-6127c870bac7', 'Zootopie 2', 'Zootopia 2', 2025, 'Jared Bush', ARRAY['Jared Bush'], '1h48min', ARRAY['Aventure', 'Animation', 'Comédie', 'Familial', 'Mystère'], 'Judy Hopps et Nick Wilde explorent à nouveau Zootopie, entre mystères, rires et rencontres inattendues. À travers chaque rue et chaque instant, ils découvrent que l’amitié et la curiosité transforment le quotidien en moments magiques.', '', 'https://image.tmdb.org/t/p/w200/50XtrC5NMcqiYMXNmuNVY5tUl34.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/hBI7Wrps6tDjhEzBxJgoPLhbmT1.jpg', 'https://image.tmdb.org/t/p/original/lgotja3xMoJZbynwHfcQcJAEMWH.jpg', ARRAY[], 'film', 88.4694, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('b288eb61-456c-44af-8ecd-f661ecf06409', '3a19f369-c581-4ee4-86d2-6127c870bac7', 1084242, 'https://image.tmdb.org/t/p/original/lgotja3xMoJZbynwHfcQcJAEMWH.jpg', 'https://image.tmdb.org/t/p/w500/hBI7Wrps6tDjhEzBxJgoPLhbmT1.jpg', 7.648, 2845, 'Retournez à Zootopie pour l’événement qui fera sensation dans l’histoire.', 'Judy Hopps et Nick Wilde explorent à nouveau Zootopie, entre mystères, rires et rencontres inattendues. À travers chaque rue et chaque instant, ils découvrent que l’amitié et la curiosité transforment le quotidien en moments magiques.', 108, '2025-11-26', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eec2e795-6074-4602-8cb4-d50721765168', '3a19f369-c581-4ee4-86d2-6127c870bac7', 417, 'Ginnifer Goodwin', 'Judy Hopps (voice)', 'https://image.tmdb.org/t/p/w200/n8XOnjgyfYvqRUDcnkAckRqSaNN.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1b04b4ea-a129-4819-9442-dc3a997b87f7', '3a19f369-c581-4ee4-86d2-6127c870bac7', 23532, 'Jason Bateman', 'Nick Wilde (voice)', 'https://image.tmdb.org/t/p/w200/h6Sl1afuHMwnyqcxannecceIg4K.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2317ee65-55a9-4e9b-b4e4-782f6dd9dfd1', '3a19f369-c581-4ee4-86d2-6127c870bac7', 690, 'Ke Huy Quan', 'Gary De''Snake (voice)', 'https://image.tmdb.org/t/p/w200/iestHyn7PLuVowj5Jaa1SGPboQ4.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('86886c4e-7d20-4ed9-b2f4-0267508fb2f6', '3a19f369-c581-4ee4-86d2-6127c870bac7', 1183672, 'Fortune Feimster', 'Nibbles Maplestick (voice)', 'https://image.tmdb.org/t/p/w200/9f2p2T61K4pIvKQMLRlow8znkXU.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fdc4ba8c-af38-4dfc-95cc-f1d7009100e5', '3a19f369-c581-4ee4-86d2-6127c870bac7', 62861, 'Andy Samberg', 'Pawbert Lynxley (voice)', 'https://image.tmdb.org/t/p/w200/jMXU5oG3i93SH1yhkpbBGskFiJl.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7a52e9f6-598f-44c4-8d92-7308d1e0a189', '3a19f369-c581-4ee4-86d2-6127c870bac7', 11064, 'David Strathairn', 'Milton Lynxley (voice)', 'https://image.tmdb.org/t/p/w200/w5YM2cGefPnkoyIXCi2UrCQW53r.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5d28b5c6-88f0-4410-8c0e-bca476564b8b', '3a19f369-c581-4ee4-86d2-6127c870bac7', 17605, 'Idris Elba', 'Chief Bogo (voice)', 'https://image.tmdb.org/t/p/w200/be1bVF7qGX91a6c5WeRPs5pKXln.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7a21d7a6-1c44-461e-8fd9-4a4cfe9cf272', '3a19f369-c581-4ee4-86d2-6127c870bac7', 446511, 'Shakira', 'Gazelle (voice)', 'https://image.tmdb.org/t/p/w200/AcOA8MbRrDswt6w3TmCBYl7TNOu.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('48c317f6-e3fd-4037-b50a-79941c9f452f', '3a19f369-c581-4ee4-86d2-6127c870bac7', 9657, 'Patrick Warburton', 'Mayor Winddancer (voice)', 'https://image.tmdb.org/t/p/w200/nDoOii5HaGwPxYa28xFC2sDkF8y.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('200eabb1-628f-4fc8-a910-8a5dcdbb3236', '3a19f369-c581-4ee4-86d2-6127c870bac7', 1745988, 'Quinta Brunson', 'Dr. Fuzzby (voice)', 'https://image.tmdb.org/t/p/w200/4x2ltnaGHF9rhaDRlkyNs7HOUI8.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1a6f2d7c-1dcf-4296-87a1-63ef5d205330', '3a19f369-c581-4ee4-86d2-6127c870bac7', 8844, 'Jumanji', 'https://image.tmdb.org/t/p/w200/nLXYV4WmYUF4i8pX0iE0H1rltmf.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('73eb37ab-a47d-46e9-8bc2-0b2d8b26c118', '3a19f369-c581-4ee4-86d2-6127c870bac7', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('356b46d9-83f1-4884-8ef8-5f88e905151e', '3a19f369-c581-4ee4-86d2-6127c870bac7', 8965, 'Les Énigmes de l''Atlantide', 'https://image.tmdb.org/t/p/w200/mYsFQt0xgBkEUOTbjA4MLRrzaKQ.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e22b6520-5d6d-48e8-aab9-7aceabba6be9', '3a19f369-c581-4ee4-86d2-6127c870bac7', 614828, 'El vecindario 2', 'https://image.tmdb.org/t/p/w200/3yXUYKOKt21mrl2iBwQhznilFP7.jpg', 1983, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e59760de-2ff3-4117-b7ef-94177df06fa8', '3a19f369-c581-4ee4-86d2-6127c870bac7', 1356458, 'Let’s Split Up!', 'https://image.tmdb.org/t/p/w200/f0pCgc7AhQhlNr7Qhjb8iOsz2jQ.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6a4d2200-4372-4e2f-bd3f-0ad727bfc92b', '3a19f369-c581-4ee4-86d2-6127c870bac7', 9031, 'Cul et chemise', 'https://image.tmdb.org/t/p/w200/jYjzckRsby8iv59LHQTnnZpPlkE.jpg', 1979, NOW());

COMMIT;

-- Movie: Kartavya : Le sens du devoir
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 'Kartavya : Le sens du devoir', 'कर्त्तव्य', 2026, 'Pulkit', ARRAY['Pulkit'], '1h49min', ARRAY['Crime', 'Drame', 'Thriller'], 'Lorsque la vie de sa famille est menacée et que le danger se rapproche, un policier doit décider jusqu''où il est prêt à aller pour remplir son devoir.', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/6OccgP26oyioq8NjfwKIJ2rWjhu.jpg', 'https://image.tmdb.org/t/p/original/mHm73HhpvGWfRkXNErcwc15Czrv.jpg', ARRAY[], 'film', 71.8725, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('4f751b0d-e21c-4f30-880e-72cdb5a0e5c7', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 1628367, 'https://image.tmdb.org/t/p/original/mHm73HhpvGWfRkXNErcwc15Czrv.jpg', 'https://image.tmdb.org/t/p/w500/6OccgP26oyioq8NjfwKIJ2rWjhu.jpg', 6.438, 16, NULL, 'Lorsque la vie de sa famille est menacée et que le danger se rapproche, un policier doit décider jusqu''où il est prêt à aller pour remplir son devoir.', 109, '2026-05-15', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c1587336-6b45-4b91-a15f-6264f8b878f7', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 35747, 'सैफ अली खान', 'Pawan Malik', 'https://image.tmdb.org/t/p/w200/85uKiFDEcIqzLh0GwqYvecXw4uA.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('abe852a0-4d79-494b-bb8d-4577c012d1c6', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 86243, 'Rasika Dugal', 'Varsha', 'https://image.tmdb.org/t/p/w200/cMJP2OEOrKwF05BFh3zI3TyS5Ft.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fd45bddd-3ce6-4ff2-be45-a4ab0db0476f', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 85879, 'Sanjay Mishra', 'Ashok', 'https://image.tmdb.org/t/p/w200/4MGKohKGU4v9SoXcQKCcC4e4Bpi.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4137175a-86f7-4565-8125-849057f33ccb', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 5576987, 'Saurabh Dwivedi', 'Anand Shri', 'https://image.tmdb.org/t/p/w200/mX0LkUJnSXXPSrFUFWW59QUG0bE.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eb2763fa-7a2c-4410-a065-234cc2e6f485', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 85656, 'Zakir Hussain', 'Harihar', 'https://image.tmdb.org/t/p/w200/etiL0ANjzBhTiyvUblZl6vwIog9.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('802053e8-e3b9-4f32-9c73-54195e7b850d', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 1040951, 'Manish Chaudhary', 'Keshav', 'https://image.tmdb.org/t/p/w200/1l4vmA0IJQLieebZWOOCAFu4ra6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d81268fc-5bfd-4f1b-915f-3d3994d54e8c', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 1294159, 'Durgesh Kumar', 'Amar', 'https://image.tmdb.org/t/p/w200/nLt1cgrxIapn7fRVwFjqnSFXc1x.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ebfc4a36-ee72-4d2a-a0ea-fbdcd2eb3950', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 1294161, 'Saharsh Kumar Shukla', 'Nirmal', 'https://image.tmdb.org/t/p/w200/jBDpti5r8uOuNJAEApcJyvrlVFA.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('731d6c48-3711-45b8-855e-c219261e4092', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 6215055, 'Swastik Bhagat', 'Honey', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('798036f4-c40e-4697-8ef6-5633f06d6d96', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 6215056, 'Saurabh Abrol', 'Deepak', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('45005282-c1bb-4bd4-a14f-ac97fc8e95aa', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 793, 'Blue Velvet', 'https://image.tmdb.org/t/p/w200/zw0JOpVE5IFE8IfAm8zRX0AkB3O.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b3e55a7c-5903-4eb6-bde3-9fb79817e3d8', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 845, 'L''Inconnu du Nord-Express', 'https://image.tmdb.org/t/p/w200/6oSfav2yXyP009cBKoNEH0UYF10.jpg', 1951, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('32b720a9-2b07-4566-9d6c-62a9931cee2c', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 807, 'Seven', 'https://image.tmdb.org/t/p/w200/to6jUaLJonMuKW2YovtWfQKtLYP.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('339e86a6-2a85-4d6b-90c6-f9ac8743bcd1', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 910, 'Le Grand Sommeil', 'https://image.tmdb.org/t/p/w200/5gaYxcRapzqqa7EZu6F8DDzLTx1.jpg', 1946, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('25b62390-d54f-4d67-a1ae-69ffb4ad6489', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 913, 'Thomas Crown', 'https://image.tmdb.org/t/p/w200/3xFUQzDR6e3lcJj7cBxfkhr4aQv.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e5eeab0d-c76d-4546-93de-03760bbbbd4b', 'ebaea0c7-eea5-4de9-897e-8e01e350fcd6', 916, 'Bullitt', 'https://image.tmdb.org/t/p/w200/bwqYLTFP6OVtxvISSpbTIr4xZ30.jpg', 1968, NOW());

COMMIT;

-- Movie: Les Évadés
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('d1f9bfac-ee25-44aa-9f02-5aa18863d622', 'Les Évadés', 'The Shawshank Redemption', 1994, 'Frank Darabont', ARRAY['Frank Darabont'], '2h20min', ARRAY['Drame', 'Crime'], 'En 1947, Andy Dufresne, un jeune banquier, est condamné à la prison à vie pour le meurtre de sa femme et de son amant. Ayant beau clamer son innocence, il est emprisonné à Shawshank, le pénitencier le plus sévère de l''État du Maine. Il y fait la rencontre de Red, un noir désabusé, détenu depuis vingt ans. Commence alors une grande histoire d''amitié entre les deux hommes…', '', 'https://image.tmdb.org/t/p/w200/vZ50guP86otYTiBSGfi35GNHWVf.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/t30GjttOdb5At1sYy8b3TOwFgWV.jpg', 'https://image.tmdb.org/t/p/original/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg', ARRAY[], 'film', 77.6488, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('3a88d075-1e44-4d22-a450-c9a820e338e9', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 278, 'https://image.tmdb.org/t/p/original/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg', 'https://image.tmdb.org/t/p/w500/t30GjttOdb5At1sYy8b3TOwFgWV.jpg', 8.7, 30448, 'Même à Shawshank on n''enferme pas l''espoir…', 'En 1947, Andy Dufresne, un jeune banquier, est condamné à la prison à vie pour le meurtre de sa femme et de son amant. Ayant beau clamer son innocence, il est emprisonné à Shawshank, le pénitencier le plus sévère de l''État du Maine. Il y fait la rencontre de Red, un noir désabusé, détenu depuis vingt ans. Commence alors une grande histoire d''amitié entre les deux hommes…', 140, '1994-09-23', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8f770048-4825-4bcd-99a9-d9c57720b301', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 504, 'Tim Robbins', 'Andy Dufresne', 'https://image.tmdb.org/t/p/w200/3FfJMIVwXgsIXbAT8ECBSZJAncR.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('efdb8959-0667-4029-bd01-4698e8f78c1e', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 192, 'Morgan Freeman', 'Ellis Boyd ''Red'' Redding', 'https://image.tmdb.org/t/p/w200/1ahENoyEgKSbRUd0IsydIff7rt1.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b6740d8a-cdd7-45bd-9134-35b005028810', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 4029, 'Bob Gunton', 'Warden Norton', 'https://image.tmdb.org/t/p/w200/ulbVvuBToBN3aCGcV028hwO0MOP.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9b22eafd-3eb5-45e0-a948-b1f5aa6f3b03', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 6573, 'William Sadler', 'Heywood', 'https://image.tmdb.org/t/p/w200/rWeb2kjYCA7V9MC9kRwRpm57YoY.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fa398ec2-7fc6-48a0-baec-c992a2696c0e', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 6574, 'Clancy Brown', 'Captain Byron T. Hadley', 'https://image.tmdb.org/t/p/w200/1JeBRNG7VS7r64V9lOvej9bZXW5.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a745b3b0-4d18-4cab-bcdc-8b3bea4379ff', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 6575, 'Gil Bellows', 'Tommy', 'https://image.tmdb.org/t/p/w200/eCOIv2nSGnWTHdn88NoMyNOKWyR.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('78dc47cc-08b6-42ed-8e2a-aad2c17a9ac5', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 6577, 'James Whitmore', 'Brooks Hatlen', 'https://image.tmdb.org/t/p/w200/nYMAbkfwFIgKK84vnLoQctI6vHg.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('017f35e9-ea02-4190-9398-50554fa136ed', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 6576, 'Mark Rolston', 'Bogs Diamond', 'https://image.tmdb.org/t/p/w200/hcrNRIptYMRXgkJ9k76BlQu6DQp.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d29e0cae-aff3-487e-bb3e-78fe756748d7', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 12645, 'Jeffrey DeMunn', '1946 D.A.', 'https://image.tmdb.org/t/p/w200/70bkLdlkBB7x2NztuJAh4pjdyxy.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5a832e7c-b69d-4c12-a71c-4ed98c74cc94', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 92119, 'Larry Brandenburg', 'Skeet', 'https://image.tmdb.org/t/p/w200/y13c1a4keaLnoTbi3dERwolQXWP.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a7e27970-63b2-45da-92e3-872beb3b12be', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 11005, 'L''Éveil', 'https://image.tmdb.org/t/p/w200/nyX0kdrCiXD27EqpiN8MJcA7xDO.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ef88aae5-256a-4f11-9fea-6d23d99e6336', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 11020, 'Pique-nique à Hanging Rock', 'https://image.tmdb.org/t/p/w200/e5myKEaZHh506KekQv0DECddflz.jpg', 1975, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a3901262-d996-46a6-9a21-7cdad455a497', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 11022, 'Narc', 'https://image.tmdb.org/t/p/w200/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('468286f1-e50b-432b-8602-2bcf09aa2bdc', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 11156, 'Coco avant Chanel', 'https://image.tmdb.org/t/p/w200/yz5JhT8ecEJLw30tvAN29LOyFcW.jpg', 2009, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8fd9d813-e17d-4d29-87e8-b0a369954d79', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 11257, 'Chambre avec vue', 'https://image.tmdb.org/t/p/w200/egKYKKa9Cpfsvbwod89QfAQwc2l.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('384af51a-5833-40c3-bea5-bb943e6e144b', 'd1f9bfac-ee25-44aa-9f02-5aa18863d622', 11293, 'La Barbe à papa', 'https://image.tmdb.org/t/p/w200/jcqfJzjob8PJPimEhshhlpkFWiC.jpg', 1973, NOW());

COMMIT;

-- Movie: Worldbreaker
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e6e46281-f913-40e3-97fa-76cdb7a1577f', 'Worldbreaker', 'Worldbreaker', 2025, 'Brad Anderson', ARRAY['Joshua Rollins'], '1h34min', ARRAY['Science-Fiction', 'Action', 'Horreur'], 'Un père cache sa fille sur une île pour la protéger, tout en la préparant à survivre et à affronter les combats qui l''attendent et qui détermineront l''avenir de l''Humanité.', '', 'https://image.tmdb.org/t/p/w200/4XCOsnXocIsOTLdVjktj3gqTu2b.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/ahj1JU8r0uJv7QII5Uj7tKzbEsC.jpg', 'https://image.tmdb.org/t/p/original/gMItMzDOyrfQGZsMWRM9tdxq5cV.jpg', ARRAY[], 'film', 71.9967, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('4cdd9776-d6ff-437a-9cbe-1e68260bbd48', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 1196067, 'https://image.tmdb.org/t/p/original/gMItMzDOyrfQGZsMWRM9tdxq5cV.jpg', 'https://image.tmdb.org/t/p/w500/ahj1JU8r0uJv7QII5Uj7tKzbEsC.jpg', 6.081, 192, 'L’avenir appartient à ceux qui se battent.', 'Un père cache sa fille sur une île pour la protéger, tout en la préparant à survivre et à affronter les combats qui l''attendent et qui détermineront l''avenir de l''Humanité.', 94, '2025-10-30', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('04ccdc4d-8293-4e0f-9b1e-46b5999333e2', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 2667928, 'Billie Boullet', 'Willa', 'https://image.tmdb.org/t/p/w200/2T18NEAVoU8cWWpAtaI6fTrdolX.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c39e689f-bb2a-41e4-9da9-472d47c58457', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 114019, 'Luke Evans', 'Dad', 'https://image.tmdb.org/t/p/w200/qUkYJcrDc4M0LHNYASs30luFvw0.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bfe41376-3ff0-4bfc-9db9-efb725a93847', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 63, 'Milla Jovovich', 'Mom', 'https://image.tmdb.org/t/p/w200/usWnHCzbADijULREZYSJ0qfM00y.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('14250491-c549-48fe-8aff-4f9aca6363df', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 3214361, 'Mila Harris', 'Rosie', 'https://image.tmdb.org/t/p/w200/10BSVhLPqosSBsOgp0L7qaU0Uhi.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e47fbd07-275c-4bb7-a8f1-91b0830c22d6', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 5287221, 'Kevin Glynn', 'The Man', 'https://image.tmdb.org/t/p/w200/jIQk6lFQ0FOg5piKabufRHfSxNc.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6bb118cd-647a-43fc-a7ce-4ff326f6dcd9', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 3744336, 'Steven Calvert', 'Infected Soldier', 'https://image.tmdb.org/t/p/w200/khzZaa3fZtWIgPe2kjpYiK0e97d.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c350da29-765c-4012-a50d-227eb6fe3937', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 956385, 'Meadow Williams', 'Female Guard 1', 'https://image.tmdb.org/t/p/w200/iECIpEM4BWt94kvOMKFJqv5uJEU.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7855ab6f-3ddc-423d-964c-fe18e983b34d', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 4746149, 'Nadia Violet-Johnson', 'Female Guard 2', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a51cc999-cd8d-4340-8fbc-e38b4c4e76b6', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 1273108, 'Brian Devlin', 'Older Man', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('143258a5-8d1d-4188-8928-690dd75d2d72', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 2412148, 'Chris Finlayson', 'Kodiak', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('718dee99-f50e-4d17-87de-a76c9022fa2e', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 1172265, 'Les Voyages de Tereza', 'https://image.tmdb.org/t/p/w200/jZMmK4mwjw0oo2YeS24nIKHtKhL.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d3c5df38-0c5a-416a-a5f8-e06fac442a81', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 11940, 'Sinbad et l''Œil du tigre', 'https://image.tmdb.org/t/p/w200/yE7Hi4ItfA7EIqI0Hub5nVSaVZQ.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7a66743a-abcb-4fa5-b921-c063b5057841', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 12101, 'Soleil vert', 'https://image.tmdb.org/t/p/w200/1kOIdhDwwaXpuIVojOvwvHSH2sy.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cf87fc30-4394-40b5-bb56-246f3b132210', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 1173214, 'Mama Casserole', 'https://image.tmdb.org/t/p/w200/xvORHniAae8OfHn1k994RwWbASy.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5e94e7a5-dcec-47c8-94e2-042b1204de0c', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 11351, 'Jeepers Creepers 2', 'https://image.tmdb.org/t/p/w200/khvDWl4kyM4n0SZAmCAiGGyUCjp.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8207cfc7-ea67-477c-aca2-c8c4edfc4679', 'e6e46281-f913-40e3-97fa-76cdb7a1577f', 11071, 'Des monstres attaquent la ville', 'https://image.tmdb.org/t/p/w200/xnBN8xgPHtliU0Zd5XLCVEmsbpw.jpg', 1954, NOW());

COMMIT;

-- Movie: Kaulayaw
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 'Kaulayaw', 'Kaulayaw', 2024, 'Iar Arondaing', ARRAY[], '0h48min', ARRAY['Drame'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/yNoRbxLHJ820AJUm4ktresuXrE.jpg', 'https://image.tmdb.org/t/p/original/aJxmgoNtP2BH7mRYvuf7AHB0VC3.jpg', ARRAY[], 'film', 86.6028, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('a4dff53c-af3b-4f3b-91b8-92965334faf4', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 1302007, 'https://image.tmdb.org/t/p/original/aJxmgoNtP2BH7mRYvuf7AHB0VC3.jpg', 'https://image.tmdb.org/t/p/w500/yNoRbxLHJ820AJUm4ktresuXrE.jpg', 5.8, 6, NULL, '', 48, '2024-07-18', 'tl', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('44e264f3-d099-4037-b6e4-ed0cede191e0', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 3582449, 'Micaella Raz', 'Ella', 'https://image.tmdb.org/t/p/w200/xJqsMSJT9D7ggk1LT9oVu2qcdcg.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('350f5d6d-580e-45dd-a323-f6e34c9efaa0', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 3972818, 'Matthew Francisco', 'Migo', 'https://image.tmdb.org/t/p/w200/535hNSYytvErtSeKlhQJn52M5f4.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b8c9940e-5a05-48a4-8203-cc79429140f5', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 3371806, 'Robb Guinto', 'Cara', 'https://image.tmdb.org/t/p/w200/raZt6SwyqxdpuMvBwnnrvvNaazq.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('10f99975-1930-4e2b-8fdd-696afd726ce3', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 4935805, 'Adelaide Sojo', 'Melody', NULL, 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('93377286-0705-4b8a-96bf-0374b3744438', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 5053579, 'Dante Navat', 'School Admin 1', NULL, 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4f961caf-4303-4bd0-b1cc-7105b551c0ea', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 5053580, 'Jolly Jamero', 'School Admin 2', NULL, 5, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3ed81548-fb1f-4ac7-a028-533a0f03f2b7', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 609261, 'Falsettos', 'https://image.tmdb.org/t/p/w200/tvXJ7ACfNisHqeEIIsgWc8bhpm7.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('455cefe5-0770-40e9-9761-d24a68f4ace4', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 796234, 'ひらいて', 'https://image.tmdb.org/t/p/w200/mkcNjbulu2yTul7TcOY0PSKlTRk.jpg', 2021, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('84d6b699-07db-478c-84cc-873e7b85f9cc', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 610759, 'The Sympathy Card', 'https://image.tmdb.org/t/p/w200/hCYMQtd9EDrJFNAZ4IGe1qm2PNM.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c8d7daae-9947-4fa4-8489-75a64b874707', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 258480, 'Carol', 'https://image.tmdb.org/t/p/w200/jD3HZaNeolV5Y1cAoQP1Wkd233f.jpg', 2015, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7121037a-539b-4716-856a-53ca21d99b9b', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 434714, 'My days of Mercy', 'https://image.tmdb.org/t/p/w200/adIPKAoKnKL9vCTkvfF4J9ZA7Ln.jpg', 2018, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8beebefb-ffc4-4738-9cff-cb07e40756c4', '0f1bae04-78ac-43f3-9fe2-7e009d7e2478', 1523652, 'Trianggulo', 'https://image.tmdb.org/t/p/w200/xSc0HZHVZlnKPu2BNxCxGlWfqHc.jpg', 2025, NOW());

COMMIT;

-- Movie: Real Steel
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('b7838567-31c3-48fe-8b19-6cf910af2773', 'Real Steel', 'Real Steel', 2011, 'Shawn Levy', ARRAY['John Gatins'], '2h7min', ARRAY['Action', 'Science-Fiction', 'Drame'], 'Dans un futur proche, la boxe a évolué pour devenir un sport high-tech. Charlie Kenton, un ancien boxeur, a perdu toute chance de remporter le championnat depuis que les humains ont été remplacés sur le ring par des robots d’acier de 900 kilos et de 2,40 m de haut. À présent, il n’est plus qu’un manager minable qui utilise des robots bas de gamme fabriqués à partir de pièces de récupération. Il gagne juste assez pour survivre d’un combat à l’autre. Lorsque Charlie touche le fond, il accepte à contrecœur de faire équipe avec son fils Max, qu’il a perdu de vue depuis des années, pour construire et entraîner un champion. Dans l’arène où tous les coups sont permis, les enjeux sont plus élevés qu’ils ne l’ont jamais été. Contre toute attente, Charlie et Max ont une chance, une seule, de faire leur grand retour…', '', 'https://image.tmdb.org/t/p/w200/uZ40wDFzxPmzROJl9KxPgEGv9ME.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/ebV1lxTaLBS1Vk1ihHCVhhdg03X.jpg', 'https://image.tmdb.org/t/p/original/pjlxrd646cBYznHoPBWTzz6FujX.jpg', ARRAY[], 'film', 66.6994, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('58219c32-e763-4371-9556-79155f02b852', 'b7838567-31c3-48fe-8b19-6cf910af2773', 39254, 'https://image.tmdb.org/t/p/original/pjlxrd646cBYznHoPBWTzz6FujX.jpg', 'https://image.tmdb.org/t/p/w500/ebV1lxTaLBS1Vk1ihHCVhhdg03X.jpg', 7.093, 9155, 'Le courage est plus robuste que l''acier.', 'Dans un futur proche, la boxe a évolué pour devenir un sport high-tech. Charlie Kenton, un ancien boxeur, a perdu toute chance de remporter le championnat depuis que les humains ont été remplacés sur le ring par des robots d’acier de 900 kilos et de 2,40 m de haut. À présent, il n’est plus qu’un manager minable qui utilise des robots bas de gamme fabriqués à partir de pièces de récupération. Il gagne juste assez pour survivre d’un combat à l’autre. Lorsque Charlie touche le fond, il accepte à contrecœur de faire équipe avec son fils Max, qu’il a perdu de vue depuis des années, pour construire et entraîner un champion. Dans l’arène où tous les coups sont permis, les enjeux sont plus élevés qu’ils ne l’ont jamais été. Contre toute attente, Charlie et Max ont une chance, une seule, de faire leur grand retour…', 127, '2011-09-28', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('00819c6b-7ca3-4f98-8285-ab242c820382', 'b7838567-31c3-48fe-8b19-6cf910af2773', 6968, 'Hugh Jackman', 'Charlie Kenton', 'https://image.tmdb.org/t/p/w200/oX6CpXmnXCHLyqsa4NEed1DZAKx.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('556497b9-1523-4d0a-be04-b268cdfade17', 'b7838567-31c3-48fe-8b19-6cf910af2773', 234479, 'Dakota Goyo', 'Max Kenton', 'https://image.tmdb.org/t/p/w200/xHfxZDILa8JRZu5OoaXKiDa781o.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0b1e0b6a-9c71-49cc-b2ee-ffa0dcd94ffb', 'b7838567-31c3-48fe-8b19-6cf910af2773', 19034, 'Evangeline Lilly', 'Bailey Tallet', 'https://image.tmdb.org/t/p/w200/pJHX2jd7ytre3NQbF9nlyWUqxH3.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e61725ad-3b7a-406b-be1d-c6f4e0544a4e', 'b7838567-31c3-48fe-8b19-6cf910af2773', 79072, 'Kevin Durand', 'Ricky', 'https://image.tmdb.org/t/p/w200/hINvryvce5tpod6kTnUg9ZTH8wg.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d43129a8-32ea-4943-91e9-0ea2bc922ebd', 'b7838567-31c3-48fe-8b19-6cf910af2773', 53650, 'Anthony Mackie', 'Finn', 'https://image.tmdb.org/t/p/w200/kfTwOYr3iUucmYz8kPjhYy07G2Z.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f481afa5-4a88-44c0-a199-b9997f8f1bcf', 'b7838567-31c3-48fe-8b19-6cf910af2773', 15250, 'Hope Davis', 'Aunt Debra', 'https://image.tmdb.org/t/p/w200/dJb76YQDFmfJ6ptlvBvx0ZBP44C.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('10ea96ab-e09f-44d1-97c9-6ea108dfa08a', 'b7838567-31c3-48fe-8b19-6cf910af2773', 8986, 'James Rebhorn', 'Marvin', 'https://image.tmdb.org/t/p/w200/jRdR3q28gTPQU6eWRgiIqzGuMKU.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8112b121-7b76-4d30-b810-83403f977bb8', 'b7838567-31c3-48fe-8b19-6cf910af2773', 19860, 'Karl Yune', 'Tak Mashido', 'https://image.tmdb.org/t/p/w200/4GI4p5aPfW0vI20IdJOcxD5BEqr.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c4763db3-b01d-4e19-a7ed-11062efdc8d8', 'b7838567-31c3-48fe-8b19-6cf910af2773', 1126350, 'Sophie Levy', 'Big Sister', 'https://image.tmdb.org/t/p/w200/ytDkZ3NrpxWayURhHuI2Dtp29TM.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2c8a9491-70d1-4b4f-9efb-209068e8608b', 'b7838567-31c3-48fe-8b19-6cf910af2773', 1126351, 'Tess Levy', 'Little Sister', 'https://image.tmdb.org/t/p/w200/xHNZkN4KhVa4ehiHnmJy6MeHia7.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('55040756-1458-4bd8-b579-3ac5252ae372', 'b7838567-31c3-48fe-8b19-6cf910af2773', 1356234, 'Sunny Edwards vs. Galal Yafai', 'https://image.tmdb.org/t/p/w200/quJvXFi8Zpjtjcu7WoJRbFn0gqG.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2354afb8-446b-49dc-ba08-5929ab36f184', 'b7838567-31c3-48fe-8b19-6cf910af2773', 8842, 'Dans les cordes', 'https://image.tmdb.org/t/p/w200/e3CBjs3YZGlcPG88QF4lkj3JA9o.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8ecc98c7-84ba-4060-811c-d43db7ac043d', 'b7838567-31c3-48fe-8b19-6cf910af2773', 8903, 'My Magic', 'https://image.tmdb.org/t/p/w200/AXnfXfaKUV2a9M5QPXncZoqLfq.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('733c6150-670f-468f-be17-8275e5065843', 'b7838567-31c3-48fe-8b19-6cf910af2773', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6a35dc41-3c1d-462f-9e33-5465d79df19e', 'b7838567-31c3-48fe-8b19-6cf910af2773', 8967, 'The Tree of Life', 'https://image.tmdb.org/t/p/w200/y47kUz3IYdoxKyscG6Bc6EPo59k.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6aa913df-93c6-4562-b54b-4c0eb8159def', 'b7838567-31c3-48fe-8b19-6cf910af2773', 8981, 'Cher Frankie', 'https://image.tmdb.org/t/p/w200/jIh8X4FiYXjMbTAfxr6eyedN6hF.jpg', 2004, NOW());

COMMIT;

-- ==========================================
-- IMPORT SUMMARY
-- Successfully processed: 50 movies
-- Failed: 0 movies
-- ==========================================
-- ✅ Setup complete! Your tables are created and 50 movies are imported.
-- 🎬 Run this SQL in Supabase SQL Editor and your app will have movies!
