# CI/CD with GitHub Actions

Automating your tests with Github Actions guarantees that your Restokit integration remains stable with each code change.

---

## Project structure

Make sure you have:

```css
├── .github/
│ └── workflows/
│   └── tests.yml
├── main.py
├── requirements.txt
└── tests/
  └── test_main.py
```

## Creating the CI workflow

`.gitHub/workflows/test.yml` file:

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
      - name: Cloning repo
        uses: actions/checkout@v3

      - name: Installing Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.11

      - name: Installing dependencies
        run: |
          python -m venv venv
          source venv/bin/activate
          pip install -r requirements.txt

      - name: Running tests
        env:
          RESTOKIT_API_KEY: ${{ secrets.RESTOKIT_API_KEY }}
        run: |
          source venv/bin/activate
          python -m unittest discover
```

## Testing your integration

In the `tests/` folder, create a simple test:

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

## Protecting the API key

Add `RESTOKIT_API_KEY` in your GitHub Secrets:

1. Go to **_Settings_** > **_Secrets_** > **_Actions_**.
2. Click **New repository secret**.
3. Enter:
    - **Name**: `RESTOKIT_API_KEY`
    - **Value**: your key

???+ tip "Tips"
     - Update your dependencies regularly.
     - Mock API calls for unit tests if necessary.
     - Add builds badges to your `README.md`.
