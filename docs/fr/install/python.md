# Installation – SDK Python

Cette page vous guide pas à pas dans l’intégration de RestoKit avec Python : installation, structure du code, tests, typage, erreurs, et même intégration FastAPI.

---

## Installation du SDK

!!! tip "Vous venez du Démarrage rapide ?"
    Vous avez peut-être déjà installé le SDK. Dans ce cas, continuez avec [l'organisation recommandée](#organisation-recommandee).

Installez le SDK depuis PyPI :

```bash
pip install restokit
```

!!! info
     Vous pouvez aussi l'ajouter à votre `requirements.txt` ou `pyproject.toml`.

## Organisation recommandée

Structure minimale d’un projet :

```css
my_project/  
├── restokit_client/  
│   ├── __init__.py  
│   └── client.py  
├── main.py  
└── requirements.txt
```

=== "`client.py`"

    ```python
    from restokit import Client

    def get_restokit_client(api_key: str) -> Client:
        return Client(api_key=api_key)
    ```

=== "`main.py`"

    ```python
    from restokit_client.client import get_restokit_client

    client = get_restokit_client(api_key="VOTRE_CLE_API")

    menus = client.menus.list()
    for menu in menus:
        print(menu)
    ```

## Authentification par identifiants

Générez un token JWT avec vos identifiants :

```python
from restokit import Auth

auth = Auth()
token = auth.login("admin@restokit.io", "votre_mot_de_passe")

print(token.access_token)
```

Puis utilisez ce token avec le client :

```python
from restokit import Client

client = Client(token=token.access_token)
```

## Typage et autocomplétion

Les objets retournés sont entièrement typés pour une meilleure DX :

```python
order = client.orders.get("order_123")

print(order.id)            # → str
print(order.status)        # → str
print(order.items[0].name) # → str
```

!!! note ""
    Compatible avec VS Code, PyCharm, etc.

## Écriture de tests

Utilisez `pytest` et `unittest.mock` pour tester vos intégrations :

```python
from unittest.mock import MagicMock
from restokit import Client

def test_list_orders():
    client = Client(api_key="test")
    client.orders.list = MagicMock(return_value=["commande_1", "commande_2"])
    
    orders = client.orders.list()
    assert len(orders) == 2
```

## Personnalisation du client

Besoin de tester en local ou de modifier l’URL de base ? C’est possible :

```python
client = Client(api_key="VOTRE_CLE_API", base_url="http://localhost:8000")
```

## Gestion des erreurs

Les erreurs RestoKit héritent de `RestokitException` :

```python
from restokit import Client
from restokit.exceptions import AuthenticationError, APIError

client = Client(api_key="CLE_INVALIDE")

try:
    client.orders.list()
except AuthenticationError:
    print("Clé API invalide.")
except APIError as e:
    print(f"Erreur API : {e}")
```

## Bonus : intégrer avec FastAPI

Injectez le client proprement dans vos routes :

```python
from fastapi import Depends
from restokit import Client

def get_restokit_client() -> Client:
    return Client(api_key="VOTRE_CLE_API")

@app.get("/orders")
def list_orders(client: Client = Depends(get_restokit_client)):
    return client.orders.list()
```

## Et ensuite ?

> [📘 Revenir au Démarrage rapide](../getting-started.md) · [📚 Explorer tous les endpoints](../reference/api/openapi.md)
