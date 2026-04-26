*** Settings ***
Library    SikuliLibrary
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Sikuli Process

*** Keywords ***
je lance l'application AUTOGES
    Launch Application    AUTO-ECOLE-SCHEDULER.exe
    Wait Until Screen Contain    bouton_connexion.png    15

je lance l'application EGESTI
    Start Process    C:\\EXECUTION_EGESTI.bat    shell=True
    Wait Until Screen Contain    bouton_connexion.png    15

je lance l'application PGETAB
    Start Process    C:\\EXECUTION_PGETAB.bat    shell=True
    Wait Until Screen Contain    bouton_connexion.png    15

je clique sur le bouton "${nom_bouton}"
    Click    ${nom_image}.png

je saisis "${texte}" sur l'image "${nom_image}"
    Input Text    ${nom_image}.png    ${texte}

l'image "${icone}" doit être visible
    Wait Until Screen Contain    ${icone}    5   

