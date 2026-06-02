*** Settings ***
Library    DatabaseLibrary
Library    Collections

*** Variables ***
# À surcharger via --variable en ligne de commande ou fichier de config
${DB_HOST}        localhost
${DB_PORT}        3306
${DB_NAME}        pgetab
${DB_USER}        root
${DB_PASSWORD}    %{DB_PASSWORD}    # lu depuis variable d'environnement


*** Keywords ***

connexion base de donnees
    [Documentation]    Ouvre la connexion SQL Server via pyodbc
    Connect To Database Using Custom Params
    ...    pyodbc
    ...    driver={ODBC Driver 18 for SQL Server};Server=${DB_HOST},${DB_PORT};Database=${DB_NAME};UID=${DB_USER};PWD=${DB_PASSWORD};TrustServerCertificate=yes

deconnexion base De donnees
    [Documentation]    Ferme proprement la connexion SQL Server
    Disconnect From Database

exporter donnees traitees
    [Documentation]
    ...    Exécute la requête SQL du cas de test et retourne les résultats bruts.
    ...    Retourne un tuple (resultats, colonnes) pour la construction du JSON obtenu.
    [Arguments]    ${export_sql}
    ${query}=        Get From Dictionary    ${export_sql}    query
    ${resultats}=    Query    ${query}
    # Extraire les noms de colonnes depuis la description du curseur
    ${description}=    Execute SQL String    ${query}
    RETURN    ${resultats}

construction du json obtenu
    [Documentation]
    ...    Keyword de haut niveau : exécute le SQL et construit le JSON obtenu
    ...    via ErpTestLibrary. Centralise la logique d'export pour tous les tests.
    [Arguments]    ${cas}    ${colonnes}
    ${export_sql}=      Get From Dictionary    ${cas}    export_sql
    ${query}=           Get From Dictionary    ${export_sql}    query
    ${resultats}=       Query    ${query}
    ${json_obtenu}=     Construire Json Obtenu    ${resultats}    ${colonnes}
    RETURN            ${json_obtenu}
