#!/bin/bash

# Script de déploiement de la Edge Function
# À exécuter dans le terminal

echo "🚀 Déploiement de l'Edge Function import-movies"
echo ""

# Vérifier si supabase CLI est installé
if ! command -v supabase &> /dev/null; then
    echo "❌ Supabase CLI n'est pas installé"
    echo "Installation : npm install -g supabase"
    exit 1
fi

# Se connecter à Supabase
echo "🔑 Connexion à Supabase..."
supabase login

# Lier le projet
echo "🔗 Lien avec le projet..."
supabase link --project-ref pqyqdvpncpohelzdfdop

# Configurer les secrets
echo "🔐 Configuration des secrets..."
supabase secrets set TMDB_API_KEY=106f51e20c9abaeec709f99ad73c7991
supabase secrets set SUPABASE_URL=https://pqyqdvpncpohelzdfdop.supabase.co
supabase secrets set SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFweXFkdnBuY3BvaGVsemRmZG9wIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTg4NzczNSwiZXhwIjoyMDg3NDYzNzM1fQ.KLt9wdzvfl4WKZtk_zJEXKEFtGw07nc8KUye2bov0TM

# Déployer la fonction
echo "📦 Déploiement de la fonction..."
supabase functions deploy import-movies

# Vérifier
echo ""
echo "✅ Déploiement terminé !"
echo ""
supabase functions list

echo ""
echo "🧪 Test de la fonction :"
echo "curl -X POST https://pqyqdvpncpohelzdfdop.supabase.co/functions/v1/import-movies \\"
echo "  -H \"Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...\" \\"
echo "  -H \"Content-Type: application/json\" \\"
echo "  -d '{\"count\": 5, \"updateExisting\": true}'"
