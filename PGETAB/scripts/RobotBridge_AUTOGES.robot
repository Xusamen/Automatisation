*** Settings ***
Resource          gherkin.resource

Test Setup        Demarrer l'environnement de test
Test Teardown     Stop Remote Server

*** Test Cases ***
Authentification réussie
    [Documentation]    AUTOGES AUTH

    Given je lance l'application AUTOGES
    When je saisis "Dev" sur l'image "champ_poste"
    And je saisis "souris" sur l'image "champ_mot_de_passe"
    And je clique sur le bouton "bouton_connexion"
    Then l'image "icone" doit être visible
