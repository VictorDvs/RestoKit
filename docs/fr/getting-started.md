# 🚀 Démarrage rapide

Testez RestoKit en quelques minutes. Choisissez votre méthode préférée (SDK, API ou Postman) et envoyez vos premiers appels dès maintenant.

---

## 1. Installez et connectez-vous

=== "💻 Utiliser le SDK Python"

    ```bash
    pip install restokit
    ```

    ```python
    from restokit import Client

    client = Client(api_key="VOTRE_CLE_API")
    ```
    !!! success "Vous êtes connecté"
        Le client est prêt à faire des appels.

=== "🌐 Utiliser l’API REST (curl)"

    ```bash
    curl -X GET https://api.restokit.io/v1/menus \
         -H "Authorization: Bearer VOTRE_TOKEN_JWT"
    ```
    !!! info
        Le token JWT s'obtient via `/auth/login` (voir plus bas).

=== "📫 Tester avec Postman"

    1. Importez la [collection Postman RestoKit](../assets/restokit.postman_collection.json).
    2. Définissez `base_url` :  `https://api.restokit.io/v1`.
    3.  Ajoutez votre **JWT** dans l’onglet **Authorization**.

---

## 2. Obtenez un token d'accès

=== "💻 SDK Python"

    ```python
    from restokit import Auth

    auth = Auth()
    token = auth.login("admin@restokit.io", "votre_mot_de_passe")
    print(token.access_token)
    ```

=== "🌐 API REST (curl)"

    ```bash
    curl -X POST https://api.restokit.io/v1/auth/login \
         -H "Content-Type: application/json" \
         -d '{
               "email": "admin@restokit.io",
               "password": "votre_mot_de_passe"
             }'
    ```

    Réponse :

    ```json
    {
      "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "token_type": "Bearer"
    }
    ```

---

## 3. Faites votre premier appel

=== "💻 SDK Python"

    ```python
    orders = client.orders.list()
    for order in orders:
        print(order)
    ```

=== "🌐 API REST (curl)"

    ```bash
    curl -X GET https://api.restokit.io/v1/orders \
         -H "Authorization: Bearer VOTRE_TOKEN_JWT"
    ```

!!! success ""
    Vous interrogez maintenant l’API RestoKit avec succès.

---

## 4. Option Postman

- Importez la collection.
- Définissez vos variables (`base_url`, `token`).
- Testez tous les endpoints en quelques clics.

---

## Et après ?

Vous êtes prêt à utiliser RestoKit. Poursuivez avec l’installation complète ou explorez l’API :

> [📘 Installation détaillée](install/python.md) · [📚 Tous les endpoints](reference/api/openapi.md)
