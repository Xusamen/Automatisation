*** Settings ***
Library         SikuliLibrary
Library         Process

*** Variables ***
${statut_global}    OK
${module_actuel}    ${EMPTY}
${module_parent}    ${EMPTY}
${chemin_images_base}    ${CURDIR}${/}..${/}images
${DB_HOST}    localhost
${DB_USER}        root
${DB_PASSWORD}    
${DB_NAME}        pgetab

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

arrete pgetab
    gestionnaire_etape    arreter_app

saisis
    [Arguments]    ${texte}    ${nom_image}
    gestionnaire_etape    saisir_donnee    ${nom_image}    ${texte}

saisis "${texte}" dans le champ "${image_label}"
    [Arguments]    ${distance}=75
    gestionnaire_etape    saisir_donnee_hover_droit    ${image_label}    ${texte}    ${distance}

clique
    [Arguments]    ${nom_bouton}
    gestionnaire_etape    cliquer_bouton    ${nom_bouton}

verification
    [Arguments]    ${nom_icone}
    gestionnaire_etape    verifier_visibilite_technique    ${nom_icone}
    
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

pause
    [Arguments]    ${temps}
    [Documentation]    Attend un temps donné (ex: 2s, 500ms).
    _gestionnaire_etape    attente_technique    ${temps}

selectionne le module
    [Arguments]    ${nom_module}    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    # On définit le premier niveau : Module_X
    Set Global Variable    ${module_parent}    Module_${nom_module}
    Set Global Variable    ${module_actuel}    ${module_parent}
    _gestionnaire_etape    charger_chemin_technique    ${module_actuel}

selectionne le sous module
    [Arguments]    ${nom_sous_module}    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    # On ajoute le sous-module au chemin actuel : Module_X/SM_Y
    Set Global Variable    ${module_actuel}    ${module_parent}${/}SM_${nom_sous_module}
    _gestionnaire_etape    charger_chemin_technique    ${module_actuel}

selectionne le sous sous module
    [Arguments]    ${nom_ssm}    ${nom_bouton}
    _gestionnaire_etape    cliquer_bouton    ${nom_bouton}
    # On ajoute le sous-sous-module : Module_X/SM_Y/SSM_Z
    Set Global Variable    ${module_actuel}    ${module_actuel}${/}SSM_${nom_ssm}
    _gestionnaire_etape    charger_chemin_technique    ${module_actuel}

choisis option 
    [Arguments]    ${image_option}    ${image_combo}
    gestionnaire_etape    selectionner_combobox    ${image_combo}    100   ${image_option}

charge image
    [Arguments]    ${chemin}
    [Documentation]   Charge des images en specifiant Module_xx/SM_xx/SSM_xx
    Set Global Variable    ${module_actuel}    ${chemin}    
    gestionnaire_etape    charger_repertoire_via_chemin_technique    ${chemin}


# Mots-clés Techniques
lancer_app
    ${chemin_login}    Set Variable    ${chemin_images_base}${/}Login
    Add Image Path    ${chemin_login}
    Start Process    C:\\EXECUTION_PGETAB.bat    shell=True
    attente_technique    20s
    Wait Until Screen Contain    bouton_login.png    5
    ${chemin_accueil}    Set Variable    ${chemin_images_base}${/}Accueil
    Add Image Path    ${chemin_accueil}
    Log    Prêt sur la page d'accueil. Dossier chargé : ${chemin_accueil}

arreter_app
    Start Process    C:\\ARRET_PGETAB.bat    shell=True
    attente_technique    10s
    Log    arret de pgetab

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
    Press Special Key    ${touche}

charger_chemin_technique
    [Arguments]    ${chemin_relatif}
    ${nouveau_chemin}    Set Variable    ${chemin_images_base}${/}${chemin_relatif}
    Add Image Path    ${nouveau_chemin}
    Log    [CONTEXTE] Images chargées depuis : ${nouveau_chemin}

effacer_champ
    # a corriger
    Press Special Key    CTRL 
    Press Special Key    a
    Press Special Key    DELETE

saisir_donnee_hover_droit
    [Arguments]    ${image_label}    ${texte}    ${distance}
    Wait Until Screen Contain    ${image_label}.png    10
    ${coordinates} =    Get Image Coordinates    ${image_label}.png
    Log    [DEBUG] Coordonnées brutes de l'image : ${coordinates}    DEBUG
    ${center_x} =    Evaluate    int(${coordinates[0]} + (${coordinates[2]} / 2))
    ${center_y} =    Evaluate    int(${coordinates[1]} + (${coordinates[3]} / 2))
    Log    [INFO] Centre du label identifié à : X=${center_x}, Y=${center_y}
    Mouse Move Location    ${center_x}    ${center_y}
    Sleep    0.5s
    ${target_x} =    Evaluate    int(${center_x} + ${distance})
    Log    [INFO] Déplacement vers le champ à : X=${target_x}, Y=${center_y} (Distance: ${distance}px)
    Mouse Move Location    ${target_x}    ${center_y}
    Click    ${image_label}    ${distance}    0
    Input Text    ${EMPTY}    ${texte}


attente_technique
    [Arguments]    ${temps}
    Sleep    ${temps}

selectionner_combobox_par_label_hover
    [Arguments]    ${image_label}    ${distance}    ${image_option}
    
    Wait Until Screen Contain    ${image_label}.png    10
    ${coordinates} =    Get Image Coordinates    ${image_label}.png
    
    ${center_x} =    Evaluate    int(${coordinates[0]} + (${coordinates[2]} / 2))
    ${center_y} =    Evaluate    int(${coordinates[1]} + (${coordinates[3]} / 2))
    ${target_x} =    Evaluate    int(${center_x} + ${distance})
    
    Mouse Move Location    ${target_x}    ${center_y}
    Sleep    0.2s
    
    Click    ${image_label}.png    50    0
    Sleep    0.5s    
    Wait Until Screen Contain    ${image_option}.png    5
    Click    ${image_option}.png    0    0

charger_repertoire_via_chemin_technique
    [Arguments]    ${chemin_relatif}
    ${chemin_final}    Set Variable    ${chemin_images_base}${/}${chemin_relatif}
    Add Image Path    ${chemin_final}
    Log    [CONTEXTE IMAGES] Basculement réussi vers le répertoire : ${chemin_final}

charger_dump_technique
    [Arguments]    ${chemin_dump}
    Log    [DATABASE] Début de la restauration du dump MySQL : ${chemin_dump}
    ${commande} =    Set Variable    mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} < "${chemin_dump}"
    ${result} =    Run Process    ${commande}    shell=True
    IF    ${result.rc} != 0
        Fail    La restauration du dump MySQL a échoué ! Erreur: ${result.stderr}
    END    
    Log    [DATABASE] Base de recette MySQL synchronisée avec succès.

exporter_dump_technique
    [Arguments]    ${chemin_export_sql}
    Log    [DATABASE] Début de l'exportation de la base MySQL...
    
    # Construction de la commande mysqldump
    # Syntaxe : mysqldump -h host -u user -pPassword database > fichier_destination.sql
    ${commande} =    Set Variable    mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > "${chemin_export_sql}"
    
    # Exécution via Process
    ${result} =    Run Process    ${commande}    shell=True
    
    # Contrôle de l'exécution
    IF    ${result.rc} != 0
        Fail    L'exportation de la base de données a échoué ! Erreur: ${result.stderr}
    END
    
    Log    [DATABASE] Base de recette exportée avec succès vers : ${chemin_export_sql}

creation_json_obtenu
    [Arguments]    ${requete_sql}
    Log    [DATABASE] Creation du json grace à la base de donnée apres exec de l'automatisation


comparer_json_technique
    [Arguments]    ${json_reference}    ${json_creer}
    Log    [DATABASE] Début de la comparaison des fichiers json
