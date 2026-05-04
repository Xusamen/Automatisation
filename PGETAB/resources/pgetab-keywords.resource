*** Settings ***
Library         SikuliLibrary
Library         Process

*** Variables ***
${statut_global}    OK
${module_actuel}    ${EMPTY}
${chemin_images_base}    ${CURDIR}${/}..${/}images

*** Keywords ***

# gestion des statuts
_gestionnaire_etape
    [Arguments]    ${nom_technique}    @{arguments}
    IF    "${statut_global}" == "KO"
        Log    STATUS: BLOCKED | Etape: ${nom_technique}    WARN
        RETURN
    END

    ${status}    ${erreur} =    Run Keyword And Ignore Error    ${nom_technique}    @{arguments}

    IF    "${status}" == "PASS"
        Log    STATUS: OK | Etape: ${nom_technique}
    ELSE
        Set Global Variable    ${statut_global}    KO
        Log    STATUS: KO | Etape: ${nom_technique} | Erreur: ${erreur}    ERROR
        Fail    ${erreur}
    END

#Keywords
lance pgetab
    _gestionnaire_etape    lancer_app

saisis
    [Arguments]    ${texte}    ${nom_image}
    _gestionnaire_etape    saisir_donnee    ${nom_image}    ${texte}

clique
    [Arguments]    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}

verification
    [Arguments]    ${nom_icone}
    _gestionnaire_etape    verifier_visibilite_technique    ${nom_icone}

selectionne le module
    [Arguments]    ${nom_module}
    _gestionnaire_etape    cliquer_bouton    ${nom_module}

selectionne le sous module
    [Arguments]    ${nom_sous_module}
    _gestionnaire_etape    cliquer_bouton    ${nom_sous_module}

appuyer sur entrer
    _gestionnaire_etape    presser_touche_technique    ENTER

appuyer sur tab
    _gestionnaire_etape    presser_touche_technique    TAB

touche directionnelle gauche
    _gestionnaire_etape    presser_touche_technique    LEFT

touche directionnelle droite
    _gestionnaire_etape    presser_touche_technique    RIGHT

touche directionnelle haut
    _gestionnaire_etape    presser_touche_technique    UP

touche directionnelle bas
    _gestionnaire_etape    presser_touche_technique    DOWN



# Mots-clés Techniques
lancer_app
    ${chemin_login}    Set Variable    ${chemin_images_base}${/}Login
    Add Image Path    ${chemin_login}
    Start Process    C:\\EXECUTION_PGETAB.bat    shell=True
    Wait Until Screen Contain    bouton_login.png    20

saisir_donnee
    [Arguments]    ${image}    ${valeur}
    Click    ${image}.png
    Input Text    ${image}.png    ${valeur}

cliquer_bouton
    [Arguments]    ${bouton}
    Click    ${bouton}.png

verifier_visibilite_technique
    [Arguments]    ${icone}
    Wait Until Screen Contain    ${icone}.png    10

presser_touche_technique
    [Arguments]    ${touche}
    # SikuliLibrary utilise 'Press Special Key' pour les touches non-alphanumériques
    Press Special Key    ${touche}

charger_chemin_module_technique
    [Arguments]    ${nom_module}
    ${nouveau_chemin}    Set Variable    ${chemin_images_base}${/}Module_${nom_module}
    Add Image Path    ${nouveau_chemin}
    Log    Chemin images mis a jour : ${nouveau_chemin}

charger_chemin_sous_module_technique
    [Arguments]    ${nom_sm}
    ${nouveau_chemin}    Set Variable    ${chemin_images_base}${/}Module_${module_actuel}${/}SM_${nom_sm}
    Add Image Path    ${nouveau_chemin}
    Log    Chemin images mis a jour : ${nouveau_chemin}