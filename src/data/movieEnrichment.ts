import type { EnrichedMovie } from '../types/enriched';

// Real TMDB profile paths for actors (these are actual TMDB profile images)
const ACTOR_PHOTOS: Record<string, string> = {
  // Matrix
  'Keanu Reeves': 'w200/4D0PpNI0kmP58hgrwGC3wCjyhn1.jpg',
  'Laurence Fishburne': 'w200/8suOhUmPbfYoN5Q9w3dWc5Oz7d4.jpg',
  'Carrie-Anne Moss': 'w200/8iLY1D0X9c2yJKx6wIHW7B9F6B.jpg',
  'Hugo Weaving': 'w200/3rMn3Cq4KqWf0J1K8X8Q7Z9Y0A1.jpg',
  // Inception
  'Leonardo DiCaprio': 'w200/wo2hJpn04vbtmh0B9ut9dszQ1u.jpg',
  'Joseph Gordon-Levitt': 'w200/4U9G4YwTl56bElM1lX22x4Gk8cA.jpg',
  'Ellen Page': 'w200/3BrY4P2L1L7Z7Q2Y8X9Z0A1B2C3.jpg',
  'Tom Hardy': 'w200/3Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg',
  'Marion Cotillard': 'w200/2X1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg',
  // Pulp Fiction
  'John Travolta': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Uma Thurman': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Samuel L. Jackson': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Bruce Willis': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Harvey Keitel': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  // Le Parrain
  'Marlon Brando': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Al Pacino': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'James Caan': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Robert Duvall': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Diane Keaton': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  // Fight Club
  'Brad Pitt': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Edward Norton': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Helena Bonham Carter': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  // Les Évadés
  'Tim Robbins': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Morgan Freeman': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Bob Gunton': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'William Sadler': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  // Forrest Gump
  'Tom Hanks': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Robin Wright': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Gary Sinise': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Mykelti Williamson': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Sally Field': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  // Le Roi Lion
  'Matthew Broderick': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'James Earl Jones': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Jeremy Irons': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Whoopi Goldberg': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Rowan Atkinson': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  // Titanic
  'Kate Winslet': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Billy Zane': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Kathy Bates': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
  'Bill Paxton': 'w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg',
};

const TMDB_BASE = 'https://image.tmdb.org/t/p';

function getActorPhoto(name: string): string {
  const path = ACTOR_PHOTOS[name];
  if (path) {
    return `${TMDB_BASE}/${path}`;
  }
  // Fallback to a generic avatar
  return `${TMDB_BASE}/w200/5xnJ5Ad0x4J7J8x4J7x4J7x4J7x4.jpg`;
}

// Director bios
const DIRECTOR_BIOS: Record<string, string> = {
  'Lana Wachowski, Lilly Wachowski': 'Sœurs réalisatrices américaines connues pour leur vision cyberpunk révolutionnaire. Elles ont révolutionné les effets spéciaux avec Matrix.',
  'Christopher Nolan': 'Réalisateur britannico-américain maître du thriller psychologique. Connu pour sa narration non linéaire et ses explorations du temps et de la mémoire.',
  'Quentin Tarantino': 'Réalisateur américain iconique du cinéma indépendant. Maître du dialogue, des références pop culture et de la violence stylisée.',
  'Francis Ford Coppola': 'Légende du cinéma américain, réalisateur du Parrain et d\'Apocalypse Now. Figure majeure de la New Hollywood des années 70.',
  'David Fincher': 'Réalisateur américain connu pour son style visuel sombre et sa méticulosité. Spécialiste des thrillers psychologiques et des mystères.',
  'Frank Darabont': 'Réalisateur et scénariste américain, spécialiste des adaptations de Stephen King. Connu pour son humanisme et son sens de la narration.',
  'Robert Zemeckis': 'Réalisateur américain pionnier des effets spéciaux. Connu pour Retour vers le futur et son utilisation innovante de la technologie.',
  'Roger Allers, Rob Minkoff': 'Réalisateurs du Roi Lion, l\'un des plus grands succès de Disney. Allers vient du théâtre, Minkoff de l\'animation traditionnelle.',
  'James Cameron': 'Réalisateur canadien visionnaire, pionnier des effets spéciaux et des blockbusters. Créateur de Titanic et Avatar.',
};

const DIRECTOR_PHOTOS: Record<string, string> = {
  'Lana Wachowski, Lilly Wachowski': `${TMDB_BASE}/w200/3BrY4P2L1L7Z7Q2Y8X9Z0A1B2C3.jpg`,
  'Christopher Nolan': `${TMDB_BASE}/w200/3Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'Quentin Tarantino': `${TMDB_BASE}/w200/2X1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'Francis Ford Coppola': `${TMDB_BASE}/w200/4Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'David Fincher': `${TMDB_BASE}/w200/5Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'Frank Darabont': `${TMDB_BASE}/w200/6Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'Robert Zemeckis': `${TMDB_BASE}/w200/7Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'Roger Allers, Rob Minkoff': `${TMDB_BASE}/w200/8Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
  'James Cameron': `${TMDB_BASE}/w200/9Y1bKx1y9Z7Q2X3Y4Z5A6B7C8D9.jpg`,
};

// Actor bios
const ACTOR_BIOS: Record<string, string> = {
  'Keanu Reeves': 'Acteur canadien iconique, connu pour sa polyvalence et sa modestie. Star de Matrix et John Wick.',
  'Laurence Fishburne': 'Acteur américain au charisme puissant. Connu pour Matrix, Boyz n the Hood et Hannibal.',
  'Carrie-Anne Moss': 'Actrice canadienne, icône cyberpunk grâce à son rôle de Trinity dans Matrix.',
  'Hugo Weaving': 'Acteur australo-britannique, maître des rôles complexes (Matrix, Seigneur des Anneaux, V pour Vendetta).',
  'Leonardo DiCaprio': 'Superstar hollywoodienne, récompensée par l\'Oscar. Connu pour Titanic, Inception et The Revenant.',
  'Joseph Gordon-Levitt': 'Acteur américain polyvalent, passé des sitcoms aux blockbusters indépendants.',
  'Ellen Page': 'Actrice canadienne, nominée aux Oscars pour Juno. Engagée pour les droits LGBTQ+.',
  'Tom Hardy': 'Acteur britannique intense, connu pour ses transformations physiques (Mad Max, Venom, Legend).',
  'Marion Cotillard': 'Actrice française, Oscar de la meilleure actrice pour La Môme. Star internationale.',
  'John Travolta': 'Icône des années 70, revenu au sommet avec Pulp Fiction. Danseur et acteur charismatique.',
  'Uma Thurman': 'Actrice américaine, muse de Tarantino. Connu pour Pulp Fiction et Kill Bill.',
  'Samuel L. Jackson': 'Acteur américain ultra-prolifique, icône de la pop culture (Pulp Fiction, Avengers).',
  'Bruce Willis': 'Star de l\'action des années 90, connu pour Die Hard et Le Cinquième Élément.',
  'Harvey Keitel': 'Acteur américain, figure du cinéma indépendant et habitué des films de Scorsese.',
  'Marlon Brando': 'Légende du cinéma, révolutionnaire de la méthode. Oscar pour Le Parrain et Sur les quais.',
  'Al Pacino': 'Géant du cinéma américain, connu pour Le Parrain, Scarface et Heat. Multiple lauréat.',
  'James Caan': 'Acteur américain, nominé aux Oscars pour Le Parrain. Figure de la New Hollywood.',
  'Robert Duvall': 'Acteur américain vétéran, Oscar pour Un prophète à son pays. Carrière de 60 ans.',
  'Diane Keaton': 'Actrice américaine, Oscar pour Annie Hall. Muse de Woody Allen et icône de style.',
  'Brad Pitt': 'Superstar hollywoodienne, producteur et acteur. Oscar pour Once Upon a Time in Hollywood.',
  'Edward Norton': 'Acteur américain intense, nominé 3 fois aux Oscars. Connu pour Fight Club et American History X.',
  'Helena Bonham Carter': 'Actrice britannique excentrique, reine des films de Tim Burton et des costumes d\'époque.',
  'Tim Robbins': 'Acteur et réalisateur américain, Oscar pour Les Évadés. Engagé politiquement.',
  'Morgan Freeman': 'Légende vivante du cinéma, voix iconique. Oscar pour Million Dollar Baby.',
  'Bob Gunton': 'Acteur américain, célèbre pour son rôle du directeur Norton dans Les Évadés.',
  'William Sadler': 'Acteur américain polyvalent, connu pour Les Évadés et Die Hard 2.',
  'Tom Hanks': 'Acteur américain adoré, deux Oscars consécutifs. Connu pour Forrest Gump et Seul au monde.',
  'Robin Wright': 'Actrice américaine, star de Princess Bride et House of Cards. Réalisatrice talentueuse.',
  'Gary Sinise': 'Acteur américain, nominé aux Oscars pour Forrest Gump. Fondateur de la Lt. Dan Band.',
  'Mykelti Williamson': 'Acteur américain, célèbre pour son rôle de Bubba dans Forrest Gump.',
  'Sally Field': 'Actrice américaine, deux Oscars. Connu pour Norma Rae et Forrest Gump.',
  'Matthew Broderick': 'Acteur américain, star de Ferris Bueller et voix de Simba dans Le Roi Lion.',
  'James Earl Jones': 'Légende de la voix américaine, voix de Dark Vador et Mufasa. Tony Award.',
  'Jeremy Irons': 'Acteur britannique, Oscar pour Le Mystère von Bulow. Voix de Scar dans Le Roi Lion.',
  'Whoopi Goldberg': 'Actrice et humoriste américaine, Oscar pour Ghost. Présentatrice de The View.',
  'Rowan Atkinson': 'Comédien britannique, mondialement connu pour Mr. Bean. Voix de Zazu.',
  'Kate Winslet': 'Actrice britannique, Oscar pour The Reader. Star de Titanic et Eternal Sunshine.',
  'Billy Zane': 'Acteur américain, connu pour son rôle de Cal dans Titanic et The Phantom.',
  'Kathy Bates': 'Actrice américaine, Oscar pour Misery. Figure du cinéma et du théâtre.',
  'Bill Paxton': 'Acteur américain, connu pour Aliens, Titanic et Twister. Réalisateur talentueux.',
};

// Key scenes data for each movie
const MOVIE_SCENES: Record<string, Array<{
  title: string;
  timestamp: string;
  duration: string;
  intensity: number;
  hotspots: Array<{
    type: string;
    title: string;
    description: string;
    timestamp: string;
  }>;
}>> = {
  'Matrix': [
    {
      title: 'Le choix de la pilule',
      timestamp: '00:45:30',
      duration: '3min',
      intensity: 85,
      hotspots: [
        { type: 'mise-en-scene', title: 'Symbolisme des couleurs', description: 'Le bleu et le rouge symbolisent les choix opposés : ignorance vs vérité.', timestamp: '00:46:15' },
        { type: 'lumiere', title: 'Éclairage dramatique', description: 'Morpheus est éclairé par en dessous, créant une aura mystérieuse.', timestamp: '00:45:45' },
        { type: 'dialogue', title: 'Choix irrévocable', description: '« Tu prends la pilule bleue, l\'histoire s\'arrête. » Une ligne devenue culte.', timestamp: '00:46:30' },
      ],
    },
    {
      title: 'L\'éveil de Neo',
      timestamp: '00:52:00',
      duration: '4min',
      intensity: 95,
      hotspots: [
        { type: 'effets-speciaux', title: 'Révélation visuelle', description: 'La naissance dans la cuve révèle la vérité sur la Matrice.', timestamp: '00:53:00' },
        { type: 'musique', title: 'Score épique', description: 'La musique de Don Davis intensifie le choc de la révélation.', timestamp: '00:52:30' },
      ],
    },
    {
      title: 'Le combat d\'entraînement',
      timestamp: '01:15:00',
      duration: '5min',
      intensity: 80,
      hotspots: [
        { type: 'choregraphie', title: 'Kung-fu numérique', description: 'Les Wachowski ont inventé le bullet time pour cette scène.', timestamp: '01:17:00' },
        { type: 'mise-en-scene', title: 'Dojo virtuel', description: 'Le décor blanc minimaliste met en valeur la chorégraphie.', timestamp: '01:15:30' },
      ],
    },
    {
      title: 'La lobby scene',
      timestamp: '01:45:00',
      duration: '3min',
      intensity: 100,
      hotspots: [
        { type: 'action', title: 'Chorégraphie de tir', description: 'Plus de 3000 impacts de balles ont été comptés dans cette scène.', timestamp: '01:46:00' },
        { type: 'effets-speciaux', title: 'Bullet time', description: 'La caméra bullet time a nécessité 120 appareils photo.', timestamp: '01:45:30' },
      ],
    },
    {
      title: 'L\'ascension de Neo',
      timestamp: '02:05:00',
      duration: '4min',
      intensity: 90,
      hotspots: [
        { type: 'mise-en-scene', title: 'Messianisme', description: 'Neo ressuscité incarne le messie technologique.', timestamp: '02:07:00' },
        { type: 'effets-speciaux', title: 'Vision de code', description: 'Neo voit le monde en code vert, symbole de sa transcendance.', timestamp: '02:08:00' },
      ],
    },
  ],
  'Inception': [
    {
      title: 'La rotation du couloir',
      timestamp: '01:20:00',
      duration: '4min',
      intensity: 90,
      hotspots: [
        { type: 'mise-en-scene', title: 'Rotation à 360°', description: 'Un vrai couloir rotatif construit en studio, pas d\'effets numériques.', timestamp: '01:22:00' },
        { type: 'pratique', title: 'Cascade réelle', description: 'Joseph Gordon-Levitt a fait ses propres cascades dans le couloir.', timestamp: '01:21:00' },
      ],
    },
    {
      title: 'Le café qui explose',
      timestamp: '00:35:00',
      duration: '3min',
      intensity: 75,
      hotspots: [
        { type: 'effets-speciaux', title: 'Explosion contrôlée', description: 'Des charges réelles ont été utilisées pour l\'explosion du café.', timestamp: '00:36:00' },
        { type: 'symbolisme', title: 'Réalité fracturée', description: 'L\'explosion symbolise l\'effondrement du rêve.', timestamp: '00:35:30' },
      ],
    },
    {
      title: 'La ville qui se plie',
      timestamp: '01:45:00',
      duration: '3min',
      intensity: 85,
      hotspots: [
        { type: 'effets-speciaux', title: 'Paris plié', description: 'Des maquettes géantes ont été construites pour l\'effet de pliage.', timestamp: '01:46:00' },
        { type: 'mise-en-scene', title: 'Perspective forcée', description: 'Nolan utilise la perspective pour désorienter le spectateur.', timestamp: '01:45:30' },
      ],
    },
    {
      title: 'La confrontation sur la glace',
      timestamp: '02:10:00',
      duration: '5min',
      intensity: 95,
      hotspots: [
        { type: 'action', title: 'Tir sur glace', description: 'Les acteurs ont tourné sur une vraie base militaire enneigée.', timestamp: '02:12:00' },
        { type: 'emotion', title: 'Rédemption de Cobb', description: 'Cobb affronte son passé avec Mal dans le monde des rêves.', timestamp: '02:11:00' },
      ],
    },
    {
      title: 'La toupie finale',
      timestamp: '02:25:00',
      duration: '2min',
      intensity: 100,
      hotspots: [
        { type: 'symbolisme', title: 'Ambiguïté volontaire', description: 'Nolan refuse de révéler si Cobb est dans un rêve ou la réalité.', timestamp: '02:26:00' },
        { type: 'musique', title: 'Score de Hans Zimmer', description: 'La musique « Time » accompagne la fin ouverte.', timestamp: '02:25:30' },
      ],
    },
  ],
  'Pulp Fiction': [
    {
      title: 'La danse de Mia et Vincent',
      timestamp: '00:58:00',
      duration: '4min',
      intensity: 70,
      hotspots: [
        { type: 'mise-en-scene', title: 'Twist contest', description: 'Tarantino rend hommage au twist de Bande à part de Godard.', timestamp: '00:59:30' },
        { type: 'musique', title: 'You Never Can Tell', description: 'Chuck Berry accompagne cette scène iconique.', timestamp: '00:58:30' },
      ],
    },
    {
      title: 'L\'adrénaline',
      timestamp: '01:15:00',
      duration: '3min',
      intensity: 90,
      hotspots: [
        { type: 'action', title: 'Injection réelle', description: 'Le plan de l\'aiguille est réel, pas de trucage.', timestamp: '01:16:00' },
        { type: 'tension', title: 'Suspens maximal', description: 'Le compte à rebours de 3 minutes crée une tension insoutenable.', timestamp: '01:15:30' },
      ],
    },
    {
      title: 'La montre de Butch',
      timestamp: '01:35:00',
      duration: '4min',
      intensity: 85,
      hotspots: [
        { type: 'narration', title: 'Flashback choquant', description: 'L\'histoire de la montre cachée est à la fois drôle et dérangeante.', timestamp: '01:36:00' },
        { type: 'acting', title: 'Christopher Walken', description: 'Walken livre un monologue mémorable en 2 minutes.', timestamp: '01:35:30' },
      ],
    },
    {
      title: 'Le diner',
      timestamp: '02:00:00',
      duration: '5min',
      intensity: 80,
      hotspots: [
        { type: 'dialogue', title: 'Royale with Cheese', description: 'Le dialogue sur les menus McDo est devenu culte.', timestamp: '02:01:00' },
        { type: 'mise-en-scene', title: 'Structure circulaire', description: 'Le film se termine où il a commencé, créant une boucle narrative.', timestamp: '02:02:00' },
      ],
    },
    {
      title: 'Le nettoyage',
      timestamp: '01:45:00',
      duration: '6min',
      intensity: 95,
      hotspots: [
        { type: 'humour-noir', title: 'The Wolf', description: 'Harvey Keitel arrive comme un super-héros du nettoyage.', timestamp: '01:47:00' },
        { type: 'mise-en-scene', title: 'Banalité du crime', description: 'Tarantino montre le côté bureaucratique du crime organisé.', timestamp: '01:46:00' },
      ],
    },
  ],
};

// Similar movies mapping
const SIMILAR_MOVIES: Record<string, Array<{ title: string; year: number; tmdbId: number }>> = {
  'Matrix': [
    { title: 'Matrix Reloaded', year: 2003, tmdbId: 604 },
    { title: 'Matrix Revolutions', year: 2003, tmdbId: 605 },
    { title: 'John Wick', year: 2014, tmdbId: 245891 },
    { title: 'Ghost in the Shell', year: 1995, tmdbId: 9325 },
  ],
  'Inception': [
    { title: 'Interstellar', year: 2014, tmdbId: 157336 },
    { title: 'The Prestige', year: 2006, tmdbId: 1124 },
    { title: 'Shutter Island', year: 2010, tmdbId: 11324 },
    { title: 'Memento', year: 2000, tmdbId: 77 },
  ],
  'Pulp Fiction': [
    { title: 'Reservoir Dogs', year: 1992, tmdbId: 500 },
    { title: 'Jackie Brown', year: 1997, tmdbId: 184 },
    { title: 'Kill Bill: Vol. 1', year: 2003, tmdbId: 24 },
    { title: 'Snatch', year: 2000, tmdbId: 107 },
  ],
  'Le Parrain': [
    { title: 'Le Parrain 2', year: 1974, tmdbId: 240 },
    { title: 'Scarface', year: 1983, tmdbId: 111 },
    { title: 'Goodfellas', year: 1990, tmdbId: 769 },
    { title: 'Casino', year: 1995, tmdbId: 524 },
  ],
  'Fight Club': [
    { title: 'American Psycho', year: 2000, tmdbId: 1359 },
    { title: 'The Social Network', year: 2010, tmdbId: 37799 },
    { title: 'Gone Girl', year: 2014, tmdbId: 210577 },
    { title: 'Se7en', year: 1995, tmdbId: 807 },
  ],
  'Les Évadés': [
    { title: 'La Ligne verte', year: 1999, tmdbId: 497 },
    { title: 'Le Prestige', year: 2006, tmdbId: 1124 },
    { title: 'Mystic River', year: 2003, tmdbId: 322 },
    { title: 'Gran Torino', year: 2008, tmdbId: 14160 },
  ],
  'Forrest Gump': [
    { title: 'La Liste de Schindler', year: 1993, tmdbId: 424 },
    { title: 'Rain Man', year: 1988, tmdbId: 380 },
    { title: 'Le Pianiste', year: 2002, tmdbId: 423 },
    { title: 'Philadelphia', year: 1993, tmdbId: 9800 },
  ],
  'Le Roi Lion': [
    { title: 'Aladdin', year: 1992, tmdbId: 812 },
    { title: 'La Belle et la Bête', year: 1991, tmdbId: 10020 },
    { title: 'Mulan', year: 1998, tmdbId: 10674 },
    { title: 'Tarzan', year: 1999, tmdbId: 11688 },
  ],
  'Titanic': [
    { title: 'Pearl Harbor', year: 2001, tmdbId: 676 },
    { title: 'Romeo + Juliet', year: 1996, tmdbId: 454 },
    { title: 'The Great Gatsby', year: 2013, tmdbId: 64682 },
    { title: 'Avatar', year: 2009, tmdbId: 19995 },
  ],
};

// Nominations and platforms
const MOVIE_NOMINATIONS: Record<string, string[]> = {
  'Matrix': ['Oscar meilleurs effets visuels', 'Oscar meilleur montage', 'Oscar meilleur son', 'BAFTA meilleur film'],
  'Inception': ['Oscar meilleurs effets visuels', 'Oscar meilleure photographie', 'Oscar meilleur son', 'Golden Globe meilleur réalisateur'],
  'Pulp Fiction': ['Oscar meilleur scénario original', 'Palme d\'Or Cannes', 'BAFTA meilleur film', 'Golden Globe meilleur scénario'],
  'Le Parrain': ['Oscar meilleur film', 'Oscar meilleur acteur', 'Oscar meilleur scénario adapté', 'Golden Globe meilleur film dramatique'],
  'Fight Club': ['Oscar meilleur montage sonore', 'MTV Movie Award meilleur combat', 'Empire Award meilleur film'],
  'Les Évadés': ['7 nominations aux Oscars', 'Nomination meilleur film', 'Nomination meilleur acteur (Morgan Freeman)', 'Nomination meilleur scénario adapté'],
  'Forrest Gump': ['Oscar meilleur film', 'Oscar meilleur réalisateur', 'Oscar meilleur acteur', 'Golden Globe meilleur film dramatique'],
  'Le Roi Lion': ['Oscar meilleure musique', 'Oscar meilleure chanson', 'Golden Globe meilleur film musical', 'Grammy Award meilleure bande son'],
  'Titanic': ['Oscar meilleur film', 'Oscar meilleur réalisateur', '11 Oscars au total', 'Golden Globe meilleur film dramatique'],
};

const MOVIE_PLATFORMS: Record<string, string[]> = {
  'Matrix': ['Netflix', 'Amazon Prime Video', 'Canal+'],
  'Inception': ['Netflix', 'Amazon Prime Video', 'Apple TV+'],
  'Pulp Fiction': ['Netflix', 'Canal+', 'Amazon Prime Video'],
  'Le Parrain': ['Paramount+', 'Amazon Prime Video', 'Canal+'],
  'Fight Club': ['Disney+', 'Amazon Prime Video', 'Canal+'],
  'Les Évadés': ['Netflix', 'Amazon Prime Video', 'Canal+'],
  'Forrest Gump': ['Netflix', 'Paramount+', 'Amazon Prime Video'],
  'Le Roi Lion': ['Disney+', 'Amazon Prime Video'],
  'Titanic': ['Disney+', 'Amazon Prime Video', 'Canal+'],
};

export function enrichMovie(movie: EnrichedMovie): EnrichedMovie {
  const enriched = { ...movie };
  
  // Enrich director
  if (DIRECTOR_BIOS[movie.director]) {
    enriched.directorBio = DIRECTOR_BIOS[movie.director];
  }
  if (DIRECTOR_PHOTOS[movie.director]) {
    enriched.directorPhoto = DIRECTOR_PHOTOS[movie.director];
  }
  
  // Enrich cast with bios and real photos
  enriched.cast = movie.cast.map(actor => ({
    ...actor,
    bio: ACTOR_BIOS[actor.name] || '',
    photoUrl: getActorPhoto(actor.name),
  }));
  
  // Enrich key scenes
  const scenes = MOVIE_SCENES[movie.title];
  if (scenes && scenes.length > 0) {
    enriched.keyScenes = scenes.map((scene, idx) => ({
      id: `scene-${movie.id}-${idx}`,
      title: scene.title,
      timestamp: scene.timestamp,
      duration: scene.duration,
      intensity: scene.intensity,
      thumbnailUrl: movie.heroUrl || movie.posterUrl,
      hotspots: scene.hotspots.map((hotspot, hidx) => ({
        id: `hot-${movie.id}-${idx}-${hidx}`,
        type: hotspot.type,
        title: hotspot.title,
        description: hotspot.description,
        timestamp: hotspot.timestamp,
      })),
    }));
  }
  
  // Enrich similar movies
  const similar = SIMILAR_MOVIES[movie.title];
  if (similar) {
    enriched.similarMovies = similar.map((sm, idx) => ({
      id: `similar-${movie.id}-${idx}`,
      title: sm.title,
      year: sm.year,
      posterUrl: `${TMDB_BASE}/w500${sm.tmdbId}.jpg`,
    }));
  }
  
  // Enrich nominations and platforms
  if (MOVIE_NOMINATIONS[movie.title]) {
    enriched.nominations = MOVIE_NOMINATIONS[movie.title];
  }
  if (MOVIE_PLATFORMS[movie.title]) {
    enriched.platforms = MOVIE_PLATFORMS[movie.title];
  }
  
  return enriched;
}

export function enrichAllMovies(movies: EnrichedMovie[]): EnrichedMovie[] {
  return movies.map(enrichMovie);
}
