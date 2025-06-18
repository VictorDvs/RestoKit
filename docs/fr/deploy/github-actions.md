# CI/CD avec GitHub Actions

Automatisez vos tests avec **GitHub Actions** pour garantir la stabilité de votre intégration **Restokit** à chaque modification du code.

---

## Structure recommandée

Voici la structure de base à respecter :

```css
├── .github/
│ └── workflows/
│   └── tests.yml
├── main.py
├── requirements.txt
└── tests/
  └── test_main.py
```

## Créer le workflow CI

Fichier `.github/workflows/tests.yml`:

```yaml
name: RestoKit CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Cloner le dépôt
        uses: actions/checkout@v3

      - name: Installer Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.11

      - name: Installer les dépendances
        run: |
          python -m venv venv
          source venv/bin/activate
          pip install -r requirements.txt

      - name: Lancer les tests
        env:
          RESTOKIT_API_KEY: ${{ secrets.RESTOKIT_API_KEY }}
        run: |
          source venv/bin/activate
          python -m unittest discover
```

## Ajouter un test minimal

Créez un fichier `tests/test_main.py` avec ce test basique :

```python
import os
import unittest
from restokit import Client
from dotenv import load_dotenv

load_dotenv()

class TestOrders(unittest.TestCase):
    def test_list_orders(self):
        client = Client(api_key=os.getenv("RESTOKIT_API_KEY"))
        orders = client.orders.list()
        self.assertIsInstance(orders, list)

if __name__ == "__main__":
    unittest.main()
```

## Protéger votre clé API

Ajoutez votre clé API dans les secrets GitHub :

1. Allez dans **Settings** > **Secrets and variables** > **Actions**.
2. Cliquez sur **New repository secret**.
3. Remplissez :
    - **Name**: `RESTOKIT_API_KEY`
    - **Value**: votre clé RestoKit

???+ tip "Conseils utiles"
      - Ajoutez un badge GitHub Actions dans votre `README.md`.
      - Mockez les appels API si vous ne voulez pas toucher aux données réelles.
      - Isolez les appels réseau dans des services pour faciliter les tests unitaires.
      - Vérifiez régulièrement vos dépendances avec `pip list --outdated`.
