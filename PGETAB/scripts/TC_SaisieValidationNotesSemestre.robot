*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images 
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_EvaluationSemestre${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_EvaluationSemestre${/}resultat_attendu.json
${DIR_NOTES}        C:\\FICHIER_AUTOM\\NOTES_AUTOM_EVALUTION
${NOTES_EPS_1}        ${DIR_NOTES}\\2nd C1_ E.P.S_Semestre 1.xls
${NOTES_SVT_1}        ${DIR_NOTES}\\2nd C1_ S.V.T_Semestre 1.xls
${NOTES_ANG_1}        ${DIR_NOTES}\\2nd C1_Ang_Semestre 1.xls
${NOTES_FR_1}         ${DIR_NOTES}\\2nd C1_Fr_Semestre 1.xls
${NOTES_HG_1}         ${DIR_NOTES}\\2nd C1_H.G_Semestre 1.xls
${NOTES_MATH_1}       ${DIR_NOTES}\\2nd C1_Math_Semestre 1.xls
${NOTES_PC_1}       ${DIR_NOTES}\\2nd C1_P.C_Semestre 1.xls
${NOTES_PHILO_1}       ${DIR_NOTES}\\2nd C1_Philosophie_Semestre 1.xls

${NOTES_EPS_2}        ${DIR_NOTES}\\2nd C1_ E.P.S_Semestre 2.xls
${NOTES_SVT_2}        ${DIR_NOTES}\\2nd C1_ S.V.T_Semestre 2.xls
${NOTES_ANG_2}        ${DIR_NOTES}\\2nd C1_Ang_Semestre 2.xls
${NOTES_FR_2}         ${DIR_NOTES}\\2nd C1_Fr_Semestre 2.xls
${NOTES_HG_2}         ${DIR_NOTES}\\2nd C1_H.G_Semestre 2.xls
${NOTES_MATH_2}       ${DIR_NOTES}\\2nd C1_Math_Semestre 2.xls
${NOTES_PC_2}       ${DIR_NOTES}\\2nd C1_P.C_Semestre 2.xls
${NOTES_PHILO_2}       ${DIR_NOTES}\\2nd C1_Philosophie_Semestre 2.xls

${REQUETE}     A definir 

*** Test Cases ***
Saisie et Validation des notes
    [Documentation]    Automatisation Cas de Test Saisie et Validation des notes
    execution dump    TC_ABS_INCIDENT_INPUT.sql
    lance pgetab
    pause	10s
    saisis	admin	champ_nom_utilisateur
    saisis	admin	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Evaluation	bouton_evaluations
    selectionne le sous module    Saisie_de_note    bouton_saisie_de_note
    selectionne le sous sous module    Saisir_notes    bouton_saisir_notes
    choisis option    option_semestre_1    choix_periode1
    clique    bouton_importer
    pause    2s
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_ANG_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_eps    choix_matiere_ang
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_EPS_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_fr    choix_matiere_eps
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_FR_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_hg    choix_matiere_fr
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_HG_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer       

    choisis option    option_math    choix_matiere_hg
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_MATH_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_philo    choix_matiere_math
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_PHILO_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_pc    choix_matiere_philo
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_PC_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_svt    choix_matiere_pc
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_SVT_1}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer
    clique    bouton_fermer_fenetre_importation_note


    #import des notes du 2ieme semestre
    choisis option    option_semestre_2    choix_periode4
    clique    bouton_importer
    pause    2s
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_ANG_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    pause    2s
    appuyer sur entrer
    pause    2s
    appuyer sur entrer

    pause    5s
    choisis option    option_eps    choix_matiere_ang
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_EPS_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_fr    choix_matiere_eps
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_FR_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_hg    choix_matiere_fr
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_HG_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer       

    choisis option    option_math    choix_matiere_hg
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_MATH_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_philo    choix_matiere_math
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_PHILO_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_pc    choix_matiere_philo
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_PC_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer

    choisis option    option_svt    choix_matiere_pc
    clique    bouton_choix_fichier_importer
    charger fichier    ${NOTES_SVT_2}
    choisis option    option_devoir1    choix_type_note
    choisis option    option_devoir1_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    choisis option    option_composition    choix_type_note
    choisis option    option_composition_fic    choix_vide_type_note_fic
    clique    bouton_correspondre
    clique    bouton_valide_import
    appuyer sur entrer
    appuyer sur entrer
    clique    bouton_fermer_fenetre_importation_note


    #validation des notes
    charge image    Module_Evaluation/SM_Saisie_de_note
    selectionne le sous sous module    Valider_notes    bouton_valider_notes
    choisis option    option_semestre_1    choix_periode1
    clique    bouton_validation_grouper_des_notes
    clique    bouton_valider_note_pour_etab
    clique    bouton_valider
    choisis option    option_semestre_2    choix_periode4
    clique    bouton_validation_grouper_des_notes
    clique    bouton_valider_note_pour_etab
    clique    bouton_valider
    
    arrete pgetab
    #verification
    #connexion bd
    #generer resultat obtenu    ${REQUETE}    ${OBTENU}
    #deconnexion bd
    #comparer resultats    ${OBTENU}        ${ATTENDU}
    