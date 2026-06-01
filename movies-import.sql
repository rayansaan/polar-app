-- ==========================================
-- POLAR APP - MOVIE IMPORT SQL
-- Generated: 2026-06-01T09:59:46.116Z
-- Target: 50 popular movies from TMDB
-- ==========================================

-- WARNING: Run this in Supabase SQL Editor
-- This will insert 50 movies with TMDB data

-- First, clear existing data if needed:
-- DELETE FROM tmdb_similar; DELETE FROM tmdb_cast; DELETE FROM tmdb_cache; DELETE FROM movies;

-- Movie: Le Réveil de la Momie
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 'Le Réveil de la Momie', 'Lee Cronin''s The Mummy', 2026, 'Lee Cronin', ARRAY['Lee Cronin'], '2h13min', ARRAY['Horreur', 'Mystère'], 'Une jeune fille disparue dans le désert égyptien réapparaît mystérieusement huit ans plus tard. Mais les retrouvailles tournent vite au cauchemar. Alors que son comportement devient de plus en plus inquiétant, sa famille se lance dans une course contre la montre pour comprendre l’origine du mal. Ce qu’ils vont découvrir dépasse tout ce qu’ils imaginaient.', '', 'https://image.tmdb.org/t/p/w200/qRJgpkLTXE1EkmmHvmD4AnvrFap.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/f77yGBGOjainowvlGHU70CCQrjV.jpg', 'https://image.tmdb.org/t/p/original/xugEpZk9YQ0DIz1aFvH5HGkqpZK.jpg', ARRAY[], 'film', 583.1981, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('99a74606-c42a-434e-8fc3-4f083f3b83f6', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1304313, 'https://image.tmdb.org/t/p/original/xugEpZk9YQ0DIz1aFvH5HGkqpZK.jpg', 'https://image.tmdb.org/t/p/w500/f77yGBGOjainowvlGHU70CCQrjV.jpg', 8.1, 1465, 'Certains sommeils ne devraient jamais être troublés.', 'Une jeune fille disparue dans le désert égyptien réapparaît mystérieusement huit ans plus tard. Mais les retrouvailles tournent vite au cauchemar. Alors que son comportement devient de plus en plus inquiétant, sa famille se lance dans une course contre la montre pour comprendre l’origine du mal. Ce qu’ils vont découvrir dépasse tout ce qu’ils imaginaient.', 133, '2026-04-15', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e2a5af52-5bc8-433d-ad99-a296294c9660', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1007683, 'Jack Reynor', 'Charlie Cannon', 'https://image.tmdb.org/t/p/w200/ti7IuuwBP66kntCCp6t38xzOcT4.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b7d40117-62e8-4f5f-b03e-bbe5f3d103fa', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1425019, 'Laia Costa', 'Larissa Cannon', 'https://image.tmdb.org/t/p/w200/kSbdpHWLlfzvOfZKJ0dgP0ieVL6.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('85cba79d-e456-44a9-bbde-04b155345fa7', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1952051, 'May Calamawy', 'Detective Dalia Zaki', 'https://image.tmdb.org/t/p/w200/5S3nNkH5p85xK7k7AaXBZ0ouyOR.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b533567b-1632-4e27-b3c2-db36719b901f', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 3524429, 'Natalie Grace', 'Katie Cannon', 'https://image.tmdb.org/t/p/w200/uoJRUulO6A9By4IhNrDdiKevAOj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5ef8e643-76ad-4918-bdf0-6fdc607c3369', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 2886183, 'Shylo Molina', 'Sebastián Cannon', 'https://image.tmdb.org/t/p/w200/rIhBsRY6c7B4ClLOJbc4qEWter1.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e491900f-bf6a-4391-ad83-38e940d24210', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 3768556, 'Billie Roy', 'Maud Cannon', 'https://image.tmdb.org/t/p/w200/criWuHntMq5c6Duv505NApONwUu.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ce292a16-a227-40ba-9aea-0fba6ea9337e', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1029593, 'Veronica Falcón', 'Carmen Santiago', 'https://image.tmdb.org/t/p/w200/8zRSwWfrDnHleSRDtIeHYuAVmFK.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('82b3896d-a18d-4fa9-8e29-5a30501240e0', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1743875, 'Hayat Kamille', 'The Magician', 'https://image.tmdb.org/t/p/w200/ftzaSEGIEn5uLHy8U7uQrXC7SZc.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('185ddf21-9fb6-4aec-bbf7-a6b64c65150e', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 1850319, 'مي الغيطي', 'Layla Khalil', 'https://image.tmdb.org/t/p/w200/dFpkIOfCrUVIASpN5wutX1OaYls.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4c295aad-c599-4a8f-a6c0-a891726fc32d', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 3543561, 'Emily Mitchell', 'Young Katie Cannon', 'https://image.tmdb.org/t/p/w200/ehxuJhPwCo0M84SdD6k6cYsKFfs.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d08e3003-76a7-4e3d-8e43-888b0c1d3e3b', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 791, 'Fog', 'https://image.tmdb.org/t/p/w200/3Yz96T2B6MUN1Lug9zv8yjBZwo0.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2bda6bfb-3604-47fb-a3ea-d6c83704e668', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 609396, 'Kuntilanak Kesurupan', 'https://image.tmdb.org/t/p/w200/7rRcyL9c4WXE2t1FT40MkpK3ju5.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1517efe8-17e5-48c8-a9a2-205a8b9499b8', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('48b49e58-9365-468e-ae39-a7ef93dad6a5', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 806, '666, La Malédiction', 'https://image.tmdb.org/t/p/w200/gvioI0mQrIYK0FyIKJF23tfp3kS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('20401aad-ec52-4801-958f-798ae2886ac6', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 256457, 'মিশর রহস্য', 'https://image.tmdb.org/t/p/w200/22NlvhCvIfIuoztBLIWjzwUSvts.jpg', 2013, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bfbd3d5a-4c21-45af-b57d-70ec6b20611e', '0291f4e5-a69f-4c7a-8cd9-2cf1cf06d2fa', 807, 'Seven', 'https://image.tmdb.org/t/p/w200/to6jUaLJonMuKW2YovtWfQKtLYP.jpg', 1995, NOW());

COMMIT;

-- Movie: Obsession
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ef794151-7b7d-4907-a5bc-89b9b8d95c91', 'Obsession', 'Obsession', 2026, 'Curry Barker', ARRAY['Curry Barker'], '1h48min', ARRAY['Horreur'], 'Et si vous pouviez réaliser votre rêve le plus fou ? Un jeune introverti met la main sur un objet magique capable d’exaucer n’importe quel souhait. Son crush de toujours tombe alors raide dingue de lui… jusqu’à l’obsession la plus totale. Faites attention à ce que vous souhaitez !', '', 'https://image.tmdb.org/t/p/w200/4rn1gS0tbVghrT4kQ4tiLLV0Q19.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/mDCR1frpUvGfIKksuM440VLb7X9.jpg', 'https://image.tmdb.org/t/p/original/rZfmzpixLKLR3Hg2u0WgC7XLFl8.jpg', ARRAY[], 'film', 501.5672, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('f82aad49-fd20-43f5-99bc-c06ff0171e69', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 1339713, 'https://image.tmdb.org/t/p/original/rZfmzpixLKLR3Hg2u0WgC7XLFl8.jpg', 'https://image.tmdb.org/t/p/w500/mDCR1frpUvGfIKksuM440VLb7X9.jpg', 8, 395, 'Votre relation est toxique ? La leur est mortelle.', 'Et si vous pouviez réaliser votre rêve le plus fou ? Un jeune introverti met la main sur un objet magique capable d’exaucer n’importe quel souhait. Son crush de toujours tombe alors raide dingue de lui… jusqu’à l’obsession la plus totale. Faites attention à ce que vous souhaitez !', 108, '2026-05-13', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c7c7adaa-358f-413e-9d94-0d81df6b10df', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 1561370, 'Michael Johnston', 'Baron ''Bear'' Bailey', 'https://image.tmdb.org/t/p/w200/fbpcCkBzu43kMdlXxEAMuLhseL8.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('150f1393-7b1e-41e8-9f4b-544e9e46bc8a', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 2638587, 'Inde Navarrette', 'Nikki Freeman', 'https://image.tmdb.org/t/p/w200/hmW22IiOwH0ukCynzSEpWIFjNPg.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ecb2a398-de49-4e38-b0bf-f59db60f67e2', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 2823609, 'Cooper Tomlinson', 'Ian', 'https://image.tmdb.org/t/p/w200/AbWgkjy3wT9Z9OidWdpZZdoONXa.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bc0acf2f-152a-43c2-ad92-127e004891d4', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 1519711, 'Megan Lawless', 'Sarah Harper', 'https://image.tmdb.org/t/p/w200/5HJ5NvEXxQAQCr8KJb3vaByS4AZ.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('544aed89-c262-4a6f-ade5-8aafc9a13e68', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 28637, 'Andy Richter', 'Carter', 'https://image.tmdb.org/t/p/w200/qazhLkyKOsPmdOQSaUWWbbUjs9q.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f45967cf-7455-4bdf-a679-7b3ffeb50f4e', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 3095494, 'Haley Fitzgerald', 'Viola', 'https://image.tmdb.org/t/p/w200/tdwhaT8jpQ7tIZDUxtlOPzy1HKJ.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e6f90790-5c16-4918-8dc8-c0395e258d43', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 1352948, 'Darin Toonder', 'Harry', 'https://image.tmdb.org/t/p/w200/bD7Y9T7Y6XwDXjGJ8Suabyt1ZGo.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('66c7e62e-ced3-4a86-acf4-2d178333af1a', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 4030428, 'Anthony Pavone', 'Reggie', 'https://image.tmdb.org/t/p/w200/hxiqY9gHgwXGYnXSD11Wacm5Nmi.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('33eace4d-6b80-470c-9200-361da357ad30', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 3592074, 'Justice', 'Joe', 'https://image.tmdb.org/t/p/w200/YFxKf2HHJvyavQf54NO5wXFOJX.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('663b4651-0f8f-4fd7-ba9e-858decd614c5', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 5618033, 'Anthony Casabianca', 'Chris', 'https://image.tmdb.org/t/p/w200/xNJUKqKQhMeyZ74erQvETr3AqV0.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f45f500b-afad-4e72-8a9e-2110679619ba', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 8852, 'Prince des ténèbres', 'https://image.tmdb.org/t/p/w200/t45gnyhKHykEj3kf12rgpL6bscP.jpg', 1987, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1c7dbb5e-8927-4d74-b0b5-a10d8a2bda41', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 1356355, 'Cin Daveti', 'https://image.tmdb.org/t/p/w200/lVhbGXvRPLalnoGU5mgUC9DAqVB.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f5713d90-cfa3-4f58-b12e-1b43c9a762ef', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 986859, 'Houndz from Hell', 'https://image.tmdb.org/t/p/w200/gyDlE8w2METkIR0itVkAuF25RJ0.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3cbc64df-8f68-42eb-b117-94dd61be9eb6', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 8973, 'Le Maître des illusions', 'https://image.tmdb.org/t/p/w200/mV3nUHTH18E0tSUFUnuyrwBMH2V.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ee4a3ef8-284d-42f0-967d-05eaa7ad9bbb', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 986990, 'Jack Be Nimble', 'https://image.tmdb.org/t/p/w200/DSgTrmgkZYm8WwT45vUwcGDcUg.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b5fe55c6-90bc-4cfd-b5e4-7edf69c40d35', 'ef794151-7b7d-4907-a5bc-89b9b8d95c91', 9064, 'Hellraiser 2 : Les Écorchés', 'https://image.tmdb.org/t/p/w200/ri6BfqkQjvznrMPbhCdNonng1Qn.jpg', 1988, NOW());

COMMIT;

-- Movie: Jack Ryan de Tom Clancy : Guerre Fantôme
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ac7bc7e5-f8dc-4305-8673-03cac776d064', 'Jack Ryan de Tom Clancy : Guerre Fantôme', 'Tom Clancy''s Jack Ryan: Ghost War', 2026, 'Andrew Bernstein', ARRAY['Aaron Rabin', 'John Krasinski'], '1h43min', ARRAY['Action', 'Thriller'], 'Jack Ryan doit malgré lui replonger dans le monde de l''espionnage quand une opération secrète met au jour une conspiration mortelle. Tandis que chaque seconde compte, il est rejoint par Mike November et James Greer de la CIA, ainsi que par Emma Marlowe, agent chevronné du MI6. Ils affrontent une unité clandestine dans une lutte à haut risque et aux implications personnelles.', '', 'https://image.tmdb.org/t/p/w200/5Q4t7rtpHtp0vfstpQzug1KGZgS.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/zR4RAnv4s6zpXhiqepdonAw4oF3.jpg', 'https://image.tmdb.org/t/p/original/dd31qJxOarrHyGZwYsCzOjobQzP.jpg', ARRAY[], 'film', 368.4056, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('930582ea-8d62-469c-b317-2b64d0cdbe3c', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 1380291, 'https://image.tmdb.org/t/p/original/dd31qJxOarrHyGZwYsCzOjobQzP.jpg', 'https://image.tmdb.org/t/p/w500/zR4RAnv4s6zpXhiqepdonAw4oF3.jpg', 7.167, 425, 'Jack Ryan est de retour.', 'Jack Ryan doit malgré lui replonger dans le monde de l''espionnage quand une opération secrète met au jour une conspiration mortelle. Tandis que chaque seconde compte, il est rejoint par Mike November et James Greer de la CIA, ainsi que par Emma Marlowe, agent chevronné du MI6. Ils affrontent une unité clandestine dans une lutte à haut risque et aux implications personnelles.', 103, '2026-05-20', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9f1836c3-41dd-4f8d-a04a-605770e60610', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 17697, 'John Krasinski', 'Jack Ryan', 'https://image.tmdb.org/t/p/w200/pmVGDb6Yl6OyFcHVGbu1EYNfyFK.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4cd41520-81b1-4dc0-abab-173435e20a08', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 17859, 'Wendell Pierce', 'James Greer', 'https://image.tmdb.org/t/p/w200/r6yKahL6Z8l9aUX5qvWxTmWl8Nm.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9b4196c4-e1ce-477f-99e4-14267635f58f', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 23459, 'Sienna Miller', 'Emma Marlowe', 'https://image.tmdb.org/t/p/w200/ygv1xVsgLlfCG1DJD0cuRmZqM1V.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a1f54119-8f06-4939-9647-d543a0083a9b', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 50217, 'Michael Kelly', 'Mike November', 'https://image.tmdb.org/t/p/w200/6MI8HhX1GWbcrWG8DiHffzmqaVm.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9a3c2e6f-0cab-4342-bf0d-1dd3f8cbfd27', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 66587, 'Max Beesley', 'Liam Crown', 'https://image.tmdb.org/t/p/w200/kUBoZ4cMo1i6ojBci0VMznmbn9y.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f1deb0af-39ec-462d-b9d7-6b36299de544', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 1660452, 'Betty Gabriel', 'Elizabeth Wright', 'https://image.tmdb.org/t/p/w200/n67i3H3VM5quDQfcS591EbotPby.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c7908fb8-fe76-488b-904e-5b41a117051b', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 30710, 'JJ Feild', 'Andrew Spear', 'https://image.tmdb.org/t/p/w200/8YIIH6ebWmIhWWJC3RGe16Z1biK.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('783e171b-69dc-41c7-bcc6-4fed1510580e', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 80149, 'Douglas Hodge', 'Nigel Cooke', 'https://image.tmdb.org/t/p/w200/tENL3Uxt07Rn21o0y0eolwTnkoZ.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7a61a041-af35-4ef1-9335-b9b15061d822', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 109874, 'Dominic Mafham', 'MI6 Chief Arnold', 'https://image.tmdb.org/t/p/w200/9IgOMf8JOu3m3tz7yHbXCn5nMCJ.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('17f81d54-d3b1-4d27-82e2-402cc01cf478', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 2303015, 'Alex Brockdorff', 'Mark Whitaker', 'https://image.tmdb.org/t/p/w200/8sf9EUU4oLOhIdJKdAPyZ5Psvch.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('94df576d-cf8d-4406-8954-fcf9f90aa4b3', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 682, 'L''Homme au pistolet d''or', 'https://image.tmdb.org/t/p/w200/rWWtStXei0hjNElbtM0J28trLcO.jpg', 1974, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('378aaaef-68c9-49fa-a95f-af2ca7d7804a', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 956, 'Mission : Impossible 3', 'https://image.tmdb.org/t/p/w200/wlesOljZycfrbBCdJLdmumSiNYT.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d84b7fc6-52eb-4cff-b4c1-adb7627d3b7c', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 7442, 'Les Nuits avec mon ennemi', 'https://image.tmdb.org/t/p/w200/mngI4Le3f5fudZj4qApeMWwBOFJ.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('27a23bb6-a874-4d02-8e73-99bfd5771dd9', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 7459, 'Speed Racer', 'https://image.tmdb.org/t/p/w200/hpCPT2V1UjBSOqxbTrPGsYLDRgC.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('498f5514-a4cd-4375-91dd-e6fb28e2ac6d', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 2124, 'Color of Night', 'https://image.tmdb.org/t/p/w200/wkkmt0u8Qz48Wa8CCgPtpiqzImP.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ba0a3312-4957-4eb3-87d5-2862683315f0', 'ac7bc7e5-f8dc-4305-8673-03cac776d064', 258654, 'Un paraíso para los malditos', 'https://image.tmdb.org/t/p/w200/uAxUy8jxLuThQEkyviIxfN62Ejq.jpg', 2013, NOW());

COMMIT;

-- Movie: The Punisher : One Last Kill
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('fab98836-87be-484f-b9ef-e52425d1d825', 'The Punisher : One Last Kill', 'The Punisher: One Last Kill', 2026, 'Reinaldo Marcus Green', ARRAY['Reinaldo Marcus Green', 'Jon Bernthal'], '0h51min', ARRAY['Action', 'Drame', 'Crime'], 'Alors que Frank Castle cherche un sens à sa vie au-delà de la vengeance, il replonge contre toute attente au cœur du combat.', '', 'https://image.tmdb.org/t/p/w200/w47y7ptzGc4jNyHuXflqkDRruQ8.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/74VbBYHmpjgeES1zkRo1DwHkWnE.jpg', 'https://image.tmdb.org/t/p/original/qO55CD8tgVL1T4WKn6zYFFiD6lL.jpg', ARRAY[], 'film', 314.4766, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('2e31ea41-63c8-4072-b908-f976b72b9f72', 'fab98836-87be-484f-b9ef-e52425d1d825', 1439930, 'https://image.tmdb.org/t/p/original/qO55CD8tgVL1T4WKn6zYFFiD6lL.jpg', 'https://image.tmdb.org/t/p/w500/74VbBYHmpjgeES1zkRo1DwHkWnE.jpg', 8.401, 1357, NULL, 'Alors que Frank Castle cherche un sens à sa vie au-delà de la vengeance, il replonge contre toute attente au cœur du combat.', 51, '2026-05-12', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b6c78d78-6866-49d2-95a2-468591c4f96c', 'fab98836-87be-484f-b9ef-e52425d1d825', 19498, 'Jon Bernthal', 'Frank Castle', 'https://image.tmdb.org/t/p/w200/o0t6EVkJOrFAjESDilZUlf46IbQ.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('52384a50-f7ea-4b18-9d19-78c63fb95296', 'fab98836-87be-484f-b9ef-e52425d1d825', 212154, 'Deborah Ann Woll', 'Karen Page', 'https://image.tmdb.org/t/p/w200/btTnyvRLXOH0pz2SLBwyKbmnFhX.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4c289e76-ea34-4a7f-a7ec-19626001c6e9', 'fab98836-87be-484f-b9ef-e52425d1d825', 555252, 'Jason R. Moore', 'Curtis Hoyle', 'https://image.tmdb.org/t/p/w200/5VJ0dTa1aZRf3mQJrHJ56Pf42dP.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3ac7ab69-0632-4a9b-a2da-11a3942cf647', 'fab98836-87be-484f-b9ef-e52425d1d825', 80415, 'Judith Light', 'Ma', 'https://image.tmdb.org/t/p/w200/zwgc0ZT8LNIfW7gDbuOFKNtTGIj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9bb1bde9-6895-4777-8537-c08a73c9cd29', 'fab98836-87be-484f-b9ef-e52425d1d825', 968851, 'Kelli Barrett', 'Maria Castle', 'https://image.tmdb.org/t/p/w200/oFY6w4H6zEx1FDOXEXmCINnlcap.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('85ee787c-ceee-4fff-a27a-328f0189f50f', 'fab98836-87be-484f-b9ef-e52425d1d825', 74957, 'Andre Royo', 'Dre', 'https://image.tmdb.org/t/p/w200/tJzftaUtVvZs2RkFt2iQlQ5QWEh.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f1198644-fa0d-4ccd-abb2-992a09025dec', 'fab98836-87be-484f-b9ef-e52425d1d825', 1218156, 'John Douglas Thompson', 'Old Vet', 'https://image.tmdb.org/t/p/w200/ieN9RkPSnsdaXWjarOhXkl4Jofm.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7451a0db-b14e-4cba-b2e8-a15e35ec8543', 'fab98836-87be-484f-b9ef-e52425d1d825', 6194326, 'Colton Hill', 'Colton Hill', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f241adf6-d0ce-4ebb-b3f8-c012b2c543b2', 'fab98836-87be-484f-b9ef-e52425d1d825', 6194324, 'Nick Koumalatsos', 'Nick Koumalatsos', 'https://image.tmdb.org/t/p/w200/oy3dWuITzLcBn1yyyzfYSMVpHK2.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('92b991a1-0d32-483c-a763-6bc3ed098a0e', 'fab98836-87be-484f-b9ef-e52425d1d825', 5243473, 'Addie Bernthal', 'Lisa', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4c1c0f0e-e2c2-4f12-a43f-a4bfe3c655e1', 'fab98836-87be-484f-b9ef-e52425d1d825', 11006, 'Cours après moi shérif', 'https://image.tmdb.org/t/p/w200/tCNGaZ3wRk5f0ZtikPSjVOSAnYk.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bcbd5f6e-1fa1-4560-bf86-fff39b46cfc1', 'fab98836-87be-484f-b9ef-e52425d1d825', 441715, '仮面ライダー対じごく大使', 'https://image.tmdb.org/t/p/w200/4CaPxi9194eP4PodKT9zfu91Yhy.jpg', 1972, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8c64f4a2-a8e5-46fd-b47b-658c27f5f717', 'fab98836-87be-484f-b9ef-e52425d1d825', 11253, 'Hellboy II : Les Légions d''or maudites', 'https://image.tmdb.org/t/p/w200/jZpAA1xTEg3epKSbE1o75vtab01.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4dfb6ed9-3ca8-4992-a56c-eff05efc364e', 'fab98836-87be-484f-b9ef-e52425d1d825', 11443, 'Génération sacrifiée', 'https://image.tmdb.org/t/p/w200/2jAWIYA99TaQvxz3i7sGmpOD51f.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ac7827e5-828d-4ee4-bd43-37a390359f1e', 'fab98836-87be-484f-b9ef-e52425d1d825', 11636, 'New Police Story', 'https://image.tmdb.org/t/p/w200/j0WLhJpaVS0t0HTmeq1C7bAlxGM.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2237779d-8936-4466-85da-a035667912e3', 'fab98836-87be-484f-b9ef-e52425d1d825', 11645, 'Ran', 'https://image.tmdb.org/t/p/w200/oEYHiurGitubeMjspRZ16H3hyoe.jpg', 1985, NOW());

COMMIT;

-- Movie: Projet Dernière Chance
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e4e2838f-8676-42f0-940e-8fd741806a2b', 'Projet Dernière Chance', 'Project Hail Mary', 2026, 'Phil Lord', ARRAY['Drew Goddard'], '2h35min', ARRAY['Science-Fiction', 'Aventure'], 'Le professeur de sciences Ryland Grace se réveille à bord d’un vaisseau spatial, à des années-lumière de la Terre, sans aucun souvenir de qui il est ni de la façon dont il est arrivé là. À mesure que sa mémoire lui revient, il commence à découvrir sa mission : résoudre l’énigme d’une mystérieuse substance qui provoque l’extinction du Soleil. Il doit faire appel à ses connaissances scientifiques et ses idées peu orthodoxes pour sauver toute vie sur Terre mais une amitié inattendue pourrait signifier qu’il n’aura pas à accomplir cette tâche seul.', '', 'https://image.tmdb.org/t/p/w200/2MagibFHZxky3FmMubyABUnf4lw.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wzyy8ZrsuHfAt4iz4iH3rT0tdoT.jpg', 'https://image.tmdb.org/t/p/original/2I1OFQJ0L9T0dpU6FobKFWV2PxX.jpg', ARRAY[], 'film', 302.0827, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('2bd0392a-d148-4056-97af-9d1840443174', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 687163, 'https://image.tmdb.org/t/p/original/2I1OFQJ0L9T0dpU6FobKFWV2PxX.jpg', 'https://image.tmdb.org/t/p/w500/wzyy8ZrsuHfAt4iz4iH3rT0tdoT.jpg', 8.643, 4454, 'Croyez en la dernière chance.', 'Le professeur de sciences Ryland Grace se réveille à bord d’un vaisseau spatial, à des années-lumière de la Terre, sans aucun souvenir de qui il est ni de la façon dont il est arrivé là. À mesure que sa mémoire lui revient, il commence à découvrir sa mission : résoudre l’énigme d’une mystérieuse substance qui provoque l’extinction du Soleil. Il doit faire appel à ses connaissances scientifiques et ses idées peu orthodoxes pour sauver toute vie sur Terre mais une amitié inattendue pourrait signifier qu’il n’aura pas à accomplir cette tâche seul.', 155, '2026-03-15', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ac7de15b-b92d-4ef2-87f9-ef797c8798ae', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 30614, 'Ryan Gosling', 'Ryland Grace', 'https://image.tmdb.org/t/p/w200/lyUyVARQKhGxaxy0FbPJCQRpiaW.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fff10bcd-a691-4395-b0cc-93edeae29374', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 7152, 'Sandra Hüller', 'Eva Stratt', 'https://image.tmdb.org/t/p/w200/tORnKU1CvjgXKsaWcYLzrJ5e1ng.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('20494275-6a84-4be4-ac76-574db16348e9', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 2096164, 'James Ortiz', 'Rocky (voice)', 'https://image.tmdb.org/t/p/w200/zYYDXniHb36mjG7xK59r9IoOKvt.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ad59f116-cbb1-45e0-abeb-0cd48bbe6c67', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 2320708, 'Lionel Boyce', 'Carl', 'https://image.tmdb.org/t/p/w200/hpIxX5nkfA3pWCW8rYkEUCSBVyS.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9b7f1a24-affd-4f96-ad91-a8b8a6aa7c7c', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 1454946, 'Milana Vayntrub', 'Olesya Ilyukhina', 'https://image.tmdb.org/t/p/w200/i5Cou9ExwTZvRRtl79V75CsI7oC.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('88e09480-a947-4603-b8ea-2c63829605fb', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 2131, 'Ken Leung', 'Yao', 'https://image.tmdb.org/t/p/w200/hpatUP6u74gkpDRmn9voNY9V43O.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8efc94f7-0202-4d03-94e0-015966daccc4', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 3554544, 'Priya Kansara', 'Mary (voice)', 'https://image.tmdb.org/t/p/w200/zv9kpaQ8AVBfjI2LAAZV58NeVQg.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c80c67b0-963d-4bac-9f97-efcab7b7c24e', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 1749206, 'Mia Soteriou', 'Dr. Browne', 'https://image.tmdb.org/t/p/w200/bU4Twfk4as290gPFouByj7Wjd2.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1b480aeb-cc20-446a-840b-dc36ca6dd560', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 3074054, 'Annelle Olaleye', 'Olivia', 'https://image.tmdb.org/t/p/w200/V0UqW30EQaHjGhwDnb6dT0AWmz.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2774c078-57b1-423b-b5ac-9ffd5271d608', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 6080198, 'Maya Eva Hosein', 'Rekha', 'https://image.tmdb.org/t/p/w200/lDHbsnyUoBzmtbMevNl4F2n8B8B.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bbb1ff96-5d81-43a7-a516-c702eed6b777', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 782, 'Bienvenue à Gattaca', 'https://image.tmdb.org/t/p/w200/a9KIIpkR6sXGHLJiXse9A7p7l9k.jpg', 1997, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1bec781b-ce22-41b7-b81a-19e40db01275', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 840, 'Rencontres du troisième type', 'https://image.tmdb.org/t/p/w200/jznNbJ80WvvlbLdGEjNsvwycDZC.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('04b0ed37-3810-49af-8570-b3c2acbef984', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 841, 'Dune', 'https://image.tmdb.org/t/p/w200/nCFApKqbqRDdGc3YylVf3VsTHcg.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('675a58f9-7f58-4db8-b230-d984938239a8', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 808, 'Shrek', 'https://image.tmdb.org/t/p/w200/rJIju4i2sENrfTbAXwL9OKv2e1i.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f5f21674-0170-4144-8723-97961e8ff3ba', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 830, 'Planète interdite', 'https://image.tmdb.org/t/p/w200/pNeL8XwQTjN0HcFdDOcq7tfQabz.jpg', 1956, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d46f290a-591b-4082-85be-f13ba7304889', 'e4e2838f-8676-42f0-940e-8fd741806a2b', 831, 'Les Survivants De l''Infini', 'https://image.tmdb.org/t/p/w200/eKVTZqBSNnoG0KBz3vhLNXQ2iT9.jpg', 1955, NOW());

COMMIT;

-- Movie: Super Mario Galaxy, le film
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e0e25974-6853-4d7a-9ace-a6f9514230e8', 'Super Mario Galaxy, le film', 'The Super Mario Galaxy Movie', 2026, 'Aaron Horvath', ARRAY['Matthew Fogel'], '1h40min', ARRAY['Familial', 'Comédie', 'Aventure', 'Fantastique', 'Animation'], 'Mario et Luigi gèrent les tracas du royaume Champignon, se lient d''amitié avec Yoshi, tentent de réhabiliter mini-Bowser et se préparent pour l''anniversaire de Peach. Mais quand un appel à l''aide arrive de l''autre bout de la galaxie, l''équipe part découvrir des mondes nouveaux, des menaces inattendues et des personnages emblématiques, comme Rosalina et Bowser Jr.', '', 'https://image.tmdb.org/t/p/w200/6AOmWzdJas3xh0xJOk1mHPstNs2.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/aSQktALDmbunDbwkuZbZFMEWVFr.jpg', 'https://image.tmdb.org/t/p/original/9Z2uDYXqJrlmePznQQJhL6d92Rq.jpg', ARRAY[], 'film', 289.9814, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('a791b5e8-62ee-493f-ac41-7da89356f19d', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 1226863, 'https://image.tmdb.org/t/p/original/9Z2uDYXqJrlmePznQQJhL6d92Rq.jpg', 'https://image.tmdb.org/t/p/w500/aSQktALDmbunDbwkuZbZFMEWVFr.jpg', 8.094, 2189, 'La galaxie vous attend.', 'Mario et Luigi gèrent les tracas du royaume Champignon, se lient d''amitié avec Yoshi, tentent de réhabiliter mini-Bowser et se préparent pour l''anniversaire de Peach. Mais quand un appel à l''aide arrive de l''autre bout de la galaxie, l''équipe part découvrir des mondes nouveaux, des menaces inattendues et des personnages emblématiques, comme Rosalina et Bowser Jr.', 100, '2026-04-01', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e42eb14e-2442-42b5-982f-8da9bc79901e', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 73457, 'Chris Pratt', 'Mario (voice)', 'https://image.tmdb.org/t/p/w200/cRH6HPAQ98PlOwwEvhYO4CM9lwu.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0016f358-ca4d-4e8e-ba1a-f48b3ff41c3b', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 1397778, 'Anya Taylor-Joy', 'Princess Peach (voice)', 'https://image.tmdb.org/t/p/w200/jxAbDJWvz4p1hoFpJYG5vY2dQmq.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('094bc7d7-7881-4767-ad5b-7c7f20c91a2b', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 95101, 'Charlie Day', 'Luigi (voice)', 'https://image.tmdb.org/t/p/w200/c0HNhjChGybnHa4eoLyqO4dDu1j.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4ef564e2-ea78-4e0d-87d7-dbbb922de7e2', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 70851, 'Jack Black', 'Bowser (voice)', 'https://image.tmdb.org/t/p/w200/59IhgCtiWI5yTfzPhsjzg7GjCjm.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f7aa3190-66b8-44ff-8e68-bd95beea75d0', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 119589, 'Donald Glover', 'Yoshi (voice)', 'https://image.tmdb.org/t/p/w200/jqVkQfeeEmdga1G0jpBwwXXwwSK.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b3738725-4a95-47ed-bb44-c89e26a5e2e3', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 227564, 'Benny Safdie', 'Bowser Jr. (voice)', 'https://image.tmdb.org/t/p/w200/u10A5DpUYRB1zMF7YoGYcyvhois.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e7d5b492-4b7a-48b0-a672-d01f32a69ba3', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 60073, 'Brie Larson', 'Rosalina (voice)', 'https://image.tmdb.org/t/p/w200/rlbQbpu3tkMAikPWM53VElMUnzR.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f1bd07fd-1d71-4f45-a24b-ab7e4b8f0b13', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 298410, 'Keegan-Michael Key', 'Toad (voice)', 'https://image.tmdb.org/t/p/w200/vAR5gVXRG2Cl6WskXT99wgkAoH8.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fb57b730-bed2-452e-aabe-2001a5ba5a55', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 83271, 'Glen Powell', 'Fox McCloud (voice)', 'https://image.tmdb.org/t/p/w200/fUnIaJkdgvQTztyR1nLeUceSzly.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b260273b-6706-4126-921d-416d1607ba96', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 40481, 'Luis Guzmán', 'Wart (voice)', 'https://image.tmdb.org/t/p/w200/kSdxUckOJj9R5VKrLUnRy14YhNV.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2fd24e8e-170d-43b2-8a64-30cc075bdf99', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 8839, 'Casper', 'https://image.tmdb.org/t/p/w200/pVLoHNIzKRj75YikaKAcj1d96JS.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f0f1485c-a4c6-4b43-8f97-62ac29a134e8', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9ef7e375-1878-4704-9a12-8a765aa8b18b', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 8965, 'Les Énigmes de l''Atlantide', 'https://image.tmdb.org/t/p/w200/mYsFQt0xgBkEUOTbjA4MLRrzaKQ.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('69a53bba-40e3-4b19-8ee0-3ba8d3f84d1e', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 8966, 'Twilight, chapitre 1 : Fascination', 'https://image.tmdb.org/t/p/w200/8phJ4i9m1tBDJbOwwQPvdeWhN2h.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d60260f0-a78f-404e-91f7-e4ebce1aaa57', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 8967, 'The Tree of Life', 'https://image.tmdb.org/t/p/w200/y47kUz3IYdoxKyscG6Bc6EPo59k.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('979afade-09c9-4235-9a6c-2ec6e5dd739b', 'e0e25974-6853-4d7a-9ace-a6f9514230e8', 8986, 'La Surprise', 'https://image.tmdb.org/t/p/w200/od8SCOMLDq4iRYaHNqihQVn1SNE.jpg', 1994, NOW());

COMMIT;

-- Movie: Dhurandhar : The Revenge
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('6c40883a-48ef-423c-ad86-6e44dbdbaf83', 'Dhurandhar : The Revenge', 'धुरंधर: द रिवेंज', 2026, 'Aditya Dhar', ARRAY['Aditya Dhar'], '3h49min', ARRAY['Action', 'Crime', 'Thriller'], 'Hamza Ali Mazari n’existe pas. Derrière ce nom se cache Jaskirat Singh Rangi, infiltré au cœur du monde criminel pakistanais. Sa cible : Majo, un fantôme insaisissable.', '', 'https://image.tmdb.org/t/p/w200/dIZs80xvNgA7VZClECVXIHdaATb.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/hsJG5r6etrMNwW00BVp4NC7zi67.jpg', 'https://image.tmdb.org/t/p/original/gRoZG3Z0zJxgElmTsVHOl2dNYXe.jpg', ARRAY[], 'film', 268.0668, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('5d2ee83e-f1bd-40b6-aeda-65e21de7f75c', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 1582770, 'https://image.tmdb.org/t/p/original/gRoZG3Z0zJxgElmTsVHOl2dNYXe.jpg', 'https://image.tmdb.org/t/p/w500/hsJG5r6etrMNwW00BVp4NC7zi67.jpg', 7.243, 101, 'La vengeance', 'Hamza Ali Mazari n’existe pas. Derrière ce nom se cache Jaskirat Singh Rangi, infiltré au cœur du monde criminel pakistanais. Sa cible : Majo, un fantôme insaisissable.', 229, '2026-03-18', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3db2f7c7-dcd3-4f4d-a007-608402bd7bad', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 224223, 'Ranveer Singh', 'Hamza Ali Mazari / Jaskirat Singh Rangi', 'https://image.tmdb.org/t/p/w200/sRiwLmhduFghJo8U2coUafnDD4C.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f693a4b0-8687-4523-8294-b97cf8da7b23', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 52263, 'Arjun Rampal', 'Major Iqbal', 'https://image.tmdb.org/t/p/w200/1F81WNcVV5cW9O4D5Otk1Y2WHV9.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bade14a3-6701-4884-bd00-ed242fc148e1', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 85519, 'R. Madhavan', 'Ajay Sanyal', 'https://image.tmdb.org/t/p/w200/gaDrAdXxIrbBRCd9cX8YvJDEuLb.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2ca85a69-7cbf-41ef-a9da-64ec519bbbd4', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 85881, 'Sanjay Dutt', 'SP Chaudhary Aslam', 'https://image.tmdb.org/t/p/w200/oq4pnvWhl1HxKpp0KVlSfAr3Tiu.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('984939f6-5dbb-4491-a763-df4e15427f44', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 579817, 'Sara Arjun', 'Yalina Jamali', 'https://image.tmdb.org/t/p/w200/uyZIlCL6xwWlor6JYSmIYUiPE7M.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1d464ab4-2e17-42c1-aed1-135a7e2da588', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 4932268, 'Arjan Panwar', 'Sameer Ahmed', 'https://image.tmdb.org/t/p/w200/zWrCO7GI3tuaEvyA6fgRIMtZOsr.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f5a78b9b-c9c6-4ad2-a49f-171e4ba146c9', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 110200, 'Rakesh Bedi', 'Jameel Jamali', 'https://image.tmdb.org/t/p/w200/dWLCiA3rqnaFPn9s0bk2MiSq5Mt.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4447e5f7-a2f1-4239-afdb-b45e977c8bdb', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 1013936, 'Gaurav Gera', 'Mohammad Aalam', 'https://image.tmdb.org/t/p/w200/l0kOZqfKusxfPp7wvkwDfNYT64K.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('536bdf37-3f86-4402-aad1-49ef633ea9d4', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 4235042, 'Danish Iqbal', 'Dawood Ibrahim', 'https://image.tmdb.org/t/p/w200/tOKa5BhjgtXXxw3IEBq6jRybH95.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9dba0656-90a4-49e9-9fb6-efda3c279bd8', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 4678084, 'Ankit Sagar', 'Javed Khanani', 'https://image.tmdb.org/t/p/w200/bO5OWuAhZRaYohtZnWWOMQDkEWI.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('75b3adab-07eb-4d7f-898d-6df2580b3bda', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 11022, 'Narc', 'https://image.tmdb.org/t/p/w200/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('624ae33d-59f2-4565-98ab-11ab641e5cd7', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 11284, 'La Fin de Freddy : L''Ultime Cauchemar', 'https://image.tmdb.org/t/p/w200/6zNufcJuwlZiGmT7Rr3yq0NK1nU.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('28a5143e-229d-4cc5-8b97-fe3070728228', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 11494, 'Wilderness', 'https://image.tmdb.org/t/p/w200/sLtUVG7ORbTJueTmIWpO4YeHayS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('69a9e76d-d073-46f4-918c-23202be096b3', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 11439, 'The Ghost Writer', 'https://image.tmdb.org/t/p/w200/q8nGQLowTVgvyGsSLoXvrOBntGC.jpg', 2010, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b546b6c2-689c-44b4-bc85-ad6e817249c1', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 11595, '48 heures de plus', 'https://image.tmdb.org/t/p/w200/25fqd9IXlGgco8Yy7Lv7WQuiWPJ.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('dbc77439-6354-45f2-a673-64ae2cad8a80', '6c40883a-48ef-423c-ad86-6e44dbdbaf83', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());

COMMIT;

-- Movie: Backrooms
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('7c7b2b83-e460-463e-9ee8-63ebec06655d', 'Backrooms', 'Backrooms', 2026, 'Kane Parsons', ARRAY['Will Soodik'], '1h50min', ARRAY['Horreur', 'Mystère', 'Science-Fiction'], 'Un jeune cinéaste bascule dans une autre dimension vide et labyrinthique, qui semble abriter des êtres d''un autre monde.', '', 'https://image.tmdb.org/t/p/w200/1G9mbCXR3uSMx6giddQCrC1lOAj.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/thQQ3BBBhGDtWm3UTtabhyDJd8U.jpg', 'https://image.tmdb.org/t/p/original/mCpwRayjXMFzKHbjbzc5JRKfq1O.jpg', ARRAY[], 'film', 273.5711, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('6cf78d37-be54-4c79-a24e-418ac64eace5', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 1083381, 'https://image.tmdb.org/t/p/original/mCpwRayjXMFzKHbjbzc5JRKfq1O.jpg', 'https://image.tmdb.org/t/p/w500/thQQ3BBBhGDtWm3UTtabhyDJd8U.jpg', 6.8, 171, NULL, 'Un jeune cinéaste bascule dans une autre dimension vide et labyrinthique, qui semble abriter des êtres d''un autre monde.', 110, '2026-05-27', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('500416b0-78c5-4aec-b3fd-a463183f0dcc', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 5294, 'Chiwetel Ejiofor', 'Clark', 'https://image.tmdb.org/t/p/w200/kq5DDnqqofoRI0t6ddtRlsJnNPT.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b7eac818-534b-49bb-9a28-fea1560d1f18', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 1576786, 'Renate Reinsve', 'Mary Kline', 'https://image.tmdb.org/t/p/w200/zbsTMhTXHtw84lA9Y9sOjdqYINF.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('71322e89-48ef-483d-ba7f-53ed13dfc55f', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 45407, 'Mark Duplass', 'Phil', 'https://image.tmdb.org/t/p/w200/lRDf99rAfcdqt8Cqk4LsIT7XSD2.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('06e4fbc7-02f3-4e62-bc86-8af5f1789ab1', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 1512452, 'Finn Bennett', 'Robert ''Bobby'' Franklin', 'https://image.tmdb.org/t/p/w200/lPq5n7WreNVtt53obM5hmnAjxeK.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7436719e-8a0e-45ec-8033-7045544f02a9', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 1709431, 'Lukita Maxwell', 'Kathrine ''Kat'' Taylor', 'https://image.tmdb.org/t/p/w200/g5g6XxUAtSdPfsJrSoFkl7vH51d.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1af4120b-fcf7-4445-8c1d-779234b91412', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 212934, 'Avan Jogia', 'Naren Warne', 'https://image.tmdb.org/t/p/w200/7BX0Lg39bHlgtvWZpszTr1YjTAW.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('787f473d-a582-400e-8846-3081096426f3', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 5725467, 'Ember Ambrose', 'Young Mary', 'https://image.tmdb.org/t/p/w200/w7h6l4ltuWaMYanGgzwyhAHGL2y.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f4692f3a-6a57-47b6-8b4e-b9444789819b', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 72482, 'Krista Kosonen', 'Nora Kline', 'https://image.tmdb.org/t/p/w200/7iW2mxbxBgV5sX2y0fSY78lewW4.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('864b446f-809c-483c-9f14-1098093f01a1', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 4848549, 'Robert Bobroczkyi', 'Pirate Clark', 'https://image.tmdb.org/t/p/w200/3SK7NuuBKR5PSJwsQ7HO4qHIM9C.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5f55b4c3-cd89-429b-8dc6-8d0e45b7ef92', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 85503, 'Patrick Baynham', 'Bearded Still Life', 'https://image.tmdb.org/t/p/w200/oa7qvjQOVCAiZimvn2uriwPypxe.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f59b7ad3-99ad-41c8-b80b-058f51df0db3', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 11024, 'Scooby-Doo 2 : Les Monstres se déchaînent', 'https://image.tmdb.org/t/p/w200/uM8lgzmMz0Y2Aqw51kE1F3bUr6q.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('73432312-53f8-4b21-b6fb-a32c9ea24846', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 441918, 'ネットから削除された禁断動画9', 'https://image.tmdb.org/t/p/w200/3nCgQMF4YnPlsHdc4rqiuG4RWeq.jpg', 2013, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0f25af51-93df-4f1c-932e-16775989ab52', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 11587, 'L''Exorciste, la suite', 'https://image.tmdb.org/t/p/w200/1S7igWeo7Ty16FRGWkAZEyDxqar.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f94fd047-82af-46ff-b7cf-ab17b09ddb9a', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 11629, 'Legion of the Dead', 'https://image.tmdb.org/t/p/w200/7altpm0i6xJYN6nT6oN7Thh2TAw.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('10e4fde7-89b9-402d-8b67-a0df7c4cdce1', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 1173214, 'Mama Casserole', 'https://image.tmdb.org/t/p/w200/xvORHniAae8OfHn1k994RwWbASy.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a57d0822-0a46-4a7f-99d7-385a0c0376bb', '7c7b2b83-e460-463e-9ee8-63ebec06655d', 265018, 'Indigenous', 'https://image.tmdb.org/t/p/w200/m4ZzYr8gmjJl56b7v4LxA3tVcc8.jpg', 2014, NOW());

COMMIT;

-- Movie: கர
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('08d059c2-7f96-4999-9e32-b3ff1353a7a8', 'கர', 'கர', 2026, 'Vignesh Raja', ARRAY['Alfred Prakash', 'Vignesh Raja'], '2h41min', ARRAY['Crime', 'Drame', 'Thriller'], '', '', 'https://image.tmdb.org/t/p/w200/aUaNkljAVaAAve5UC7jMBXT3zwP.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/uIrFdMWlJFdc1jPBP9bxeaISCDj.jpg', 'https://image.tmdb.org/t/p/original/jatqtz0VlQRiugmHktbKQpuf5EV.jpg', ARRAY[], 'film', 328.9697, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('eb79f889-b5a7-411f-9124-c00279640d68', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 1433117, 'https://image.tmdb.org/t/p/original/jatqtz0VlQRiugmHktbKQpuf5EV.jpg', 'https://image.tmdb.org/t/p/w500/uIrFdMWlJFdc1jPBP9bxeaISCDj.jpg', 6.5, 8, NULL, '', 161, '2026-04-30', 'ta', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('92b2b740-3e98-4c8b-a0cc-6167bbd0d9ca', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 550165, 'Dhanush', 'Karasaami', 'https://image.tmdb.org/t/p/w200/7bI9oy1BXIk58hsOK8WfN5g0i1P.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d7d5c4e1-ec5c-467e-8970-d887fc109e87', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 2191938, 'Mamitha Baiju', 'Selli', 'https://image.tmdb.org/t/p/w200/tGEFW7uGdYrvZ2f3FP8JH5Yh5L2.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ba5ad1da-9fc3-483a-a4c4-545b917d28cf', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 93194, 'K. S. Ravikumar', 'Kanthasaami', 'https://image.tmdb.org/t/p/w200/8dUdM3sFvL4aXnDtLJJCkDMNEbo.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ca9531ed-ec97-4561-aeb4-521495a2a05a', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 930731, 'Suraj Venjaramoodu', 'Bharathan', 'https://image.tmdb.org/t/p/w200/2FUs0wmR3eHBd8g4GVbCmhkUzeI.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('511a0aa0-9151-4513-8d76-4de01b3363ae', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 120949, 'Karunas', 'Kasi Maayan', 'https://image.tmdb.org/t/p/w200/dnh00MeOyiWFQ21l5az3UVJ5rhp.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8c1298b5-2fe5-4c5c-8a56-e826c1cbbba5', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 141704, 'Jayaram', 'Muthu Selvan', 'https://image.tmdb.org/t/p/w200/cc1SfVFctuYH353NgxXNBoAFX2d.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5f786e77-306b-414a-b350-4e09bce4a0e5', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 130114, 'M. S. Bhaskar', 'Kangayya', 'https://image.tmdb.org/t/p/w200/jyamX33xAwz2ZWCgh29qkg9exb8.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5585aca7-8b34-4f50-927a-ed0dedf9f283', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 1325660, 'Prithvi Pandiarajan', 'Murugesan', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('06aa88f4-12db-42f0-8678-391f3c3ea565', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 1960294, 'Sreeja Ravi', 'Dhanam', 'https://image.tmdb.org/t/p/w200/fzSMF0kJTVh7cfdkDJvUFQK2Tlk.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('74cedca3-b917-4dc5-85bb-8c96713bed17', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 4160017, 'Dhanesh Koliyat', 'Chittarkottai Manager', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('89ec4e9f-00a9-478a-ac9e-cd458ebdafbf', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 8848, 'Braquage à l''anglaise', 'https://image.tmdb.org/t/p/w200/dvQMKvrn93F3jUDWY5x6AfPMVFe.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5daadf5d-c21d-4f79-b387-b873fea7a211', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 13681, 'Les Saisons du cœur', 'https://image.tmdb.org/t/p/w200/bmWg3uVn700inqOiadxeFTmiqmV.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e1818fab-b514-4c68-8e80-0f4f42eeaaea', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 949, 'Heat', 'https://image.tmdb.org/t/p/w200/e0xv5Y7UVrhKEVy1g3URMLLVDYB.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e53d11e7-40cd-4d69-9c74-36cd47e2cf75', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 609242, 'Le Braquage du siècle', 'https://image.tmdb.org/t/p/w200/221zUcu4MGHIKbGJVzQ5DLje9nP.jpg', 2020, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c4c6693d-462d-46b9-8d60-b24650c7e226', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 2457, 'Les Enfants du Paradis', 'https://image.tmdb.org/t/p/w200/pmYOsWz9F7qNQaT9MNe0n0JKsR4.jpg', 1945, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('967101e1-b726-4fb7-ad5d-e56ae46253ef', '08d059c2-7f96-4999-9e32-b3ff1353a7a8', 434783, 'Ben Tumbling', NULL, 1985, NOW());

COMMIT;

-- Movie: Aventures croisées
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('538594a8-9fb0-4843-b08e-6f66e9cb051c', 'Aventures croisées', 'Swapped', 2026, 'Nathan Greno', ARRAY['Christian Magalhaes', 'Robert Snow', 'John Whittington'], '1h42min', ARRAY['Aventure', 'Animation', 'Familial', 'Fantastique'], 'Un petit animal des bois et un oiseau majestueux, ennemis jurés de la Vallée, qui échangent soudainement leurs corps et doivent faire équipe, en se mettant dans la peau  de l''autre, pour survivre à la plus folle aventure de leur vie.', '', 'https://image.tmdb.org/t/p/w200/eFE9odW9uzWAGomGFmmusxJT1Ee.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/gz64ZUKg4C4g1yfGD0o5opcBOKy.jpg', 'https://image.tmdb.org/t/p/original/zMwhWailP1WY7sb6AoE6b8ugoy.jpg', ARRAY[], 'film', 265.3704, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('62672619-1407-4d44-9458-a83cbb01ec72', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 1007757, 'https://image.tmdb.org/t/p/original/zMwhWailP1WY7sb6AoE6b8ugoy.jpg', 'https://image.tmdb.org/t/p/w500/gz64ZUKg4C4g1yfGD0o5opcBOKy.jpg', 8.984, 1506, 'Transforme ton destin.', 'Un petit animal des bois et un oiseau majestueux, ennemis jurés de la Vallée, qui échangent soudainement leurs corps et doivent faire équipe, en se mettant dans la peau  de l''autre, pour survivre à la plus folle aventure de leur vie.', 102, '2026-05-01', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cd0f8fb7-8b00-456e-a79c-4014261f33e5', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 135651, 'Michael B. Jordan', 'Ollie (voice)', 'https://image.tmdb.org/t/p/w200/sMBpav8cK7t7Nk0yf4tuNOqNUyW.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('907f7386-b53a-442b-bd33-34b9282bf56b', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 36594, 'Juno Temple', 'Ivy (voice)', 'https://image.tmdb.org/t/p/w200/nvsPrM4OKHVCDivgMx4FF6PgE5f.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('869864c3-e62d-4f5e-9f57-15401186c265', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 56903, 'Tracy Morgan', 'Boogle / Firewolf (voice)', 'https://image.tmdb.org/t/p/w200/ec0OJVbs6NZKMbS1yiCAJKjeoJf.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d66e52d8-02ed-493a-bf58-14adb8408208', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 5726, 'Cedric the Entertainer', 'Caloo (voice)', 'https://image.tmdb.org/t/p/w200/s6UrY5uofyxXsU5PydWBoLFReK0.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('64799d66-0f84-4908-be0d-c492dce1cc65', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 95517, 'Justina Machado', 'Calli (voice)', 'https://image.tmdb.org/t/p/w200/j5FaJXoyhMHlqv1l6TBdt1CH1oO.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8468db0f-ccf7-4edb-bf39-67d29f6e618a', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 41565, 'Nate Torrence', 'Lodd (voice)', 'https://image.tmdb.org/t/p/w200/yT9o149xPygdY0NsF9sNgiQwuru.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('12eb8794-d81e-4f50-9ea6-7f4f4af99adf', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 4663666, 'Camden Brooks', 'Young Ollie (voice)', 'https://image.tmdb.org/t/p/w200/ge9FgIjRERhyylebW2Np9YwkqqR.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f764c3e4-0844-4fc4-bf7b-54869c17da39', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 1934645, 'Táta Vega', 'Grandma / Mrs. Dung Beetle (voice)', 'https://image.tmdb.org/t/p/w200/9SdaK2vly0Gx5yvI5rrTszh31vt.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1374f86f-d7b3-487f-ab74-4f152f227216', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 3411764, 'Ambika Mod', 'Violet (voice)', 'https://image.tmdb.org/t/p/w200/jN9HhFYPNMYIupFt6GzGnHAW88c.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4cbc4b18-86d0-49c7-bd0b-bbb80c77dd48', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 1627501, 'Lolly Adefope', 'Lily (voice)', 'https://image.tmdb.org/t/p/w200/qPS57Mw1vjydSSfSYoMw8u81waI.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('90ff00bf-4c53-4c8d-95fd-9e0457f86bb1', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 11282, 'Harold et Kumar chassent le burger', 'https://image.tmdb.org/t/p/w200/pDWbZ5vccuKBoVCaXHAexTld6Cr.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('27a88d7e-2b89-47e7-93a0-5d21e4ab60f5', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 1172265, 'Les Voyages de Tereza', 'https://image.tmdb.org/t/p/w200/jZMmK4mwjw0oo2YeS24nIKHtKhL.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c8af3ddd-5dc6-4eab-b758-7fc5d9f4aaf5', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 11455, 'Faut Trouver Le Joint', 'https://image.tmdb.org/t/p/w200/lKXINU3ApbhFPQJ3pqgMzGPCYnH.jpg', 1978, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ad17c2d3-a238-4a70-a02a-78e55ac059de', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 11967, 'Young Guns', 'https://image.tmdb.org/t/p/w200/1693VrRivfykC8oimhouWzVXYp5.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('dccf7131-681c-4010-ad07-112138f123bf', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 617535, 'Телёнок', 'https://image.tmdb.org/t/p/w200/b92DMSsEItolc1d298DZkcMxMa5.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7c538933-8e28-45f7-9bba-b0e624ffe7eb', '538594a8-9fb0-4843-b08e-6f66e9cb051c', 617572, 'Mezcaliente', 'https://image.tmdb.org/t/p/w200/hhxUkdrYimwVmjSzHTTyglBquI3.jpg', 2015, NOW());

COMMIT;

-- Movie: Your Heart Will Be Broken
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('74bdad11-9f31-4623-a04b-b8997daaf9c3', 'Your Heart Will Be Broken', 'Твоё сердце будет разбито', 2026, 'Mikhail Vaynberg', ARRAY[], '2h14min', ARRAY['Romance', 'Drame'], 'Polina, une lycéenne, est sauvée du harcèlement dans son nouveau lycée et conclut un pacte avec Bars, le principal harceleur : il doit faire semblant d''être son petit ami et la protéger, et elle doit obéir à tout ce qu''il lui dit. Au fil de ce jeu, le couple développe de véritables sentiments, mais sa famille et ses camarades de classe ont de bonnes raisons de vouloir séparer les amoureux.', '', 'https://image.tmdb.org/t/p/w200/m2gtdkNGGMkE6LUevQpA7xvYq6p.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/iGpMm603GUKH2SiXB2S5m4sZ17t.jpg', 'https://image.tmdb.org/t/p/original/1x9e0qWonw634NhIsRdvnneeqvN.jpg', ARRAY[], 'film', 255.3572, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('295096e6-95a9-43c1-a42b-446abb7609ae', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 1523145, 'https://image.tmdb.org/t/p/original/1x9e0qWonw634NhIsRdvnneeqvN.jpg', 'https://image.tmdb.org/t/p/w500/iGpMm603GUKH2SiXB2S5m4sZ17t.jpg', 6.762, 82, NULL, 'Polina, une lycéenne, est sauvée du harcèlement dans son nouveau lycée et conclut un pacte avec Bars, le principal harceleur : il doit faire semblant d''être son petit ami et la protéger, et elle doit obéir à tout ce qu''il lui dit. Au fil de ce jeu, le couple développe de véritables sentiments, mais sa famille et ses camarades de classe ont de bonnes raisons de vouloir séparer les amoureux.', 134, '2026-03-26', 'ru', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('25958f82-463a-473b-ab05-c2ada03c9ed0', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 5598110, 'Даниэль Вегас', 'Барс', 'https://image.tmdb.org/t/p/w200/t9AFZX1rpTt59npITX2GY3JgySd.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0280b153-25cc-4218-94bc-34e0edd97c60', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 5037367, 'Вероника Журавлёва', 'Полина', 'https://image.tmdb.org/t/p/w200/bvlry6DeiYkm0onAZhonlpl4J7.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('89fcf109-dc2e-41d3-a0d8-d057592fb176', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 4508505, 'Иван Трушин', 'Лэйм', 'https://image.tmdb.org/t/p/w200/8DWSEUJnxlr7kTP0O8iOSnsqbcs.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e60e3c6d-23ad-4c4d-9c8d-6a63b5cb7be2', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 2007622, 'Максим Сапрыкин', 'Леха', 'https://image.tmdb.org/t/p/w200/u6c2wEvtqhXHyYRqd2LXKsyHr5a.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a3016383-270a-40d7-a0dd-d08d98bdbbb4', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 5654199, 'Аля Майер', 'Дилара', NULL, 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c1e7c932-b4e9-46a1-8e50-a7cf7024123d', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 558048, 'Евгения Лоза', 'мама Полины', 'https://image.tmdb.org/t/p/w200/ruLILWf9x0gxg8o9W9Yj9LCI0us.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7f790dff-9d62-4b13-8811-034f00304d0e', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 1565264, 'Павел Кузьмин', 'отчим Полины', 'https://image.tmdb.org/t/p/w200/uIIS1FLF4zMxR0Sj53a4wc9tGU6.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c112139a-47d4-4921-852a-6306a3cd6662', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 4465638, 'Александра Тихонова', 'Саша', 'https://image.tmdb.org/t/p/w200/iZL6tYLqs5uhvqE4SM7GwJHxUz3.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dd9b5a4c-e8a7-4af0-985d-51760d05d4ec', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 2887356, 'Маргарита Дьяченкова', 'Лика', 'https://image.tmdb.org/t/p/w200/a3c2BqkxkZBlJNKFtZTjxZUiLvZ.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('028b28d7-6dc6-4e66-98e2-f4134089c33c', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 5654204, 'Антон Соломатин', 'Власов', 'https://image.tmdb.org/t/p/w200/rsiqKjHvpQGmDvba4TMpe8Rt8hj.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d33eb957-5034-4cb4-bf1f-0d81b4b535a4', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 789, 'Trains étroitement surveillés', 'https://image.tmdb.org/t/p/w200/yzNCrmtT6o8gLlsYkXN9NlGNQkk.jpg', 1966, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f376d637-0e17-457b-8bb0-9408537a2579', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 796, 'Sexe intentions', 'https://image.tmdb.org/t/p/w200/tkShoPdnzijP1VdADBLghgephTC.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d206476b-a0fa-429b-8448-faee12c6ff26', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d577688a-284e-4749-ae3c-7d86f8019583', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 845, 'L''Inconnu du Nord-Express', 'https://image.tmdb.org/t/p/w200/6oSfav2yXyP009cBKoNEH0UYF10.jpg', 1951, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('48efdaa7-4880-43d8-9579-bc6c0b173a46', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 805, 'Rosemary''s Baby', 'https://image.tmdb.org/t/p/w200/yKtdS5oaHEtBUD1Gq4rdOezzWp6.jpg', 1968, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2d4a5882-9d97-4c37-b5c3-9a442343bc09', '74bdad11-9f31-4623-a04b-b8997daaf9c3', 815, 'La Ferme des Animaux', 'https://image.tmdb.org/t/p/w200/vFQo4DdhgHBr0Jy06VpzCYaZaPI.jpg', 1999, NOW());

COMMIT;

-- Movie: Matrix
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('03af77ff-6a33-48e0-a59e-fa14d0959138', 'Matrix', 'The Matrix', 1999, 'Lana Wachowski', ARRAY['Lana Wachowski', 'Lilly Wachowski'], '2h15min', ARRAY['Action', 'Science-Fiction'], 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l''un des pirates les plus recherchés du cyber‐espace. À cheval entre deux mondes, Neo est assailli par d''étranges songes et des messages cryptés provenant d''un certain Morpheus. Celui‐ci l''exhorte à aller au‐delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu''est‐ce que la Matrice ? Nul ne le sait, et aucun homme n''est encore parvenu à en percer les défenses. Mais Morpheus est persuadé que Neo est l''Élu, le libérateur mythique de l''humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents…', '', 'https://image.tmdb.org/t/p/w200/5KuRHnoH8UkSCFHMKf4YjKOvzOM.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/pEoqbqtLc4CcwDUDqxmEDSWpWTZ.jpg', 'https://image.tmdb.org/t/p/original/tlm8UkiQsitc8rSuIAscQDCnP8d.jpg', ARRAY[], 'film', 257.5238, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('91d68dee-abe5-4bac-9367-bd8086df821e', '03af77ff-6a33-48e0-a59e-fa14d0959138', 603, 'https://image.tmdb.org/t/p/original/tlm8UkiQsitc8rSuIAscQDCnP8d.jpg', 'https://image.tmdb.org/t/p/w500/pEoqbqtLc4CcwDUDqxmEDSWpWTZ.jpg', 8.246, 27909, 'Croire à l''incroyable.', 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l''un des pirates les plus recherchés du cyber‐espace. À cheval entre deux mondes, Neo est assailli par d''étranges songes et des messages cryptés provenant d''un certain Morpheus. Celui‐ci l''exhorte à aller au‐delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu''est‐ce que la Matrice ? Nul ne le sait, et aucun homme n''est encore parvenu à en percer les défenses. Mais Morpheus est persuadé que Neo est l''Élu, le libérateur mythique de l''humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents…', 135, '1999-03-31', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5cb6585b-46f8-48a3-b8b2-183e2ac9ecfe', '03af77ff-6a33-48e0-a59e-fa14d0959138', 6384, 'Keanu Reeves', 'Neo', 'https://image.tmdb.org/t/p/w200/kEoUZKEG7dzbCESDjd0CKAN1r0n.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9ebb667a-a2ae-475c-812b-272f733e9d59', '03af77ff-6a33-48e0-a59e-fa14d0959138', 2975, 'Laurence Fishburne', 'Morpheus', 'https://image.tmdb.org/t/p/w200/2GbXERENPpl5MmlqOLlPVaVtifD.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3ad6b6be-9756-4077-9485-f2977f04f412', '03af77ff-6a33-48e0-a59e-fa14d0959138', 530, 'Carrie-Anne Moss', 'Trinity', 'https://image.tmdb.org/t/p/w200/xD4jTA3KmVp5Rq3aHcymL9DUGjD.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e6c762a8-e0b4-4d65-8b80-bb8148d38c99', '03af77ff-6a33-48e0-a59e-fa14d0959138', 1331, 'Hugo Weaving', 'Agent Smith', 'https://image.tmdb.org/t/p/w200/lSC8Et0PYi5zeQb3IpPkFje7hgR.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('74b3b040-af45-4b1d-9ad0-c1a0cf03882c', '03af77ff-6a33-48e0-a59e-fa14d0959138', 9364, 'Gloria Foster', 'Oracle', 'https://image.tmdb.org/t/p/w200/AriGXtC9fjBOia9Zr8CZjn4o3rx.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('55608796-1a98-4dc9-b008-6ea0885a2a8b', '03af77ff-6a33-48e0-a59e-fa14d0959138', 532, 'Joe Pantoliano', 'Cypher', 'https://image.tmdb.org/t/p/w200/3OHUI3nX4SYGGItDk3xqeIvWtIf.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d8c054c6-22e3-48bb-8e8f-4a29df78b929', '03af77ff-6a33-48e0-a59e-fa14d0959138', 9372, 'Marcus Chong', 'Tank', 'https://image.tmdb.org/t/p/w200/q9HQttibTj2MoXVtLjq2kKqmPrE.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2c5690a7-fd36-417b-8701-0ab3f2c450fb', '03af77ff-6a33-48e0-a59e-fa14d0959138', 7244, 'Julian Arahanga', 'Apoc', 'https://image.tmdb.org/t/p/w200/g2YkF3PWSJU1vTKuURBH0DOMblm.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9b5af60f-f191-40be-a46b-406e1aa26854', '03af77ff-6a33-48e0-a59e-fa14d0959138', 9374, 'Matt Doran', 'Mouse', 'https://image.tmdb.org/t/p/w200/4HtMShAbsZ2AyFtq5z3bOVrvw2s.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d545b6fc-5e7b-4a39-bf4d-0d7eaba553c9', '03af77ff-6a33-48e0-a59e-fa14d0959138', 9376, 'Belinda McClory', 'Switch', 'https://image.tmdb.org/t/p/w200/wfTCwkIDJjH5k5DtuvcjP52PrLc.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('807b3fc2-345b-4ed5-96c8-b9ceeeb6f040', '03af77ff-6a33-48e0-a59e-fa14d0959138', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5ffc5147-8bb1-47e6-8cf0-028fcdd582b9', '03af77ff-6a33-48e0-a59e-fa14d0959138', 8974, 'La Guerre des mondes', 'https://image.tmdb.org/t/p/w200/eqXzeARWaOJug38Qlv59yVlC0B4.jpg', 1953, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5564df52-4881-4f17-adb4-b70644339e75', '03af77ff-6a33-48e0-a59e-fa14d0959138', 8982, 'L''Honneur du Dragon', 'https://image.tmdb.org/t/p/w200/fcVFC02Q0mQ31Dq0LZVAm9yflWP.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7addb0c3-fd21-403e-a52e-5378deb2be81', '03af77ff-6a33-48e0-a59e-fa14d0959138', 1356421, 'Program', 'https://image.tmdb.org/t/p/w200/1ag0w5xWeQJZh3xEQmCds8fBmE5.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1e4f75b1-d371-43fd-a0ac-e1285082eded', '03af77ff-6a33-48e0-a59e-fa14d0959138', 9067, 'Tank Girl', 'https://image.tmdb.org/t/p/w200/5vi1BxR6pGyUNqKMrG9myM4tq2n.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('643d7b7a-58e2-47d4-862d-301e732ccc26', '03af77ff-6a33-48e0-a59e-fa14d0959138', 614933, 'Atlas', 'https://image.tmdb.org/t/p/w200/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg', 2024, NOW());

COMMIT;

-- Movie: चाँद मेरा दिल
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('8fe0a26e-39ee-4bce-adca-be3f9a35358f', 'चाँद मेरा दिल', 'चाँद मेरा दिल', 2026, 'Vivek Soni', ARRAY['Vivek Soni', 'Tushar Paranjape'], '2h22min', ARRAY['Romance', 'Drame'], '', '', 'https://image.tmdb.org/t/p/w200/3df8awQoznVXTrKm3ghoHUwHHM1.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/9LPkXJustudEBgPZEm9tgDx5KtC.jpg', 'https://image.tmdb.org/t/p/original/kkRpcauZoBFKnH0Qsy7J5qtwBF5.jpg', ARRAY[], 'film', 175.793, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('c546b1d2-7a5a-4443-b1f1-30826e6f136e', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 1371023, 'https://image.tmdb.org/t/p/original/kkRpcauZoBFKnH0Qsy7J5qtwBF5.jpg', 'https://image.tmdb.org/t/p/w500/9LPkXJustudEBgPZEm9tgDx5KtC.jpg', 5.5, 2, NULL, '', 142, '2026-05-22', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9abdf48f-87b3-4f43-a375-d02ecdbc821a', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 1973077, 'Ananya Panday', 'Chandni Prasad', 'https://image.tmdb.org/t/p/w200/AgywmKnKdOJ7HvlNKBc3hADsF1S.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1526e265-4ddb-4d49-b1de-f760f6c6715b', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 2011444, 'Lakshya Lalwani', 'Aarav', 'https://image.tmdb.org/t/p/w200/iabAj9GCIkGnAMvzyIvdUXeCPTo.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c56a829b-47a6-4e6e-8efa-4b0f325448a5', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 4959658, 'Aastha Singh', 'Jyotsna', NULL, 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('95d08567-28ad-4477-a744-76c389b90485', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 2422210, 'Paresh Pahuja', 'Kevin', 'https://image.tmdb.org/t/p/w200/eoqUy5KRCXlt0vI4vajnhfN1M8y.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cad08f3c-d5f7-44e4-8d64-6a7bca2423c2', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 1040951, 'Manish Chaudhary', 'Aarav''s  Father', 'https://image.tmdb.org/t/p/w200/1l4vmA0IJQLieebZWOOCAFu4ra6.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5f9592d7-f591-48a1-8750-8b6868e34985', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 1047713, 'Iravati Harshe', 'Aarav''s Mother', 'https://image.tmdb.org/t/p/w200/zVDkFwUN8pj3jpEuQRWQa3sUSzp.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b6fbc689-b7bd-48bd-bc72-bc8b9cb118dc', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 2340243, 'Charu Shankar', 'Chandni''s  Mother', 'https://image.tmdb.org/t/p/w200/lh3RNfZoWSfNS4m5o0tQVVhCd3o.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('56a9762f-1381-40c8-b99a-6d6241d02a26', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 1517760, 'Atul Kumar', 'Principal', 'https://image.tmdb.org/t/p/w200/rbPFvPZgqiK21z4uyD5QhRwr7bb.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('29afb3ce-a705-485d-8b98-ee46881969ee', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 3904560, 'Akhil Kaimal', 'Chinna', 'https://image.tmdb.org/t/p/w200/6AjpGmXuJqWpnxVzDbIQGkwYfUq.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b0394124-6975-4876-9f1c-4de750f4f905', '8fe0a26e-39ee-4bce-adca-be3f9a35358f', 2967857, 'Manik Papneja', 'Sameer', 'https://image.tmdb.org/t/p/w200/bjVqyExEk5n1qHLuOnbR8UbPLpY.jpg', 9, NOW());

COMMIT;

-- Movie: पति पत्नी और वो दो
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('7d9d5704-675e-4984-917f-6ae6356aed99', 'पति पत्नी और वो दो', 'पति पत्नी और वो दो', 2026, 'Mudassar Aziz', ARRAY['Mudassar Aziz'], '1h57min', ARRAY['Comédie'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/5MweEeMzPbueb65BcJpdiy0ihwU.jpg', 'https://image.tmdb.org/t/p/original/eNAFLrd1XAAD4hgdTPjewpzYU4W.jpg', ARRAY[], 'film', 167.4581, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('c48d17ef-b0f5-4cc4-be69-76813bac8db0', '7d9d5704-675e-4984-917f-6ae6356aed99', 1320660, 'https://image.tmdb.org/t/p/original/eNAFLrd1XAAD4hgdTPjewpzYU4W.jpg', 'https://image.tmdb.org/t/p/w500/5MweEeMzPbueb65BcJpdiy0ihwU.jpg', 7.5, 4, NULL, '', 117, '2026-05-15', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9838b0c6-e618-40e6-af5f-3f8edc118437', '7d9d5704-675e-4984-917f-6ae6356aed99', 1033157, 'Ayushmann Khurrana', 'Prajapati Pandey', 'https://image.tmdb.org/t/p/w200/qbdclvnDkJxPX7OQqmMY7w9ekBP.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8a3fd398-5507-48c4-b906-3a29c9b6f91e', '7d9d5704-675e-4984-917f-6ae6356aed99', 1267400, 'Wamiqa Gabbi', 'Aparna Pandey', 'https://image.tmdb.org/t/p/w200/e1CNXkH2scGeoabOTowFJJxX2YF.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('32e66f12-f49c-4bc9-889e-5a612b0ea4f6', '7d9d5704-675e-4984-917f-6ae6356aed99', 1143308, 'Rakul Preet Singh', 'Nilofer Khan', 'https://image.tmdb.org/t/p/w200/d5OOKtPu9NhlNVMQTAAPff29KMv.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('469ed91e-6cc5-460b-8f0c-d55ebedb511f', '7d9d5704-675e-4984-917f-6ae6356aed99', 1848952, 'Sara Ali Khan', 'Chanchal Kumari', 'https://image.tmdb.org/t/p/w200/nRtF9kNgIt9q52jy89cyZBimUPs.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('59ba4d12-4783-4417-b1a0-98adf2af369e', '7d9d5704-675e-4984-917f-6ae6356aed99', 6500, 'Vijay Raaz', 'Dharamveer Singh', 'https://image.tmdb.org/t/p/w200/bLSjiy51UPjVnTYRDmgRUy1VOwD.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eca76e2f-f8fb-4146-b3d4-f8b782663843', '7d9d5704-675e-4984-917f-6ae6356aed99', 545084, 'Tigmanshu Dhulia', 'MLA Gajraj Tiwari', 'https://image.tmdb.org/t/p/w200/2CRk2UX3KfqMythuLBleMwQ7bQr.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('90ec8a6e-22d2-4c2e-8990-b969c0d31a78', '7d9d5704-675e-4984-917f-6ae6356aed99', 1873664, 'Ayesha Raza Mishra', NULL, 'https://image.tmdb.org/t/p/w200/cKC6Gj5AbeoLpH0bxnSj8SEzewi.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('23b04de8-458c-4dd7-9031-03c96743e5c3', '7d9d5704-675e-4984-917f-6ae6356aed99', 1974138, 'Vishal Vashishtha', 'Sudhanshu Tiwari', 'https://image.tmdb.org/t/p/w200/gxvmaEsTW1HnhnHLZOb7CNQmJIp.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c0f1b74b-bc71-4e85-963a-2793999e8935', '7d9d5704-675e-4984-917f-6ae6356aed99', 1294159, 'Durgesh Kumar', 'Mahinder', 'https://image.tmdb.org/t/p/w200/nLt1cgrxIapn7fRVwFjqnSFXc1x.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7f746bdb-01d5-4316-b65e-9141dd54da58', '7d9d5704-675e-4984-917f-6ae6356aed99', 1662481, 'Deepika Amin', 'Bhavna Trivedi', 'https://image.tmdb.org/t/p/w200/jQYrPnGERwUKd33Ufnspt6dvXv3.jpg', 9, NOW());

COMMIT;

-- Movie: Over Your Dead Body
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 'Over Your Dead Body', 'Over Your Dead Body', 2026, 'Jorma Taccone', ARRAY['Nick Kocher', 'Brian McElhaney'], '1h45min', ARRAY['Action', 'Comédie', 'Thriller'], 'Un couple dysfonctionnel se rend dans une cabane isolée pour se " reconnecter " l''un envers l''autre, mais chacun a l''intention secrète de tuer l''autre.', '', 'https://image.tmdb.org/t/p/w200/x7x4NvDauuQ7HA6psLZYZ6m3zTd.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/fqXIk1BY0tJvlqwiTw2HL9gegqE.jpg', 'https://image.tmdb.org/t/p/original/sb76azrAXr9U13uEQxNP5e3fujY.jpg', ARRAY[], 'film', 160.3583, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('d79d9a2c-fc37-446b-9758-82f8e7197bf1', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 1390300, 'https://image.tmdb.org/t/p/original/sb76azrAXr9U13uEQxNP5e3fujY.jpg', 'https://image.tmdb.org/t/p/w500/fqXIk1BY0tJvlqwiTw2HL9gegqE.jpg', 6.848, 69, NULL, 'Un couple dysfonctionnel se rend dans une cabane isolée pour se " reconnecter " l''un envers l''autre, mais chacun a l''intention secrète de tuer l''autre.', 105, '2026-04-24', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9095942b-bedb-47ac-a554-6bfe45e290f4', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 1372369, 'Samara Weaving', 'Lisa', 'https://image.tmdb.org/t/p/w200/7ThO37CpqkBRgrosep0ROVs2q5s.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aa436b60-f214-4720-9c5d-0bb2621a7768', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 41088, 'Jason Segel', 'Dan', 'https://image.tmdb.org/t/p/w200/aG6tVNSbl1YEjN65G3luFYnWbUM.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('09cc9d7e-b393-4a19-b384-94af530d5715', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 925, 'Paul Guilfoyle', 'Michael', 'https://image.tmdb.org/t/p/w200/c7unxeM13lF9pMhZhYwlNsSFjFe.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('96a08f61-3a08-4b43-9a63-8957fbff94c4', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 18082, 'Timothy Olyphant', 'Pete', 'https://image.tmdb.org/t/p/w200/7pHmRHE2wBNC9cBgNIRCBqFLoyZ.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d467cffd-5cf0-4539-891c-197caf40e725', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 78890, 'Keith Jardine', 'Todd', 'https://image.tmdb.org/t/p/w200/emN5dXAoqW9Naab4g3yOwxSfkvh.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('489b8bf5-adaa-46e6-90ca-16c4fd16737d', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 3196, 'Juliette Lewis', 'Allegra', 'https://image.tmdb.org/t/p/w200/sSGCW01aUsYlVQhuk3XSY7cl6Ww.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eb2c58e3-e3ec-4045-b867-750a87d1f8f2', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 3551, 'Jake Curran', 'Henry', 'https://image.tmdb.org/t/p/w200/pC6ozticiOmovaPpwqKVOMhn0b9.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e94e8bfb-6981-4791-bfa4-96042932faaa', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 54024, 'Nikolai Kinski', 'Frank', 'https://image.tmdb.org/t/p/w200/hN81FHqEqFjLvU0x4Cy4Zni4n1v.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('db4dace4-47e8-43ae-8f6b-6bc4ba28cce4', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 1290648, 'Kayla Jenee Radomski', 'Renée', 'https://image.tmdb.org/t/p/w200/4bQxG6wFaIXLylc566k4YhOUfuV.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d51cf601-d1a9-46b3-84a4-baaa16f826aa', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 1786960, 'Danusia Samal', 'Rachel', 'https://image.tmdb.org/t/p/w200/8FqUG5hRe9MskGzXzx8ktS7b20y.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('27e91e58-04ee-4e0f-9164-bad16bb24688', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 1359389, 'Маме снова 17', 'https://image.tmdb.org/t/p/w200/zkXypMK3iCECIpHo2NJZLX5pbgn.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7d8ed4fc-b648-4ccb-bbc7-0e6fb957c367', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 11943, 'Jeremiah Johnson', 'https://image.tmdb.org/t/p/w200/yQaVbiSJBlKHCnu3Ts2LFZqiBU.jpg', 1972, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cc2b48ba-37a0-444d-bcf1-cf59c9c0bb17', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 11007, 'Treize à la douzaine', 'https://image.tmdb.org/t/p/w200/nvPey652U3UvmS4V5dJlJxwxYiW.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ffbf9d03-dc6a-4129-a783-322dd44085fd', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 11064, 'Comment claquer un million de dollars par jour', 'https://image.tmdb.org/t/p/w200/qJv3VXuVdYcPsliKfm64xKVwrF4.jpg', 1985, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('40a8aaf2-ad65-407f-b1f5-e2da19a8dcbe', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 11859, 'Fair Game', 'https://image.tmdb.org/t/p/w200/ouLux4mXHF5b37mkwesppjad5zV.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('62fdf887-d2cb-4aa7-b79a-1126194240b5', '36b9d3b2-d5f7-4bce-b5c3-af5c15f081f9', 11862, 'Le Père de la mariée II', 'https://image.tmdb.org/t/p/w200/51dOseh6cExZ8YShj5298NZC2E2.jpg', 1995, NOW());

COMMIT;

-- Movie: The Mandalorian and Grogu
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('015f7eb3-3f63-4843-a41e-7feac5985ddf', 'The Mandalorian and Grogu', 'The Mandalorian and Grogu', 2026, 'Jon Favreau', ARRAY['Jon Favreau', 'Dave Filoni', 'Noah Kloor'], '2h12min', ARRAY['Action', 'Aventure', 'Science-Fiction'], 'L''Empire maléfique est tombé et les seigneurs de guerre impériaux restent dispersés dans toute la galaxie. Alors que la nouvelle République naissante travaille pour protéger tout ce que la rébellion s''est battue, ils ont fait appel à Din Djarin et à son jeune apprenti Grogu.', '', 'https://image.tmdb.org/t/p/w200/tnx7iMVydPQXGOoLsxXl84PXtbA.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/eUOVyCSZrUH6aPfhsfd7j0bxGOl.jpg', 'https://image.tmdb.org/t/p/original/6zg7A9ICOthNR2TSXlT51KvXrsA.jpg', ARRAY[], 'film', 162.5472, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('9a54e8a4-1837-4198-be4a-ef08532f1103', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 1228710, 'https://image.tmdb.org/t/p/original/6zg7A9ICOthNR2TSXlT51KvXrsA.jpg', 'https://image.tmdb.org/t/p/w500/eUOVyCSZrUH6aPfhsfd7j0bxGOl.jpg', 6.9, 341, NULL, 'L''Empire maléfique est tombé et les seigneurs de guerre impériaux restent dispersés dans toute la galaxie. Alors que la nouvelle République naissante travaille pour protéger tout ce que la rébellion s''est battue, ils ont fait appel à Din Djarin et à son jeune apprenti Grogu.', 132, '2026-05-20', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f90b59b2-3ebc-4f33-8e47-2989d066c09f', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 1253360, 'Pedro Pascal', 'The Mandalorian', 'https://image.tmdb.org/t/p/w200/9VYK7oxcqhjd5LAH6ZFJ3XzOlID.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('25262fa0-2d49-4d70-a3cf-55872284b18d', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 206905, 'Jeremy Allen White', 'Rotta (voice)', 'https://image.tmdb.org/t/p/w200/zKk4vmDeUexdevtt6wm8WdMQ1TG.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bc83362a-5b5f-4ab3-9348-8702de8a376d', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 10205, 'Sigourney Weaver', 'Colonel Ward', 'https://image.tmdb.org/t/p/w200/wTSnfktNBLd6kwQxgvkqYw6vEon.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('70bd64af-7758-45a6-a0e9-45f38b5ff2be', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 946854, 'Brendan Wayne', 'The Mandalorian Suit Performer', 'https://image.tmdb.org/t/p/w200/klsNR0ld4NjURhhn3PYZetFkaCK.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5eb72e78-6b85-4e88-859e-7b9596fbdb33', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 123812, 'Lateef Crowder', 'The Mandalorian Stunt Performer', 'https://image.tmdb.org/t/p/w200/mhGArPyh3N97t3PU4YnvLZTzHjl.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ab008991-73be-4b0a-b573-89d28b01defb', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 571562, 'Steve Blum', 'Zeb Orrelios (voice)', 'https://image.tmdb.org/t/p/w200/cpO0muunoigq1WHegeOEI1AIQAo.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('71c7d342-3713-4c52-b7ca-732faaf9d0d1', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 1323612, 'Jonny Coyne', 'Lord Janu', 'https://image.tmdb.org/t/p/w200/6PSW0qaoY3KSnWUUv6f54NOuPC0.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6ab6edb5-a7dc-4d9d-ae7a-d274bab77a28', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 92617, 'Matthew Willig', 'Hogsbreth', 'https://image.tmdb.org/t/p/w200/46nLaoxRvXpx8ohmG7hx2Qq00Sr.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6ade1acf-df62-4077-a83a-2ab78fb209ca', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 1032, 'Martin Scorsese', 'Hugo Durant (voice)', 'https://image.tmdb.org/t/p/w200/9U9Y5GQuWX3EZy39B8nkk4NY01S.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8eb120a8-fd44-4fd2-a670-2e76fcbb1b34', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 164208, 'Hemky Madera', 'Commander Baro', 'https://image.tmdb.org/t/p/w200/net1kEEpSrr9QC9be6YRhLGuM0k.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('540773a2-9f4f-4f72-ac10-6fb09aae0bc4', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 841, 'Dune', 'https://image.tmdb.org/t/p/w200/nCFApKqbqRDdGc3YylVf3VsTHcg.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('904191ee-a288-4a80-95ce-36a2f87ccd54', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 957, 'La Folle Histoire de l’espace', 'https://image.tmdb.org/t/p/w200/edjYw7tTiuJMKoANioAghvOdpqO.jpg', 1987, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b0f133a4-053d-4ba5-99b9-0de636c255b7', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 956, 'Mission : Impossible 3', 'https://image.tmdb.org/t/p/w200/wlesOljZycfrbBCdJLdmumSiNYT.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c7de245a-a042-4b3c-9bcd-0f2bda8749bb', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 7450, 'Titan A.E.', 'https://image.tmdb.org/t/p/w200/1UeG2ipwjM5zzAFSIdMDByP8BC2.jpg', 2000, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7a754c0c-8cb3-4250-9276-33a2ece5160d', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 7453, 'H2G2 : Le Guide du Voyageur Galactique', 'https://image.tmdb.org/t/p/w200/4InIApI5Zx0Xf3481MUzugDdXCX.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('abbd142c-526d-497a-bed4-9f37e2a5da13', '015f7eb3-3f63-4843-a41e-7feac5985ddf', 7459, 'Speed Racer', 'https://image.tmdb.org/t/p/w200/hpCPT2V1UjBSOqxbTrPGsYLDRgC.jpg', 2008, NOW());

COMMIT;

-- Movie: The Shadow's Edge
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('4813c79f-87dc-44b3-9765-f23c104e0132', 'The Shadow''s Edge', '捕风追影', 2025, '杨子', ARRAY['杨子'], '2h21min', ARRAY['Action', 'Crime', 'Drame', 'Thriller'], 'Un mafieux et ses 7 fils adoptifs manipulent et ridiculisent la police en piratant le système de surveillance de la ville, dans le but de récupérer une fortune en crypto-monnaie. La police doit faire appel à un ancien expert qui va s''associer avec une policière à laquelle il est lié par un secret qu''elle ignore. Une partie d''échec commence, où les cerveaux et la loyauté seront mis à l''épreuve.', '', 'https://image.tmdb.org/t/p/w200/qUOe56aOGlFI1eii9mkde0mE4Ds.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/t1PFVsGYdUHtPv0Xowoc9b4PAap.jpg', 'https://image.tmdb.org/t/p/original/4BtL2vvEufDXDP4u6xQjjQ1Y2aT.jpg', ARRAY[], 'film', 168.7615, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('a0f28803-cf8d-4043-89ad-02e19e7cdbc6', '4813c79f-87dc-44b3-9765-f23c104e0132', 1419406, 'https://image.tmdb.org/t/p/original/4BtL2vvEufDXDP4u6xQjjQ1Y2aT.jpg', 'https://image.tmdb.org/t/p/w500/t1PFVsGYdUHtPv0Xowoc9b4PAap.jpg', 7.422, 702, 'Il forme une nouvelle génération d’agents de la loi pour une mission dangereuse visant à sauver le monde des criminels impitoyables.', 'Un mafieux et ses 7 fils adoptifs manipulent et ridiculisent la police en piratant le système de surveillance de la ville, dans le but de récupérer une fortune en crypto-monnaie. La police doit faire appel à un ancien expert qui va s''associer avec une policière à laquelle il est lié par un secret qu''elle ignore. Une partie d''échec commence, où les cerveaux et la loyauté seront mis à l''épreuve.', 141, '2025-08-16', 'zh', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7de0d70d-4add-4f4e-9334-fe0763082704', '4813c79f-87dc-44b3-9765-f23c104e0132', 18897, 'Jackie Chan', 'Wong Tak Chung', 'https://image.tmdb.org/t/p/w200/nraZoTzwJQPHspAVsKfgl3RXKKa.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('154891ad-3a10-4cf6-b643-07b139601973', '4813c79f-87dc-44b3-9765-f23c104e0132', 1173805, 'Zhang Zifeng', 'He Qiuguo', 'https://image.tmdb.org/t/p/w200/3S8yEnTVqH8T3bTVf9FmtXxWcu2.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b6719113-59c6-4e18-915c-1670d54680b8', '4813c79f-87dc-44b3-9765-f23c104e0132', 56861, 'Tony Leung Ka-fai', 'Fu Longsheng', 'https://image.tmdb.org/t/p/w200/il4L0QSp5STfZCB1wsvb6rSCDar.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('08c94233-d2d7-43c3-97c7-06a49776238e', '4813c79f-87dc-44b3-9765-f23c104e0132', 3167855, '此沙', 'Xi Meng / Xi Wang', 'https://image.tmdb.org/t/p/w200/eWytg5M0VUCb0aHEKpUDijQ7JxF.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0f7fab83-6d37-4a45-ac34-a2d7559f3457', '4813c79f-87dc-44b3-9765-f23c104e0132', 1625880, '文俊辉', 'Hu Feng', 'https://image.tmdb.org/t/p/w200/z1seXrQQWG7nsQVHqSWKefJQ8DO.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2a289035-64d7-47a0-972b-c74dee77adf6', '4813c79f-87dc-44b3-9765-f23c104e0132', 4062369, '周政杰', 'Liu Jinxiao', 'https://image.tmdb.org/t/p/w200/9n4vnXt6SIrfUfDDXxz4ewxhbSf.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('51a86b55-6688-4792-bd73-2b6a1ac2d841', '4813c79f-87dc-44b3-9765-f23c104e0132', 1016316, '王杍逸', 'Wu Yaolei', 'https://image.tmdb.org/t/p/w200/6xOEI8NnQuvRwe6nSDXYGAamKzO.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4c28f9ec-deef-452d-85b8-36baf91494f9', '4813c79f-87dc-44b3-9765-f23c104e0132', 1516593, '郎月婷', 'Madam Wang', 'https://image.tmdb.org/t/p/w200/bdyJhQrIG7ai9B2Tp2kD2M0F32X.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cfdc6bc2-969c-4ef2-920f-5ec21b61bf60', '4813c79f-87dc-44b3-9765-f23c104e0132', 1881987, '林秋楠', 'Xin', 'https://image.tmdb.org/t/p/w200/4QerqhhsMnhTQZgmbxh6vTl37DE.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c0e4db39-304f-46e1-8162-f8e0bb175d32', '4813c79f-87dc-44b3-9765-f23c104e0132', 1443375, '王振威', 'Ray', 'https://image.tmdb.org/t/p/w200/bXVR7TbR8xXBT1fAwCAgLmbubq1.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5a360fe7-a0a6-4f0a-bb07-9220b512ef86', '4813c79f-87dc-44b3-9765-f23c104e0132', 614810, 'நா நா', 'https://image.tmdb.org/t/p/w200/ax1nM3sMDDbylSLPy2ahiofdSAo.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4774f0a8-1ac8-4185-bc54-2c8a149553b4', '4813c79f-87dc-44b3-9765-f23c104e0132', 9064, 'Hellraiser 2 : Les Écorchés', 'https://image.tmdb.org/t/p/w200/ri6BfqkQjvznrMPbhCdNonng1Qn.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5d3683bf-b812-4ca2-b025-02a1088d0c7c', '4813c79f-87dc-44b3-9765-f23c104e0132', 8845, 'Piège en haute mer', 'https://image.tmdb.org/t/p/w200/6X5iYIfx6CcMGKQ0PM5UllxZD0d.jpg', 1992, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8b7e5357-efdf-4b07-9716-7ea6885fa2f5', '4813c79f-87dc-44b3-9765-f23c104e0132', 438798, 'The Prison', 'https://image.tmdb.org/t/p/w200/8ieBJvHi6Keg5t1Rwlw650klefS.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c0851c89-80e3-4eed-9a4e-f8289d37cde3', '4813c79f-87dc-44b3-9765-f23c104e0132', 9355, 'Mad Max :  Au-delà du dôme du tonnerre', 'https://image.tmdb.org/t/p/w200/fHo2AJ9brsXKWbYJ2LA087UDBwZ.jpg', 1985, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6fdea59c-ef4e-4f02-97e3-1a8369411d49', '4813c79f-87dc-44b3-9765-f23c104e0132', 8909, 'Wanted : Choisis ton destin', 'https://image.tmdb.org/t/p/w200/j0YQlXsfcYm5WQJS7i1XZWI5amk.jpg', 2008, NOW());

COMMIT;

-- Movie: Mortal Kombat II
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 'Mortal Kombat II', 'Mortal Kombat II', 2026, 'Simon McQuoid', ARRAY['Jeremy Slater'], '1h56min', ARRAY['Action', 'Fantastique', 'Aventure'], 'Les champions plébiscités par les fans – désormais secondés par Johnny Cage en personne – s’affrontent dans un tournoi ultime, sans foi ni loi, pour tenter de renverser le règne de Shao Kahn, un tyran qui menace l’existence même de l’Earthrealm et de ses partisans.', '', 'https://image.tmdb.org/t/p/w200/tETDfHV9cd8DOeOoO5VITv2ki0t.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/yPkeeBEJdQO85AGCwi2XEIfMOxa.jpg', 'https://image.tmdb.org/t/p/original/4EAAwpylq313qrDqpCxulUrXBNF.jpg', ARRAY[], 'film', 167.7321, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('62afa63c-9154-4461-9ab9-5b8aa0f54dba', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 931285, 'https://image.tmdb.org/t/p/original/4EAAwpylq313qrDqpCxulUrXBNF.jpg', 'https://image.tmdb.org/t/p/w500/yPkeeBEJdQO85AGCwi2XEIfMOxa.jpg', 6.762, 351, 'Prépare-toi à passer au niveau supérieur.', 'Les champions plébiscités par les fans – désormais secondés par Johnny Cage en personne – s’affrontent dans un tournoi ultime, sans foi ni loi, pour tenter de renverser le règne de Shao Kahn, un tyran qui menace l’existence même de l’Earthrealm et de ses partisans.', 116, '2026-05-06', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d1d4c635-6aca-4fdb-85e3-7a26670d9f9d', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1372, 'Karl Urban', 'Johnny Cage', 'https://image.tmdb.org/t/p/w200/6CkZLwEJxfqqcJHyeXegMAvOlPh.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('291a468c-f7a8-429d-b42a-d9b866759cb8', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 2168270, 'Adeline Rudolph', 'Kitana', 'https://image.tmdb.org/t/p/w200/sWjjm53MeVrpQH2dxtFD3gfEt3v.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('537848d3-ca58-4d3f-84ef-3a6d54d9db92', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 136347, 'Jessica McNamee', 'Sonya Blade', 'https://image.tmdb.org/t/p/w200/sKgsW78FCDWAes0SeCp5lgq3eou.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b17e1640-97da-4d84-b86a-2100131d8267', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 189230, 'Josh Lawson', 'Kano', 'https://image.tmdb.org/t/p/w200/Am9vM77uZd9bGODugwmWtOfzx6E.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e9bcab8f-fe41-45ca-a31e-0f9c45486d32', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1510237, 'Martyn Ford', 'Shao Kahn', 'https://image.tmdb.org/t/p/w200/fC6p8G76IJJpDjgdfuVTDAWG24s.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0fd0dd6f-f8ea-4bc5-9061-40e1983c2673', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1525689, 'Ludi Lin', 'Liu Kang', 'https://image.tmdb.org/t/p/w200/9Ila4K8POeuVWRO9hzyekFjvCDk.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('75c9a17e-76e8-4d7d-8ac0-08d750f003cf', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 51684, 'Mehcad Brooks', 'Jax', 'https://image.tmdb.org/t/p/w200/s7Cu6Si9n5qsH64eLBVGXaf55bE.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a3bf9567-fbfa-4e56-b3ea-fcf63c1b1bca', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1859934, 'Tati Gabrielle', 'Jade', 'https://image.tmdb.org/t/p/w200/txZTL1HkPVxliTilbjlwR51VIt6.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0d279e2f-e950-4315-9713-409346b7dc12', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1610940, 'Lewis Tan', 'Cole Young', 'https://image.tmdb.org/t/p/w200/yMr3mwHHBpfbXwDDkahOzFtTCak.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('448b8f34-9240-4f5c-aa3a-cfae1863903c', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1358974, 'Max Huang', 'Kung Lao', 'https://image.tmdb.org/t/p/w200/pHntB82hNVVKZtTAUgUKr2KE1Zt.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0071f13e-6c07-46f6-b4c5-a103b83d0387', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 8840, 'Cœur de dragon', 'https://image.tmdb.org/t/p/w200/sgTitA0BNzzBc1zPx3KHuJxp8or.jpg', 1996, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('88276486-0f9a-42ac-a3b4-e9fd2045bfef', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2e98556b-5963-48db-b827-d3a1909341e2', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 8965, 'Les Énigmes de l''Atlantide', 'https://image.tmdb.org/t/p/w200/mYsFQt0xgBkEUOTbjA4MLRrzaKQ.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('800198c6-2dfb-4820-a39a-1c6cc148b2c4', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 8982, 'L''Honneur du Dragon', 'https://image.tmdb.org/t/p/w200/fcVFC02Q0mQ31Dq0LZVAm9yflWP.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e5021241-f764-416b-b446-a5fc51fe6dab', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 1529694, 'Mahavatar Raghunandan', NULL, NULL, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d1fcbe41-ef81-4e49-95d2-b8c8db59c780', '260eb0f3-cd8c-4cfd-b72c-95fc8454f510', 9078, 'Merlin l''enchanteur', 'https://image.tmdb.org/t/p/w200/fht7xph50bzcvtfsPkcrHRSPYcT.jpg', 1963, NOW());

COMMIT;

-- Movie: Mortal Kombat
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 'Mortal Kombat', 'Mortal Kombat', 2021, 'Simon McQuoid', ARRAY['Greg Russo', 'David Callaham'], '1h50min', ARRAY['Action', 'Fantastique', 'Aventure'], 'Lorsque les plus grands champions de la Terre sont appelés à combattre les ennemis de l''Autre Monde, ils doivent découvrir leurs véritables pouvoirs pour sauver notre planète de l''annihilation totale.', '', 'https://image.tmdb.org/t/p/w200/tETDfHV9cd8DOeOoO5VITv2ki0t.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/rxw7an9VWIlaEzTB4ETadMWSdym.jpg', 'https://image.tmdb.org/t/p/original/6ELCZlTA5lGUops70hKdB83WJxH.jpg', ARRAY[], 'film', 151.1462, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('aa0d71f6-052e-47b2-83f1-327f7cdde2e0', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 460465, 'https://image.tmdb.org/t/p/original/6ELCZlTA5lGUops70hKdB83WJxH.jpg', 'https://image.tmdb.org/t/p/w500/rxw7an9VWIlaEzTB4ETadMWSdym.jpg', 7.035, 6673, 'Viens par ici.', 'Lorsque les plus grands champions de la Terre sont appelés à combattre les ennemis de l''Autre Monde, ils doivent découvrir leurs véritables pouvoirs pour sauver notre planète de l''annihilation totale.', 110, '2021-04-07', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0be6637a-1a05-4f0b-9e79-358590afe4fc', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 1610940, 'Lewis Tan', 'Cole Young', 'https://image.tmdb.org/t/p/w200/yMr3mwHHBpfbXwDDkahOzFtTCak.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('de142d6f-103c-46ca-8041-d6815e2ae8d7', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 136347, 'Jessica McNamee', 'Sonya Blade', 'https://image.tmdb.org/t/p/w200/sKgsW78FCDWAes0SeCp5lgq3eou.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0f8b304e-45c6-43d8-a222-1bcc89c90f8c', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 51684, 'Mehcad Brooks', 'Jax', 'https://image.tmdb.org/t/p/w200/s7Cu6Si9n5qsH64eLBVGXaf55bE.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('16f6fd3b-a51b-4bee-8ceb-a037cb00ff49', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 189230, 'Josh Lawson', 'Kano', 'https://image.tmdb.org/t/p/w200/Am9vM77uZd9bGODugwmWtOfzx6E.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ab2bf1d6-1de1-4e86-b8a7-c4dbd4f52c37', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 1525689, 'Ludi Lin', 'Liu Kang', 'https://image.tmdb.org/t/p/w200/9Ila4K8POeuVWRO9hzyekFjvCDk.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c57deb20-776e-4c5a-99e1-808cd0fd8f00', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 1358974, 'Max Huang', 'Kung Lao', 'https://image.tmdb.org/t/p/w200/pHntB82hNVVKZtTAUgUKr2KE1Zt.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('447b5f69-9c18-46b2-8be7-30094b16e451', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 13275, 'Tadanobu Asano', 'Lord Raiden', 'https://image.tmdb.org/t/p/w200/3CBpfGRcPq1jEeYr51TiOiNbZzT.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f8f156d7-19c7-4bcc-a52f-8eb941be69da', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 101015, 'Chin Han', 'Shang Tsung', 'https://image.tmdb.org/t/p/w200/3XJXmYm6r4Hvm3izOArU58fhQrT.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7fffc020-d30f-4ab8-8e7c-a4d792109fda', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 9195, 'Hiroyuki Sanada', 'Hanzo Hasashi / Scorpion', 'https://image.tmdb.org/t/p/w200/oyOk03ldE3wJm2CMjxTzs6rc30z.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3cbc3d2e-383d-46e6-956d-d234f20cb604', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 592496, 'Joe Taslim', 'Bi-Han / Sub-Zero', 'https://image.tmdb.org/t/p/w200/6S60RmKqa4p1HN0n4uaohNqjaU8.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b862f5f5-b038-4b75-afca-f0fcac983e3d', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 441669, 'Butcher the Bakers', 'https://image.tmdb.org/t/p/w200/6AXFxrot8sXHD2TfMEgE5ZkJC2k.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('11bbb33a-2c71-4840-8edf-0510af0e6a6e', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 11253, 'Hellboy II : Les Légions d''or maudites', 'https://image.tmdb.org/t/p/w200/jZpAA1xTEg3epKSbE1o75vtab01.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('faa27003-a088-4190-8eb2-c472033d792f', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 11494, 'Wilderness', 'https://image.tmdb.org/t/p/w200/sLtUVG7ORbTJueTmIWpO4YeHayS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('143b6125-a609-4fc7-afcb-a67ad7b961cd', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 11595, '48 heures de plus', 'https://image.tmdb.org/t/p/w200/25fqd9IXlGgco8Yy7Lv7WQuiWPJ.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('74474390-8517-447a-b90e-79c132c76083', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 11596, 'Freddy sort de la nuit', 'https://image.tmdb.org/t/p/w200/oHTDAuadMvuiiTi5EPBLYz1GazE.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('2a2db01f-f930-4266-9edd-b7403a15cd2d', '5f8cd910-3a2f-43b6-9e7c-cef77cbb2cea', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());

COMMIT;

-- Movie: Nymphomaniac : Volume 2
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('17d59820-2d75-402f-b5e8-e773fb1c9914', 'Nymphomaniac : Volume 2', 'Nymphomaniac: Vol. II', 2013, 'Lars von Trier', ARRAY['Lars von Trier'], '1h59min', ARRAY['Drame', 'Mystère'], 'La folle et poétique histoire du parcours érotique d''une femme, de sa naissance jusqu''à l''âge de 50 ans, racontée par le personnage principal, Joe, qui s''est autodiagnostiquée nymphomane. Par une froide soirée d’hiver, le vieux et charmant célibataire Seligman découvre Joe dans une ruelle, rouée de coups. Après l''avoir ramenée chez lui, il soigne ses blessures et l’interroge sur sa vie. Seligman écoute intensément Joe lui raconter en huit chapitres successifs le récit de sa vie aux multiples ramifications et facettes, riche en associations et en incidents de parcours.', '', 'https://image.tmdb.org/t/p/w200/a1zVySI0Yqqf3ORegQ1icMfvhAa.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/iLUNqgNKuWn667kXCKztSxYbT3k.jpg', 'https://image.tmdb.org/t/p/original/oQEAWIr3thvSICvoQnFEqyuf0Oz.jpg', ARRAY[], 'film', 152.8571, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('19ff7867-c0dc-454b-b4e8-6474e4eed38d', '17d59820-2d75-402f-b5e8-e773fb1c9914', 249397, 'https://image.tmdb.org/t/p/original/oQEAWIr3thvSICvoQnFEqyuf0Oz.jpg', 'https://image.tmdb.org/t/p/w500/iLUNqgNKuWn667kXCKztSxYbT3k.jpg', 6.711, 3168, 'Oubliez l''amour', 'La folle et poétique histoire du parcours érotique d''une femme, de sa naissance jusqu''à l''âge de 50 ans, racontée par le personnage principal, Joe, qui s''est autodiagnostiquée nymphomane. Par une froide soirée d’hiver, le vieux et charmant célibataire Seligman découvre Joe dans une ruelle, rouée de coups. Après l''avoir ramenée chez lui, il soigne ses blessures et l’interroge sur sa vie. Seligman écoute intensément Joe lui raconter en huit chapitres successifs le récit de sa vie aux multiples ramifications et facettes, riche en associations et en incidents de parcours.', 119, '2013-12-25', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('88ebb6ac-0298-4ecb-99ce-f4ef21b9a7c5', '17d59820-2d75-402f-b5e8-e773fb1c9914', 4273, 'Charlotte Gainsbourg', 'Joe', 'https://image.tmdb.org/t/p/w200/vyZQlwBSpARVHzn6M91ZcJTy7P8.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4884551d-6b31-4b44-a562-1eefa5c58004', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1640, 'Stellan Skarsgård', 'Seligman', 'https://image.tmdb.org/t/p/w200/mW7xmtGV4y79kQGn0zkKVGDMAmw.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('53f9afac-2078-4226-a206-af906590d091', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1137823, 'Stacy Martin', 'Young Joe', 'https://image.tmdb.org/t/p/w200/wLPh456xduwDkGgPpaf1KGH9EWz.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ea35f0e4-bcc0-40d3-97a4-0a408092f26e', '17d59820-2d75-402f-b5e8-e773fb1c9914', 10959, 'Shia LaBeouf', 'Jerôme', 'https://image.tmdb.org/t/p/w200/egvlIdeizCkSkuHVoDuuduIThFA.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5625f4c5-8358-46bb-b9a7-985377f003c0', '17d59820-2d75-402f-b5e8-e773fb1c9914', 5293, 'Willem Dafoe', 'L', 'https://image.tmdb.org/t/p/w200/ui8e4sgZAwMPi3hzEO53jyBJF9B.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7b7b258e-3864-41eb-97c1-4cb866ef2074', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1646, 'Udo Kier', 'The Waiter', 'https://image.tmdb.org/t/p/w200/lIOGDMvrVHMgPXdhicLI41tY1zf.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5bf36734-0ce2-4b8c-92ad-880adacbaf67', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1642, 'Jean-Marc Barr', 'Debtor Gentleman', 'https://image.tmdb.org/t/p/w200/65aLM2ZvBjJu2JWGSrTGHqXyc8w.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('486950bb-4ae4-437a-9634-7deb2abd76e9', '17d59820-2d75-402f-b5e8-e773fb1c9914', 478, 'Jamie Bell', 'K', 'https://image.tmdb.org/t/p/w200/xAfNYOJYOy5ee9PHbBF8Y6xzZ9I.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9166d7e2-cc71-4624-8b04-eafdeda4a80c', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1137824, 'Mia Goth', 'P', 'https://image.tmdb.org/t/p/w200/rwko7XVaKFcJH1dtAIIsrgLMzHb.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a34294fb-8566-4142-bff4-c5e62e97721d', '17d59820-2d75-402f-b5e8-e773fb1c9914', 140493, 'Michaël Pas', 'Old Jerôme', 'https://image.tmdb.org/t/p/w200/lb88BHKoizgOKo6OfKlFFlzPqtE.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('12f0f3b3-a30d-4d25-aedb-406a40e3f3e9', '17d59820-2d75-402f-b5e8-e773fb1c9914', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('195a4ff9-7f0d-457e-95fe-6e3f8e8f8123', '17d59820-2d75-402f-b5e8-e773fb1c9914', 438537, 'Szatan kazał tańczyć', 'https://image.tmdb.org/t/p/w200/lOj0wvAlNrgTt33ZOaBvgbayAnH.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('248d9c65-70c7-4d9d-b831-dbb6397298a5', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1169448, 'Prison Babies', 'https://image.tmdb.org/t/p/w200/caPxPMEmReBziXCjolv99rJsqVv.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('44cec1e9-46b4-4a2b-b247-f2ee67334c01', '17d59820-2d75-402f-b5e8-e773fb1c9914', 438601, 'Tout le monde dit je t''aime', 'https://image.tmdb.org/t/p/w200/duZDza0xEboF9PtFWYmygRmz3SE.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('81032176-7ed6-45fc-98d2-49988292d7d8', '17d59820-2d75-402f-b5e8-e773fb1c9914', 614743, 'Peppermint', 'https://image.tmdb.org/t/p/w200/5hQ2mBbPt3o35Sx3e4FpJJJALmA.jpg', 2020, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1cb0a56c-1552-4b58-abe2-a1705607c7cc', '17d59820-2d75-402f-b5e8-e773fb1c9914', 1529694, 'Mahavatar Raghunandan', NULL, NULL, NOW());

COMMIT;

-- Movie: Le Diable s'habille en Prada
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ff12da1b-0e52-47d8-aad1-5f386f41ae30', 'Le Diable s''habille en Prada', 'The Devil Wears Prada', 2006, 'David Frankel', ARRAY['Aline Brosh McKenna'], '1h50min', ARRAY['Drame', 'Comédie'], 'Fraîchement diplômée, Andrea débarque à New York et décroche le job de rêve. Mais en tant qu’assistante de la tyrannique rédactrice en chef d’un prestigieux magazine de mode, elle va vite découvrir ce que le mot « enfer » veut dire…', '', 'https://image.tmdb.org/t/p/w200/hfIjLMo8Upl6MXhn1YcoDoXeeZn.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/vTIBjWMWx1p5Wv2J3IRhEW13lrj.jpg', 'https://image.tmdb.org/t/p/original/gkh6Nt8DtY1XT4gQsyFq9XAVJlJ.jpg', ARRAY[], 'film', 155.4556, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('0a6cf757-eb26-4f23-8c16-217d4c2c4d7b', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 350, 'https://image.tmdb.org/t/p/original/gkh6Nt8DtY1XT4gQsyFq9XAVJlJ.jpg', 'https://image.tmdb.org/t/p/w500/vTIBjWMWx1p5Wv2J3IRhEW13lrj.jpg', 7.427, 13623, 'Un job d’enfer, une boss infernale !', 'Fraîchement diplômée, Andrea débarque à New York et décroche le job de rêve. Mais en tant qu’assistante de la tyrannique rédactrice en chef d’un prestigieux magazine de mode, elle va vite découvrir ce que le mot « enfer » veut dire…', 110, '2006-06-29', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6ed39a4e-8e48-4135-b49d-02d2e90a2154', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 5064, 'Meryl Streep', 'Miranda Priestly', 'https://image.tmdb.org/t/p/w200/g5cVxQBAQ3AXt3LhdBXtbbN47Uc.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a6d52c84-c7ad-439a-98c3-441a08ec123a', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 1813, 'Anne Hathaway', 'Andy Sachs', 'https://image.tmdb.org/t/p/w200/nbccV2pMoyLTCeg5DQip24Eq0Jp.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3d00f54f-b972-4411-a853-0b9006f93a8c', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 5081, 'Emily Blunt', 'Emily', 'https://image.tmdb.org/t/p/w200/5nCSG5TL1bP1geD8aaBfaLnLLCD.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('16a8a5d2-1277-48df-b803-6121655af83c', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 2283, 'Stanley Tucci', 'Nigel', 'https://image.tmdb.org/t/p/w200/q4TanMDI5Rgsvw4SfyNbPBh4URr.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5a243100-8cb4-44d6-8057-c7d2f725335a', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 1284159, 'Simon Baker', 'Christian Thompson', 'https://image.tmdb.org/t/p/w200/8RPbdwSOJ3DEQDQaj05zBFaUu5f.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e79173cf-3ce6-44ab-93e1-b00b7fbeb5b2', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 5090, 'Adrian Grenier', 'Nate', 'https://image.tmdb.org/t/p/w200/ghSzUkiw7OjRq0poNOlCjbXbdU6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c51426d8-cd72-408a-b3e8-4e7b8acdffeb', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 10580, 'Tracie Thoms', 'Lily', 'https://image.tmdb.org/t/p/w200/9PKUJJtqFRbZDhme6uDzIu0mRIE.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7fb9151e-47dc-4b7e-b2dd-1b423a6544c9', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 10581, 'Rich Sommer', 'Doug', 'https://image.tmdb.org/t/p/w200/cfbJ3nyiyRpSq2mLrbbrbg1k3Dh.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cee5aa38-83fd-45ca-9c1e-eef9e5d4ab3b', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 10582, 'Daniel Sunjata', 'James Holt', 'https://image.tmdb.org/t/p/w200/w3Wa0d7j2auA2R8FQvjrgfB3ozo.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8ca991aa-1c61-4fcc-a693-c6161978e415', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 24535, 'David Marshall Grant', 'Richard Sachs', 'https://image.tmdb.org/t/p/w200/81E0yZVUrojvq10qKRdSvNkq9up.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d58b6214-d791-4f21-a9b2-1b0814f859c5', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 789, 'Trains étroitement surveillés', 'https://image.tmdb.org/t/p/w200/yzNCrmtT6o8gLlsYkXN9NlGNQkk.jpg', 1966, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('82c825d2-cf6a-4de3-8363-5b6605c1dea8', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 796, 'Sexe intentions', 'https://image.tmdb.org/t/p/w200/tkShoPdnzijP1VdADBLghgephTC.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7e46c798-69dc-4e0b-a2fe-8bde357d585f', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 840, 'Rencontres du troisième type', 'https://image.tmdb.org/t/p/w200/jznNbJ80WvvlbLdGEjNsvwycDZC.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b4927e8a-2049-4abf-885e-9c2c86fa8991', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9cbc84fc-49f3-4f78-9529-c6345c2842af', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 845, 'L''Inconnu du Nord-Express', 'https://image.tmdb.org/t/p/w200/6oSfav2yXyP009cBKoNEH0UYF10.jpg', 1951, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1ae90ca3-f024-4c3a-822b-f005158fc482', 'ff12da1b-0e52-47d8-aad1-5f386f41ae30', 805, 'Rosemary''s Baby', 'https://image.tmdb.org/t/p/w200/yKtdS5oaHEtBUD1Gq4rdOezzWp6.jpg', 1968, NOW());

COMMIT;

-- Movie: Graphic Desires
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('64a88f70-caa1-4462-b80e-1357c139800a', 'Graphic Desires', 'Graphic Desires', 2023, 'Andy Edwards', ARRAY['Andy Edwards'], '1h30min', ARRAY['Thriller', 'Crime'], 'Graphic Desires suit le parcours d''une jeune femme nommée Charlie, qui est une artiste numérique en pleine ascension. Elle commence à ressentir une forte attirance pour un mystérieux inconnu qu''elle découvre à travers une série d''illustrations graphiques sensuelles et troublantes. Au fil du temps, elle se retrouve de plus en plus obsédée par cet inconnu, au point de ne plus pouvoir distinguer la réalité de l''imaginaire. Charlie se retrouve alors plongée dans un monde de désirs inavoués et de sombres secrets, où chaque nouvelle illustration semble la rapprocher d''une vérité inquiétante sur sa propre vie. "Graphic Desires" explore les thèmes de l''obsession, de la dualité entre l''art et la vie, et de la fine frontière entre la réalité et la fiction. Au fur et à mesure que l''intrigue se déroule, Charlie doit faire face à des révélations choquantes qui la poussent à remettre en question sa propre identité et la nature de son désir.', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/3BjLdTWRiHc1ISIZMFvToOmghOM.jpg', 'https://image.tmdb.org/t/p/original/rHnANzYUmV3WZw3n0yWOLiR3pen.jpg', ARRAY[], 'film', 158.2495, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('7da2ca6c-70ea-4dbc-b566-4589f33816f3', '64a88f70-caa1-4462-b80e-1357c139800a', 976912, 'https://image.tmdb.org/t/p/original/rHnANzYUmV3WZw3n0yWOLiR3pen.jpg', 'https://image.tmdb.org/t/p/w500/3BjLdTWRiHc1ISIZMFvToOmghOM.jpg', 7.038, 78, NULL, 'Graphic Desires suit le parcours d''une jeune femme nommée Charlie, qui est une artiste numérique en pleine ascension. Elle commence à ressentir une forte attirance pour un mystérieux inconnu qu''elle découvre à travers une série d''illustrations graphiques sensuelles et troublantes. Au fil du temps, elle se retrouve de plus en plus obsédée par cet inconnu, au point de ne plus pouvoir distinguer la réalité de l''imaginaire. Charlie se retrouve alors plongée dans un monde de désirs inavoués et de sombres secrets, où chaque nouvelle illustration semble la rapprocher d''une vérité inquiétante sur sa propre vie. "Graphic Desires" explore les thèmes de l''obsession, de la dualité entre l''art et la vie, et de la fine frontière entre la réalité et la fiction. Au fur et à mesure que l''intrigue se déroule, Charlie doit faire face à des révélations choquantes qui la poussent à remettre en question sa propre identité et la nature de son désir.', 90, '2023-08-31', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('989d7aa8-7238-482f-b569-dffacffe5a3d', '64a88f70-caa1-4462-b80e-1357c139800a', 1085939, 'David Wayman', 'Franklin', 'https://image.tmdb.org/t/p/w200/M5U57NeWvj143cMIQSCdOEAFpp.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7bb40a4e-9210-4d79-b881-e73bf6bf26bc', '64a88f70-caa1-4462-b80e-1357c139800a', 2667809, 'Sian Altman', 'Candida', 'https://image.tmdb.org/t/p/w200/49DvxTVXjkNR95dTBdVnI6fI14a.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('36e9ced7-8e86-4242-921a-31c8e5264585', '64a88f70-caa1-4462-b80e-1357c139800a', 3367977, 'May Kelly', 'Atlanta / Lucinda', 'https://image.tmdb.org/t/p/w200/p1HXYttPQ3RaB4oDt3EOfNPRpb4.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c3311360-1442-4e9d-adf9-4f4df59673fc', '64a88f70-caa1-4462-b80e-1357c139800a', 3320644, 'Ocean M Harris', 'Brandon', 'https://image.tmdb.org/t/p/w200/7QwPdS5uyhuCKcSAo426JhoPDVi.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0edfe01c-56f8-4934-9945-ee7de1c8c8d8', '64a88f70-caa1-4462-b80e-1357c139800a', 1865766, 'Valis Volkova', 'Cooper', 'https://image.tmdb.org/t/p/w200/7Knlbu24ZKfOOX5OLyDDQ7klA8Z.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('44980825-0b64-416f-bb4b-9ba069ba7796', '64a88f70-caa1-4462-b80e-1357c139800a', 3553535, 'Jack Edwards', 'The Bleeding Cowboy', NULL, 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0cb955b8-5ec4-49e8-b734-9b8ee2d4d2d6', '64a88f70-caa1-4462-b80e-1357c139800a', 3553537, 'Caidney Simone', 'Casey', NULL, 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2c8177cb-e3d8-4651-9769-5c6f49a087bc', '64a88f70-caa1-4462-b80e-1357c139800a', 3489245, 'Eva Ray', 'Georgia', 'https://image.tmdb.org/t/p/w200/qWhxXG764l2G5ezoMvRZX5uChLG.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8f7b12d4-b3a1-4581-9818-8889fb49d8b7', '64a88f70-caa1-4462-b80e-1357c139800a', 3553539, 'Felicia Westring', 'Korinna', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('747ed12e-755c-4963-826d-d95daf4ae9d0', '64a88f70-caa1-4462-b80e-1357c139800a', 1475390, 'Fahad Salman', 'Jokerman', 'https://image.tmdb.org/t/p/w200/cqCPqcZXZWrBbdNj0DtTqHmELN1.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('10b2560b-890b-44ec-9c2a-7852c9739f5d', '64a88f70-caa1-4462-b80e-1357c139800a', 8984, 'Harcèlement', 'https://image.tmdb.org/t/p/w200/ehBKgyIIdw3HTT1nwVe9uy4NiRJ.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('39f2af3a-2f62-4408-913f-bba590b3a84a', '64a88f70-caa1-4462-b80e-1357c139800a', 614742, 'Writer''s Block', 'https://image.tmdb.org/t/p/w200/aqVHp8XqL8uxE7WQNrJbKCQB54P.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('fa065928-259d-469a-b3c7-5b15ff8103df', '64a88f70-caa1-4462-b80e-1357c139800a', 438674, 'Traîné sur le bitume', 'https://image.tmdb.org/t/p/w200/aTXiGzob8DbeZSNhaSni6rfcR78.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('11a5fd2d-15c2-45ea-83f2-6488e80dbc21', '64a88f70-caa1-4462-b80e-1357c139800a', 9010, 'Silentium', 'https://image.tmdb.org/t/p/w200/uca8Pb96wSgcTuUYaT5Nb3IIAzu.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5e5061d3-8639-44fd-bc10-8dffb68a8243', '64a88f70-caa1-4462-b80e-1357c139800a', 9022, 'Tous les garçons aiment Mandy Lane', 'https://image.tmdb.org/t/p/w200/uac8ntNtyN2oOrTBxolUqUfZaeX.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('777cd8e1-87f4-4d1c-9991-f1ad24654866', '64a88f70-caa1-4462-b80e-1357c139800a', 262127, 'എസ്കേപ് ഫ്രം ഉഗാണ്ട', 'https://image.tmdb.org/t/p/w200/2lHefLofYx1oXLTI002DD2bwNxG.jpg', 2013, NOW());

COMMIT;

-- Movie: Iron Lung
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('08dabd1b-3361-4d68-93fd-84c9d35b6edb', 'Iron Lung', 'Iron Lung', 2026, 'Mark Fischbach', ARRAY['Mark Fischbach'], '2h5min', ARRAY['Horreur', 'Mystère', 'Science-Fiction'], 'Les étoiles ne sont plus. Les planètes ont disparu. Seuls quelques individus subsistent, à bord de stations spatiales ou de vaisseaux errants. Ils ont survécu pour assister à la fin — et lui donner un nom : « Le Rapt silencieux ». Après des années de déclin et d’infrastructures en perdition, l’Iron Consolidation fait une découverte sur une lune désolée, AT-5. Un océan de sang. L’Iron Consolidation lance immédiatement une expédition, avec l’espoir d’y trouver des ressources cruciales. Un sous-marin est construit, et un condamné y est enfermé. En raison de la pression et de la profondeur de l’océan, l’hublot frontal du sous-marin est masqué par un bouclier de métal. S’il s’en sort, il gagnera sa liberté. Sinon, un autre suivra.', '', 'https://image.tmdb.org/t/p/w200/2y59nq7vipTBdRMmMTsy1d4HeiG.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/sIwakdbMGS1krtgendTWpxTY9Hw.jpg', 'https://image.tmdb.org/t/p/original/gqGQ0zADV5FIcgMWtWX8FcGQjFp.jpg', ARRAY[], 'film', 145.7933, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('80a814db-7687-442b-a035-2881dea1b31e', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 1116201, 'https://image.tmdb.org/t/p/original/gqGQ0zADV5FIcgMWtWX8FcGQjFp.jpg', 'https://image.tmdb.org/t/p/w500/sIwakdbMGS1krtgendTWpxTY9Hw.jpg', 7.292, 168, NULL, 'Les étoiles ne sont plus. Les planètes ont disparu. Seuls quelques individus subsistent, à bord de stations spatiales ou de vaisseaux errants. Ils ont survécu pour assister à la fin — et lui donner un nom : « Le Rapt silencieux ». Après des années de déclin et d’infrastructures en perdition, l’Iron Consolidation fait une découverte sur une lune désolée, AT-5. Un océan de sang. L’Iron Consolidation lance immédiatement une expédition, avec l’espoir d’y trouver des ressources cruciales. Un sous-marin est construit, et un condamné y est enfermé. En raison de la pression et de la profondeur de l’océan, l’hublot frontal du sous-marin est masqué par un bouclier de métal. S’il s’en sort, il gagnera sa liberté. Sinon, un autre suivra.', 125, '2026-01-30', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c87b3870-85fc-48c2-954b-199a9c0b8589', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 1494060, 'Mark Fischbach', 'Simon', 'https://image.tmdb.org/t/p/w200/2y59nq7vipTBdRMmMTsy1d4HeiG.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('169507f1-0e69-4827-8ee0-f00078c41dc4', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 2602912, 'Caroline Kaplan', 'Ava', 'https://image.tmdb.org/t/p/w200/oMOswhHN3LfRtziULWTxNiYgAFj.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('793cddd7-4378-4727-a5bc-17badfb0f03e', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 963818, 'Troy Baker', 'David', 'https://image.tmdb.org/t/p/w200/9jeUft7h20HscRCrsVQTgKHXRwJ.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6fd11156-5e1b-4b4c-b0a5-08e8f8ddbeb9', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 2444615, 'Elsie Lovelock', 'SM-8 Research Lead / The Speaker (voice)', 'https://image.tmdb.org/t/p/w200/aVI0QKCJVbIPBFY99E2VLKCpaXa.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4da2f102-d32e-4e1d-9c3c-955ed49698a5', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 1042667, 'Elle LaMont', 'SM-8 Research Assistant / The Whisper (voice)', 'https://image.tmdb.org/t/p/w200/uR16F3g1J32HgvnlHW890ZAFnnT.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d5693f88-d965-4fc1-bea0-b876f6c4cf91', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 1298793, 'Mick Lauer', 'The Guy Who Told You to Cross the Wires (voice)', 'https://image.tmdb.org/t/p/w200/gE18SWyqRjbfuAfNi5Al2M122pL.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3aec95db-b6f3-4651-a67f-17e24e6bb582', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 1243018, 'Dave Pettitt', 'The Father', 'https://image.tmdb.org/t/p/w200/qaohw3Q0M57lSww37pK421b7P04.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ca3ed4d4-541f-4594-a986-ca53ad5a6048', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 963313, 'Holt Boggs', 'Eden Soldier', 'https://image.tmdb.org/t/p/w200/jiTZr7sqFqJIHxKxYa4uxFnW6rK.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d5d01007-3a72-45b0-bb4c-e082396dfa04', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 5972532, 'Isaac McKee', 'Young Simon', 'https://image.tmdb.org/t/p/w200/6Zetel3zXvQF7tlQcuncmfkZAzR.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d7d8cc46-1582-4c00-b0d1-3ab3af08deb8', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 4692741, 'Roman Parsons Crow', 'Child of Eden', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8c8e2eb1-c12c-45ec-8a49-1295c43eb33d', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 11020, 'Pique-nique à Hanging Rock', 'https://image.tmdb.org/t/p/w200/e5myKEaZHh506KekQv0DECddflz.jpg', 1975, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a84d5142-f76a-4e80-9111-91dbd9093277', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 441669, 'Butcher the Bakers', 'https://image.tmdb.org/t/p/w200/6AXFxrot8sXHD2TfMEgE5ZkJC2k.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e88855b7-589d-4227-8637-9ef02aae619a', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 11260, 'Appelez-moi Dave', 'https://image.tmdb.org/t/p/w200/rB8cemSXMwuZyrZQiXIfE17fPWd.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('aa604ec8-c1b1-496b-8e25-772b4918b479', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 11494, 'Wilderness', 'https://image.tmdb.org/t/p/w200/sLtUVG7ORbTJueTmIWpO4YeHayS.jpg', 2006, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bea7e493-3b75-4579-a2b2-cfa4f225b5e0', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 11587, 'L''Exorciste, la suite', 'https://image.tmdb.org/t/p/w200/1S7igWeo7Ty16FRGWkAZEyDxqar.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0a2028a1-17f3-43f8-bc14-02dbf2d6ee5a', '08dabd1b-3361-4d68-93fd-84c9d35b6edb', 11596, 'Freddy sort de la nuit', 'https://image.tmdb.org/t/p/w200/oHTDAuadMvuiiTi5EPBLYz1GazE.jpg', 1994, NOW());

COMMIT;

-- Movie: Avatar : De feu et de cendres
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('64087181-bbda-4a9f-b7cf-63570d6b36f9', 'Avatar : De feu et de cendres', 'Avatar: Fire and Ash', 2025, 'James Cameron', ARRAY['James Cameron', 'Rick Jaffa', 'Amanda Silver'], '3h18min', ARRAY['Science-Fiction', 'Aventure', 'Fantastique'], 'Après la mort de Neteyam, Jake et Neytiri affrontent leur chagrin tout en faisant face au Peuple des Cendres, une tribu Na’vi redoutable menée par la fougueuse Varang, alors que le conflit sur Pandora s’intensifie et qu’une nouvelle quête morale s’amorce.', '', 'https://image.tmdb.org/t/p/w200/9NAZnTjBQ9WcXAQEzZpKy4vdQto.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/kG3N8oQ10qiw2MsnSHFGJpQNyEy.jpg', 'https://image.tmdb.org/t/p/original/iN41Ccw4DctL8npfmYg1j5Tr1eb.jpg', ARRAY[], 'film', 154.2828, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('ead776ab-5058-48c7-90fe-ed6040f71bf4', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 83533, 'https://image.tmdb.org/t/p/original/iN41Ccw4DctL8npfmYg1j5Tr1eb.jpg', 'https://image.tmdb.org/t/p/w500/kG3N8oQ10qiw2MsnSHFGJpQNyEy.jpg', 7.53, 3261, 'Le monde de Pandora changera à jamais.', 'Après la mort de Neteyam, Jake et Neytiri affrontent leur chagrin tout en faisant face au Peuple des Cendres, une tribu Na’vi redoutable menée par la fougueuse Varang, alors que le conflit sur Pandora s’intensifie et qu’une nouvelle quête morale s’amorce.', 198, '2025-12-17', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c42e52ad-0f7a-4af6-bdc3-e3090a93e6fb', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 65731, 'Sam Worthington', 'Jake', 'https://image.tmdb.org/t/p/w200/mflBcox36s9ZPbsZPVOuhf6axaJ.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1b68a6b4-4cec-42a2-9995-ccdc633737a2', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 8691, 'Zoe Saldaña', 'Neytiri', 'https://image.tmdb.org/t/p/w200/iOVbUH20il632nj2v01NCtYYeSg.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a25dbe48-6290-409f-89fd-2e730bec8e35', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 10205, 'Sigourney Weaver', 'Kiri', 'https://image.tmdb.org/t/p/w200/wTSnfktNBLd6kwQxgvkqYw6vEon.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('04bee903-fc2d-44c6-87d1-7e4eef557295', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 32747, 'Stephen Lang', 'Quaritch', 'https://image.tmdb.org/t/p/w200/gnO5VfkDgA2fsHweD0622LUY3Hu.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7cc689a3-a2bb-40ef-ae5b-2fce57c37724', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 566331, 'Oona Chaplin', 'Varang', 'https://image.tmdb.org/t/p/w200/uYnBSVKcFgw48Wxts01Dh5Gxlar.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('960499cd-1d51-453a-a5ef-cd33b14a6a70', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 1895760, 'Jack Champion', 'Spider', 'https://image.tmdb.org/t/p/w200/8PXFKzhjFJ0oYP60Bj1kA44XBjY.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34dbc20d-e2d6-4c1d-b215-ae9f320cae45', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 204, 'Kate Winslet', 'Ronal', 'https://image.tmdb.org/t/p/w200/surklDlLW6g2D7EqycEQwHXsoD1.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8e58c6f8-cd2d-4fa5-b252-af7c678f6e08', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 7248, 'Cliff Curtis', 'Tonowari', 'https://image.tmdb.org/t/p/w200/dfaElGoyJWseFWxXwEMLL9WTi7V.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('701a7363-f3ca-4566-b67e-1961d155cc74', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 59231, 'Joel David Moore', 'Norm', 'https://image.tmdb.org/t/p/w200/mMVhVglj6BZFuvqAXnEibce08k7.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('497cd869-2bb6-4285-972d-dc333749179f', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 30485, 'CCH Pounder', 'Mo''at', 'https://image.tmdb.org/t/p/w200/mr6BLDN75T8DJl9dNK3hN4YwqJa.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('affd550c-cf6e-4ea6-937a-435b050d74ec', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 11024, 'Scooby-Doo 2 : Les Monstres se déchaînent', 'https://image.tmdb.org/t/p/w200/uM8lgzmMz0Y2Aqw51kE1F3bUr6q.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('363f3226-7962-4c1e-8704-94f93a19dcdc', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 11224, 'Cendrillon', 'https://image.tmdb.org/t/p/w200/nqSJwBdvG89uHRpDDdaAy5YhogZ.jpg', 1950, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7279fbec-ceea-4fa2-99fb-2d01b2bc05a4', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 11260, 'Appelez-moi Dave', 'https://image.tmdb.org/t/p/w200/rB8cemSXMwuZyrZQiXIfE17fPWd.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0c56b3e0-26db-4a57-a8eb-2cbb65e34188', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 1533042, 'Poultrygeist 2: Dawn of the Chicken Dead', 'https://image.tmdb.org/t/p/w200/pTWLw2LfLnspJlz9XpH434IQR0X.jpg', NULL, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ad2e2b58-8bb2-4cc1-b045-efc19c9af74e', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 1172649, 'Soultribe - Ein Tanz des Lebens', 'https://image.tmdb.org/t/p/w200/nqXyPH5elH5Z4k39PfUnll3LQcm.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8e7ed44d-6b20-4adb-a637-2180e52d8709', '64087181-bbda-4a9f-b7cf-63570d6b36f9', 618354, 'Superman : L''Homme de demain', 'https://image.tmdb.org/t/p/w200/wpzb0qq2QdHXYo7ZYk5CPLfYfka.jpg', 2020, NOW());

COMMIT;

-- Movie: Jumpers
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('baa8ed96-2159-432e-b696-5dbd4fe73f2d', 'Jumpers', 'Hoppers', 2026, 'Daniel Chong', ARRAY['Jesse Andrews'], '1h44min', ARRAY['Aventure', 'Animation', 'Comédie', 'Familial', 'Science-Fiction'], 'Mabel, une amoureuse des animaux, utilise une nouvelle technologie pour "transférer" sa conscience dans un robot-castor réaliste et communiquer directement avec les animaux. Alors qu''elle découvre des mystères du monde animal dépassant tout ce qu''elle aurait pu imaginer, Mabel se lie d''amitié avec Roi Georges, un charismatique castor, et doit rallier tout le règne animal pour faire face à une menace humaine majeure et imminente : le maire Jerry Generazzo, un beau parleur.', '', 'https://image.tmdb.org/t/p/w200/gMYqVwLdoaPhIFyWUAQrRlGGjkE.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/gme8X6Y0b1wutuW6kB039i9NwCr.jpg', 'https://image.tmdb.org/t/p/original/u53UYu5XG2hNgWGvs3xGhAVzypl.jpg', ARRAY[], 'film', 145.8289, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('24c0760e-5ff3-4fd9-8240-b927dcd69685', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1327819, 'https://image.tmdb.org/t/p/original/u53UYu5XG2hNgWGvs3xGhAVzypl.jpg', 'https://image.tmdb.org/t/p/w500/gme8X6Y0b1wutuW6kB039i9NwCr.jpg', 8.167, 1316, 'Avoir l''air naturel… ou presque !', 'Mabel, une amoureuse des animaux, utilise une nouvelle technologie pour "transférer" sa conscience dans un robot-castor réaliste et communiquer directement avec les animaux. Alors qu''elle découvre des mystères du monde animal dépassant tout ce qu''elle aurait pu imaginer, Mabel se lie d''amitié avec Roi Georges, un charismatique castor, et doit rallier tout le règne animal pour faire face à une menace humaine majeure et imminente : le maire Jerry Generazzo, un beau parleur.', 104, '2026-03-04', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c15576ca-3aaa-41b1-8691-5fbe35294634', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1308818, 'Piper Curda', 'Mabel (voice)', 'https://image.tmdb.org/t/p/w200/oyitEBcracNWMuF8Frhsqkjgzuc.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9c856a78-4be5-4016-9793-38aa0ec8037c', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 452205, 'Bobby Moynihan', 'King George (voice)', 'https://image.tmdb.org/t/p/w200/gOvwNz5joi5yWJ7dAhuF8WA2aas.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('76d54dbb-20e0-4e72-b5c3-6cc1e6960d1b', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 65717, 'Jon Hamm', 'Mayor Jerry Generazzo (voice)', 'https://image.tmdb.org/t/p/w200/mrXE5fZbEDPc7BEE5G21J6qrwzi.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('143a840f-ed94-43cb-a62c-1b37a6bdd66e', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 11074, 'Kathy Najimy', 'Dr. Sam (voice)', 'https://image.tmdb.org/t/p/w200/nqbZF7Igr0SC8Xq8y0jwmx0mLDN.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('24318b2e-3fbf-4b12-9641-0c9acc79a8e7', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 54697, 'Dave Franco', 'Insect King (voice)', 'https://image.tmdb.org/t/p/w200/d0I1BgNBAVvLJEDSfmyNVjYWPZE.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3c6dfefb-7d84-425b-8a7d-893db0623ddb', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1653235, 'Eduardo Franco', 'Loaf (voice)', 'https://image.tmdb.org/t/p/w200/FOnx5Rg8L7xvEWkBhNoXwhELd6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eefae7a9-ae93-480b-9b8b-a2e30ab1c7c6', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1625231, 'Aparna Nancherla', 'Nisha (voice)', 'https://image.tmdb.org/t/p/w200/vwpktqJnQCAGEfq2EKUjB8ZdnhI.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e4553a85-31d8-48ee-b20c-ddfa6e3675cf', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1798896, 'Tom Law', 'Tom Lizard (voice)', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2160b644-0d32-42ac-b7ed-269a681ac0aa', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1429453, 'Sam Richardson', 'Conner (voice)', 'https://image.tmdb.org/t/p/w200/hUN7IIbegvL7aSqQI5KRWoqqJLm.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0cd45883-1e1c-4e6d-b500-6f3e95298961', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 1695631, 'Melissa Villaseñor', 'Ellen (voice)', 'https://image.tmdb.org/t/p/w200/144VoO4M5sU0Mn4lpTOYQFAgNVO.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e6bb3a13-abd2-4183-a77f-8b6a3e8ca43d', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 809, 'Shrek 2', 'https://image.tmdb.org/t/p/w200/2e8hcPLaWjLXdQLgdi5otr4Jj9L.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('10c41edf-0130-428f-a9f1-bb7286df5e3f', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 810, 'Shrek le troisième', 'https://image.tmdb.org/t/p/w200/iV8HuZuij5CvfPl0RucGCmA6NB5.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d4acec5a-54c4-433e-906c-b0ad11ac4516', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 816, 'Austin Powers', 'https://image.tmdb.org/t/p/w200/sqbYNe6ILOWGLE6CBmTVi11Zbz7.jpg', 1997, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('191021be-33f7-42ef-bd6f-95ed513fea0e', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 812, 'Aladdin', 'https://image.tmdb.org/t/p/w200/7Hf6Y7WRRRVDBHn5lJghcXXp4DT.jpg', 1992, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('779e7679-f7de-4f01-8c63-ea98fd1d6492', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 813, 'Y a-t-il un pilote dans l''avion ?', 'https://image.tmdb.org/t/p/w200/7pH55GUezP1isKGo16ehbmRB1pK.jpg', 1980, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ce6784e6-d2d9-4519-aadc-f3b96bc83686', 'baa8ed96-2159-432e-b696-5dbd4fe73f2d', 817, 'Austin Powers : L''Espion qui m''a tirée', 'https://image.tmdb.org/t/p/w200/ikM7IfM2rQxv0gltOk4hllQTNvw.jpg', 1999, NOW());

COMMIT;

-- Movie: കാട്ടാളൻ
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('a1150125-32d5-42a4-a6c9-768639165ee8', 'കാട്ടാളൻ', 'കാട്ടാളൻ', 2026, 'Paul George', ARRAY['Paul George', 'Jero Jacob', 'Joby Varghese'], '1h59min', ARRAY['Action', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/53FATyQirV8BuBcrsQMGPvGKgCu.jpg', 'https://image.tmdb.org/t/p/original/wvmfToHjflWab2PHKG1vCqg2Asx.jpg', ARRAY[], 'film', 151.4169, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('74ff4bde-f1e8-441a-be68-c299bfef3048', 'a1150125-32d5-42a4-a6c9-768639165ee8', 1065834, 'https://image.tmdb.org/t/p/original/wvmfToHjflWab2PHKG1vCqg2Asx.jpg', 'https://image.tmdb.org/t/p/w500/53FATyQirV8BuBcrsQMGPvGKgCu.jpg', 6, 1, NULL, '', 119, '2026-05-14', 'ml', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4b2bfeba-7187-4c17-be9b-7cc38dc9dcb2', 'a1150125-32d5-42a4-a6c9-768639165ee8', 1758913, 'Antony Varghese', 'Antony Varghese', 'https://image.tmdb.org/t/p/w200/dKRa8ghSXw6J1OTcxMziZh3l1jb.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ec46610d-24be-45b1-a856-bbf33394e371', 'a1150125-32d5-42a4-a6c9-768639165ee8', 213428, 'Sunil Varma', 'Maari', 'https://image.tmdb.org/t/p/w200/ifmUCkLgpEzbfnRjIw62otrADpI.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('43f6c5ae-d10c-4f44-8716-61afa1dd8c40', 'a1150125-32d5-42a4-a6c9-768639165ee8', 1974753, 'Dushara Vijayan', 'Lucy', 'https://image.tmdb.org/t/p/w200/5C5V9qdYil7LVCp8LqctZCEsu1n.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('faafac9c-2185-4b87-9278-e213c2067b51', 'a1150125-32d5-42a4-a6c9-768639165ee8', 111669, 'Jagadish', 'Ali', 'https://image.tmdb.org/t/p/w200/ml3XX5bWPIdHUPvqhW2MYYZ8H7Y.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('05c8e848-5ddf-47bf-b392-1d20bdb1ccf3', 'a1150125-32d5-42a4-a6c9-768639165ee8', 1543640, 'Kabir Duhan Singh', 'Eddy', 'https://image.tmdb.org/t/p/w200/lAVAxFARP63oTHMYWpwHrWsXPWa.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('61213efe-ef71-49da-b92c-32d3d7fca03a', 'a1150125-32d5-42a4-a6c9-768639165ee8', 4555786, 'Parth Tiwari', 'Roby', NULL, 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f29b5601-a4c0-489e-a40d-a29ea04c3590', 'a1150125-32d5-42a4-a6c9-768639165ee8', 2520756, 'Raj Tirandasu', 'Maari 95', 'https://image.tmdb.org/t/p/w200/dnuD0t8xpELhXs4tKZDRdsFureg.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('76da0e7f-255d-4be2-87c8-64abd839fd4c', 'a1150125-32d5-42a4-a6c9-768639165ee8', 111668, 'Siddique', 'George D’Peter', 'https://image.tmdb.org/t/p/w200/tMv7QsmYlXAXtP75D3eIxXHpgTv.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0551493c-0a31-42d6-94be-22faf006bb59', 'a1150125-32d5-42a4-a6c9-768639165ee8', 1657965, 'Anson Paul', 'Stanley', 'https://image.tmdb.org/t/p/w200/tuuQTQFh4qMY7EOP9rgVlz0Y57y.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c744f422-2411-447d-8c0e-23e26c72b57c', 'a1150125-32d5-42a4-a6c9-768639165ee8', 5549653, 'Hanan Shaah', 'Malik', NULL, 9, NOW());

COMMIT;

-- Movie: கருப்பு
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e4bc0546-f11b-4d69-bc46-1c2875c77840', 'கருப்பு', 'கருப்பு', 2026, 'RJ Balaji', ARRAY['RJ Balaji', 'Ashwin Ravichandran', 'Rahul Raj', 'T. S. Gopi Krishnan', 'Karan Aravind Kumar'], '2h31min', ARRAY['Action', 'Fantastique'], '', '', 'https://image.tmdb.org/t/p/w200/vguX29CK1j9JGOoHQOO5MGsQrT6.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/4KZXlZ5tTT6ghbW77gS4hSLkCd7.jpg', 'https://image.tmdb.org/t/p/original/1eAuwNBy34kkM3xkl202z4f1NiI.jpg', ARRAY[], 'film', 128.292, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('95d02b0a-96e2-4629-921e-adc393f2f622', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 1367220, 'https://image.tmdb.org/t/p/original/1eAuwNBy34kkM3xkl202z4f1NiI.jpg', 'https://image.tmdb.org/t/p/w500/4KZXlZ5tTT6ghbW77gS4hSLkCd7.jpg', 7.3, 9, NULL, '', 151, '2026-05-14', 'ta', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('84109594-2f75-430e-890e-336197f396c0', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 85720, 'Suriya', 'Karuppasamy / Saravanan', 'https://image.tmdb.org/t/p/w200/hIFXv3gIjlNS78gJmaguEOxvfPH.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b4d4ab36-f564-40d8-9c2d-59c34b5ccc33', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 116925, 'Trisha Krishnan', 'Preethi', 'https://image.tmdb.org/t/p/w200/jfeAV0VeAQhKONzIv1UEYbklJGn.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fd2bf593-c5ce-4fba-952b-8d1851924761', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 1182187, 'RJ Balaji', 'Baby Kannan ''BK'' / Usilampatti Karuppaiah Gandhi ''UKG''', 'https://image.tmdb.org/t/p/w200/vguX29CK1j9JGOoHQOO5MGsQrT6.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c4610f10-18f0-4db3-8def-9465121bf9e8', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 1061913, 'Indrans', 'Mattancherry Sukumaran', 'https://image.tmdb.org/t/p/w200/vs5Acy2hJ4dWoM3xRGdnFKdVXzw.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('31efa339-a44b-4508-83db-585c99397867', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 3531368, 'Anagha Maya Ravi', 'Binu Sukumaran', 'https://image.tmdb.org/t/p/w200/4eJdSUgSIHoddsnNVNJTEUKpF17.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d2010117-7fc4-4c53-a866-03c879cfaf2f', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 1174161, 'Swasika', 'Vasanthi', 'https://image.tmdb.org/t/p/w200/7LWxyKwGH5S1ZwEEjlbBcDUJKk8.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d73d7fe1-8de7-4836-88f3-ba8f55f30af5', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 223162, 'Sshivada Nair', 'Kanmani', 'https://image.tmdb.org/t/p/w200/wfXsqcfCdrQFdzxPSwNVNCsojFO.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a853e1d7-80d2-45ad-87ec-7b5da4495251', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 223148, 'Natarajan Subramaniam', 'Chief Metropolitan Magistrate M.D. Rajanayagam', 'https://image.tmdb.org/t/p/w200/1sKmgVKSw8qJUzBTJGvL45wlDss.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5b3839ac-4260-4c9b-920f-2fb65a138a12', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 213431, 'Supreet', 'Gowri', 'https://image.tmdb.org/t/p/w200/3HZopNIG3zeaSpbGjEvsdmoXjaR.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b2efefbd-51d0-4ea5-9667-30883991d46d', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 4912601, 'Poobalam Pragatheeswaran', 'Shanmugam aka Peiyi', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('98e3a892-f9a0-4e8f-b5c7-950d7e4786e0', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 442370, 'Prédateurs', 'https://image.tmdb.org/t/p/w200/2116LiCF1feFfYweRLjH9FeHXjw.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3871a4c4-4630-4224-aa74-d0f79ea72646', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 15943, 'Un candidat au poil', 'https://image.tmdb.org/t/p/w200/l9mTb9ovwkhdUgOADe7SuvISfSf.jpg', 1976, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1e9264ee-f02a-4729-8a39-d76d95156a0e', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 16311, 'Twentyman', 'https://image.tmdb.org/t/p/w200/qYGRCIFFbXAxvARQtzC4pG693dC.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7e0a217e-befb-4042-9509-44af2f5700f4', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 21040, 'Protection rapprochée', 'https://image.tmdb.org/t/p/w200/fc7SP7MNJ7jGU1FkBUcMShluEen.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('449758ca-b363-4893-812a-4756596f113c', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 20968, 'सर्कार', 'https://image.tmdb.org/t/p/w200/csdv0iVY2B6TX7QbMDTBOGnoWCM.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1f5bd25a-7b8a-4b9b-9c45-64ad44ff6765', 'e4bc0546-f11b-4d69-bc46-1c2875c77840', 21733, 'Dragons Forever', 'https://image.tmdb.org/t/p/w200/dVAAUBgnWsBJ870bOm204wBnc7Z.jpg', 1988, NOW());

COMMIT;

-- Movie: Apex
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('d8a595eb-d998-499f-b804-f90275791ecb', 'Apex', 'Apex', 2026, 'Baltasar Kormákur', ARRAY['Jeremy Robbins'], '1h36min', ARRAY['Action', 'Thriller'], 'Alors qu''elle teste ses limites en solo dans la nature sauvage australienne, une femme en deuil se retrouve prise au piège d''un jeu tordu avec un tueur qui a fait d''elle sa proie.', '', 'https://image.tmdb.org/t/p/w200/bpWHj7MUtv0bNRuCET69UWQRa0o.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/55lEECwWtRWltEa6u3TbiljaoOd.jpg', 'https://image.tmdb.org/t/p/original/oTE4lNs4PSG5iIWjqaTdCIFJ4Bs.jpg', ARRAY[], 'film', 122.1691, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('1f054edf-adda-4bcc-902e-015def0d235b', 'd8a595eb-d998-499f-b804-f90275791ecb', 1318447, 'https://image.tmdb.org/t/p/original/oTE4lNs4PSG5iIWjqaTdCIFJ4Bs.jpg', 'https://image.tmdb.org/t/p/w500/55lEECwWtRWltEa6u3TbiljaoOd.jpg', 6.723, 1320, 'Traquer. Survivre.', 'Alors qu''elle teste ses limites en solo dans la nature sauvage australienne, une femme en deuil se retrouve prise au piège d''un jeu tordu avec un tueur qui a fait d''elle sa proie.', 96, '2026-04-24', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('63be6e41-9d4d-40e5-8e7a-1f779f43a3c2', 'd8a595eb-d998-499f-b804-f90275791ecb', 6885, 'Charlize Theron', 'Sasha', 'https://image.tmdb.org/t/p/w200/gd7ShD0yt4bsR2STeQ19KQ6hvXL.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('60a3216c-3081-423f-a475-6fb57f4cc23a', 'd8a595eb-d998-499f-b804-f90275791ecb', 1303037, 'Taron Egerton', 'Ben', 'https://image.tmdb.org/t/p/w200/uCaPhyKAQIfEzAWWCYIrO2004CB.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('00e30408-4104-46e2-9c04-9b40c280d1c7', 'd8a595eb-d998-499f-b804-f90275791ecb', 8783, 'Eric Bana', 'Tommy', 'https://image.tmdb.org/t/p/w200/l9yoDgw3YFC2gMD1HTo5djGOwSY.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e4bfc197-9a3c-4aa3-a9d3-b7bdddfb6c18', 'd8a595eb-d998-499f-b804-f90275791ecb', 145245, 'Caitlin Stasey', 'Leah', 'https://image.tmdb.org/t/p/w200/uJW62qSjIyI0OP30s5U8KLlDw32.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1136865f-0353-41ae-a47b-d7348e1c79ac', 'd8a595eb-d998-499f-b804-f90275791ecb', 2933227, 'Bessie Holland', 'Cashier', 'https://image.tmdb.org/t/p/w200/pWjjlOAs61Rxy2KbAXACxL2eJ9w.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c036c0b8-5183-48d2-8b63-0e8c36491748', 'd8a595eb-d998-499f-b804-f90275791ecb', 1245420, 'Zachary Garred', 'Sean', 'https://image.tmdb.org/t/p/w200/zBveIZvcVCkWTcAWEV88MwpynyG.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e366ed1c-a989-4eac-a7c9-3d0dfe5dff8e', 'd8a595eb-d998-499f-b804-f90275791ecb', 1046893, 'Matt Whelan', 'Hunter', 'https://image.tmdb.org/t/p/w200/qTIe7SblKwxR9DF6iNuVX0pEWIZ.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('16bae74e-1e25-4106-be96-589cad026ef5', 'd8a595eb-d998-499f-b804-f90275791ecb', 1240306, 'Rob Carlton', '2nd Hunter', 'https://image.tmdb.org/t/p/w200/8K0E0FaNDiCWvx1u6Xe3MAOHEGu.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0bbe807e-3f1f-4207-91ea-953260ae503b', 'd8a595eb-d998-499f-b804-f90275791ecb', 126579, 'Aaron Pedersen', 'Park Ranger', 'https://image.tmdb.org/t/p/w200/3SoOwjIPULquiuo0yBWAwVamJFj.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eaf24ac5-cc95-497e-a918-f5ad52016cec', 'd8a595eb-d998-499f-b804-f90275791ecb', 1928966, 'Duncan Fellows', 'Dad', 'https://image.tmdb.org/t/p/w200/kG6EGc5dR5A0mGhTpIcxK9lkL1k.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d521b701-b1fb-4bf9-947e-05ff5906754e', 'd8a595eb-d998-499f-b804-f90275791ecb', 790646, 'The Toll', 'https://image.tmdb.org/t/p/w200/2BTbYZ1zdNrpFRvLFEkRUP5vCJd.jpg', 2021, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('46462bf4-aead-4e2b-a044-87b5ab020a3e', 'd8a595eb-d998-499f-b804-f90275791ecb', 1700, 'Misery', 'https://image.tmdb.org/t/p/w200/vRJEpqZ3BX7N2SzAidQONcsrZsQ.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a9bcd0dd-0438-488c-aaf2-2cbbee7ee7d3', 'd8a595eb-d998-499f-b804-f90275791ecb', 613178, 'Shadow Wolves', 'https://image.tmdb.org/t/p/w200/xPLyuKO74kbFS6PmSUKLsJHnLHa.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('d2fb092f-1415-464f-b3af-2dcd311f6401', 'd8a595eb-d998-499f-b804-f90275791ecb', 20187, 'La Sanction', 'https://image.tmdb.org/t/p/w200/bERSKJZJfFDPie46ruVO4iGJ46.jpg', 1975, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cb5ed781-bae0-4097-b5fe-e5756f3802c8', 'd8a595eb-d998-499f-b804-f90275791ecb', 20372, 'Le rescapé', 'https://image.tmdb.org/t/p/w200/nyH8PvUZm8ojXksAhX0xTDg4yRe.jpg', 1957, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8ed8300a-a3b5-4645-b647-fd19a25af3e3', 'd8a595eb-d998-499f-b804-f90275791ecb', 1369679, 'Get Fast', 'https://image.tmdb.org/t/p/w200/tDpTR7xhHu9cz1X4JAIRFwXyf6U.jpg', 2024, NOW());

COMMIT;

-- Movie: सिस्टम
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('c9cab781-025e-4d14-a2dd-e9c063a4f63d', 'सिस्टम', 'सिस्टम', 2026, 'Ashwiny Iyer Tiwari', ARRAY['Arun Sukumar', 'Harman Baweja', 'Ashwiny Iyer Tiwari', 'Tasneem Lokhandwala'], '2h4min', ARRAY['Thriller'], '', '', 'https://image.tmdb.org/t/p/w200/b7n68jbzVAN68CJSI8ubERlToli.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/8qrddM5BRcTuqjc9crJY6e3gyE6.jpg', 'https://image.tmdb.org/t/p/original/7f9ZaTwyqQOJtNWUS7xZgWQOzSt.jpg', ARRAY[], 'film', 105.014, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('a4d77c09-4123-48f3-a2ef-d0ed4d2899ac', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 1431071, 'https://image.tmdb.org/t/p/original/7f9ZaTwyqQOJtNWUS7xZgWQOzSt.jpg', 'https://image.tmdb.org/t/p/w500/8qrddM5BRcTuqjc9crJY6e3gyE6.jpg', 7.5, 2, NULL, '', 124, '2026-05-22', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1afc0654-5e94-45aa-9b17-d3534f1ffd62', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 130958, 'Sonakshi Sinha', 'Neha Rajvansh', 'https://image.tmdb.org/t/p/w200/7HaI5owaKzOb6Qdtwifp29uhHk2.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9b20926d-1e4d-42c9-94ff-eb6862ad16a6', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 147324, 'Jyothika', 'Sarika Rawat', 'https://image.tmdb.org/t/p/w200/9rcFS99kwlSiQdY5Iv9YctJKh1F.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d2e9d909-f5ac-4bea-9c27-99bdb736fa44', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 78751, 'Ashutosh Gowariker', 'Ravi Rajvansh', 'https://image.tmdb.org/t/p/w200/s48qPtQJVXdwrVfezMIiyowl3eT.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('04ee265b-21d4-4ef5-bbfc-5f59a792a371', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 1682080, 'Adinath Kothare', 'Alok Rajvansh', 'https://image.tmdb.org/t/p/w200/5mpunA4RSLJhtkYHTB6UMvOfrV5.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c17220ba-ea27-4653-96c5-f4cd23de4818', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 4160287, 'Aashriya Mishra', 'Kusum Rawat', NULL, 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('418330c6-cccf-4022-87dc-92f99759dac2', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 1566911, 'Gaurav Pandey', 'Akshay Rao', 'https://image.tmdb.org/t/p/w200/rH9haKecOQsjMP7BC9XRi1kl5uF.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('95f5daed-7555-4ee8-a46f-d0f0b0da5ffc', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 6193828, 'Sayandeep Gupta', 'Raghav Shrivastav', NULL, 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e6e9c354-d914-4453-81ad-a8707947ff92', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 2746527, 'Preeti Agarwal Mehta', NULL, NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('67fe203e-5f26-4bb3-8bfb-4f2176937751', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 1758521, 'Vijayant Kohli', 'Vikram Bajral', 'https://image.tmdb.org/t/p/w200/dzzewlf0Z5dEkVxu4QkH86xUEx4.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ca823098-a647-4bc4-99ea-03ef5cf60562', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 4442105, 'Diwanshu Gambhir', 'Juggi', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6e4810d9-d6c3-4039-8a7d-b7ed9cbe97e5', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 604, 'Matrix Reloaded', 'https://image.tmdb.org/t/p/w200/csKNmbZuo8aqPF6hejO3rmaFEqx.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f57bcd29-68c8-44b0-8629-7559a1afdbcc', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 605, 'Matrix Revolutions', 'https://image.tmdb.org/t/p/w200/xOCeckuZDzqydvt3vLlzftZkef1.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('34025200-ec2f-4f3e-b60b-9ca8043c5c10', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 980571, 'Fractured Justice', 'https://image.tmdb.org/t/p/w200/sAJgcw31UpiMwO8CCnvEPWepefu.jpg', 2028, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1a8bc141-3ff7-4dc7-a645-281444d5c1cb', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 2721, 'Z', 'https://image.tmdb.org/t/p/w200/cN7A9OODtSQpTgMxC31vFAN8ta.jpg', 1969, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ba89f8d8-88ae-4083-834d-eef96586473b', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 2652, 'Hard Candy', 'https://image.tmdb.org/t/p/w200/910U04iol8zQklyrPz6anJk8cRl.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('cc52c8c3-9e34-4ec6-9b3c-482b04079988', 'c9cab781-025e-4d14-a2dd-e9c063a4f63d', 182, 'The Good German', 'https://image.tmdb.org/t/p/w200/3LjHC2CWDkzoiPehf3GViujws0.jpg', 2006, NOW());

COMMIT;

-- Movie: Michael
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e3cbb256-135d-4c35-88eb-b648f37fb931', 'Michael', 'Michael', 2026, 'Antoine Fuqua', ARRAY['John Logan'], '2h8min', ARRAY['Musique', 'Drame'], 'Michael dresse le portrait cinématographique de la vie et de l’héritage de l’un des artistes les plus influents de notre époque.  Le film raconte l’histoire de Michael Jackson au-delà de la musique, depuis la découverte d’un talent hors du commun en tant que leader des Jackson Five, jusqu’à l’artiste visionnaire dont l’ambition créative a alimenté une quête incessante pour devenir le plus grand artiste au monde.  Mettant en lumière sa vie hors scène et ses performances les plus emblématiques de ses débuts en solo, le film offre au public une place au premier rang pour découvrir Michael Jackson comme jamais auparavant.', '', 'https://image.tmdb.org/t/p/w200/h58HRBCQOtWIR8zMqOIVgkHjssU.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/2sDgNilJGVFpl1x4DMzYHjk0L0f.jpg', 'https://image.tmdb.org/t/p/original/xBT0oNq6rsTFv4SxG5uGRIEOrq6.jpg', ARRAY[], 'film', 112.6836, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('af2b4147-1369-4792-b035-c7e26541df0a', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 936075, 'https://image.tmdb.org/t/p/original/xBT0oNq6rsTFv4SxG5uGRIEOrq6.jpg', 'https://image.tmdb.org/t/p/w500/2sDgNilJGVFpl1x4DMzYHjk0L0f.jpg', 7.573, 885, 'C’est ici que son histoire commence.', 'Michael dresse le portrait cinématographique de la vie et de l’héritage de l’un des artistes les plus influents de notre époque.  Le film raconte l’histoire de Michael Jackson au-delà de la musique, depuis la découverte d’un talent hors du commun en tant que leader des Jackson Five, jusqu’à l’artiste visionnaire dont l’ambition créative a alimenté une quête incessante pour devenir le plus grand artiste au monde.  Mettant en lumière sa vie hors scène et ses performances les plus emblématiques de ses débuts en solo, le film offre au public une place au premier rang pour découvrir Michael Jackson comme jamais auparavant.', 128, '2026-04-22', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('37fa12db-b88e-40bd-b7f0-970bbbfd53f9', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 3898497, 'Jaafar Jackson', 'Michael Jackson', 'https://image.tmdb.org/t/p/w200/tVSzFjQxOrLOcvnzFto0772Q9Bw.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('10b126df-8125-4da5-bca5-6c28308ab070', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 91671, 'Colman Domingo', 'Joseph Jackson', 'https://image.tmdb.org/t/p/w200/2tu6T9ugnf82qIMGVKWSb0dvvq5.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5ebf977b-d3a5-4d90-b406-5ab3693f6550', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 9781, 'Nia Long', 'Katherine Jackson', 'https://image.tmdb.org/t/p/w200/heVQkCGKUuKKRjRJaZIBrEKGhYA.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cd433fa1-0d77-4d49-8d67-02b1a8480806', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 4487890, 'Juliano Krue Valdi', 'Young Michael Jackson', 'https://image.tmdb.org/t/p/w200/1rQYmcxdPD1IwHpa78DcfVEu1EN.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('34b4ba66-d805-4e63-aaa9-bfd66c27dce5', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 996701, 'Miles Teller', 'John Branca', 'https://image.tmdb.org/t/p/w200/kDf3sW3USjEBDQ3Ua7lbwOfwty6.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9b7da75c-4e9b-46cc-9688-d086850adbda', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 1990676, 'KeiLyn Durrel Jones', 'Bill Bray', 'https://image.tmdb.org/t/p/w200/4wDO3Zt9KJg9CARCEgjuVdhWa8x.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d6dc2820-22ea-486d-922a-892cdb23be92', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 1446825, 'Kendrick Sampson', 'Quincy Jones', 'https://image.tmdb.org/t/p/w200/AoZGTujNZEfabaXR5kUwmDUmxfe.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d586f8c2-1b2e-43c6-a9a4-dfa6cde42fba', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 1581190, 'Joseph David-Jones', 'Jackie Jackson', 'https://image.tmdb.org/t/p/w200/qwX7ciIV8jwssmIqHv1eyzzqEvh.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('21c8a0a9-c56b-47e5-8c19-b6c254a21ffd', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 2754193, 'Rhyan Hill', 'Tito Jackson', 'https://image.tmdb.org/t/p/w200/iPNBMJL9kKtUYmqJzbarQfQcPp4.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('46943893-b0de-4b24-a92f-8c58ea7f18e1', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 4805996, 'Jamal Henderson', 'Jermaine Jackson', 'https://image.tmdb.org/t/p/w200/8yI9c3utD4EcEteNwHlFkdR8Rhv.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f4025875-03f3-4fe5-acc6-d3744c6885cc', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 783, 'Gandhi', 'https://image.tmdb.org/t/p/w200/eTv0wtWoBwrkme13ja0ThSybZZe.jpg', 1982, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('00bf8eb6-d8b2-419b-b3b7-e73fdc3c098c', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 796, 'Sexe intentions', 'https://image.tmdb.org/t/p/w200/tkShoPdnzijP1VdADBLghgephTC.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('03a23ac3-d73c-4fa0-ad5a-58ed2f77ee39', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 838, 'American Graffiti', 'https://image.tmdb.org/t/p/w200/1bvAKQW9MuHiIGSnbuny0GGdwp1.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c600a36e-5a88-42a2-a030-3605c7c02dcc', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 842, 'L''assassinat de Richard Nixon', 'https://image.tmdb.org/t/p/w200/dgRajeH7j678UA0gCWapGqkTv7L.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('25068d10-97df-4ad3-a744-6e42c00f0ddd', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 791177, 'Bones and All', 'https://image.tmdb.org/t/p/w200/fmjOEHYMQang2sMuM1fz5ddaEc2.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('20659a3d-c5d5-4480-8ef4-448f5532aa68', 'e3cbb256-135d-4c35-88eb-b648f37fb931', 980816, 'Miranda''s Victim', 'https://image.tmdb.org/t/p/w200/82lu2Rb0MoBpfyUtoVwhLiVrDlF.jpg', 2023, NOW());

COMMIT;

-- Movie: Demon Slayer : Kimetsu no Yaiba - Le film : La Forteresse infinie
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e4608f76-72f4-47bc-bd52-9b58403040a7', 'Demon Slayer : Kimetsu no Yaiba - Le film : La Forteresse infinie', '劇場版「鬼滅の刃」無限城編 第一章 猗窩座再来', 2025, 'Haruo Sotozaki', ARRAY['Hikaru Kondō', 'Koyoharu Gotōge'], '2h35min', ARRAY['Animation', 'Action', 'Fantastique'], 'L''armée des pourfendeurs de démons est attirée dans la Forteresse Infinie, où Tanjiro, Zenitsu et Inosuke  affrontent de terrifiants démons de rang supérieur dans un combat désespéré alors que la bataille finale contre Kibutsuji Muzan commence.', '', 'https://image.tmdb.org/t/p/w200/ylaWAuJB1PyAzaefqENBDEAKTLI.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wXTU3AFmlUPbqjH68MZ989uHd6k.jpg', 'https://image.tmdb.org/t/p/original/1RgPyOhN4DRs225BGTlHJqCudII.jpg', ARRAY[], 'film', 119.9525, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('565a9de1-f881-4d7d-a602-e79753453478', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 1311031, 'https://image.tmdb.org/t/p/original/1RgPyOhN4DRs225BGTlHJqCudII.jpg', 'https://image.tmdb.org/t/p/w500/wXTU3AFmlUPbqjH68MZ989uHd6k.jpg', 7.728, 846, NULL, 'L''armée des pourfendeurs de démons est attirée dans la Forteresse Infinie, où Tanjiro, Zenitsu et Inosuke  affrontent de terrifiants démons de rang supérieur dans un combat désespéré alors que la bataille finale contre Kibutsuji Muzan commence.', 155, '2025-07-18', 'ja', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1e928761-e878-4668-a138-9cb24fb638ae', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 1256603, 'Natsuki Hanae', '灶门炭治郎（配音）', 'https://image.tmdb.org/t/p/w200/alTb0DlcPIbcwM08WSmxFai58sd.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c53960e3-64bb-44b3-b9a2-9808a7ecf272', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 9705, 'Takahiro Sakurai', '富冈义勇（配音）', 'https://image.tmdb.org/t/p/w200/8s8owcKmpRAuhzEGjSdRpztthUg.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('74775293-2d1b-43f5-a0ea-96c8d06b90f3', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 81244, 'Akira Ishida', '猗窝座（配音）', 'https://image.tmdb.org/t/p/w200/jnW2Gn2NlR2uwOCeyOuzypnTmkH.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8c4906f6-a120-43ef-a216-b267760898be', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 119145, 'Hiro Shimono', '我妻善逸（配音）', 'https://image.tmdb.org/t/p/w200/yrSDcgFefHtWkFmLnTrcw2t0MV.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4d5c3cce-796b-4878-84b5-7db8af1aca8d', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 1253008, 'Yoshimasa Hosoya', '狯岳（配音）', 'https://image.tmdb.org/t/p/w200/lUR5oN1LrqGgp25IOcI1qOH1Ud5.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d0b9e4d2-dcd0-47d3-b04e-af6adef4b1d1', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 221773, 'Saori Hayami', '胡蝶忍（配音）', 'https://image.tmdb.org/t/p/w200/gLv9lO7dlUbIsmyJUvgegqAAXki.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f662081c-0be5-4012-9156-fb75d81087d9', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 93803, 'Mamoru Miyano', '童磨（配音）', 'https://image.tmdb.org/t/p/w200/nuok8ueG7k9hPZ09Tpr8e7Qn0ah.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1acb98fa-2a0c-4bb9-a72d-391a8e59a936', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 1452028, 'Reina Ueda', '栗花落香奈乎（配音）', 'https://image.tmdb.org/t/p/w200/2WV61uVU7y6XGYqNHLMpP0sApdu.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('92e0cb25-906a-45ac-a6db-e78f35f0543f', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 1221114, 'Yūichi Nakamura', '庆藏（配音）', 'https://image.tmdb.org/t/p/w200/wb8behVKjBHX9XXrEydvNINCYwH.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6d1fdc73-d18c-4844-a09b-48973a513240', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 1691384, 'Lynn', '恋雪（配音）', 'https://image.tmdb.org/t/p/w200/eJ2NqgzpnzNbT6Nt9EpDfzqNeZM.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('49c84484-526d-4823-a03e-2978877366f2', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 441669, 'Butcher the Bakers', 'https://image.tmdb.org/t/p/w200/6AXFxrot8sXHD2TfMEgE5ZkJC2k.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('66415482-45a1-4b2b-857b-bd5fefbe58ad', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 441715, '仮面ライダー対じごく大使', 'https://image.tmdb.org/t/p/w200/4CaPxi9194eP4PodKT9zfu91Yhy.jpg', 1972, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e8d70e94-fe66-4328-91bb-675b1ad30e88', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 11596, 'Freddy sort de la nuit', 'https://image.tmdb.org/t/p/w200/oHTDAuadMvuiiTi5EPBLYz1GazE.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e1743199-7238-444b-aad2-4665879b0a15', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3d95f9ab-d745-462c-bd13-1db9b44eaf9e', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 442253, 'アニメ店長', 'https://image.tmdb.org/t/p/w200/ntWogeW1JlNKzjZvBG6FpYgBXns.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0c363c29-d2ce-4c9e-9a18-e39f5eb8b22f', 'e4608f76-72f4-47bc-bd52-9b58403040a7', 11633, 'Appleseed', 'https://image.tmdb.org/t/p/w200/kfjAm4PmCGoh7nVmUYA7elPGAlu.jpg', 2004, NOW());

COMMIT;

-- Movie: Fatale
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('cb77555b-98a0-46ce-8124-ea3f8b2a281e', 'Fatale', 'Damage', 1992, 'Louis Malle', ARRAY['David Hare'], '1h51min', ARRAY['Drame', 'Romance'], 'Stephen Fleming, parlementaire conservateur récemment promu secrétaire d''État, est marié depuis 25 ans à Ingrid, avec laquelle il entretient une relation pleine d''affection. Ils ont 2 enfants : Martyn, brillant journaliste politique, et Sally, adolescente à l''esprit vif et curieux. Au cours d''une réception à l''ambassade de France, Stephen fait la connaissance d''Anna Barton, la nouvelle petite amie de son fils.', '', 'https://image.tmdb.org/t/p/w200/8BKM2iXcr4b8pvx1OOcNsO9wADn.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/b9Vx5fA8UgMGRkvh8TGg4k78mg.jpg', 'https://image.tmdb.org/t/p/original/krhj4Fhb0G3QCmyBtEADxgFFmRX.jpg', ARRAY[], 'film', 125.3256, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('06de02dd-3c93-455d-b14b-9058ea475072', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11012, 'https://image.tmdb.org/t/p/original/krhj4Fhb0G3QCmyBtEADxgFFmRX.jpg', 'https://image.tmdb.org/t/p/w500/b9Vx5fA8UgMGRkvh8TGg4k78mg.jpg', 6.6, 680, 'Quand une passion devient...', 'Stephen Fleming, parlementaire conservateur récemment promu secrétaire d''État, est marié depuis 25 ans à Ingrid, avec laquelle il entretient une relation pleine d''affection. Ils ont 2 enfants : Martyn, brillant journaliste politique, et Sally, adolescente à l''esprit vif et curieux. Au cours d''une réception à l''ambassade de France, Stephen fait la connaissance d''Anna Barton, la nouvelle petite amie de son fils.', 111, '1992-12-02', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2a1c1930-6bdb-4b06-aeaf-22e5268b8374', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 16940, 'Jeremy Irons', 'Dr. Stephen Fleming', 'https://image.tmdb.org/t/p/w200/w8Ct1q02Ht3sWdOSqfp3B85TzT.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('55a9c8d8-7f67-4562-943f-98f9a29f116b', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 1137, 'Juliette Binoche', 'Anna Barton', 'https://image.tmdb.org/t/p/w200/htdZZIroEyJaeHQAUTqokNfkPgl.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5643ed38-e16f-4c61-9ad5-28f2968e6e4e', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 8436, 'Miranda Richardson', 'Ingrid Fleming', 'https://image.tmdb.org/t/p/w200/2IEW3fxqHb4AHBl5xU8JuipJbNK.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f539df05-6626-4eeb-adcf-8e0788171253', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11278, 'Rupert Graves', 'Martyn Fleming', 'https://image.tmdb.org/t/p/w200/6tS8XMuTS04xXTfeWFjJED6SFBF.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('72db769c-32fb-4bf1-9f5c-39c6bcca1bd9', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 53, 'Peter Stormare', 'Peter Wetzler', 'https://image.tmdb.org/t/p/w200/1rtpuUqBV29jDc1huUhtjGDbEwn.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('81c7141e-bfe1-41eb-8d7b-6d0053dde12c', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 67798, 'Gemma Clarke', 'Sally Fleming', 'https://image.tmdb.org/t/p/w200/98TgvalxQ5mPZycc7YxgCyOy3BN.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a8c8368e-eb69-4697-87ba-cd2c69e18b7d', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 2481, 'Ian Bannen', 'Edward Lloyd', 'https://image.tmdb.org/t/p/w200/4WrkyylbxsSNsVlfXDctE7KDOuP.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2f32deec-1ea9-4c7a-a45c-02e321d2f6f5', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 10747, 'Julian Fellowes', 'Donald Lyndsay, MP', 'https://image.tmdb.org/t/p/w200/hRWGCVNRkeu61lh3NRmfRym9yOp.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1fb23d1c-28a1-4d3d-954c-a5ce92227aef', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 5320, 'Leslie Caron', 'Elizabeth Prideaux', 'https://image.tmdb.org/t/p/w200/8KaogFPimucFHFyUkdA0c0Bym5C.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cf1f1a74-b5f3-4cf7-a12b-78aa247079d7', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 73284, 'Tony Doyle', 'Prime Minister', 'https://image.tmdb.org/t/p/w200/zyNKcvgfIcCvMM7BVIP8e4Vx2Ks.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ceabdf5d-8ba6-4ba1-ad0e-4e7621c4e050', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11057, 'La Rose blanche', 'https://image.tmdb.org/t/p/w200/a2LVdGxEcmrL1FFSfonD5n4xtkK.jpg', 1982, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('75f8e78b-2438-4a28-bb8a-bb6f3039bf9f', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11224, 'Cendrillon', 'https://image.tmdb.org/t/p/w200/nqSJwBdvG89uHRpDDdaAy5YhogZ.jpg', 1950, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f58f1c55-785d-42f5-aed0-7886e1f96013', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11628, 'Solino', 'https://image.tmdb.org/t/p/w200/jI9HBEE9OqmMZk5n91qgHmLudW.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3c5f15c4-74c5-4abe-93fc-45c5e4ad9892', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11632, 'Vanity Fair : La Foire aux vanités', 'https://image.tmdb.org/t/p/w200/c9w4c33qKscv6ypWBslBpPnePk4.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('521d7a5d-b060-4e0e-8f1a-8c55a3d33e45', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11648, 'La Main au collier', 'https://image.tmdb.org/t/p/w200/m0D2UmlpEr7rhlcMy7mwUa0LlXS.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0acb676f-3e98-4372-a658-0f74a92b1552', 'cb77555b-98a0-46ce-8124-ea3f8b2a281e', 11659, 'Nos meilleures années', 'https://image.tmdb.org/t/p/w200/cF3bGMMCtfHOIyAkiaJM77h2jOh.jpg', 2003, NOW());

COMMIT;

-- Movie: GOAT : Rêver plus haut
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 'GOAT : Rêver plus haut', 'GOAT', 2026, 'Tyree Dillihay', ARRAY['Aaron Buchsbaum', 'Teddy Riley'], '1h40min', ARRAY['Animation', 'Comédie', 'Familial'], 'Will est un petit bouc avec de grands rêves. Lorsqu''il décroche une chance inespérée de rejoindre la ligue professionnelle de "roarball", un sport ultra-intense réservé aux bêtes les plus rapides et féroces, il entend bien saisir l’opportunité. Problème : ses nouveaux coéquipiers ne sont pas vraiment ravis d''avoir un "petit" dans l''équipe. Mais Will est prêt à tout pour changer les règles du jeu.', '', 'https://image.tmdb.org/t/p/w200/cA4rfx4HwDYmmxpJoBclTZTjcEN.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/9wwbYnU3HfAYqdjbFMhy2a8HYvr.jpg', 'https://image.tmdb.org/t/p/original/tq3h43fZy0H80vzf47MAY7R9Mxo.jpg', ARRAY[], 'film', 116.6577, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('ae169cb2-49cd-46cc-b09a-1360f6ac56bf', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 1297842, 'https://image.tmdb.org/t/p/original/tq3h43fZy0H80vzf47MAY7R9Mxo.jpg', 'https://image.tmdb.org/t/p/w500/9wwbYnU3HfAYqdjbFMhy2a8HYvr.jpg', 8.115, 710, 'On n’est jamais trop petit pour rêver grand.', 'Will est un petit bouc avec de grands rêves. Lorsqu''il décroche une chance inespérée de rejoindre la ligue professionnelle de "roarball", un sport ultra-intense réservé aux bêtes les plus rapides et féroces, il entend bien saisir l’opportunité. Problème : ses nouveaux coéquipiers ne sont pas vraiment ravis d''avoir un "petit" dans l''équipe. Mais Will est prêt à tout pour changer les règles du jeu.', 100, '2026-02-11', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e6e9c81c-69ad-47eb-8905-e28affb94c1e', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 1474123, 'Caleb McLaughlin', 'Will Harris (voice)', 'https://image.tmdb.org/t/p/w200/4jVS3EziBn7bf97ErxkW7jsdiLM.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d602dd05-f265-4da4-8ec4-a2b73a26faeb', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 17773, 'Gabrielle Union', 'Jett Fillmore (voice)', 'https://image.tmdb.org/t/p/w200/toeSCybsYufRKfgz77AKy4C8axD.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cdbb1fa3-e7d3-47f4-9f86-52c9eb14f02c', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 1718307, 'Stephen Curry', 'Lenny Williamson (voice)', 'https://image.tmdb.org/t/p/w200/dmLZdGhZkCYktooIp8iqXhAvoWz.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aff9abfa-2829-43f7-b1a4-c64537a8a8ce', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 1763709, 'Aaron Pierre', 'Mane Attraction (voice)', 'https://image.tmdb.org/t/p/w200/z2cMMZyWzv5ztT6pFdAAjB3u7CQ.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('91e0ec96-96da-45d6-9733-c242689a54ad', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 1267240, 'Nicola Coughlan', 'Olivia Burke (voice)', 'https://image.tmdb.org/t/p/w200/shSN86O3qckxcO7YXVtaNy9ksSU.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('801fc02f-6d14-415c-bacb-043fb50bde2e', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 35029, 'David Harbour', 'Archie Everhardt (voice)', 'https://image.tmdb.org/t/p/w200/qMFtMWlYVtFVyBoBhX5IoA5sN5a.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a5f5f82b-9c76-4d51-be06-0df134631530', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 208519, 'Nick Kroll', 'Modo Olachenko (voice)', 'https://image.tmdb.org/t/p/w200/fNiOuEKeBtELGdhKn4lxXq4O7YP.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ee3a0255-3048-44e5-b772-3b82e7377f22', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 15899, 'Jenifer Lewis', 'Flo Everson (voice)', 'https://image.tmdb.org/t/p/w200/htrTYcoJQQpSYo6BrRehe3h46vo.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a6c66976-b65e-49c5-8673-bb074868e69a', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 10872, 'Patton Oswalt', 'Dennis Cooper (voice)', 'https://image.tmdb.org/t/p/w200/ljQvjbPmcIAl205Lb2Mu4CW8WO7.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('de4767e7-483a-49c5-9de9-68ba1f48ffae', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 2974019, 'Jelly Roll', 'Grizz (voice)', 'https://image.tmdb.org/t/p/w200/zRW0Tb9JJq7pfLZAGbXxufsgGWU.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('79c4de80-e8a8-4bd0-93f9-4532e1192243', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 784, 'Kolya', 'https://image.tmdb.org/t/p/w200/cwZuzdbdWqqdBN7auDleTkphqkS.jpg', 1996, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('70de6aeb-e148-480a-bd8b-546e291bc431', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 789, 'Trains étroitement surveillés', 'https://image.tmdb.org/t/p/w200/yzNCrmtT6o8gLlsYkXN9NlGNQkk.jpg', 1966, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ba511cc8-84b2-4e58-adf0-f39071bf3f50', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 980996, 'I Like Movies', 'https://image.tmdb.org/t/p/w200/phb6rDzREtNXvTXuXVuAYcJBR7F.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e9ea980c-9def-4277-8285-e393d2a91713', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 838, 'American Graffiti', 'https://image.tmdb.org/t/p/w200/1bvAKQW9MuHiIGSnbuny0GGdwp1.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('484cea6b-1849-45a5-a830-008e9767deb1', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 808, 'Shrek', 'https://image.tmdb.org/t/p/w200/rJIju4i2sENrfTbAXwL9OKv2e1i.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('84cae8bc-914e-4df9-838f-546d6c4cf60b', 'a1c22cb4-7ea4-4f9f-acc4-dd7c9d314f73', 809, 'Shrek 2', 'https://image.tmdb.org/t/p/w200/2e8hcPLaWjLXdQLgdi5otr4Jj9L.jpg', 2004, NOW());

COMMIT;

-- Movie: Disforia
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('901d1df3-241c-4cb9-a9b3-acc618f42077', 'Disforia', 'Disforia', 2025, 'Christopher Cartagena', ARRAY['Christopher Cartagena', 'Joan-Pol Argenter', 'Imanol Ortiz López'], '1h22min', ARRAY['Horreur', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/49pzxbf1Eftz7wQZdVDVl8OM9bg.jpg', 'https://image.tmdb.org/t/p/original/gYumbUCWyUI6Mutgd7oILOCunk8.jpg', ARRAY[], 'film', 108.0813, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e203bb50-ad15-408d-884e-a52f8b59da15', '901d1df3-241c-4cb9-a9b3-acc618f42077', 1252051, 'https://image.tmdb.org/t/p/original/gYumbUCWyUI6Mutgd7oILOCunk8.jpg', 'https://image.tmdb.org/t/p/w500/49pzxbf1Eftz7wQZdVDVl8OM9bg.jpg', 4.833, 6, NULL, '', 82, '2025-09-20', 'es', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e8ccecf5-31f5-4048-97cb-dc64fbca7462', '901d1df3-241c-4cb9-a9b3-acc618f42077', 2030317, 'Claudia Salas', 'Vera', 'https://image.tmdb.org/t/p/w200/jfLi59P55yQeyjfD8UVf4DilXpt.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('15f315da-16a7-47ae-abb6-dca7222d7b7e', '901d1df3-241c-4cb9-a9b3-acc618f42077', 2486753, 'Fariba Sheikhan', 'Esther', 'https://image.tmdb.org/t/p/w200/bgULbaEJAtWvAOrEtvcoCMrGRsm.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('32f00ced-6d7e-4a15-8aff-40fda4a28ae1', '901d1df3-241c-4cb9-a9b3-acc618f42077', 964, 'Eloy Azorín', 'Tomás', 'https://image.tmdb.org/t/p/w200/xSBOlzQC3NwchCDRuWvPrS1pASB.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1a3c2769-c89b-4748-acb4-84be605f1931', '901d1df3-241c-4cb9-a9b3-acc618f42077', 4105608, 'Noah Casas', 'Say', 'https://image.tmdb.org/t/p/w200/pCLSPCIQq1Re4Qv2LtTSP6kvPXx.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2f5d1107-28d1-4122-97b1-445b69a2b30f', '901d1df3-241c-4cb9-a9b3-acc618f42077', 1479796, 'Ferran Vilajosana', 'Policía', 'https://image.tmdb.org/t/p/w200/csrmEVeZsQrDaUI2iS4KPVR40QJ.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('53000b41-2f1d-45a8-96e9-fc3fd8f2d53b', '901d1df3-241c-4cb9-a9b3-acc618f42077', 1609626, 'Kike Guaza', NULL, 'https://image.tmdb.org/t/p/w200/mx40KxmzdhXZD7V8Qs3IesYBGwe.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e3b7433f-0635-489e-8f4b-b53dab8faa85', '901d1df3-241c-4cb9-a9b3-acc618f42077', 1985190, 'Aleida Torrent', NULL, 'https://image.tmdb.org/t/p/w200/GgxOPY852oFuIxjsEAFiVBFBQb.jpg', 6, NOW());

COMMIT;

-- Movie: Mortal Game
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('6caf333f-a053-4a37-a935-1e0a7d2812fa', 'Mortal Game', 'Mortal Game', 2025, 'John Lechago', ARRAY['Paco Alvarez', 'John Lechago'], '1h25min', ARRAY['Horreur', 'Action'], '', '', 'https://image.tmdb.org/t/p/w200/x9H622dXZN4fh4voNAYfipjhDbL.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/iCvucorbs3hFqWshDbLe0fHzB71.jpg', 'https://image.tmdb.org/t/p/original/hdLsZ3dCjKt5A6xDpoo3UFgcTSm.jpg', ARRAY[], 'film', 97.6395, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e935cea1-6cc6-4aa2-8d6b-a63a84676a6a', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 1426822, 'https://image.tmdb.org/t/p/original/hdLsZ3dCjKt5A6xDpoo3UFgcTSm.jpg', 'https://image.tmdb.org/t/p/w500/iCvucorbs3hFqWshDbLe0fHzB71.jpg', 4.917, 12, NULL, '', 85, '2025-02-03', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('849a2c57-d80e-430d-a970-830fc47a97af', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 3899035, 'Deniella Alexis', 'Jessie', 'https://image.tmdb.org/t/p/w200/rqKHY2kUwQNlXD3POvQLh8k6Q0L.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('85b443c4-e628-4649-a7c2-f16c3de40d4d', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 3871127, 'Kevin Lloyd Reid', 'Murphy', NULL, 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aa458259-43f3-47fb-9cca-b7088df5e5a3', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 1073806, 'Mark Ettlinger', 'Alexander', 'https://image.tmdb.org/t/p/w200/pCz5e6UGvFChjlqyDBJ4IxG0iCZ.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4cc0096e-6514-4af1-9fa7-c604f69d8148', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 4945933, 'Madison Caan', 'Bailey', 'https://image.tmdb.org/t/p/w200/9RJkEsYIsFR0ktkupjIzvcWbpcI.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('51e067ff-3ff4-480d-b1f5-05a729298103', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 1529621, 'Reece Presley', 'Sam', 'https://image.tmdb.org/t/p/w200/bp3EOp7bRO5k9K83U0wf4NH878R.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5c20a8d2-a770-4f08-99c5-da6b8543d750', '6caf333f-a053-4a37-a935-1e0a7d2812fa', 4508034, 'Joey Harlem', NULL, NULL, 5, NOW());

COMMIT;

-- Movie: Vacanze per un massacro
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('2b69835f-d68e-42df-9089-56d3bf208f60', 'Vacanze per un massacro', 'Vacanze per un massacro', 1980, 'Fernando Di Leo', ARRAY['Fernando Di Leo'], '1h29min', ARRAY['Thriller', 'Action', 'Crime'], '', '', 'https://image.tmdb.org/t/p/w200/extKHlTDlc7bHdwZgafCSIu5LmP.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/arRNmW27fs1TFsIBOwPYCfZQFJC.jpg', 'https://image.tmdb.org/t/p/original/7TJjD2X9GTEqyLVIJKLS85J2V47.jpg', ARRAY[], 'film', 92.2054, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('77a72808-d0e8-443e-b704-028926f75ea5', '2b69835f-d68e-42df-9089-56d3bf208f60', 28322, 'https://image.tmdb.org/t/p/original/7TJjD2X9GTEqyLVIJKLS85J2V47.jpg', 'https://image.tmdb.org/t/p/w500/arRNmW27fs1TFsIBOwPYCfZQFJC.jpg', 4.969, 32, NULL, '', 89, '1980-03-20', 'it', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('41e02c52-be58-4491-a868-501754248020', '2b69835f-d68e-42df-9089-56d3bf208f60', 29915, 'Joe Dallesandro', 'Joe Brezzi', 'https://image.tmdb.org/t/p/w200/dtLU66GGm6Lis5ZMrseT0qei2Ii.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('edc6637c-5ddc-43d3-b50c-ed1e3cfd0a48', '2b69835f-d68e-42df-9089-56d3bf208f60', 100420, 'Patrizia Behn', 'Liliana', 'https://image.tmdb.org/t/p/w200/ou744kaQSI2pkPM2BtErRP35mQP.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5daae3ee-0cc6-4ab1-8e11-5858f5079be6', '2b69835f-d68e-42df-9089-56d3bf208f60', 38762, 'Gianni Macchia', 'Sergio', 'https://image.tmdb.org/t/p/w200/ysecXVh8vo4USlM1ExfkE0XlA7W.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('205665d7-d4ac-4925-971f-dd9ff9b235c1', '2b69835f-d68e-42df-9089-56d3bf208f60', 101577, 'Lorraine De Selle', 'Paola', 'https://image.tmdb.org/t/p/w200/jVmkHcu5DjKuPDhqqWBmZSw4A8g.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('10be377e-3f9d-4f22-bd26-6e8ea6be8822', '2b69835f-d68e-42df-9089-56d3bf208f60', 119370, 'Omero Capanna', 'Killed Cardriver', 'https://image.tmdb.org/t/p/w200/kM9AC6ZSU1q2RIdgDJWKFvuAAbd.jpg', 4, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9857b5f7-b3bd-4e8a-aa6d-9d9ffa7f28a0', '2b69835f-d68e-42df-9089-56d3bf208f60', 11022, 'Narc', 'https://image.tmdb.org/t/p/w200/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5a1902cc-6b70-4ec9-a98d-e49827f5b1ba', '2b69835f-d68e-42df-9089-56d3bf208f60', 11284, 'La Fin de Freddy : L''Ultime Cauchemar', 'https://image.tmdb.org/t/p/w200/6zNufcJuwlZiGmT7Rr3yq0NK1nU.jpg', 1991, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7d4b56ad-082f-409f-bd20-f3b206c5f91f', '2b69835f-d68e-42df-9089-56d3bf208f60', 11456, 'L''Intrus', 'https://image.tmdb.org/t/p/w200/79DoWhmWi9T02jaWmwUmXHJsEJt.jpg', 2001, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('6a46854f-1460-4e0e-85f4-2a9e5e716192', '2b69835f-d68e-42df-9089-56d3bf208f60', 11588, 'Memories (Inside)', 'https://image.tmdb.org/t/p/w200/65AD6BVPS9K4Ls3oUqTGGAHx7y5.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('e679bef6-0308-4d44-be20-1772b9f9c7e5', '2b69835f-d68e-42df-9089-56d3bf208f60', 11592, 'Serial mother', 'https://image.tmdb.org/t/p/w200/ae8cy850doLF92w8a31NyerYNNw.jpg', 1994, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('11e5e6d3-132e-404b-a4ae-7f7fd277c5d4', '2b69835f-d68e-42df-9089-56d3bf208f60', 442249, 'American Nightmare 4 : Les origines', 'https://image.tmdb.org/t/p/w200/er8aMOEndXZ9MoPmVRHeZ63wPPb.jpg', 2018, NOW());

COMMIT;

-- Movie: ಮಾರ್ಕ್
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 'ಮಾರ್ಕ್', 'ಮಾರ್ಕ್', 2025, 'Vijay Kartikeyaa', ARRAY['Vijay Kartikeyaa'], '2h24min', ARRAY['Action', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/6LTDv6XHiHN0N77QIFg2tidVvhh.jpg', 'https://image.tmdb.org/t/p/original/6DfHl4CE88x7Rt9oyARQQm6bHXD.jpg', ARRAY[], 'film', 109.2945, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('6948e932-e17c-4ab3-97ff-9916b5fb2dfc', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1510339, 'https://image.tmdb.org/t/p/original/6DfHl4CE88x7Rt9oyARQQm6bHXD.jpg', 'https://image.tmdb.org/t/p/w500/6LTDv6XHiHN0N77QIFg2tidVvhh.jpg', 4, 1, NULL, '', 144, '2025-12-25', 'kn', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0ee98725-e163-4680-bb05-4c8168ceb394', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 389604, 'Sudeep', 'Ajay Markendeya', 'https://image.tmdb.org/t/p/w200/8c5TYgGwbkcQkvC3ZlTU41OfYBN.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('51eb5b5c-0913-4fca-92bb-32dc63ed5a15', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 2345501, 'Deepshika Umapathy', NULL, 'https://image.tmdb.org/t/p/w200/f20SM61Foa1U7eO4KZRA0suam3j.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c20c2b00-9bdc-4a59-bd6c-505251f005a8', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1135117, 'Naveen Chandra', 'Bhadra', 'https://image.tmdb.org/t/p/w200/6iEhNOOqRTOQ0JFSiv6agtqvwx9.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7f259f61-1aae-4cfe-9ba8-3d1d6c63f937', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1296632, 'Shine Tom Chacko', 'Adikeshava', 'https://image.tmdb.org/t/p/w200/lIfhgkTK8bgM5jS2R91ZvCxKIwj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('194b1b36-c18c-46e0-a4bb-6506162595c8', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1540764, 'Yogi Babu', 'Solomon', 'https://image.tmdb.org/t/p/w200/lTNb5POaftGHXzgN9aIegcehh89.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4e58eead-0fe5-4c19-8c41-c082ca1e2ba0', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 585382, 'Vikranth', NULL, 'https://image.tmdb.org/t/p/w200/ksMHimRUMXLwJqrZsgGx9TzyQiN.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dfbbaa14-304c-45eb-9175-f3bb5a0a26ed', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 122986, 'Dev Gill', 'Devaraj', 'https://image.tmdb.org/t/p/w200/8Ta11Sdp6jCCbBEroTbnzoRxkvw.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fb979492-d827-4e58-ad06-87d385781656', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1124964, 'Aruldoss', NULL, 'https://image.tmdb.org/t/p/w200/gDMVbi6reJPolJm9qtqYwTWyh4p.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d180c0b5-4236-4548-8fa7-840f96821a60', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1256447, 'Roshini Prakash', 'Sanchana', 'https://image.tmdb.org/t/p/w200/kQTusKHgUJVeXddPhlHgPfQ62ZY.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ac59638a-d11b-4529-99a0-88b78a53c154', 'ef9a0a9d-6935-4d12-bfbc-57aabc1fe438', 1266840, 'Guru Somasundaram', 'Stephen Raj', 'https://image.tmdb.org/t/p/w200/eqjEcc6LnZI5teGwOrrArAr5vko.jpg', 9, NOW());

COMMIT;

-- Movie: Beast
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('b873f379-8827-4c85-94d9-a1a5326ee03a', 'Beast', 'Beast', 2026, 'Tyler Atkins', ARRAY['David Frigerio'], '1h54min', ARRAY['Action', 'Drame'], 'Patton James abandonne son rêve de pratiquer les arts martiaux mixtes pour subvenir aux besoins de sa femme, Luciana et de leur fils. Lorsque son frère, Malon, subit une grave blessure et doit faire face à des pressions financières, Patton décide de le venger lors d''un combat avec l''aide de l''entraîneur vétéran Sammy.', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/7NrvUI3vnW8H3rD7ExKcTL7KRcQ.jpg', 'https://image.tmdb.org/t/p/original/hlZGaey4lR9hc4rGxZRAmIEsZOc.jpg', ARRAY[], 'film', 95.786, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('ab6dadb8-0084-4b1f-b772-89d99003fe0e', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 1292415, 'https://image.tmdb.org/t/p/original/hlZGaey4lR9hc4rGxZRAmIEsZOc.jpg', 'https://image.tmdb.org/t/p/w500/7NrvUI3vnW8H3rD7ExKcTL7KRcQ.jpg', 6.3, 45, NULL, 'Patton James abandonne son rêve de pratiquer les arts martiaux mixtes pour subvenir aux besoins de sa femme, Luciana et de leur fils. Lorsque son frère, Malon, subit une grave blessure et doit faire face à des pressions financières, Patton décide de le venger lors d''un combat avec l''aide de l''entraîneur vétéran Sammy.', 114, '2026-04-10', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d46fee5d-be7d-47bc-b6b1-1ccfe7cc2dae', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 1229432, 'Daniel MacPherson', 'Patton', 'https://image.tmdb.org/t/p/w200/aBvJnrSlzXeU8K3glUa6XQ6nbuK.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9229887f-4755-4a8f-a638-ddf54d8e23bc', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 216986, 'Luke Hemsworth', 'Gabriel', 'https://image.tmdb.org/t/p/w200/m3VkYWENQc392VMrn0B4VnW886R.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d4638266-5179-47fc-b960-71356568e5b0', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 934, 'Russell Crowe', 'Sammy', 'https://image.tmdb.org/t/p/w200/uxiXuVH4vNWrKlJMVVPG1sxAJFe.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7e43eb07-6c96-4be4-8868-4535700a0959', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 1375499, 'Mojean Aria', 'Malon James', 'https://image.tmdb.org/t/p/w200/v5W5lpuAWSDVMokU0RKGkHDT2rj.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('66921c6e-cbc6-4290-886a-7eb043e6bc6f', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 1701014, 'Kelly Gale', 'Luciana', 'https://image.tmdb.org/t/p/w200/bU9w5FITuN7TUa9VxFH3whhXFkP.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2dc74de0-ad50-4c70-88c8-c7860f581ec1', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 2966859, 'George Burgess', 'Neal', 'https://image.tmdb.org/t/p/w200/fxTvtnpfjU5uKFKu4GoAVD1o7i0.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cc75858f-49a6-467d-9988-36b7089358b9', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 60005, 'Nathan Phillips', 'Skipper', 'https://image.tmdb.org/t/p/w200/9t54w1XE7u7fOWQv83IP0xYAWkh.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('92778caf-2250-4c6a-bda1-1bc276378b9d', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 6135738, 'Sol Nc Carrico', 'Maddie', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b4e458b4-98a9-4464-ab31-77e44180e893', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 230601, 'Bren Foster', 'Xavier Grau', 'https://image.tmdb.org/t/p/w200/qRCsPgki64JVreidPI6KAexZxpk.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('01f6145f-6f72-440a-93e7-a08d5beb2590', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 5440961, 'Saphira Moran', 'Nadine', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0f9c60cc-c817-4e2f-884e-0e777e47225a', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 1360455, 'PFL Super Fights: Battle of the Giants', 'https://image.tmdb.org/t/p/w200/AR2x7K9RFt4uMyNL4MLePkvR8H.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('622c1e91-a1e9-4fe1-9ad1-8d6c02d4c094', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 11690, 'Bloodsport, tous les coups sont permis', 'https://image.tmdb.org/t/p/w200/r9Jijds91tMq28MYyK9eK185los.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7067b707-956d-44f4-876c-ba1894aae97f', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 265678, 'UFC on Fox 11: Werdum vs. Browne', 'https://image.tmdb.org/t/p/w200/oTnFq0tx7DtY6d7FYS4L05ePZ29.jpg', 2014, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('8cbb46ed-3376-4f0e-b5e5-eca21f82f349', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 622152, 'UFC Fight Night 156: Shevchenko vs. Carmouche 2', 'https://image.tmdb.org/t/p/w200/legvspDrrewFfTJLqGq5cEsTGTP.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f5b90442-892d-42de-9e7d-959783f7b9d1', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 1341989, 'Stadionlar Səssiz Olanda', 'https://image.tmdb.org/t/p/w200/reGmfWTc13vNHLupx8sABBqMOzT.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f3467336-5ec3-4c45-a097-cd56ab82225e', 'b873f379-8827-4c85-94d9-a1a5326ee03a', 980772, 'UFC Fight Night 207: Volkov vs. Rozenstruik', 'https://image.tmdb.org/t/p/w200/jjUJkSunX6jsDo1Jp00na0RTG8V.jpg', 2022, NOW());

COMMIT;

-- Movie: भूत बंगला
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 'भूत बंगला', 'भूत बंगला', 2026, 'Priyadarshan', ARRAY['Rohan Shankar', 'Priyadarshan', 'Abhilash Nair'], '2h43min', ARRAY['Horreur', 'Comédie'], '', '', 'https://image.tmdb.org/t/p/w200/durYQlaO6ZuQ0hLgIpuum0SAZTF.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/79RBp8afL4u4z3nVGR78z6eIvBB.jpg', 'https://image.tmdb.org/t/p/original/A2tzVTVtnTvpji96IZmleN78KKv.jpg', ARRAY[], 'film', 83.0296, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e4641bc9-3e1e-4bfd-af4a-5a7e2678e87b', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 1239134, 'https://image.tmdb.org/t/p/original/A2tzVTVtnTvpji96IZmleN78KKv.jpg', 'https://image.tmdb.org/t/p/w500/79RBp8afL4u4z3nVGR78z6eIvBB.jpg', 6.5, 10, NULL, '', 163, '2026-04-16', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a3a346fc-a113-4d12-926c-c34f1e0cc993', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 35070, 'Akshay Kumar', 'Arjun Acharya', 'https://image.tmdb.org/t/p/w200/sR8nASRtTpiwXqkFHjG2jdRBZ7a.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9fb21420-f0bb-4f2d-8e19-3dbc3525c671', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 1267400, 'Wamiqa Gabbi', 'Priya', 'https://image.tmdb.org/t/p/w200/e1CNXkH2scGeoabOTowFJJxX2YF.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('da3e93ae-aa03-4f1e-ac4c-c23c9197d45c', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 85033, 'Paresh Rawal', 'Jagdish Kewalramani', 'https://image.tmdb.org/t/p/w200/haRliZNMm04QXItBGScbFh4bHSJ.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5f0b5441-5d89-4db6-87bf-630014edb693', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 55062, 'Tabu', 'Yashoda', 'https://image.tmdb.org/t/p/w200/cvt5nvCHr1ICf5u8A2mlzLQ8LsV.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('2212029b-7f33-4595-bcfa-66ea89126c33', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 545144, 'Jisshu Sengupta', 'Dr. Vasudev Acharya', 'https://image.tmdb.org/t/p/w200/6Ha4p2iQOHpnKC1uB4NKJ53kHRi.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('68a02c7f-2f30-4fa1-9eef-8020f359ec19', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 35756, 'Rajpal Yadav', 'Sundar', 'https://image.tmdb.org/t/p/w200/aJJAU9EPiiXRsWDuy60mXE8U6lT.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('62920a3c-c2ba-4f60-b391-f6292d177f2d', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 86019, 'Govardhan Asrani', 'Shantaram', 'https://image.tmdb.org/t/p/w200/zoZRnIHNkCRq4gKZGaQhbtPrIDj.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('130b5be6-d6be-47cc-b18e-479c96b2d841', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 1955922, 'Mithila Palkar', 'Meera', 'https://image.tmdb.org/t/p/w200/ggqPRbqWEayrM6SCj490gIwQK6t.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aebf0d5e-43cc-4986-9791-1bae4013e28a', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 648087, 'Rajesh Sharma', 'Dasund Acharya', 'https://image.tmdb.org/t/p/w200/cBmZY1EICMD1q16Fx7GqpHkc6A1.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6e17246f-008d-451a-8591-2ad2a5b9c873', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 86018, 'Manoj Joshi', 'Govind Maharaj', 'https://image.tmdb.org/t/p/w200/u7GllU8dO2bkAvRC0i8yszogYqY.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c187035a-c2c0-4a6f-a88d-8a132ab6f2e2', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 791, 'Fog', 'https://image.tmdb.org/t/p/w200/3Yz96T2B6MUN1Lug9zv8yjBZwo0.jpg', 2005, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('923c804c-5001-4e7f-a2a7-f00b0c60073e', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 694, 'Shining', 'https://image.tmdb.org/t/p/w200/cnniZQGtjK8kh2tsjih4GtkX6bl.jpg', 1980, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bc459e20-8387-4a93-9c02-bed8dd9eafc6', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 1523926, 'Maju Serem Mundur Horor', 'https://image.tmdb.org/t/p/w200/n2pGsAiCFQfoiKsigJOV10p46VO.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('dee5c1ce-2d56-40f9-a4dc-cdea19853169', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 1342333, 'Upholstergeist', 'https://image.tmdb.org/t/p/w200/4Z8j2VfA7utfAQghwD0MmpmEsPE.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a23c171b-37dd-4886-8566-4cfefb77e868', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 927, 'Gremlins', 'https://image.tmdb.org/t/p/w200/5DmmWDmfEeqeXREEfV0M5AMzfNK.jpg', 1984, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b9939709-f750-43d9-9741-3a630b952a6d', 'ffe52ce4-dacf-4ccb-bdc7-a1eccf1d1cc1', 791348, 'DC Showcase - Constantine: The House of Mystery', 'https://image.tmdb.org/t/p/w200/n3FQYSzptYZJRvp9yGVDxoTfE0L.jpg', 2022, NOW());

COMMIT;

-- Movie: Dhurandhar
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 'Dhurandhar', 'धुरंधर', 2025, 'Aditya Dhar', ARRAY['Aditya Dhar'], '3h32min', ARRAY['Action', 'Crime', 'Thriller'], 'Un mystérieux voyageur s''infiltre au cœur des bas-fonds de Karachi et gravit les échelons avec une précision mortelle, dans le seul but de détruire de l''intérieur le célèbre réseau ISI-Underworld.', '', 'https://image.tmdb.org/t/p/w200/dIZs80xvNgA7VZClECVXIHdaATb.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/8FHOtUpNIk5ZPEay2N2EY5lrxkv.jpg', 'https://image.tmdb.org/t/p/original/4DfxcN4w0FuYZHQ3JAHzpHWia1U.jpg', ARRAY[], 'film', 92.8225, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('f54b1085-baed-49b8-a703-d5e9e262199b', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 1291608, 'https://image.tmdb.org/t/p/original/4DfxcN4w0FuYZHQ3JAHzpHWia1U.jpg', 'https://image.tmdb.org/t/p/w500/8FHOtUpNIk5ZPEay2N2EY5lrxkv.jpg', 7.135, 288, NULL, 'Un mystérieux voyageur s''infiltre au cœur des bas-fonds de Karachi et gravit les échelons avec une précision mortelle, dans le seul but de détruire de l''intérieur le célèbre réseau ISI-Underworld.', 212, '2025-12-05', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('aa8864a9-a75d-4fea-a304-a32e8a49071f', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 224223, 'Ranveer Singh', 'Hamza Ali Mazari / Jaskirat Singh Rangi', 'https://image.tmdb.org/t/p/w200/sRiwLmhduFghJo8U2coUafnDD4C.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5ee1d459-224f-44c6-8a6a-471ef275a6bd', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 87328, 'Akshaye Khanna', 'Rehman Dakait', 'https://image.tmdb.org/t/p/w200/kRPLQ908NrKejOwG6i3ypBd9qDq.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6bffb535-e8ec-43cd-bcb6-955028837564', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 85519, 'R. Madhavan', 'Ajay Sanyal', 'https://image.tmdb.org/t/p/w200/gaDrAdXxIrbBRCd9cX8YvJDEuLb.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4203a9dc-8c99-41cb-8dc1-7dbf83513c9c', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 52263, 'Arjun Rampal', 'Major Iqbal', 'https://image.tmdb.org/t/p/w200/1F81WNcVV5cW9O4D5Otk1Y2WHV9.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c10ab34f-8cac-4348-8ab6-322efeeb736e', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 85881, 'Sanjay Dutt', 'SP Chaudhary Aslam', 'https://image.tmdb.org/t/p/w200/oq4pnvWhl1HxKpp0KVlSfAr3Tiu.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c6be3f5d-4368-41c0-a94a-59388e0c5ea1', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 579817, 'Sara Arjun', 'Yalina Jamali', 'https://image.tmdb.org/t/p/w200/uyZIlCL6xwWlor6JYSmIYUiPE7M.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('550c603e-8011-4378-8871-1629002b0225', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 110200, 'Rakesh Bedi', 'Jameel Jamali', 'https://image.tmdb.org/t/p/w200/dWLCiA3rqnaFPn9s0bk2MiSq5Mt.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('05bd9966-aa30-460f-b1d6-9585c6839775', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 2985214, 'Danish Pandor', 'Uzair Baloch', 'https://image.tmdb.org/t/p/w200/vDAzq7SJtVlTIj10Oa55BV3Qszm.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('01a44592-a3c2-451c-b796-9b0f2d448e62', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 1013936, 'Gaurav Gera', 'Mohammad Aalam', 'https://image.tmdb.org/t/p/w200/l0kOZqfKusxfPp7wvkwDfNYT64K.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dbec337c-e1a2-4698-b6f0-11aa32727157', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 150476, 'Naveen Kaushik', 'Donga', 'https://image.tmdb.org/t/p/w200/amxQkCtdEGOQk6z1arVfHhLxYyA.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('bf7dc507-67fc-41c4-8fce-173b01cdadbd', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 8843, 'The Cell', 'https://image.tmdb.org/t/p/w200/d1fDHzDw1hwxu67kpBrztNCy1o6.jpg', 2000, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('117eaf26-bb9d-4f01-840e-6d6c20c66e3f', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 8848, 'Braquage à l''anglaise', 'https://image.tmdb.org/t/p/w200/dvQMKvrn93F3jUDWY5x6AfPMVFe.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('1c591ec5-61d3-4dc0-8be1-0e2bb92497ab', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 8893, 'C''est dur d''être aimé par des cons', 'https://image.tmdb.org/t/p/w200/nOoKOLYaZmTBQ5heT3xg9dn0lOO.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('79c58d8a-e6b3-4aec-b612-166e7446b604', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 614743, 'Peppermint', 'https://image.tmdb.org/t/p/w200/5hQ2mBbPt3o35Sx3e4FpJJJALmA.jpg', 2020, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9a5e1bf5-2c6b-4ee9-8fe5-d3baa17bc0c7', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 9064, 'Hellraiser 2 : Les Écorchés', 'https://image.tmdb.org/t/p/w200/ri6BfqkQjvznrMPbhCdNonng1Qn.jpg', 1988, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5d0ada02-fd69-4104-8b56-423eb8f1a1f5', '98b5fbb4-4d61-4aee-83c8-d20de4f844a8', 8845, 'Piège en haute mer', 'https://image.tmdb.org/t/p/w200/6X5iYIfx6CcMGKQ0PM5UllxZD0d.jpg', 1992, NOW());

COMMIT;

-- Movie: Red Latex
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('e79ce451-1c52-41d3-bdf6-1f5ee1bbdfd7', 'Red Latex', 'Red Latex', 2020, 'Gerard Marcó de Mas', ARRAY['Gerard Marcó de Mas'], '1h28min', ARRAY['Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/cQkaMqjeJ0K8GyWENpYl3sE7a8l.jpg', 'https://image.tmdb.org/t/p/original/dMX6RR0SHgI43r2CsDkF5wzozOw.jpg', ARRAY[], 'film', 129.4559, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('893a09b9-a14d-4e8c-a576-02c13f5a2be0', 'e79ce451-1c52-41d3-bdf6-1f5ee1bbdfd7', 758308, 'https://image.tmdb.org/t/p/original/dMX6RR0SHgI43r2CsDkF5wzozOw.jpg', 'https://image.tmdb.org/t/p/w500/cQkaMqjeJ0K8GyWENpYl3sE7a8l.jpg', 5.149, 37, NULL, '', 88, '2020-02-22', 'es', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8fbfb3d3-213f-4b3c-970c-3fcd804f08d9', 'e79ce451-1c52-41d3-bdf6-1f5ee1bbdfd7', 2455665, 'Fedra Duarte', 'Mistress Gise', NULL, 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f2f424b1-0e51-454b-98f1-1626e5356e5a', 'e79ce451-1c52-41d3-bdf6-1f5ee1bbdfd7', 2833891, 'Nestor Napolitano', 'Quiel', NULL, 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b0b6a5f2-1f77-4670-aa61-f7ac45f2c646', 'e79ce451-1c52-41d3-bdf6-1f5ee1bbdfd7', 2455664, 'Valeria Rowinski', 'Julia', NULL, 2, NOW());

COMMIT;

-- Movie: Ladies First
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 'Ladies First', 'Ladies First', 2026, 'Thea Sharrock', ARRAY['Natalie Krinsky', 'Cinco Paul', 'Katie Silberman'], '1h34min', ARRAY['Comédie', 'Fantastique'], 'Un dragueur arrogant et charismatique qui enchaîne les liaisons voit sa vie d''homme riche et puissant chamboulée quand il se réveille dans un monde parallèle dominé par les femmes.', '', 'https://image.tmdb.org/t/p/w200/levYh65v2zBLBROydIjQijBupgW.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wkI57tUgF4azrXy4QURO0diuDxD.jpg', 'https://image.tmdb.org/t/p/original/bOy625BjpCskOWnx3tD09MsKVCb.jpg', ARRAY[], 'film', 83.6047, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e7cde550-2c0e-4a1c-be93-a3dfa39964e1', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 1368881, 'https://image.tmdb.org/t/p/original/bOy625BjpCskOWnx3tD09MsKVCb.jpg', 'https://image.tmdb.org/t/p/w500/wkI57tUgF4azrXy4QURO0diuDxD.jpg', 6, 213, NULL, 'Un dragueur arrogant et charismatique qui enchaîne les liaisons voit sa vie d''homme riche et puissant chamboulée quand il se réveille dans un monde parallèle dominé par les femmes.', 94, '2026-05-21', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('19c92a51-7418-42e4-90a2-aec20b0d1381', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 6730, 'Sacha Baron Cohen', 'Damien Sachs', 'https://image.tmdb.org/t/p/w200/bGzXHu8zwWqUY5gEExSh3deQd2j.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('9f72fc50-ab42-4292-8d74-bb4b9190d31b', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 10882, 'Rosamund Pike', 'Alex Fox', 'https://image.tmdb.org/t/p/w200/tW3pobTn2znqK1nuSUWT7Kj8CSc.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('31f79564-9b12-4a38-8f03-35d7f72153ac', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 1464254, 'Tom Davis', 'Chris Black', 'https://image.tmdb.org/t/p/w200/n7JqvXrpPsbpfeelPpZ5R8HTWMG.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('5a0f0adf-3fc9-450b-b487-774c0544d21d', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 1246, 'Emily Mortimer', 'Sunny Black', 'https://image.tmdb.org/t/p/w200/oZ4CZW2eW8lL2alD1mwZrFkfACI.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('452b210d-7b95-43a9-8406-b998a862861e', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 1948465, 'Weruche Opia', 'Ruby', 'https://image.tmdb.org/t/p/w200/pPgIOuM9lRO1zH6eDnqDpf0w7da.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('be302d02-302f-4cf4-a92f-fe1c9a9b79b8', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 4391, 'Charles Dance', 'Fred Powell', 'https://image.tmdb.org/t/p/w200/3xHwq5lchAI6mfW0aGQOEijexv6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('52d4309a-809a-4266-b85f-63c9883bfe01', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 10981, 'Fiona Shaw', 'Felicity Chase', 'https://image.tmdb.org/t/p/w200/8X7fZybxtwh2nTvYk6kjRYo9RIY.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f483d11f-1c4f-4b22-a80b-34438e2d9bc3', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 20766, 'Richard E. Grant', 'Pigeon Man', 'https://image.tmdb.org/t/p/w200/720dpCjuN5cEYFn43GwzZqXtpWv.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0c86b95d-146c-4b7e-b007-94b7188d0717', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 6231976, 'Red Tennant', 'Charlie', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8635e625-4ce7-48e3-b65b-b601764c8f00', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 72309, 'Kathryn Hunter', 'Glenda Cartwright', 'https://image.tmdb.org/t/p/w200/ni98cNE8kOAj6kcpEVmIfi8iAsw.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3a0d15a1-de8a-4cda-83a6-cd690b3fa471', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 8970, 'Escapade à New York', 'https://image.tmdb.org/t/p/w200/9HBA1LP7I9RYFH7TvlhirqlY5jM.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('14b09b90-920c-4e96-8c44-5fbb83c5e4bd', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 797109, '말할 수 없는 비밀', 'https://image.tmdb.org/t/p/w200/lxqqFS3W1NsyeAcUVULAxT2jld2.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('507aaf05-09bc-45f9-977e-0df5ac3075ef', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 9038, 'Les Femmes de ses rêves', 'https://image.tmdb.org/t/p/w200/wwDYsulqWM50hPadM6In9PiB7OA.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9558cd2c-ea83-49dc-a3b4-964de22a95ff', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 13637, 'Sukiyaki Western Django', 'https://image.tmdb.org/t/p/w200/6rglnNhFPDetSms0DAR2WcXKJvq.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0535a07d-9e03-4dcc-803e-7d5e20019334', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 13732, 'L''Auberge rouge', 'https://image.tmdb.org/t/p/w200/fsYIPEzzUc2PgyjVIykaH16XBlO.jpg', 2007, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('38589342-c4fe-4e77-bec6-6fbb3ae2b151', '646427fa-0eb7-4a27-9e92-4abb0e26bf3d', 993092, '我的麻吉4個鬼', 'https://image.tmdb.org/t/p/w200/g02M4amQMpVMmQNeoOEk2tc2e3N.jpg', 2023, NOW());

COMMIT;

-- Movie: Infiltrate
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('a963bc98-40b9-4ce2-ae9c-8ad696ada496', 'Infiltrate', 'Infiltrate', 2026, 'James Mark', ARRAY['James Mark'], '1h33min', ARRAY['Action', 'Thriller'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/8Cw8GF9wG63kF8pRRXwOx2kXGt.jpg', 'https://image.tmdb.org/t/p/original/cfDHxkco8RrslL0Vk2XPTwTVFCe.jpg', ARRAY[], 'film', 111.6802, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e01cc521-23b1-48b7-88cc-73ae7cded8ca', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 1472951, 'https://image.tmdb.org/t/p/original/cfDHxkco8RrslL0Vk2XPTwTVFCe.jpg', 'https://image.tmdb.org/t/p/w500/8Cw8GF9wG63kF8pRRXwOx2kXGt.jpg', 5.2, 15, NULL, '', 93, '2026-04-10', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ce917d5b-3253-49c7-b7e8-6c49e4ce034c', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 1501941, 'Orphée Ladouceur-Nguyen', 'Lily Chen', 'https://image.tmdb.org/t/p/w200/b64Q2pc8jfLObZ68iKFULhXKYT0.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('205b4709-d648-46b3-9c0a-0e4e2088f581', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 1427888, 'Alain Moussi', 'Marcel LaFleur', 'https://image.tmdb.org/t/p/w200/cIpMdm0ggxVmZIBVj7vz8Q8nPLT.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c8644400-5dd9-4eb3-bace-ed2ddf56a78b', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 73610, 'Tim Rozon', 'John', 'https://image.tmdb.org/t/p/w200/c7r0ahbhIimXSgJkqUTUjVuKM2m.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dbf9409c-4152-470f-9c6f-b3da01c52a1a', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 3814629, 'Finn McCager Higgins', 'Romeo', 'https://image.tmdb.org/t/p/w200/nWvzmUc3xkh6dJTPgmkHc7OHJk7.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6f763143-199d-4ef5-8e8d-f85738b214ed', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 207713, 'Lisa Berry', 'Director Bass', 'https://image.tmdb.org/t/p/w200/tTvV9ZWKieJtWX8JK1kIzIUFWJR.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d7b8213c-724e-4b86-b6c3-543a1f796602', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 948533, 'Paul Braunstein', 'Nikolai', 'https://image.tmdb.org/t/p/w200/5WFAZe2AGttbi0LPg2MmmswL7Gn.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('83e82148-4f5d-40a8-9cb3-353fb882b490', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 30617, 'Jason Cavalier', 'Guy', 'https://image.tmdb.org/t/p/w200/nTCcnKIS8Eil9Ve2aGUz2fcf2I.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('73c0ad38-aecd-47b5-ac53-3117b5d44b51', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 116484, 'Jonathan Goad', 'The Voice / Mr. White', 'https://image.tmdb.org/t/p/w200/6gMaCtTJH6LBACYQUVaeHMcz5SY.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e493ab91-5175-4793-8a25-aa316447e6bf', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 2284578, 'Mitra Suri', 'Juliette', 'https://image.tmdb.org/t/p/w200/yYfJcAYcupuXYa1ON7JxG6NZCqV.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f67faff7-3712-4bad-b8a8-40f3dd6af0a5', 'a963bc98-40b9-4ce2-ae9c-8ad696ada496', 1793739, 'Jeff Yung', 'Tuan', 'https://image.tmdb.org/t/p/w200/9iZFECLtqhoNiXfzWYwbDz9o7Ux.jpg', 9, NOW());

COMMIT;

-- Movie: After - Chapitre 3
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('38243e5e-6093-447a-a995-d2cb7826259e', 'After - Chapitre 3', 'After We Fell', 2021, 'Castille Landon', ARRAY['Sharon Soboil'], '1h38min', ARRAY['Drame', 'Romance'], 'Tessa entame un nouveau chapitre de sa vie, mais alors qu’elle se prépare à emménager à Seattle pour son job de rêves, la jalousie et le comportement imprévisible d’Hardin s’intensifient et menacent leur relation. La situation se complique davantage lorsque le père de Tessa fait son retour et que des révélations choquantes sur la famille d’Hardin surgissent. Tessa et Hardin vont alors devoir décider si leur amour vaut la peine de se battre ou s’il est temps pour eux de prendre des chemins différents.', '', 'https://image.tmdb.org/t/p/w200/s1oXtmqyG9X0uDfiU5HidPB6BJx.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/wAEQvm2W9BUx5ggag4ALtSAhIe6.jpg', 'https://image.tmdb.org/t/p/original/mxdiaM2tsx8M6W3zLgiPwAkhQfq.jpg', ARRAY[], 'film', 85.4975, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('7a4a8d5a-5d9d-4631-a292-6330d7a599aa', '38243e5e-6093-447a-a995-d2cb7826259e', 744275, 'https://image.tmdb.org/t/p/original/mxdiaM2tsx8M6W3zLgiPwAkhQfq.jpg', 'https://image.tmdb.org/t/p/w500/wAEQvm2W9BUx5ggag4ALtSAhIe6.jpg', 7.005, 2742, 'L''amour mis à l''épreuve. La loyauté mise en doute. Plus rien ne sera comme avant.', 'Tessa entame un nouveau chapitre de sa vie, mais alors qu’elle se prépare à emménager à Seattle pour son job de rêves, la jalousie et le comportement imprévisible d’Hardin s’intensifient et menacent leur relation. La situation se complique davantage lorsque le père de Tessa fait son retour et que des révélations choquantes sur la famille d’Hardin surgissent. Tessa et Hardin vont alors devoir décider si leur amour vaut la peine de se battre ou s’il est temps pour eux de prendre des chemins différents.', 98, '2021-09-01', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b4640dc0-29b5-4b4d-909e-4b41a789eaa6', '38243e5e-6093-447a-a995-d2cb7826259e', 1753914, 'Josephine Langford', 'Tessa Young', 'https://image.tmdb.org/t/p/w200/rxQIrvUN1NGHkqSKHug1hoHTUNi.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('40349f93-2deb-41e6-87a7-325a7ff91525', '38243e5e-6093-447a-a995-d2cb7826259e', 1114487, 'Hero Fiennes Tiffin', 'Hardin Scott', 'https://image.tmdb.org/t/p/w200/6zMrrZvOMH6uGwEFoK0Uo8sZvxL.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ee0f3c91-cafc-4124-92bf-6b33c8f3020c', '38243e5e-6093-447a-a995-d2cb7826259e', 86653, 'Carter Jenkins', 'Robert Freeman', 'https://image.tmdb.org/t/p/w200/fGVndWC3hgwK1uVrhiyzTUyIaxW.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f03ff305-cf20-4484-abe0-eaf3da593cc8', '38243e5e-6093-447a-a995-d2cb7826259e', 20805, 'Louise Lombard', 'Trish Daniels', 'https://image.tmdb.org/t/p/w200/6znYbOI2Z8PfzZ6p9jHG5QdAeb2.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b8720570-9780-4db4-9665-dd55bcd929b0', '38243e5e-6093-447a-a995-d2cb7826259e', 2035329, 'Chance Perdomo', 'Landon Gibson', 'https://image.tmdb.org/t/p/w200/xRRDtdHhTewrKMj5cpcmEkPNmuP.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ceaf95f2-7349-4a6f-95cf-8c43c0fc6c83', '38243e5e-6093-447a-a995-d2cb7826259e', 20960, 'Rob Estes', 'Ken Scott', 'https://image.tmdb.org/t/p/w200/uRex9dyCv4mt7V4mxUzZ9NmVxjH.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b5277455-ca8e-495e-8f0c-c771cf19ff91', '38243e5e-6093-447a-a995-d2cb7826259e', 20373, 'Arielle Kebbel', 'Kimberly "Kim" Vance', 'https://image.tmdb.org/t/p/w200/eFN9TTOFk4COQQsDSufChNd7GfP.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('548b4131-39fc-438d-a87c-31cabf98a276', '38243e5e-6093-447a-a995-d2cb7826259e', 32203, 'Stephen Moyer', 'Christian Vance', 'https://image.tmdb.org/t/p/w200/rQDODAKYgDGSXAShNHMmGGOJI35.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b7c2580a-b8da-4cf9-8ee7-b58ee77b0ed8', '38243e5e-6093-447a-a995-d2cb7826259e', 23931, 'Mira Sorvino', 'Carol Young', 'https://image.tmdb.org/t/p/w200/3CPM8yvppihiKsA1pf4x8PJe4x6.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c585abf8-9bff-4abd-bc4a-49b40f2a855f', '38243e5e-6093-447a-a995-d2cb7826259e', 1845809, 'Frances Turner', 'Karen Scott', 'https://image.tmdb.org/t/p/w200/ik2MNJFA2CzeuGtdwrpgUJaidef.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4d3d85e7-0ce2-4c01-98f0-f3bdd7eaaa42', '38243e5e-6093-447a-a995-d2cb7826259e', 8898, 'La Femme sans tête', 'https://image.tmdb.org/t/p/w200/7U7bn6KueKIxi8LRUoYBLMVdfv.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('194c8a8d-cddf-4b23-9a2b-e5e8c510ad55', '38243e5e-6093-447a-a995-d2cb7826259e', 8901, 'Les Bureaux de Dieu', 'https://image.tmdb.org/t/p/w200/2WXWVf94h6TlnInTWsPTCgycLPr.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('da3b86f1-8551-4ac8-a4dc-d54dd4b987e4', '38243e5e-6093-447a-a995-d2cb7826259e', 8902, 'Une famille brésilienne', 'https://image.tmdb.org/t/p/w200/xKx5msZOhp71R7w9LPudDfrFQsz.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('447766e7-2522-4fd2-bc9d-85d4ff017895', '38243e5e-6093-447a-a995-d2cb7826259e', 8888, 'L''Absent', 'https://image.tmdb.org/t/p/w200/blsfrlSo19Q29kM6ckapWVXuCAh.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7bd2ca79-6ec4-422b-9421-0390a7dd4630', '38243e5e-6093-447a-a995-d2cb7826259e', 8889, 'La femme de l''anarchiste', 'https://image.tmdb.org/t/p/w200/sAbmd8MNFBQKu9zUpeRQskz0dG4.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('a710a1d8-082f-42c1-9800-fc670af8c581', '38243e5e-6093-447a-a995-d2cb7826259e', 8890, 'Clara', 'https://image.tmdb.org/t/p/w200/8h4srQUi9bY6nEW3QGtrhi6OZIy.jpg', 2008, NOW());

COMMIT;

-- Movie: Zootopie 2
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 'Zootopie 2', 'Zootopia 2', 2025, 'Jared Bush', ARRAY['Jared Bush'], '1h48min', ARRAY['Aventure', 'Animation', 'Comédie', 'Familial', 'Mystère'], 'Judy Hopps et Nick Wilde explorent à nouveau Zootopie, entre mystères, rires et rencontres inattendues. À travers chaque rue et chaque instant, ils découvrent que l’amitié et la curiosité transforment le quotidien en moments magiques.', '', 'https://image.tmdb.org/t/p/w200/50XtrC5NMcqiYMXNmuNVY5tUl34.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/hBI7Wrps6tDjhEzBxJgoPLhbmT1.jpg', 'https://image.tmdb.org/t/p/original/lgotja3xMoJZbynwHfcQcJAEMWH.jpg', ARRAY[], 'film', 88.4694, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('e437543d-2c68-4dee-9455-79bed46934c9', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 1084242, 'https://image.tmdb.org/t/p/original/lgotja3xMoJZbynwHfcQcJAEMWH.jpg', 'https://image.tmdb.org/t/p/w500/hBI7Wrps6tDjhEzBxJgoPLhbmT1.jpg', 7.648, 2845, 'Retournez à Zootopie pour l’événement qui fera sensation dans l’histoire.', 'Judy Hopps et Nick Wilde explorent à nouveau Zootopie, entre mystères, rires et rencontres inattendues. À travers chaque rue et chaque instant, ils découvrent que l’amitié et la curiosité transforment le quotidien en moments magiques.', 108, '2025-11-26', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('93bf7eee-e722-46bb-9d79-f1f54c364cbd', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 417, 'Ginnifer Goodwin', 'Judy Hopps (voice)', 'https://image.tmdb.org/t/p/w200/n8XOnjgyfYvqRUDcnkAckRqSaNN.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f134b2a2-8767-40a7-b2f2-133ce6de9b7a', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 23532, 'Jason Bateman', 'Nick Wilde (voice)', 'https://image.tmdb.org/t/p/w200/h6Sl1afuHMwnyqcxannecceIg4K.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f3a821ab-6a64-4367-8fc9-062bb2300d40', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 690, 'Ke Huy Quan', 'Gary De''Snake (voice)', 'https://image.tmdb.org/t/p/w200/iestHyn7PLuVowj5Jaa1SGPboQ4.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('20cd316c-a431-431a-b141-1b318ecf866e', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 1183672, 'Fortune Feimster', 'Nibbles Maplestick (voice)', 'https://image.tmdb.org/t/p/w200/9f2p2T61K4pIvKQMLRlow8znkXU.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('ca237305-67d3-434b-9d35-ac80efcf164d', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 62861, 'Andy Samberg', 'Pawbert Lynxley (voice)', 'https://image.tmdb.org/t/p/w200/jMXU5oG3i93SH1yhkpbBGskFiJl.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8d980ece-6a46-4d18-af4c-4cc794c6bdbc', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 11064, 'David Strathairn', 'Milton Lynxley (voice)', 'https://image.tmdb.org/t/p/w200/w5YM2cGefPnkoyIXCi2UrCQW53r.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('65f72fab-a6b5-46f2-9af7-3de53b125425', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 17605, 'Idris Elba', 'Chief Bogo (voice)', 'https://image.tmdb.org/t/p/w200/be1bVF7qGX91a6c5WeRPs5pKXln.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('979b357b-cf1d-4f5e-a2b3-49dbf15e5b8f', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 446511, 'Shakira', 'Gazelle (voice)', 'https://image.tmdb.org/t/p/w200/AcOA8MbRrDswt6w3TmCBYl7TNOu.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('f9e528ba-b880-4262-8479-df6fca69cea7', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 9657, 'Patrick Warburton', 'Mayor Winddancer (voice)', 'https://image.tmdb.org/t/p/w200/nDoOii5HaGwPxYa28xFC2sDkF8y.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3d6377ee-9988-4705-a701-b3718dbe9c27', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 1745988, 'Quinta Brunson', 'Dr. Fuzzby (voice)', 'https://image.tmdb.org/t/p/w200/4x2ltnaGHF9rhaDRlkyNs7HOUI8.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7ab2cce5-cca1-409c-8628-4d47052637b6', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 8844, 'Jumanji', 'https://image.tmdb.org/t/p/w200/nLXYV4WmYUF4i8pX0iE0H1rltmf.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('721ef5a8-87ab-4920-bc4c-fc30ac3a0713', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('171fb47e-2c26-4d94-aee3-96d9f85e3014', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 8965, 'Les Énigmes de l''Atlantide', 'https://image.tmdb.org/t/p/w200/mYsFQt0xgBkEUOTbjA4MLRrzaKQ.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('9fb24973-49ff-4d60-86b7-eeb74b912c34', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 614828, 'El vecindario 2', 'https://image.tmdb.org/t/p/w200/3yXUYKOKt21mrl2iBwQhznilFP7.jpg', 1983, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c0627492-a6f6-4c60-b94e-437944015fb6', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 1356458, 'Let’s Split Up!', 'https://image.tmdb.org/t/p/w200/f0pCgc7AhQhlNr7Qhjb8iOsz2jQ.jpg', 2022, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5928a1e4-b21f-46ce-b7a4-ec9d5289c731', '23dfa81c-339b-49f7-85fc-b1959e5d1fe2', 9031, 'Cul et chemise', 'https://image.tmdb.org/t/p/w200/jYjzckRsby8iv59LHQTnnZpPlkE.jpg', 1979, NOW());

COMMIT;

-- Movie: Kartavya : Le sens du devoir
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('d4407b92-1b9f-4bbe-9115-b7d7b19eb734', 'Kartavya : Le sens du devoir', 'कर्त्तव्य', 2026, 'Pulkit', ARRAY['Pulkit'], '1h49min', ARRAY['Crime', 'Drame', 'Thriller'], 'Lorsque la vie de sa famille est menacée et que le danger se rapproche, un policier doit décider jusqu''où il est prêt à aller pour remplir son devoir.', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/6OccgP26oyioq8NjfwKIJ2rWjhu.jpg', 'https://image.tmdb.org/t/p/original/mHm73HhpvGWfRkXNErcwc15Czrv.jpg', ARRAY[], 'film', 71.8725, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('5bbefb03-9db0-4667-9a63-2cf14c01a61a', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 1628367, 'https://image.tmdb.org/t/p/original/mHm73HhpvGWfRkXNErcwc15Czrv.jpg', 'https://image.tmdb.org/t/p/w500/6OccgP26oyioq8NjfwKIJ2rWjhu.jpg', 6.438, 16, NULL, 'Lorsque la vie de sa famille est menacée et que le danger se rapproche, un policier doit décider jusqu''où il est prêt à aller pour remplir son devoir.', 109, '2026-05-15', 'hi', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('54a4a6e4-3e90-4bc8-9bbf-ef6ebd95a33a', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 35747, 'सैफ अली खान', 'Pawan Malik', 'https://image.tmdb.org/t/p/w200/85uKiFDEcIqzLh0GwqYvecXw4uA.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('71c29f7a-ce4b-4385-b004-2344160f757c', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 86243, 'Rasika Dugal', 'Varsha', 'https://image.tmdb.org/t/p/w200/cMJP2OEOrKwF05BFh3zI3TyS5Ft.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6a1a22f4-1add-4ce3-a442-2af0490feacc', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 85879, 'Sanjay Mishra', 'Ashok', 'https://image.tmdb.org/t/p/w200/4MGKohKGU4v9SoXcQKCcC4e4Bpi.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('222435de-2409-4cd9-a4d3-b75dd1e78ae7', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 5576987, 'Saurabh Dwivedi', 'Anand Shri', 'https://image.tmdb.org/t/p/w200/mX0LkUJnSXXPSrFUFWW59QUG0bE.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('7efe7c3b-a2cd-4ec6-a38e-f9fa216e5ed1', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 85656, 'Zakir Hussain', 'Harihar', 'https://image.tmdb.org/t/p/w200/etiL0ANjzBhTiyvUblZl6vwIog9.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eac4e268-c29d-4d9a-8cc7-518d2606d45b', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 1040951, 'Manish Chaudhary', 'Keshav', 'https://image.tmdb.org/t/p/w200/1l4vmA0IJQLieebZWOOCAFu4ra6.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('292331aa-3150-406c-b86f-84530e9e9c2c', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 1294159, 'Durgesh Kumar', 'Amar', 'https://image.tmdb.org/t/p/w200/nLt1cgrxIapn7fRVwFjqnSFXc1x.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a0c1882b-abf4-4e24-b396-820968551c1c', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 1294161, 'Saharsh Kumar Shukla', 'Nirmal', 'https://image.tmdb.org/t/p/w200/jBDpti5r8uOuNJAEApcJyvrlVFA.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('653ac126-ad33-4242-a5de-b1a272e58925', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 6215055, 'Swastik Bhagat', 'Honey', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('6f3aac37-b7d3-4fa4-a26f-b2f90dd709e6', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 6215056, 'Saurabh Abrol', 'Deepak', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('be2e413a-5590-4f88-ab3d-708c83332a2f', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 793, 'Blue Velvet', 'https://image.tmdb.org/t/p/w200/zw0JOpVE5IFE8IfAm8zRX0AkB3O.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b1ab41cf-cc31-4023-8a24-d54adb8594fc', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 845, 'L''Inconnu du Nord-Express', 'https://image.tmdb.org/t/p/w200/6oSfav2yXyP009cBKoNEH0UYF10.jpg', 1951, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('91bc0ac3-b14c-4f79-84e5-c0b4ff5ef245', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 807, 'Seven', 'https://image.tmdb.org/t/p/w200/to6jUaLJonMuKW2YovtWfQKtLYP.jpg', 1995, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0d31c294-c78f-4b29-ae27-ba6380ceb4c9', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 910, 'Le Grand Sommeil', 'https://image.tmdb.org/t/p/w200/5gaYxcRapzqqa7EZu6F8DDzLTx1.jpg', 1946, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b155b2e7-8af7-4a14-b6d1-1e94504f558f', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 913, 'Thomas Crown', 'https://image.tmdb.org/t/p/w200/3xFUQzDR6e3lcJj7cBxfkhr4aQv.jpg', 1999, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('3b79a926-0fa7-48e7-81f3-005c47fc7f25', 'd4407b92-1b9f-4bbe-9115-b7d7b19eb734', 916, 'Bullitt', 'https://image.tmdb.org/t/p/w200/bwqYLTFP6OVtxvISSpbTIr4xZ30.jpg', 1968, NOW());

COMMIT;

-- Movie: Les Évadés
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('688dc041-6767-41c0-ab96-afe0d1d197cc', 'Les Évadés', 'The Shawshank Redemption', 1994, 'Frank Darabont', ARRAY['Frank Darabont'], '2h20min', ARRAY['Drame', 'Crime'], 'En 1947, Andy Dufresne, un jeune banquier, est condamné à la prison à vie pour le meurtre de sa femme et de son amant. Ayant beau clamer son innocence, il est emprisonné à Shawshank, le pénitencier le plus sévère de l''État du Maine. Il y fait la rencontre de Red, un noir désabusé, détenu depuis vingt ans. Commence alors une grande histoire d''amitié entre les deux hommes…', '', 'https://image.tmdb.org/t/p/w200/vZ50guP86otYTiBSGfi35GNHWVf.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/t30GjttOdb5At1sYy8b3TOwFgWV.jpg', 'https://image.tmdb.org/t/p/original/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg', ARRAY[], 'film', 77.6488, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('1b4a8f8d-ddc5-4095-b2f7-b36aa95de8cb', '688dc041-6767-41c0-ab96-afe0d1d197cc', 278, 'https://image.tmdb.org/t/p/original/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg', 'https://image.tmdb.org/t/p/w500/t30GjttOdb5At1sYy8b3TOwFgWV.jpg', 8.7, 30448, 'Même à Shawshank on n''enferme pas l''espoir…', 'En 1947, Andy Dufresne, un jeune banquier, est condamné à la prison à vie pour le meurtre de sa femme et de son amant. Ayant beau clamer son innocence, il est emprisonné à Shawshank, le pénitencier le plus sévère de l''État du Maine. Il y fait la rencontre de Red, un noir désabusé, détenu depuis vingt ans. Commence alors une grande histoire d''amitié entre les deux hommes…', 140, '1994-09-23', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('80112415-db16-4fd7-8bbd-6f86ea6f1230', '688dc041-6767-41c0-ab96-afe0d1d197cc', 504, 'Tim Robbins', 'Andy Dufresne', 'https://image.tmdb.org/t/p/w200/3FfJMIVwXgsIXbAT8ECBSZJAncR.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cbbc23fe-68f4-4944-8265-7e40445df036', '688dc041-6767-41c0-ab96-afe0d1d197cc', 192, 'Morgan Freeman', 'Ellis Boyd ''Red'' Redding', 'https://image.tmdb.org/t/p/w200/1ahENoyEgKSbRUd0IsydIff7rt1.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('e77c306d-e608-416a-b91a-9f3a943d123c', '688dc041-6767-41c0-ab96-afe0d1d197cc', 4029, 'Bob Gunton', 'Warden Norton', 'https://image.tmdb.org/t/p/w200/ulbVvuBToBN3aCGcV028hwO0MOP.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('cf488107-d30f-4041-b726-c15699118f78', '688dc041-6767-41c0-ab96-afe0d1d197cc', 6573, 'William Sadler', 'Heywood', 'https://image.tmdb.org/t/p/w200/rWeb2kjYCA7V9MC9kRwRpm57YoY.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fc021ef3-df94-43f7-b3a3-37001bad85ca', '688dc041-6767-41c0-ab96-afe0d1d197cc', 6574, 'Clancy Brown', 'Captain Byron T. Hadley', 'https://image.tmdb.org/t/p/w200/1JeBRNG7VS7r64V9lOvej9bZXW5.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('4460c249-d6c6-4c09-a8f5-864aca7ff8ea', '688dc041-6767-41c0-ab96-afe0d1d197cc', 6575, 'Gil Bellows', 'Tommy', 'https://image.tmdb.org/t/p/w200/eCOIv2nSGnWTHdn88NoMyNOKWyR.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fbec9e02-0e42-46d4-9ac3-750f7a84be25', '688dc041-6767-41c0-ab96-afe0d1d197cc', 6577, 'James Whitmore', 'Brooks Hatlen', 'https://image.tmdb.org/t/p/w200/nYMAbkfwFIgKK84vnLoQctI6vHg.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0dd110f7-9c4d-421d-bb5e-f84ce783e76f', '688dc041-6767-41c0-ab96-afe0d1d197cc', 6576, 'Mark Rolston', 'Bogs Diamond', 'https://image.tmdb.org/t/p/w200/hcrNRIptYMRXgkJ9k76BlQu6DQp.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0d1d3744-8470-498f-851c-898209fe077c', '688dc041-6767-41c0-ab96-afe0d1d197cc', 12645, 'Jeffrey DeMunn', '1946 D.A.', 'https://image.tmdb.org/t/p/w200/70bkLdlkBB7x2NztuJAh4pjdyxy.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8c79899b-f3fb-46b0-863a-d336e1247dd6', '688dc041-6767-41c0-ab96-afe0d1d197cc', 92119, 'Larry Brandenburg', 'Skeet', 'https://image.tmdb.org/t/p/w200/y13c1a4keaLnoTbi3dERwolQXWP.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('349ce4a5-4bee-44f0-99b1-fb245927f274', '688dc041-6767-41c0-ab96-afe0d1d197cc', 11005, 'L''Éveil', 'https://image.tmdb.org/t/p/w200/nyX0kdrCiXD27EqpiN8MJcA7xDO.jpg', 1990, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('01cb3a38-925e-4342-9762-8810b0d79d26', '688dc041-6767-41c0-ab96-afe0d1d197cc', 11020, 'Pique-nique à Hanging Rock', 'https://image.tmdb.org/t/p/w200/e5myKEaZHh506KekQv0DECddflz.jpg', 1975, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('495e72d6-afee-4322-870f-ffdb8405aed8', '688dc041-6767-41c0-ab96-afe0d1d197cc', 11022, 'Narc', 'https://image.tmdb.org/t/p/w200/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg', 2002, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('b438afae-4236-4f33-8683-ceac0cf919a6', '688dc041-6767-41c0-ab96-afe0d1d197cc', 11156, 'Coco avant Chanel', 'https://image.tmdb.org/t/p/w200/yz5JhT8ecEJLw30tvAN29LOyFcW.jpg', 2009, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('277f765d-f51e-4709-97f8-3a096691f541', '688dc041-6767-41c0-ab96-afe0d1d197cc', 11257, 'Chambre avec vue', 'https://image.tmdb.org/t/p/w200/egKYKKa9Cpfsvbwod89QfAQwc2l.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('136481d9-e898-486e-8d37-ab382e4a26f7', '688dc041-6767-41c0-ab96-afe0d1d197cc', 11293, 'La Barbe à papa', 'https://image.tmdb.org/t/p/w200/jcqfJzjob8PJPimEhshhlpkFWiC.jpg', 1973, NOW());

COMMIT;

-- Movie: Worldbreaker
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 'Worldbreaker', 'Worldbreaker', 2025, 'Brad Anderson', ARRAY['Joshua Rollins'], '1h34min', ARRAY['Science-Fiction', 'Action', 'Horreur'], 'Un père cache sa fille sur une île pour la protéger, tout en la préparant à survivre et à affronter les combats qui l''attendent et qui détermineront l''avenir de l''Humanité.', '', 'https://image.tmdb.org/t/p/w200/4XCOsnXocIsOTLdVjktj3gqTu2b.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/ahj1JU8r0uJv7QII5Uj7tKzbEsC.jpg', 'https://image.tmdb.org/t/p/original/gMItMzDOyrfQGZsMWRM9tdxq5cV.jpg', ARRAY[], 'film', 71.9967, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('1b3ef15c-cfd7-47d1-a0b5-78ec9a04f04a', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 1196067, 'https://image.tmdb.org/t/p/original/gMItMzDOyrfQGZsMWRM9tdxq5cV.jpg', 'https://image.tmdb.org/t/p/w500/ahj1JU8r0uJv7QII5Uj7tKzbEsC.jpg', 6.081, 192, 'L’avenir appartient à ceux qui se battent.', 'Un père cache sa fille sur une île pour la protéger, tout en la préparant à survivre et à affronter les combats qui l''attendent et qui détermineront l''avenir de l''Humanité.', 94, '2025-10-30', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('44ef8f1e-6b38-4394-b9ac-6845bc25a0ae', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 2667928, 'Billie Boullet', 'Willa', 'https://image.tmdb.org/t/p/w200/2T18NEAVoU8cWWpAtaI6fTrdolX.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('97a6db35-5e1c-42b9-8390-248298196ccf', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 114019, 'Luke Evans', 'Dad', 'https://image.tmdb.org/t/p/w200/qUkYJcrDc4M0LHNYASs30luFvw0.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('dc4be61f-1eea-4f92-aa48-3b7bc6923687', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 63, 'Milla Jovovich', 'Mom', 'https://image.tmdb.org/t/p/w200/usWnHCzbADijULREZYSJ0qfM00y.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('eef7b511-b8e8-4693-8ed0-3b04f77a2856', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 3214361, 'Mila Harris', 'Rosie', 'https://image.tmdb.org/t/p/w200/10BSVhLPqosSBsOgp0L7qaU0Uhi.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('bc66f199-7c1b-4476-8e4a-398eead8993e', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 5287221, 'Kevin Glynn', 'The Man', 'https://image.tmdb.org/t/p/w200/jIQk6lFQ0FOg5piKabufRHfSxNc.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('0129f5d0-5e0f-47ab-aff1-355025cabf8b', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 3744336, 'Steven Calvert', 'Infected Soldier', 'https://image.tmdb.org/t/p/w200/khzZaa3fZtWIgPe2kjpYiK0e97d.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3fe10411-6aee-49e3-94f6-aef624fd9cbb', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 956385, 'Meadow Williams', 'Female Guard 1', 'https://image.tmdb.org/t/p/w200/iECIpEM4BWt94kvOMKFJqv5uJEU.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('18234c42-e8d5-428c-9d68-8602efc8e430', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 4746149, 'Nadia Violet-Johnson', 'Female Guard 2', NULL, 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('428311ab-f34f-496c-b432-f60246418b07', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 1273108, 'Brian Devlin', 'Older Man', NULL, 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('b7cd8b51-73c5-4122-b5fc-57dbfe21d464', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 2412148, 'Chris Finlayson', 'Kodiak', NULL, 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f418e0b3-8988-4528-9572-81149204e899', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 1172265, 'Les Voyages de Tereza', 'https://image.tmdb.org/t/p/w200/jZMmK4mwjw0oo2YeS24nIKHtKhL.jpg', 2025, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('5f07eb34-175a-432b-954f-4171a2002d7a', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 11940, 'Sinbad et l''Œil du tigre', 'https://image.tmdb.org/t/p/w200/yE7Hi4ItfA7EIqI0Hub5nVSaVZQ.jpg', 1977, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('43dd1d31-288f-428b-963d-bae72d7e40bd', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 12101, 'Soleil vert', 'https://image.tmdb.org/t/p/w200/1kOIdhDwwaXpuIVojOvwvHSH2sy.jpg', 1973, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4dfe8eaf-5160-4b6e-8620-43cb7f3f39db', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 1173214, 'Mama Casserole', 'https://image.tmdb.org/t/p/w200/xvORHniAae8OfHn1k994RwWbASy.jpg', 2023, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('275f7d37-a84b-4d6b-b122-3f8ab851462a', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 11351, 'Jeepers Creepers 2', 'https://image.tmdb.org/t/p/w200/khvDWl4kyM4n0SZAmCAiGGyUCjp.jpg', 2003, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('07887c0c-bd9b-4b98-b0c2-90754e58c290', '00f5cc98-9a4e-4f5b-b848-7d1113d8d3a3', 11071, 'Des monstres attaquent la ville', 'https://image.tmdb.org/t/p/w200/xnBN8xgPHtliU0Zd5XLCVEmsbpw.jpg', 1954, NOW());

COMMIT;

-- Movie: Kaulayaw
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('b39e0586-bd2a-451e-9337-624ccc5f320a', 'Kaulayaw', 'Kaulayaw', 2024, 'Iar Arondaing', ARRAY[], '0h48min', ARRAY['Drame'], '', '', '', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/yNoRbxLHJ820AJUm4ktresuXrE.jpg', 'https://image.tmdb.org/t/p/original/aJxmgoNtP2BH7mRYvuf7AHB0VC3.jpg', ARRAY[], 'film', 86.6028, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('59b38ca5-a259-409b-b969-10c13c2e9374', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 1302007, 'https://image.tmdb.org/t/p/original/aJxmgoNtP2BH7mRYvuf7AHB0VC3.jpg', 'https://image.tmdb.org/t/p/w500/yNoRbxLHJ820AJUm4ktresuXrE.jpg', 5.8, 6, NULL, '', 48, '2024-07-18', 'tl', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('715b137d-3b17-401d-a8eb-9a72c062ddef', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 3582449, 'Micaella Raz', 'Ella', 'https://image.tmdb.org/t/p/w200/xJqsMSJT9D7ggk1LT9oVu2qcdcg.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('d6882ae8-f4f2-413b-9af5-11e8c8d2251e', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 3972818, 'Matthew Francisco', 'Migo', 'https://image.tmdb.org/t/p/w200/535hNSYytvErtSeKlhQJn52M5f4.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('a053541c-fa7f-4a5c-9a05-98b5343008d5', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 3371806, 'Robb Guinto', 'Cara', 'https://image.tmdb.org/t/p/w200/raZt6SwyqxdpuMvBwnnrvvNaazq.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('8c6f53f2-2c45-4f42-ba07-b30c45389346', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 4935805, 'Adelaide Sojo', 'Melody', NULL, 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('fcdc3dfb-edae-4d4e-977a-f3b9ad50b64e', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 5053579, 'Dante Navat', 'School Admin 1', NULL, 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('513f356f-c9f2-4006-b6df-21d4f6737769', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 5053580, 'Jolly Jamero', 'School Admin 2', NULL, 5, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('7a190033-53f0-4b9e-9965-317a085fb098', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 609261, 'Falsettos', 'https://image.tmdb.org/t/p/w200/tvXJ7ACfNisHqeEIIsgWc8bhpm7.jpg', 2017, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('0a9d0d2c-58ac-4ae0-bdbe-3f5fc853de02', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 796234, 'ひらいて', 'https://image.tmdb.org/t/p/w200/mkcNjbulu2yTul7TcOY0PSKlTRk.jpg', 2021, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('34db72e9-1fa5-433d-8ccb-1173d6234dd1', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 610759, 'The Sympathy Card', 'https://image.tmdb.org/t/p/w200/hCYMQtd9EDrJFNAZ4IGe1qm2PNM.jpg', 2019, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f1590625-60c6-4f82-9a08-9b09ef384906', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 258480, 'Carol', 'https://image.tmdb.org/t/p/w200/jD3HZaNeolV5Y1cAoQP1Wkd233f.jpg', 2015, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('722cada3-05c1-4750-97bf-b92caca818d7', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 434714, 'My days of Mercy', 'https://image.tmdb.org/t/p/w200/adIPKAoKnKL9vCTkvfF4J9ZA7Ln.jpg', 2018, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('ff24d83d-b7f8-4690-a90f-7ae7de469719', 'b39e0586-bd2a-451e-9337-624ccc5f320a', 1523652, 'Trianggulo', 'https://image.tmdb.org/t/p/w200/xSc0HZHVZlnKPu2BNxCxGlWfqHc.jpg', 2025, NOW());

COMMIT;

-- Movie: Real Steel
BEGIN;

INSERT INTO movies (id, title, original_title, year, director, writers, duration, genre, synopsis, director_bio, director_photo, anecdote, inspiration, nominations, platforms, poster_url, hero_url, locations, type, popularity, created_at)
VALUES ('f25fab8c-d9f4-4b07-9d23-cfd96a304152', 'Real Steel', 'Real Steel', 2011, 'Shawn Levy', ARRAY['John Gatins'], '2h7min', ARRAY['Action', 'Science-Fiction', 'Drame'], 'Dans un futur proche, la boxe a évolué pour devenir un sport high-tech. Charlie Kenton, un ancien boxeur, a perdu toute chance de remporter le championnat depuis que les humains ont été remplacés sur le ring par des robots d’acier de 900 kilos et de 2,40 m de haut. À présent, il n’est plus qu’un manager minable qui utilise des robots bas de gamme fabriqués à partir de pièces de récupération. Il gagne juste assez pour survivre d’un combat à l’autre. Lorsque Charlie touche le fond, il accepte à contrecœur de faire équipe avec son fils Max, qu’il a perdu de vue depuis des années, pour construire et entraîner un champion. Dans l’arène où tous les coups sont permis, les enjeux sont plus élevés qu’ils ne l’ont jamais été. Contre toute attente, Charlie et Max ont une chance, une seule, de faire leur grand retour…', '', 'https://image.tmdb.org/t/p/w200/uZ40wDFzxPmzROJl9KxPgEGv9ME.jpg', '', '', ARRAY[]::text[], ARRAY[]::text[], 'https://image.tmdb.org/t/p/w500/ebV1lxTaLBS1Vk1ihHCVhhdg03X.jpg', 'https://image.tmdb.org/t/p/original/pjlxrd646cBYznHoPBWTzz6FujX.jpg', ARRAY[], 'film', 66.6994, NOW());

INSERT INTO tmdb_cache (id, movie_id, tmdb_id, backdrop_url, poster_url, rating, vote_count, tagline, overview, runtime, release_date, original_language, origin_country, updated_at)
VALUES ('19a53214-7793-4ca3-ad73-12bef700f8a9', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 39254, 'https://image.tmdb.org/t/p/original/pjlxrd646cBYznHoPBWTzz6FujX.jpg', 'https://image.tmdb.org/t/p/w500/ebV1lxTaLBS1Vk1ihHCVhhdg03X.jpg', 7.093, 9155, 'Le courage est plus robuste que l''acier.', 'Dans un futur proche, la boxe a évolué pour devenir un sport high-tech. Charlie Kenton, un ancien boxeur, a perdu toute chance de remporter le championnat depuis que les humains ont été remplacés sur le ring par des robots d’acier de 900 kilos et de 2,40 m de haut. À présent, il n’est plus qu’un manager minable qui utilise des robots bas de gamme fabriqués à partir de pièces de récupération. Il gagne juste assez pour survivre d’un combat à l’autre. Lorsque Charlie touche le fond, il accepte à contrecœur de faire équipe avec son fils Max, qu’il a perdu de vue depuis des années, pour construire et entraîner un champion. Dans l’arène où tous les coups sont permis, les enjeux sont plus élevés qu’ils ne l’ont jamais été. Contre toute attente, Charlie et Max ont une chance, une seule, de faire leur grand retour…', 127, '2011-09-28', 'en', ARRAY[]::text[], NOW());

INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('248bc3c4-1673-4c47-8e7a-e94e4d238927', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 6968, 'Hugh Jackman', 'Charlie Kenton', 'https://image.tmdb.org/t/p/w200/oX6CpXmnXCHLyqsa4NEed1DZAKx.jpg', 0, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('444d718d-269b-4b10-bbfb-c2234ef06925', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 234479, 'Dakota Goyo', 'Max Kenton', 'https://image.tmdb.org/t/p/w200/xHfxZDILa8JRZu5OoaXKiDa781o.jpg', 1, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('3e03af97-23c7-4bd4-bafc-264342084e18', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 19034, 'Evangeline Lilly', 'Bailey Tallet', 'https://image.tmdb.org/t/p/w200/pJHX2jd7ytre3NQbF9nlyWUqxH3.jpg', 2, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('413f95a3-1e97-4fd4-8081-efc85f7771ad', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 79072, 'Kevin Durand', 'Ricky', 'https://image.tmdb.org/t/p/w200/hINvryvce5tpod6kTnUg9ZTH8wg.jpg', 3, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('37ce882b-7d15-4409-865a-7c15704f95d9', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 53650, 'Anthony Mackie', 'Finn', 'https://image.tmdb.org/t/p/w200/kfTwOYr3iUucmYz8kPjhYy07G2Z.jpg', 4, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('1d49ae83-77a7-48af-b67f-c53954134bcd', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 15250, 'Hope Davis', 'Aunt Debra', 'https://image.tmdb.org/t/p/w200/dJb76YQDFmfJ6ptlvBvx0ZBP44C.jpg', 5, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c347a796-b46a-4c76-9378-30b985af5f98', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 8986, 'James Rebhorn', 'Marvin', 'https://image.tmdb.org/t/p/w200/jRdR3q28gTPQU6eWRgiIqzGuMKU.jpg', 6, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('97269380-542b-4fef-94ae-7beb051a11f2', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 19860, 'Karl Yune', 'Tak Mashido', 'https://image.tmdb.org/t/p/w200/4GI4p5aPfW0vI20IdJOcxD5BEqr.jpg', 7, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('21e86de9-fa2a-4ed5-94b6-2c2d8286dd8b', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 1126350, 'Sophie Levy', 'Big Sister', 'https://image.tmdb.org/t/p/w200/ytDkZ3NrpxWayURhHuI2Dtp29TM.jpg', 8, NOW());
INSERT INTO tmdb_cast (id, movie_id, tmdb_person_id, name, character, profile_path, order_index, created_at)
VALUES ('c173b3ac-7db3-4571-b1c2-2d4c298caf04', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 1126351, 'Tess Levy', 'Little Sister', 'https://image.tmdb.org/t/p/w200/xHNZkN4KhVa4ehiHnmJy6MeHia7.jpg', 9, NOW());

INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('f31eaa5a-b226-472e-afbc-063bde43b406', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 1356234, 'Sunny Edwards vs. Galal Yafai', 'https://image.tmdb.org/t/p/w200/quJvXFi8Zpjtjcu7WoJRbFn0gqG.jpg', 2024, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('622963e2-c973-4f25-b079-80b370486d17', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 8842, 'Dans les cordes', 'https://image.tmdb.org/t/p/w200/e3CBjs3YZGlcPG88QF4lkj3JA9o.jpg', 2004, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('389bd044-bb07-410d-b75e-8e9d827e052a', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 8903, 'My Magic', 'https://image.tmdb.org/t/p/w200/AXnfXfaKUV2a9M5QPXncZoqLfq.jpg', 2008, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('4432ffdc-fbe5-4e62-a503-7ac328bd3af9', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 8856, 'Karate Kid II', 'https://image.tmdb.org/t/p/w200/zCBT9Ql54W24hAckIH3LWFRxtrv.jpg', 1986, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('c79c0b75-6186-4bd2-b8a8-bdf788e0c523', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 8967, 'The Tree of Life', 'https://image.tmdb.org/t/p/w200/y47kUz3IYdoxKyscG6Bc6EPo59k.jpg', 2011, NOW());
INSERT INTO tmdb_similar (id, movie_id, similar_tmdb_id, title, poster_path, release_year, created_at)
VALUES ('952cf4a7-8fa3-4b40-95a6-c48bddd7e14a', 'f25fab8c-d9f4-4b07-9d23-cfd96a304152', 8981, 'Cher Frankie', 'https://image.tmdb.org/t/p/w200/jIh8X4FiYXjMbTAfxr6eyedN6hF.jpg', 2004, NOW());

COMMIT;

-- ==========================================
-- IMPORT SUMMARY
-- Successfully processed: 50 movies
-- Failed: 0 movies
-- ==========================================
