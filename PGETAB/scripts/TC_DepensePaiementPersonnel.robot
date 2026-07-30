*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py
Resource         ../resources/utils-keywords.resource

Suite Setup     init env and start
Suite Teardown  stop and clean env

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_DepensePaiementPersonnel${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_DepensePaiementPersonnel${/}resultat_attendu.json
${REQUETE}
...            SELECT
...                p.NOM_PERS,
...                p.PRENOM_PERS,
...                b.date_debut          AS PERIODE_DEBUT,
...                b.date_fin            AS PERIODE_FIN,
...                b.salaire_net,
...                b.FL_VALIDE           AS BULLETIN_VALIDE,
...                b.FL_PAYE             AS BULLETIN_PAYE,
...                ps.SALAIR_MENS,
...                tc.MT_PAIEMENT_DEP,
...                CASE
...                    WHEN b.ID_BULTIN IS NULL THEN 'PAS DE BULLETIN'
...                    WHEN b.FL_PAYE = 'N' THEN 'BULLETIN NON MARQUE PAYE'
...                    WHEN ps.ID_DEPENSE IS NULL THEN 'PAIEMENT NON ENREGISTRE'
...                    WHEN tc.ID_TRANSAC IS NULL THEN 'TRANSACTION CAISSE MANQUANTE'
...                    WHEN tc.MT_PAIEMENT_DEP <> ps.SALAIR_MENS THEN 'MONTANT INCOHERENT'
...                    ELSE 'OK'
...                END AS STATUT_VERIFICATION
...            FROM pe_personnel p
...            INNER JOIN co_cntra c
...                ON c.ID_PERSONNEL = p.ID_PERSONNEL
...            LEFT JOIN co_bultin_sal b
...                ON b.ID_CNTRA = c.ID_CNTRA
...            LEFT JOIN co_paiemen_salair ps
...                ON ps.ID_BULTIN = b.ID_BULTIN
...            LEFT JOIN co_transac_caisse tc
...                ON tc.ID_DEPENSE = ps.ID_DEPENSE
...            ORDER BY
...                p.NOM_PERS,
...                p.PRENOM_PERS,
...                b.date_debut;
*** Test Cases ***
Module Depense
    [Documentation]    Automatisation du cas de test lié au paiement du personnel
    execution dump    TC_SM_DEPENSE_INPUT.sql
    lance pgetab
    saisis	intendant	champ_nom_utilisateur
    saisis	souris	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    charge image    Module_Comptabilite
    clique    bouton_depense    
    charge image    Module_Comptabilite/SM_Depense/SSM_Paie_personnel
    saisis    BANDE    champ_nom
    saisis    Stephanie    champ_prenom
    clique    bouton_bulletin
    clique  periode_debut
    selectionne tout
    supprime selection
    saisis texte    01/10/2025
    clique  periode_fin
    selectionne tout
    supprime selection
    saisis texte    31/10/2025
    clique    bouton_valider
    appuyer sur entrer
    clique    bouton_detail_bulletin
    clique    bouton_valider_bulletin
    clique    bouton_oui
    appuyer sur entrer
    clique    bouton_payer
    pause    1s
    appuyer sur entrer
    saisis "CNIB B10759750 du 10/09/2020" dans le champ "champ_document_ID"
    choisis option    option_salaire_personnel    choix_motif_paiement
    choisis option    option_bulletin    choix_bulletin
    saisis_hover_max    RAS    champ_motif    50
    clique    bouton_valider_paiement_salaire
    pause    5s

    clique  champ_nom_1
    selectionne tout
    supprime selection
    saisis texte    Camara
    clique  champ_prenom_1
    selectionne tout
    supprime selection
    saisis texte    Madou
    clique    bouton_bulletin
    saisis "30" dans le champ "champ_volume_horaire"
    clique  periode_debut
    selectionne tout
    supprime selection
    saisis texte    01/10/2025
    clique  periode_fin
    selectionne tout
    supprime selection
    saisis texte    31/10/2025
    clique    bouton_calculer
    clique    bouton_valider
    appuyer sur entrer
    clique    bouton_detail_bulletin
    clique    bouton_valider_bulletin
    clique    bouton_oui
    appuyer sur entrer
    clique    bouton_payer
    pause    1s
    appuyer sur entrer
    saisis "CNIB B10758000 du 10/05/2019" dans le champ "champ_document_ID"
    choisis option    option_salaire_personnel    choix_motif_paiement
    choisis option    option_bulletin    choix_bulletin
    saisis_hover_max    RAS    champ_motif    50
    clique    bouton_valider_paiement_salaire
    arrete pgetab
    
    #Verification BD
    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}


