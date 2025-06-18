# Authentification

L’API Restokit utilise des **jetons JWT** pour sécuriser l’accès à ses endpoints.  
Chaque appel à une ressource protégée doit inclure un jeton valide dans l’en-tête `Authorization`.

---

## Obtenir un jeton

Envoyez une requête `POST` au point d’entrée `/auth/login` avec vos identifiants.

=== "Exemple de requête"

    ```bash
    curl -X POST https://api.restokit.io/v1/auth/login \
     -H "Content-Type: application/json" \
     -d '{
           "email": "admin@restokit.io",
           "password": "motdepasse"
         }'
    ```

=== "Réponse attendu"

    ```json
    {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "token_type": "Bearer"
    }
    ```

## Faire un appel authentifié

Incluez le token JWT dans l’en-tête `Authorization` de vos requêtes :

```bash
curl -X GET https://api.restokit.io/v1/menus \
     -H "Authorization: Bearer VOTRE_TOKEN"
```

!!! note ""
    Le préfixe `Bearer` est requis.

## Durée de validité

- Jeton actif pendant : 30 minutes

- Pas de rafraîchissement automatique (pas de `/refresh-token`)

- Il faut réauthentifier l’utilisateur une fois le token expiré

## Bonnes pratiques

- Stockez le token côté client (HTTP-only cookie recommandé pour les apps web).

- Anticipez l’expiration avec un mécanisme de reconnexion silencieuse si nécessaire.

- Vérifiez toujours le code d’erreur HTTP `401` pour détecter une expiration ou une authentification invalide.
