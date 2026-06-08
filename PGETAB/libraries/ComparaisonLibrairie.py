import json
from deepdiff import DeepDiff
from robot.api.deco import keyword

class JsonComparator:
    @keyword("Comparer deux fichiers JSON")
    def comparer_fichiers_json(self, chemin1, chemin2):
        with open(chemin1, 'r', encoding='utf-8') as f1, \
             open(chemin2, 'r', encoding='utf-8') as f2:
            
            data1 = json.load(f1)
            data2 = json.load(f2)
            
            diff = DeepDiff(data1, data2, ignore_order=True)
            
            if diff:
                # On lève une erreur pour que Robot Framework marque le test comme FAIL
                raise AssertionError(f"Les fichiers JSON sont différents : {diff}")
            return True