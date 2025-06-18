# Mettre à jour le stock

L’API permet de modifier dynamiquement la quantité d’un article en stock via le **SDK Python** ou en **appel REST direct**.

=== "SDK Python"

    === "Étape 1 : Authentification"

        ```python
        from restokit import Auth

        auth = Auth()
        token = auth.login("admin@restokit.io", "motdepasse")
        ```

    === "Étape 2 : Mise à jour du stock"

        ```python
        from restokit_client.client import get_restokit_client

        client = get_restokit_client(api_key=token.access_token)

        updated = client.stock.update(item_id=42, quantity=10)
        print(f"Stock mis à jour : {updated}")
        ```

=== "API REST (cURL)"

    === "Étape 1 : Authentification"

        ```bash
        curl -X POST https://api.restokit.io/v1/auth/login \
             -H "Content-Type: application/json" \
             -d '{
                   "email": "admin@restokit.io",
                   "password": "motdepasse"
                 }'
        ```

    === "Étape 2 : Mise à jour du stock"

        ```bash
        curl -X PATCH https://api.restokit.io/v1/stock/42 \
             -H "Authorization: Bearer jwt.token.string" \
             -H "Content-Type: application/json" \
             -d '{
                  "quantity": 10
                 }'
        ```

        Réponse :

        ```json
        {
          "item_id": 42,
          "new_quantity": 10
        }
        ```

## Bonnes pratiques

- Une mise à jour partielle est possible avec la méthode `PATCH`.
- Le champ `quantity` est obligatoire.
- Si l’article n’existe pas, un code `404` sera retourné.
