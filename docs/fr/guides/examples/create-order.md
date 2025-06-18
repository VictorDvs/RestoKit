# Créer une commande

Voici deux approches pour créer une commande : via le **SDK Python** ou l’**API RESTful** en HTTP.

=== "SDK Python"

    === "Étape 1 : Authentification"

        ```python
        from restokit import Auth

        auth = Auth()
        token = auth.login("user@example.com", "votre_mot_de_passe")
        print(token.access_token)
        ```

    === "Étape 2 : Créer une commande"

        ```python
        from restokit_client.client import get_restokit_client

        client = get_restokit_client(api_key="VOTRE_CLE_API")

        order_data = {
            "items": [
                {"menu_id": 5, "qty": 2},
                {"menu_id": 9, "qty": 1}
            ],
            "delivery_type": "livraison",
            "address_id": 12
        }

        order = client.orders.create(order_data)
        print(f"Commande créée avec ID: {order['order_id']}, statut: {order['status']}")
        ```

=== "API REST (cURL)"

    === "Étape 1 : Authentification"

        ```bash
        curl -X POST https://api.restokit.io/v1/auth/login \
             -H "Content-Type: application/json" \
             -d '{
                   "email": "user@example.com",
                   "password": "votre_mot_de_passe"
                 }'
        ```

        Réponse :

        ```json
        {
          "access_token": "jwt.token.string",
          "token_type": "Bearer"
        }
        ```

    === "Étape 2 : Créer la commande"

        ```bash
        curl -X POST https://api.restokit.io/v1/orders \
             -H "Authorization: Bearer jwt.token.string" \
             -H "Content-Type: application/json" \
             -d '{
                   "items": [
                     {"menu_id": 5, "qty": 2},
                     {"menu_id": 9, "qty": 1}
                   ],
                   "delivery_type": "livraison",
                   "address_id": 12
                 }'
        ```

        Réponse :

        ```json
        {
          "order_id": 1002,
          "status": "en cours"
        }
        ```

## Résultat

Dans les deux cas, une commande est créée avec un ID unique et un statut initial (`en cours`, `préparation`, etc.).
