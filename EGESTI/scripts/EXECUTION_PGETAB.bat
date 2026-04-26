@echo off
echo Lancement du serveur PGETAB...
start "Serveur PGETAB" /d "C:\Program Files (x86)\PGETAB\serveur" "start.bat"

echo.
echo Attente de 15 secondes (initialisation du serveur)...
timeout /t 15 /nobreak

echo Lancement du client PGETAB...
start "Client PGETAB" /d "C:\Program Files (x86)\PGETAB\client" "start.bat"

echo.
echo PGETAB lance.
pause