# Local Demo

Launching a local version of your Restokit integration is useful to quickly test API calls, without depending on a complex infrastructure.

---

## Before you begin

Make sure you have:

- **Python 3.10 or higher**: Check with `python -version`.
- **pip**: The Python packet manager.
- (optional) **`venv`** to create an isolated environment.
- An **API Restokit key** (sandbox or production mode).

---

## Preparing the environment

Create a clean project:

```bash
mkdir demo-restokit && cd demo-restokit
python -m venv venv
source venv/bin/activate  # On Windows : venv\Scripts\activate
```

Install the SDK:

```bash
pip install restokit
```

## Storing the API key locally

Create a `.env` file at the root of the project:

```env
RESTOKIT_API_KEY=VOTRE_CLE_API
```

!!! warning
    Don't forget to add `.env` to your `.gitignore` file to avoid pushing your API key to GitHub.

## Minimal example code

`main.py` file:

```python
import os
from dotenv import load_dotenv
from restokit import Client

load_dotenv()  # Loads the environment variables

client = Client(api_key=os.getenv("RESTOKIT_API_KEY"))

orders = client.orders.list()
for order in orders:
    print(order)
```

## Running the demo

Run the script:

```bash
python main.py
```

!!! note
    If everything works, you will see a list of commands displayed in your terminal in JSON format.

## Good practices

- Always use environment variables for your secrets.
- Keep your dependencies in a `requirements.txt` file.

```bash
pip freeze > requirements.txt
```
