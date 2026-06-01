@echo off
chcp 65001 > nul
echo 🎬 Polar TMDB Importer
echo.
echo 📦 Installation des dépendances...
cd tools\tmdb-importer
npm install

echo.
echo 🚀 Import de 50 films...
node importer.js 50

echo.
echo ✅ Terminé !
echo Appuyez sur une touche pour fermer...
pause > nul
