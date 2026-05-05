*** Settings ***
Library         SikuliLibrary
Library         Process

*** Variables ***
${statut_global}    OK
${module_actuel}    ${EMPTY}
${chemin_images_base}    ${CURDIR}${/}..${/}images

*** Keywords ***

# gestion des statuts
gestionnaire_etape
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




# Keywords Fonctionnel
lance pgetab
    gestionnaire_etape    lancer_app

saisis
    [Arguments]    ${texte}    ${nom_image}
    gestionnaire_etape    saisir_donnee    ${nom_image}    ${texte}

saisis "${texte}" dans le champ "${image_label}"
    [Arguments]    ${distance}=150
    gestionnaire_etape    saisir_donnee_hover_droit    ${image_label}    ${texte}    ${distance}

clique
    [Arguments]    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}

verification
    [Arguments]    ${nom_icone}
    gestionnaire_etape    verifier_visibilite_technique    ${nom_icone}

selectionne le module
    [Arguments]    ${nom_module}
    gestionnaire_etape    cliquer_bouton    ${nom_module}

selectionne le sous module
    [Arguments]    ${nom_sous_module}
    gestionnaire_etape    cliquer_bouton    ${nom_sous_module}

appuyer sur entrer
    gestionnaire_etape    presser_touche_technique    ENTER

appuyer sur tab
    gestionnaire_etape    presser_touche_technique    TAB

touche directionnelle gauche
    gestionnaire_etape    presser_touche_technique    LEFT

touche directionnelle droite
    gestionnaire_etape    presser_touche_technique    RIGHT

touche directionnelle haut
    gestionnaire_etape    presser_touche_technique    UP

touche directionnelle bas
    gestionnaire_etape    presser_touche_technique    DOWN




# Mots-clés Techniques
lancer_app
    ${chemin_login}    Set Variable    ${chemin_images_base}${/}Login
    Add Image Path    ${chemin_login}
    Start Process    C:\\EXECUTION_PGETAB.bat    shell=True
    Wait Until Screen Contain    bouton_login.png    20

saisir_donnee
    [Arguments]    ${image}    ${valeur}
    Click    ${image}.png
    Input Text    ${EMPTY}    ${valeur}

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

saisir_donnee_hover_droit
    [Arguments]    ${image_label}    ${texte}    ${distance}
    Wait Until Screen Contain    ${image_label}.png    10
    ${coordinates} =    Get Center    ${image_label}.png
    ${target_x} =    Evaluate    ${coordinates[0]} + ${distance}
    ${target_y} =    Set Variable    ${coordinates[1]}
    Mouse Move    ${target_x}    ${target_y}
    Click Region    ${target_x}    ${target_y}
    Type    a    ${Key.CTRL}
    Type    ${Key.BACKSPACE}
    Input Text    ${image_label}.png    ${texte}