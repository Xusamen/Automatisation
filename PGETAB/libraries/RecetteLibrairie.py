import re
import logging

class RecetteLibrairie:
    """
    Librairie Robot Framework pour les tests de recette.
    À placer dans : Projet/Librairies/RecetteLibrairie.py
    """

    ROBOT_LIBRARY_VERSION = "1.0.0"
    ROBOT_LIBRARY_SCOPE = "GLOBAL"

    # ──────────────────────────────────────────────
    # COMPARAISON DE DUMPS MySQL
    # ──────────────────────────────────────────────

    def _extract_inserts(self, dump_path: str) -> dict:
        """Extrait les INSERT INTO de chaque table depuis un dump SQL."""
        tables = {}

        with open(dump_path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                match = re.match(r"INSERT INTO `?(\w+)`?", line, re.IGNORECASE)
                if match:
                    table_name = match.group(1)
                    if table_name not in tables:
                        tables[table_name] = set()
                    tables[table_name].add(line)

        return tables

    def compare_deux_dumps_mysql(self, dump1_path: str, dump2_path: str) -> bool:
        """
        Compare les données de deux fichiers dump MySQL.

        Retourne True si les dumps sont identiques, False sinon.
        Log les différences pour Robot Framework / SquashTM.

        Arguments :
        - dump1_path : chemin vers le premier fichier .sql
        - dump2_path : chemin vers le deuxième fichier .sql

        Exemple :
        | ${result}=    Compare Deux Dumps MySQL    ${DUMP1}    ${DUMP2}
        """
        logging.info(f"Comparaison des dumps : {dump1_path} vs {dump2_path}")

        data1 = self._extract_inserts(dump1_path)
        data2 = self._extract_inserts(dump2_path)

        all_tables = set(data1.keys()) | set(data2.keys())
        is_identical = True

        for table in sorted(all_tables):
            rows1 = data1.get(table, set())
            rows2 = data2.get(table, set())

            only_in_dump1 = rows1 - rows2
            only_in_dump2 = rows2 - rows1

            if only_in_dump1 or only_in_dump2:
                is_identical = False
                logging.warning(f"[TABLE: {table}] Différences détectées :")

                for row in sorted(only_in_dump1):
                    logging.warning(f"  [-] Absent du dump2 : {row[:120]}...")

                for row in sorted(only_in_dump2):
                    logging.warning(f"  [+] Absent du dump1 : {row[:120]}...")
            else:
                logging.info(f"[TABLE: {table}] Identique.")

        if is_identical:
            logging.info("Résultat : Les deux dumps sont IDENTIQUES.")
        else:
            logging.warning("Résultat : Les deux dumps sont DIFFÉRENTS.")

        return is_identical