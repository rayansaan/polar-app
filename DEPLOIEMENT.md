# 🚀 Déploiement de l'Import Automatique TMDB

## Architecture

Cette solution utilise une **Supabase Edge Function** pour importer automatiquement les films depuis TMDB :

```
Frontend (React) <-- HTTP --> Supabase Edge Function <-- API --> TMDB
                                    |
                                    v
                              Supabase Database
```

## ✅ Avantages

- **Future-proof** : Peut être relancé à tout moment sans doublons
- **Idempotent** : Détecte les films existants et les met à jour
- **Sécurisé** : Clé API TMDB cachée côté serveur
- **Automatique** : Bouton dans l'interface admin

---

## 📋 Prérequis

- [ ] Compte Supabase avec votre projet
- [ ] CLI Supabase installée (`npm install -g supabase`)
- [ ] Clé API TMDB (déjà configurée dans `.env`)
- [ ] Accès au Service Role Key de Supabase

---

## 🔧 Configuration des Secrets

### 1. Récupérer votre Service Role Key

1. Allez sur [Supabase Dashboard](https://app.supabase.com)
2. Sélectionnez votre projet
3. Allez dans **Project Settings** → **API**
4. Copiez la clé **service_role** (⚠️ Ne la partagez jamais !)

### 2. Configurer les secrets de la Edge Function

Dans votre terminal :

```bash
# Se connecter à Supabase
supabase login

# Lier votre projet
supabase link --project-ref pqyqdvpncpohelzdfdop

# Définir les secrets
supabase secrets set TMDB_API_KEY=106f51e20c9abaeec709f99ad73c7991
supabase secrets set SUPABASE_URL=https://pqyqdvpncpohelzdfdop.supabase.co
supabase secrets set SUPABASE_SERVICE_ROLE_KEY=votre_service_role_key_ici
```

---

## 🚀 Déploiement

### Méthode 1 : Via CLI (Recommandé)

```bash
# Déployer la fonction
supabase functions deploy import-movies

# Vérifier le déploiement
supabase functions list
```

### Méthode 2 : Via Dashboard

1. Allez sur [Supabase Dashboard](https://app.supabase.com)
2. Cliquez sur **Edge Functions** dans le menu
3. Cliquez sur **New Function**
4. Nommez-la `import-movies`
5. Copiez le contenu de `supabase/functions/import-movies/index.ts`
6. Cliquez sur **Deploy**

---

## 🧪 Test

### 1. Vérifier la fonction

```bash
# Tester la fonction
curl -X POST https://pqyqdvpncpohelzdfdop.supabase.co/functions/v1/import-movies \
  -H "Authorization: Bearer votre_anon_key" \
  -H "Content-Type: application/json" \
  -d '{"count": 5, "updateExisting": true}'
```

### 2. Utiliser l'interface

1. Lancez votre app : `npm run dev`
2. Allez sur `/admin`
3. Utilisez la section **"Import Automatique TMDB"**
4. Choisissez le nombre de films (défaut: 50)
5. Cochez/décochez "Mettre à jour les films existants"
6. Cliquez sur **"Lancer l'import"**

---

## 📊 Fonctionnalités

### Filtres appliqués automatiquement

- ✅ Films déjà sortis (année ≤ 2025)
- ✅ Popularité minimale (> 10)
- ✅ Pas de doublons (détection par tmdb_id)

### Statuts possibles

| Statut | Description |
|--------|-------------|
| ✅ Importé | Nouveau film ajouté |
| 🔄 Mis à jour | Film existant rafraîchi |
| ⏭️ Ignoré | Film existant non mis à jour |
| ❌ Échoué | Erreur lors du traitement |

---

## 🔄 Mise à jour régulière

Pour importer les nouveaux films populaires :

1. Allez sur `/admin`
2. Lancez l'import avec "Mettre à jour les films existants" ✅
3. Les films déjà présents seront rafraîchis, les nouveaux seront ajoutés

---

## 🛠️ Dépannage

### "Function not found"
→ Vérifiez que la fonction est bien déployée : `supabase functions list`

### "Missing environment variables"
→ Vérifiez les secrets : `supabase secrets list`

### "Failed to fetch"
→ Vérifiez votre connexion internet et la clé TMDB

### "CORS error"
→ La fonction est bien configurée avec les headers CORS

---

## 📁 Fichiers créés

- `supabase/functions/import-movies/index.ts` - La Edge Function
- `src/services/import.ts` - Service frontend
- `src/screens/AdminScreen.tsx` - Interface (modifié)

---

## 🎉 Résultat

Après déploiement, votre app aura :
- ✅ Un bouton d'import automatique dans `/admin`
- ✅ La possibilité d'importer 50 films en un clic
- ✅ La détection des doublons
- ✅ La mise à jour des films existants
- ✅ Un tableau de bord avec les résultats

**Votre app est maintenant future-proof !** 🚀
