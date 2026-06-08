*** Settings ***
Library    DatabaseLibrary
Library    Collections

*** Variables ***
${DB_HOST}        localhost
${DB_PORT}        3306
${DB_NAME}        pgetab
${DB_USER}        backup
${DB_PASSWORD}    Ba/12ck34567up89 
${DB_CHARSET}       utf8mb4
${DB_MODULE}        pymysql
${DB_TIMEOUT}       10
${SQL_TIMEOUT}      10

*** Keywords ***

connexion bd
    [Documentation]    Ouvre la connexion MySQL pgetab
    Connect To Database
    ...    pymysql
    ...    ${DB_NAME}
    ...    ${DB_USER}
    ...    ${DB_PASSWORD}
    ...    ${DB_HOST}
    ...    ${DB_PORT}
    Log    [CONNEXION BD] connexion réussie à bd pgetab

deconnexion bd
    [Documentation]    Ferme la connexion MySQL.
    Disconnect From Database
    Log    [DECONNEXION BD] deconnexion réussie

execution requete
    [Documentation]    Exécute une requête SELECT et retourne
    ...                les résultats sous forme de liste de dictionnaires.
    [Arguments]    ${query}
    ${resultats}=    Query    ${query}
    RETURN    ${resultats}

creation json
    [Documentation]    se charge de la creation du fichier json
    [Arguments]    ${requete}
    ${resultats}=     Query    ${requete}
    
