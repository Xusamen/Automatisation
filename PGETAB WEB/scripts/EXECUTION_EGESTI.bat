@echo off
echo Lancement du serveur EGESTI...
start "Serveur EGESTI" /d "C:\Program Files (x86)\EGESTI\serveur" "start.bat"

echo.
echo Attente de 15 secondes (initialisation du serveur)...
timeout /t 15 /nobreak

echo Lancement du client EGESTI...
start "Client EGESTI" /d "C:\Program Files (x86)\EGESTI\client" "start.bat"

echo.
echo EGESTI lance.
pause