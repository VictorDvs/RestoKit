# Démo locale

Lancer une version locale de votre intégration RestoKit est utile pour tester rapidement les appels à l'API, sans dépendre d'une infrastructure distante.

---

## Prérequis

Avant de commencer, assurez-vous d’avoir :

- **Python ≥ 3.10** (`python --version`)
- **pip** (installé avec Python)
- *(Optionnel)* `venv` pour isoler l’environnement
- Une **clé API RestoKit** (mode sandbox ou production).

---

## Préparer l’environnement

Créez un nouveau dossier de projet :

```bash
mkdir demo-restokit && cd demo-restokit
python -m venv venv
source venv/bin/activate  # Sous Windows : venv\Scripts\activate
```

Installez le SDK RestoKit :

```bash
pip install restokit
```

## Stocker la clé API

Créez un fichier `.env` à la racine :

```env
RESTOKIT_API_KEY=VOTRE_CLE_API
```

!!! warning "Ne versionnez jamais votre clé API"
    Ajoutez `.env` dans votre `.gitignore` pour éviter toute fuite sur GitHub.

## Code d'exemple minimal

Fichier `main.py`:

```python
import os
from dotenv import load_dotenv
from restokit import Client

load_dotenv()  # Charge les variables d’environnement

client = Client(api_key=os.getenv("RESTOKIT_API_KEY"))

orders = client.orders.list()
for order in orders:
    print(order)
```

## Exécuter la démo

Lancez le script :

```bash
python main.py
```

!!! note "Résultat attendu"
    Une liste d’objets commandes s’affiche dans le terminal au format JSON.

## Bonnes pratiques

- Utilisez des variables d'environnement pour vos secrets.
- Gardez vos dépendances dans un fichier `requirements.txt`.

```bash
pip freeze > requirements.txt
```
