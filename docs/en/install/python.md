# Installation - Python SDK

This section guides you in the complete integration of the Python SDK Restokit in a professional project. You will find good installation, configuration, typing and test practices.

---

## SDK installation

!!! tip "Coming from the Quick Start section?"
    You may have already installed the SDK. In this case, skip to [Basic organization of the code](#basic-organization-of-the-code).

Install the SDK from pip:

```bash
pip install restokit
```

!!! info
     You can also add it to a file `requirements.txt` or `pyproject.toml` depending on your dependency manager.

## Basic organization of the code

Here is a minimum recommended structure to integrate Restokit into your Python project:

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

=== "`hand.py`"

    ```python
    from restokit_client.client import get_restokit_client

    client = get_restokit_client(api_key="YOUR_API_KEY")

    menus = client.menus.list()
    for menu in menus:
        print(menu)
    ```

## Advanced authentication

To generate a token from your identifiers, use the `Auth` module:

```python
from restokit import Auth

auth = Auth()
token = auth.login("admin@restokit.io", "your_password")

print(token.access_token)
```

Then pass this token to your client:

```python
from restokit import Client

client = Client(token=token.access_token)
```

## Test writing

We recommend that you use `pytest` and mocking the SDK with `unittest.mock` or `pytest-mock`.

```python
from unittest.mock import MagicMock
from restokit import Client

def test_list_orders():
    client = Client(api_key="test")
    client.orders.list = MagicMock(return_value=["order_1", "order_2"])
    
    orders = client.orders.list()
    assert len(orders) == 2
```

## Typage and self-compulsory

The SDK exhibits typed objects compatible with IDE. Example:

```python
order = client.orders.get("order_123")
print(order.id)           # → str
print(order.status)       # → str (ex: "pending", "confirmed")
print(order.items[0].name) # → str
```

!!! note ""
    Compatible with VS Code, Pycharm, etc.

## Client personalization

You can configure certain aspects such as the basic URL (useful for testing a local server):

```python
client = Client(api_key="YOUR_API_KEY", base_url="http://localhost:8000")
```

## Error management

All Restokit errors are subclasses of `Restokitexception`.

```python
from restokit import Client
from restokit.exceptions import AuthenticationError, APIError

client = Client(api_key="INVALID_KEY")

try:
    client.orders.list()
except AuthenticationError:
    print("Invalid API Key.")
except APIError as e:
    print(f"API Error : {e}")
```

## Bonus: Integrate with FastAPI

If you use FastAPI, inject the client via a dependency:

```python
from fastapi import Depends
from restokit import Client

def get_restokit_client() -> Client:
    return Client(api_key="YOUR_API_KEY")

@app.get("/orders")
def list_orders(client: Client = Depends(get_restokit_client)):
    return client.orders.list()
```
