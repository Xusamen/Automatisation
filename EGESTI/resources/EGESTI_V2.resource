*** Settings ***
Library         SikuliLibrary
Library         Process

*** Variables ***
${statut_global}    OK

*** Keywords ***
# --- Moteur de gestion des statuts (Interne) ---

_gestionnaire_etape
    [Arguments]    ${nom_technique}    @{arguments}
    # Si une étape précédente a échoué (KO), on bloque celle-ci
    IF    "${statut_global}" == "KO"
        Log    STATUS: BLOCKED | Etape: ${nom_technique}    WARN
        # On ne stoppe pas brutalement pour laisser les autres s'afficher en BLOCKED
        RETURN
    END

    # Exécution de l'étape technique
    ${status}    ${erreur} =    Run Keyword And Ignore Error    ${nom_technique}    @{arguments}

    IF    "${status}" == "PASS"
        Log    STATUS: OK | Etape: ${nom_technique}
    ELSE
        Set Global Variable    ${statut_global}    KO
        Log    STATUS: KO | Etape: ${nom_technique} | Erreur: ${erreur}    ERROR
        Fail    ${erreur}
    END

# --- Mots-clés Métier (Gherkin - Sans accents/majuscules) ---

je_lance_l_application_autoges
    _gestionnaire_etape    app_lancer_technique

je_saisis_sur_l_image
    [Arguments]    ${texte}    ${nom_image}
    _gestionnaire_etape    saisir_donnee_technique    ${nom_image}    ${texte}

je_clique_sur_le_bouton
    [Arguments]    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton_technique    ${nom_bouton}

l_image_doit_etre_visible
    [Arguments]    ${nom_icone}
    _gestionnaire_etape    verifier_visibilite_technique    ${nom_icone}

# --- Mots-clés Techniques (Action réelle) ---

app_lancer_technique
    Start Process    AUTO-ECOLE-SCHEDULER.exe
    Wait Until Screen Contain    bouton_connexion.png    20

saisir_donnee_technique
    [Arguments]    ${image}    ${valeur}
    Click    ${image}.png
    Input Text    ${image}.png    ${valeur}

cliquer_bouton_technique
    [Arguments]    ${bouton}
    Click    ${bouton}.png

verifier_visibilite_technique
    [Arguments]    ${icone}
    Wait Until Screen Contain    ${icone}.png    10