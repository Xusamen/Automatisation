*** Settings ***
Resource          EGESTI/EGESTI_V2.resource

Test Setup        Demarrer l'environnement de test
Test Teardown     Stop Remote Server

*** Test Cases ***
Authentification réussie
    [Documentation]    AUTOGES Scripting gestion des Erreurs

    Given je lance l'application autoges
    When je saisis "Dev" sur l'image "champ_poste"
    And je saisis "souris" sur l'image "champ_mot_de_passe"
    And je clique sur le bouton "bouton_connexion"
    Then l'image "icone" doit etre visible
