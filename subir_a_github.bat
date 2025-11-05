@echo off
set /p repo_url=Introduce la URL del repositorio GitHub: 

REM Inicializa el repositorio si no existe
if not exist .git (
    git init
)

REM Crear o actualizar .gitignore para ignorar todos los .bat
if not exist .gitignore (
    echo *.bat>.gitignore
) else (
    findstr /C:"*.bat" .gitignore >nul || echo *.bat>>.gitignore
)

git add .
git commit -m "primer commit"
git branch -M main

git remote remove origin 2>nul
git remote add origin %repo_url%
git push -u origin main

pause
