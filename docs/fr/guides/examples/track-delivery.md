# Suivre une livraison

Permet de consulter le **statut de livraison** d’une commande existante, soit via le SDK Python, soit par appel direct à l’API REST.

=== "SDK Python"

    === "Étape 1 : Authentification"

        ```python
        from restokit import Auth

        auth = Auth()
        token = auth.login("user@restokit.io", "motdepasse")
        ```

    === "Étape 2 : Suivre la livraison"

        ```python
        from restokit_client.client import get_restokit_client

        client = get_restokit_client(api_key=token.access_token)

        delivery = client.delivery.get_status(order_id=1002)
        print(f"Commande #{delivery['order_id']} - statut : {delivery['status']}")
        ```

=== "API REST (cURL)"

    === "Étape 1 : Authentification"

        ```bash
        curl -X POST https://api.restokit.io/v1/auth/login \
            -H "Content-Type: application/json" \
            -d '{
                "email": "user@restokit.io",
                "password": "motdepasse"
                }'
        ```

    === "Étape 2 : Suivre la livraison"

        ```bash
        curl -X GET https://api.restokit.io/v1/delivery/status/1002 \
             -H "Authorization: Bearer jwt.token.string"
        ```

        Réponse :

        ```json
        {
          "order_id": 1002,
          "status": "en cours de livraison"
        }
        ```

## Astuces

- Les statuts possibles sont : `préparée`, `en cours de livraison`, `livrée`, `annulée`.
- L’endpoint retourne une erreur `404` si la commande n’existe pas ou n’a pas de livraison associée.
- L’authentification est obligatoire.
