*** Settings ***
Resource          PGETAB/PGETAB.resource

Test Setup        Demarrer l'environnement de test
Test Teardown     Stop Remote Server

*** Test Cases ***
Saisie des identifiants de connexion
    [Documentation]    xxxxx

    Given je lance l'application egesti
    When je saisis "admin" sur l'image "champ_nom_utilisateur"
    And je saisis "admin" sur l'image "champ_mot_de_passe"
    Then je clique sur "bouton_login"
