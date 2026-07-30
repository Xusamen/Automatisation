*** Settings ***
Library          OperatingSystem
Library          SikuliLibrary

*** Keywords ***
init env and start
    [Documentation]    Purge les processus Java/Sikuli fantômes puis démarre le serveur propre.
    Run Keyword And Ignore Error    Run    taskkill /F /IM java.exe /T
    Sleep    1s
    Start Sikuli Process

stop and clean env
    [Documentation]    Arrête le serveur Sikuli et libère les verrous sur les fichiers de log.
    Run Keyword And Ignore Error    Stop Remote Server
    Run Keyword And Ignore Error    Run    taskkill /F /IM java.exe /T