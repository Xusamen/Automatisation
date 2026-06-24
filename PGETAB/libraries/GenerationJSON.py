import json
from datetime import date, datetime
from decimal import Decimal
import os

class GenerationJSON:

    def sauvegarder_en_json(self, resultats, colonnes, fichier_sortie):
        """
        Reçoit les résultats de DatabaseLibrary (liste de tuples)
        et les sauvegarde dans fichier_sortie au format JSON.

        Exemple Robot :
        | ${resultats}=    Execution Requete    ${REQUETE}
        | Generer Resultat Obtenu    ${resultats}    ${CURDIR}/../data/json/resultat_obtenu.json
        """
        noms_colonnes = [col[0] for col in colonnes]
        lignes = [dict(zip(noms_colonnes, ligne)) for ligne in resultats]

        lignes_serialisables = json.loads(
            json.dumps(lignes, default=self._serialiser, ensure_ascii=False)
        )

        os.makedirs(os.path.dirname(os.path.abspath(fichier_sortie)), exist_ok=True)
        with open(fichier_sortie, "w", encoding="utf-8") as f:
            json.dump(lignes_serialisables, f, ensure_ascii=False, indent=2)

        print(f"✓ {len(lignes_serialisables)} ligne(s) sauvegardée(s) → {fichier_sortie}")
        return len(lignes_serialisables)

    @staticmethod
    def _serialiser(obj):
        if isinstance(obj, (datetime, date)):
            return obj.isoformat()
        if isinstance(obj, Decimal):
            return float(obj)
        if obj is None:
            return None
        raise TypeError(f"Type non sérialisable : {type(obj)}")