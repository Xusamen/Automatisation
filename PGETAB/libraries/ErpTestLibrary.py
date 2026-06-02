"""
ErpTestLibrary.py
Library Robot Framework custom pour :
  - Charger les fichiers JSON de cas de test
  - Construire le JSON obtenu depuis les résultats SQL
  - Comparer JSON attendu vs JSON obtenu et retourner les écarts
"""

import json
import os
from deepdiff import DeepDiff
from robot.api import logger
from robot.api.deco import keyword


class ErpTestLibrary:

    ROBOT_LIBRARY_SCOPE = "TEST CASE"

    # ------------------------------------------------------------------ #
    #  CHARGEMENT JSON                                                     #
    # ------------------------------------------------------------------ #

    @keyword("Charger Cas De Test")
    def charger_cas_de_test(self, chemin_json: str) -> dict:
        """
        Lit le fichier JSON du cas de test et retourne le dictionnaire complet.
        Utilisation dans .robot :
            ${cas}=    Charger Cas De Test    ${JSON_DIR}/TC001.json
        """
        chemin_absolu = os.path.abspath(chemin_json)
        if not os.path.exists(chemin_absolu):
            raise FileNotFoundError(f"Fichier JSON introuvable : {chemin_absolu}")

        with open(chemin_absolu, encoding="utf-8") as f:
            cas = json.load(f)

        logger.info(f"[TC] Cas de test chargé : {cas.get('test_id')} — {cas.get('description')}")
        return cas

    # ------------------------------------------------------------------ #
    #  CONSTRUCTION JSON OBTENU DEPUIS RÉSULTATS SQL                       #
    # ------------------------------------------------------------------ #

    @keyword("Construire Json Obtenu")
    def construire_json_obtenu(self, resultats_sql: list, colonnes: list) -> dict:
        """
        Transforme les résultats bruts de DatabaseLibrary en JSON structuré
        identique au format 'resultats_attendus' du fichier de cas de test.

        resultats_sql : liste de tuples retournée par Query
        colonnes      : liste des noms de colonnes dans l'ordre SQL
        """
        if not resultats_sql:
            raise ValueError("Aucune ligne retournée par la requête SQL d'export.")

        lignes = [dict(zip(colonnes, row)) for row in resultats_sql]
        premiere = lignes[0]

        json_obtenu = {
            "commande": {
                "code_client":    premiere.get("code_client"),
                "statut":         premiere.get("statut"),
                "montant_total":  float(premiere.get("montant_total", 0))
            },
            "lignes": [
                {
                    "code_article":  l.get("code_article"),
                    "quantite":      int(l.get("quantite", 0)),
                    "prix_unitaire": float(l.get("prix_unitaire", 0))
                }
                for l in lignes
            ]
        }

        logger.info(f"[SQL] JSON obtenu construit — {len(lignes)} ligne(s)")
        logger.debug(json.dumps(json_obtenu, indent=2, ensure_ascii=False))
        return json_obtenu

    # ------------------------------------------------------------------ #
    #  COMPARAISON JSON ATTENDU vs OBTENU                                  #
    # ------------------------------------------------------------------ #

    @keyword("Comparer Resultats")
    def comparer_resultats(self, json_attendu: dict, json_obtenu: dict) -> None:
        """
        Compare les deux JSON et fait échouer le test (FAIL) si des écarts
        sont détectés, avec un rapport lisible dans le log Robot Framework.

        Utilisation dans .robot :
            Comparer Resultats    ${cas}[resultats_attendus]    ${json_obtenu}
        """
        diff = DeepDiff(json_attendu, json_obtenu, ignore_order=True)

        if not diff:
            logger.info("✅  Comparaison OK — Aucun écart détecté.")
            return

        # Construire un rapport lisible
        rapport = self._formater_rapport(diff)
        logger.error(rapport)
        raise AssertionError(f"❌  Écarts détectés entre résultats attendus et obtenus :\n{rapport}")

    def _formater_rapport(self, diff: DeepDiff) -> str:
        lignes = ["=== RAPPORT DE DIFFÉRENCES ==="]

        if "values_changed" in diff:
            lignes.append("\n[Valeurs modifiées]")
            for chemin, detail in diff["values_changed"].items():
                lignes.append(
                    f"  {chemin}\n"
                    f"    Attendu : {detail['old_value']}\n"
                    f"    Obtenu  : {detail['new_value']}"
                )

        if "iterable_item_added" in diff:
            lignes.append("\n[Éléments en trop dans le résultat obtenu]")
            for chemin, val in diff["iterable_item_added"].items():
                lignes.append(f"  {chemin} : {val}")

        if "iterable_item_removed" in diff:
            lignes.append("\n[Éléments manquants dans le résultat obtenu]")
            for chemin, val in diff["iterable_item_removed"].items():
                lignes.append(f"  {chemin} : {val}")

        if "dictionary_item_added" in diff:
            lignes.append("\n[Clés inattendues]")
            for chemin in diff["dictionary_item_added"]:
                lignes.append(f"  {chemin}")

        if "dictionary_item_removed" in diff:
            lignes.append("\n[Clés manquantes]")
            for chemin in diff["dictionary_item_removed"]:
                lignes.append(f"  {chemin}")

        return "\n".join(lignes)

    # ------------------------------------------------------------------ #
    #  UTILITAIRES                                                         #
    # ------------------------------------------------------------------ #

    @keyword("Logger Json")
    def logger_json(self, label: str, data: dict) -> None:
        """Affiche un JSON formaté dans le log Robot Framework — utile pour debug."""
        logger.info(f"[{label}]\n{json.dumps(data, indent=2, ensure_ascii=False)}")
