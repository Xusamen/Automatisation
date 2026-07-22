*** Settings ***
Resource         ../resources/pgetab-keywords.resource
Resource         ../resources/database-keywords.resource
Library          ../libraries/Key.py

Suite Setup     Start Sikuli Process
Suite Teardown  Stop Remote Server

*** Variables ***
${IMAGE_PATH}    ${CURDIR}${/}images
${REQUETE}     SELECT
...                 el.NOM_ELV,
...                 el.PRENOM_ELV,
...                 sa.LIB_CRT_SS_ARTICL         AS LIBELLE_FRAIS,
...                 ps.MONTANT_SCOLARITE,
...                 re.MT_REC_TOT_ELEV,
...                 pe.NOM_PERS,
...                 pe.PRENOM_PERS,
...                 typ_trans.LIB_CRT_PARAM_GLOB AS TYPE_TRANSACTION,
...                 ca.NOM_CAISSE,
...                 ans.LIB_SCOLAIR              AS ANNEE_SCOLAIRE
...             FROM EL_ELEVE el
...             INNER JOIN EL_INSCRIPTION i
...                 ON i.ID_ELEVE = el.ID_ELEVE
...             INNER JOIN CO_RECETTE_ELEVE re
...                 ON re.ID_INSCRIPTION = i.ID_INSCRIPTION
...             INNER JOIN CO_LIST_ID_RECETTE lir
...                 ON lir.ID_RECETTE = re.ID_RECETTE
...             LEFT JOIN CO_PARAM_SCOLARITE ps
...                 ON ps.ID_PARAM_SCOLARITE = re.ID_PARAM_SCOLARITE
...             LEFT JOIN PA_SOUS_ARTICLE sa
...                 ON sa.ID_SS_ARTICL = ps.ID_SS_ARTICL
...             INNER JOIN CO_TRANSAC_CAISSE tc
...                 ON tc.ID_RECETTE = re.ID_RECETTE
...                 AND tc.NUM_PAIE_REC = re.NUM_ORDR_PAI
...             LEFT JOIN PA_PARAM_GLOB typ_trans
...                 ON typ_trans.ID_PARAM_GLOB = tc.ID_PA_TYP_TRANSAC
...             INNER JOIN CO_HISTO_CONXION_CAISSE hcc
...                 ON hcc.ID_CONXION_CAISSE = tc.ID_CONXION_CAISSE
...             INNER JOIN PE_PERSONNEL pe
...                 ON pe.ID_PERSONNEL = hcc.ID_PERSONNEL
...             INNER JOIN CO_CAISSE ca
...                 ON ca.ID_CAISSE = hcc.ID_CAISSE
...             LEFT JOIN PA_ANNEE_SCOLAIRE ans
...                 ON ans.ID_AN_SCOLAIRE = hcc.ID_AN_SCOLAIRE
...             ORDER BY
...                 el.NOM_ELV ASC,
...                 el.PRENOM_ELV ASC,
...                 re.DAT_RECU DESC
${OBTENU}      ${CURDIR}${/}..${/}fichiers_json${/}TC_PaiementScolarite${/}resultat_obtenu.json
${ATTENDU}     ${CURDIR}${/}..${/}fichiers_json${/}TC_PaiementScolarite${/}resultat_attendu.json

*** Test Cases ***
Paiement Scolarite
    [Documentation]    Automatisation Cas de Test Paiement Scolarite
    execution dump    TC_INSERTION_ELEVE.sql 
    lance pgetab
    saisis	intendant	champ_nom_utilisateur
    saisis	souris	champ_mot_de_passe
    clique	bouton_login
    verification	icone
    pause	2s
    selectionne le module	Parametrage    bouton_parametrage
    charge image     Accueil
    selectionne le module	Comptabilite    bouton_comptabilite
    selectionne le sous module    Recette    bouton_recette
    clique  bouton_autres_recettes
    selectionne le sous sous module    Recettes_eleves    bouton_recettes_eleves
    saisis	BAZONGO	champ_nom
    saisis	Alicia	champ_prenom
    clique	bouton_payer_scolarite
    clique	bouton_valider
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction
    
    clique  champ_recherche_nom_1
    selectionne tout
    supprime selection
    saisis texte    BIRBA
    clique  champ_recherche_prenom_1
    selectionne tout
    supprime selection
    saisis texte    Emmanuel
    clique	bouton_payer_scolarite
    saisis texte  100000
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction
    
    clique  champ_recherche_nom_2
    selectionne tout
    supprime selection
    saisis texte    CAMARA
    clique  champ_recherche_prenom_2
    selectionne tout
    supprime selection
    saisis texte    Rahim
    clique	bouton_payer_scolarite
    clique  bouton_ajouter_transaction
    choisis option    option_livret_scolaire    choix_motif_2
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction
    
    clique  champ_recherche_nom_3
    selectionne tout
    supprime selection
    saisis texte    KABORE
    clique  champ_recherche_prenom_3
    selectionne tout
    supprime selection
    saisis texte    Wendyam
    clique	bouton_payer_scolarite
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    choisis option    option_cotisation_speciale    choix_motif_3
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction
    
    clique  champ_recherche_nom_4
    selectionne tout
    supprime selection
    saisis texte    OUEDRAOGO
    clique  champ_recherche_prenom_4
    selectionne tout
    supprime selection
    saisis texte    Richard
    clique	bouton_payer_scolarite
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction
    
    clique  champ_recherche_prenom_5
    selectionne tout
    supprime selection
    saisis texte    Stefi
    clique	bouton_payer_scolarite
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction

    clique  champ_recherche_nom_6
    selectionne tout
    supprime selection
    saisis texte    ZONGO
    clique  champ_recherche_prenom_6
    selectionne tout
    supprime selection
    saisis texte    Franck
    clique	bouton_payer_scolarite
    choisis option    option_carte_identite    choix_motif
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_ajouter_transaction
    clique  bouton_valider_transaction

    clique  champ_recherche_nom_7
    selectionne tout
    supprime selection
    clique  champ_recherche_prenom_7
    selectionne tout
    supprime selection
    arrete pgetab


    connexion bd
    generer resultat obtenu    ${REQUETE}    ${OBTENU}
    deconnexion bd
    comparer resultats    ${OBTENU}        ${ATTENDU}