@echo off
SETLOCAL ENABLEEXTENSIONS

REM 1. Aller dans le dossier du script
cd /d %~dp0
cd ..

REM 2. Définir les chemins
set SITE_DIR=..\balades-parisiennes-site
set HUGO_CMD=hugo

echo ===================================
echo 📦 Suppression du contenu de %SITE_DIR%
echo (sauf le dossier .git)
echo ===================================

REM 3. Supprimer tous les fichiers et dossiers sauf .git
for /D %%G in ("%SITE_DIR%\*") do (
    if /I not "%%~nxG"==".git" (
        echo Supprime dossier: %%G
        rmdir /S /Q "%%G"
    )
)

for %%F in ("%SITE_DIR%\*") do (
    if /I not "%%~nxF"==".git" (
        echo Supprime fichier: %%F
        del /F /Q "%%F"
    )
)

echo ===================================
echo ⚙️ Génération du site avec Hugo
echo ===================================
%HUGO_CMD% --destination %SITE_DIR%

IF ERRORLEVEL 1 (
    echo ❌ Erreur lors de la génération Hugo
    EXIT /B 1
)

echo ===================================
echo 🚀 Lancement du serveur Hugo local
echo ===================================
%HUGO_CMD% server

ENDLOCAL