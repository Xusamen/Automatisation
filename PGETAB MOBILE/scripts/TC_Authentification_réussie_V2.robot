*** Settings ***
Documentation    Suite generee automatiquement via Robot Bridge
Library          SikuliLibrary
Library          OperatingSystem
Library          Process

Resource         ../resources/gherkin.resource

*** Variables ***
${IMAGES_DIR}    ${CURDIR}/../images

*** Test Cases ***
Authentification réussie
    Démarrer l'environnement de test
    je lance l'application AUTOGES
    je saisis "${texte}" sur l'image "${nom_image}"    Dev    champ_poste
    je saisis "${texte}" sur l'image "${nom_image}"    souris    champ_mot_de_passe
    je clique sur le bouton "${nom_bouton}"    bouton_connexion
    l'image "${nom_icone}" doit être visible    icone
