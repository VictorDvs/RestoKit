# Utilisation de l’API REST

Cette section vous montre comment interagir avec l’API RestoKit sans SDK, juste avec des requêtes REST classiques.  

Découvrez tous les [endpoints disponibles](../reference/api/openapi.md) pour enchaîner avec des appels complets.

> Vous utilisez Python ? Essayez plutôt le [SDK RestoKit pour Python](python.md).

---

## Authentification JWT

Authentifiez-vous en envoyant une requête `POST` à `/auth/login` avec vos identifiants :

=== "Requête"

    ```bash
    curl -X POST https://api.restokit.io/v1/auth/login \
      -H "Content-Type: application/json" \
      -d '{
        "email": "votre.email@example.com",
        "password": "votre_mot_de_passe"
        }'
    ```

=== "Réponse"

    ```json
    {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "token_type": "Bearer"
    }
    ```

Utilisez ensuite ce token dans l’en-tête `Authorization` de vos requêtes.

## Exemple : lister les menus

```bash
curl  -X GET https://api.restokit.io/v1/menus \
      -H "Authorization: Bearer VOTRE_TOKEN_JWT"
```

!!! info ""
    Réponse : un tableau JSON contenant les menus disponibles.

## Endpoints les plus utilisés

|      Ressource   | Enpoint |
| :---------: | :------:|
|Commandes    |`/orders`|
|Stock        |`/stock`|
|Partenaires  |`/partners`|
|Livraison    |`/delivery`|

Toutes les routes nécessitent un header `Authorization` avec un token JWT valide :

```http
Authorization: Bearer VOTRE_TOKEN_JWT
```

## Gestion des erreurs

Les erreurs de l’API suivent les bonnes pratiques REST (codes HTTP + messages explicites) :

```json
{
  "error": "Unauthorized",
  "message": "Token invalide ou expiré."
}
```

Voici quelques cas fréquents :

| Code HTTP | Signification              |
| --------- | -------------------------- |
| 401       | Token invalide ou manquant |
| 403       | Accès refusé               |
| 404       | Ressource non trouvée      |
| 500       | Erreur serveur             |
