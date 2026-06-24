"""
ComparaisonJSON.py
------------------
Librairie Robot Framework pour comparer deux fichiers JSON
(resultat_obtenu.json vs resultat_attendu.json).
"""

import json
from deepdiff import DeepDiff


class ComparaisonJSON:

    def verifier_resultats(self, fichier_obtenu, fichier_attendu):
        """
        Compare resultat_obtenu.json avec resultat_attendu.json.
        Lève une AssertionError si des différences sont trouvées.

        Exemple Robot :
        | Verifier Resultats
        | ...    ${CURDIR}/../data/json/resultat_obtenu.json
        | ...    ${CURDIR}/../data/json/resultat_attendu.json
        """
        with open(fichier_obtenu, "r", encoding="utf-8") as f:
            obtenu = json.load(f)

        with open(fichier_attendu, "r", encoding="utf-8") as f:
            attendu = json.load(f)

        diff = DeepDiff(attendu, obtenu, ignore_order=True)

        if diff:
            message = self._formater_diff(diff)
            raise AssertionError(f"❌ Différences détectées :\n{message}")

        print("✓ Résultats identiques — test passé")

    @staticmethod
    def _formater_diff(diff):
        lignes = []
        if "values_changed" in diff:
            for cle, val in diff["values_changed"].items():
                lignes.append(
                    f"  Valeur modifiée [{cle}] :\n"
                    f"    attendu = {val['old_value']}\n"
                    f"    obtenu  = {val['new_value']}"
                )
        if "iterable_item_added" in diff:
            for cle, val in diff["iterable_item_added"].items():
                lignes.append(f"  Ligne en trop dans obtenu [{cle}] : {val}")
        if "iterable_item_removed" in diff:
            for cle, val in diff["iterable_item_removed"].items():
                lignes.append(f"  Ligne manquante dans obtenu [{cle}] : {val}")
        if "dictionary_item_added" in diff:
            for cle in diff["dictionary_item_added"]:
                lignes.append(f"  Champ inattendu : {cle}")
        if "dictionary_item_removed" in diff:
            for cle in diff["dictionary_item_removed"]:
                lignes.append(f"  Champ manquant : {cle}")
        return "\n".join(lignes) if lignes else str(diff)