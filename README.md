# Polar App

Application React Native (Expo) pour les amateurs de films policiers, thrillers et noirs.

## Phase 1 - MovieDetail + Watchlist + Notation

### Fonctionnalités ajoutées

- **MovieDetail enrichi**
  - Bouton Favoris ❤️
  - Bouton Watchlist 📋 (À voir / En cours / Vu)
  - Notation utilisateur ⭐ (1-10 étoiles)
  - Films similaires (basé sur genres, réalisateur, keywords)
  - Casting enrichi avec filmographie

- **Watchlist**
  - Ajout/retrait de films
  - Statuts : À voir / En cours / Vu
  - Section dédiée dans le profil

- **Notation**
  - Notation 1-10 étoiles
  - Affichage dans MovieDetail
  - Stats dans le profil

## Configuration Supabase

Exécutez le fichier `supabase/migrations/001_watchlist_ratings.sql` dans votre SQL Editor Supabase.

Tables créées :
- `watchlist` - Films à voir
- `ratings` - Notations utilisateur

## Démarrage

```bash
npm install
npx expo start
```

## Phases de développement

- ✅ **Phase 1** : MovieDetail + Watchlist + Notation
- **Phase 2** : Annotations vidéo sur scènes
- **Phase 3** : Recommandations personnalisées
- **Phase 4** : Mode hors-ligne
- **Phase 5** : Thème sombre/clair
- **Phase 6** : Partage social
- **Phase 7** : Notifications push
- **Phase 8** : Commentaires communautaires
- **Phase 9** : Gamification
