*** Settings ***
Library    SikuliLibrary
Suite Setup     Start Sikuli Process
Suite Teardown  Stop Sikuli Process

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Connexion Auto-Ecole Scheduler
    Add Image Path    ${IMAGE_PATH}
    
    # Puisque c'est dans le PATH, le nom seul suffit
    Launch Application    AUTO-ECOLE-SCHEDULER.exe
    
    # On attend que l'interface soit prête
    Wait Until Screen Contain    bouton_connexion.png    15
    
    # Remplissage des champs
    Click         champ_poste.png
    Input Text    champ_poste.png    Dev
    
    Click         champ_mot_de_passe.png
    Input Text    champ_mot_de_passe.png    souris
    
    # Validation
    Click    bouton_valider.png