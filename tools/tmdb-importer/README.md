# 🎬 Importateur TMDB pour Polar

## Installation rapide

```bash
cd tools/tmdb-importer
npm install
```

## Configuration

Créez un fichier `.env` dans ce dossier :

```env
SUPABASE_SERVICE_ROLE_KEY=votre_clé_service_role_ici
```

> 💡 **Où trouver la clé ?** 
> Supabase Dashboard → Project Settings → API → service_role key

## Utilisation

```bash
# Importer 50 films (défaut)
node importer.js

# Importer 100 films
node importer.js 100

# Mettre à jour les films existants
node importer.js 50 --update
```

## Fonctionnalités

- ✅ Importe les films populaires depuis TMDB
- ✅ Récupère posters, synopsis, casting, notes
- ✅ Détecte les doublons (par TMDB ID)
- ✅ Filtre les films non sortis
- ✅ Idempotent (peut être relancé sans risque)

## Filtres appliqués

- Films déjà sortis (année ≤ 2025)
- Popularité minimale
- Pas de doublons

## Dépendances

- `@supabase/supabase-js` : Connexion à la base
- `axios` : Appels API TMDB

---

**Besoin d'aide ?** Vérifiez que :
1. Votre clé Service Role est valide
2. Les tables existent dans Supabase
3. Vous avez une connexion Internet
