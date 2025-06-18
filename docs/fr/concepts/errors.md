# Gestion des erreurs

Restokit adopte les bonnes pratiques des API REST en utilisant des **codes HTTP standard** pour indiquer les erreurs.  
Chaque réponse d’erreur inclut un message clair dans un format JSON simple.

---

## Format d’erreur type

```json
{
  "detail": "Message d'erreur clair"
}
```

Ce champ `detail` peut être utilisé pour l’affichage côté client ou le débogage.

## Codes de statut courants

| Code  | Signification         | Cause fréquente                                       |
| ----- | --------------------- | ----------------------------------------------------- |
| `400` | Requête invalide      | Paramètre manquant, corps mal formé                   |
| `401` | Non authentifié       | Jeton JWT absent ou expiré                            |
| `403` | Accès interdit        | Authentifié mais sans autorisation suffisante         |
| `404` | Ressource introuvable | Endpoint incorrect ou ressource inexistante           |
| `422` | Échec de validation   | Donnée invalide (ex. email mal formé, champ manquant) |
| `500` | Erreur serveur        | Erreur interne (exception non gérée, etc.)            |

## Conseils pour le client

- Surveillez les erreurs `401` pour détecter un besoin de reconnexion.

- Gérez proprement les erreurs `422` pour afficher des messages clairs à l’utilisateur.

- Les erreurs `500` ne doivent jamais survenir en utilisation normale : contactez l’équipe si elles persistent.
