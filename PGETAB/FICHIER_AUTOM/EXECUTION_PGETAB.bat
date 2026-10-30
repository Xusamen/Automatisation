@echo off
echo Lancement du serveur PGETAB...
start /min "Serveur PGETAB" /d "C:\Program Files (x86)\PGETAB\serveur" "start.bat"

echo.
echo Attente de 10 secondes (initialisation du serveur)...
timeout /t 10 /nobreak

echo Lancement du client PGETAB...
start /min "Client PGETAB" /d "C:\Program Files (x86)\PGETAB\client" "start.bat"

echo.
echo PGETAB lance.
exit