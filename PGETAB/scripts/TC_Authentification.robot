*** Settings ****
Library          OperatingSystem
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/utils-keywords.resource

Suite Setup     init env and start
Suite Teardown  stop and clean env

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images

*** Test Cases ***
Cas de test
    [Documentation]    Automatisation du cas de test  Authentification

    Given lance pgetab
    When saisis	admin	champ_nom_utilisateur
    And saisis	admin	champ_mot_de_passe
    And clique	bouton_login
    Then verification	icone
    And arrete pgetab
    #Modifier en ajoutant l'usage d'identifiant erroné
