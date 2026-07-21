*** Settings ***
Library    DatabaseLibrary
Library    Collections
Library    OperatingSystem
Library    Process
Library    ../libraries/GenerationJSON.py
Library    ../libraries/ComparaisonJSON.py

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


init bd
    [Documentation]    Réinitialise la base de données depuis le dump SQL.
    ${resultat}=    Run Process
    ...    mysql
    ...    -u${DB_USER}
    ...    -p${DB_PASSWORD}
    ...    --host\=${DB_HOST}
    ...    --port\=${DB_PORT}
    ...    ${DB_NAME}
    ...    -e    source ${CURDIR}/../piece_jointe/init_bd/CONFIG_BASE.sql
    Should Be Equal As Integers    ${resultat.rc}    0
    ...    msg= Erreur lors de l'initialisation de la BD : ${resultat.stderr}
    Log    Base de données réinitialisée    level=INFO

execution dump
    [Documentation]    Exécute un dump fourni en paramètre depuis le répertoire par défaut.
    [Arguments]        ${nom_fichier_dump}
    ${chemin_fichier} =    Set Variable    ${CURDIR}/../piece_jointe/init_bd/${nom_fichier_dump}
    ${resultat}=    Run Process
    ...    mysql
    ...    -u${DB_USER}
    ...    -p${DB_PASSWORD}
    ...    --host\=${DB_HOST}
    ...    --port\=${DB_PORT}
    ...    ${DB_NAME}
    ...    -e    source ${chemin_fichier}
    Should Be Equal As Integers    ${resultat.rc}    0
    ...    msg=Erreur execution dump ${nom_fichier_dump} : ${resultat.stderr}
    Log    Base de données réinitialisée avec le fichier : ${nom_fichier_dump}    level=INFO


execution requete
    [Documentation]    Exécute une requête SELECT et retourne
    ...                les résultats sous forme de liste de dictionnaires.
    [Arguments]    ${query}
    ${resultats}=    Query    ${query}
    RETURN    ${resultats}


generer resultat obtenu
    [Documentation]    Exécute la requête, sauvegarde le résultat en JSON
    ...                puis compare avec le fichier attendu.
    [Arguments]    ${requete}    ${fichier_obtenu}
    ${resultats}=       Execution Requete          ${requete}
    ${colonnes}=    Description    ${requete}
    Sauvegarder En Json    ${resultats}    ${colonnes}    ${fichier_obtenu}


comparer resultats
    [Documentation]    Compare le résultat obtenu avec le résultat attendu.
    [Arguments]    ${fichier_obtenu}    ${fichier_attendu}
    TRY
        Verifier Resultats    ${fichier_obtenu}    ${fichier_attendu}
        Log    PASS — Les données sont correctement enregistrées en base de données.    level=INFO
    EXCEPT    AS    ${erreur}
        Fail    FAIL — Les données ne correspondent pas à ce qui est attendu en BD.\n${erreur}
    END                                                                      