@echo off
setlocal

REM 1. Aller dans le dossier du script
cd /d %~dp0
cd ..
REM Dossier du site Hugo généré
set SITE_DIR=..\balades-parisiennes-code

REM Aller dans le dossier du code
cd %SITE_DIR%

REM Ajouter tous les fichiers modifiés
git add .

REM Demander le message de commit
set /p COMMENT=Entrez le message du commit : 

REM Commit avec le message saisi
git commit -m "%COMMENT%"

REM Push vers le dépôt distant
git push

REM Revenir au dossier initial
cd -

endlocal
pause