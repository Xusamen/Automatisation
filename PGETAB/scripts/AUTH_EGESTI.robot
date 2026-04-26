*** Settings ***
Documentation     Automatisation de l'authentification EGESTI avec SikuliLibrary.
Library           SikuliLibrary
Library           Process
Suite Setup       Start Sikuli Process
Suite Teardown    Stop Remote Server

*** Variables ***
${BASE_IMG}       C:/Users/DID/Documents/OpenTestFactory/images
${TIMEOUT}         30
#${IMG_LOGIN}     ${BASE_IMG}\\Login
#${IMG_Module_Achats}   ${BASE_IMG}\\Module_Achats
#${IMG_Module_Ventes}    ${BASE_IMG}\\Module_Ventes
#${IMG_Module_Comptabilite}    ${BASE_IMG}\\Module_Comptabilite
#${IMG_Module_Gestion_Adherants}    ${BASE_IMG}\\Module_Gestion_Adherants
#${IMG_Module_Gestion_Des_Roles}    ${BASE_IMG}\\Module_Gestion_Des_Roles
#${IMG_Module_Parametrage}    ${BASE_IMG}\\Module_Parametrage
#${IMG_Module_Personnel}    ${BASE_IMG}\\Module_Personnel
#${IMG_Module_Stocks}    ${BASE_IMG}\\Module_Stocks




*** Test Cases ***
AUTH EGESTI
    # Configuration du chemin des images
    Add Image Path    ${BASE_IMG}/Login

    Start Process    C:\\EXECUTION_EGESTI.bat    shell=True
    
    Wait Until Screen Contain    button_se_connecter.png    ${TIMEOUT}
    
    Wait Until Screen Contain    champ_nom_utilisateur.png    10
    Input Text    champ_nom_utilisateur.png    admin
    
    Sleep    5s

    Click         champ_mot_de_passe.png
    Input Text    ${EMPTY}    admin
    #Input Text    champ_mot_de_passe.png       admin
    
    Click         button_se_connecter.png