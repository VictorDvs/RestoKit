# Architecture de Restokit

Restokit est une API RESTful conçue pour orchestrer efficacement commandes, stock et livraison dans un environnement de restauration.

---

## Principes fondamentaux

- **RESTful** – Ressources accessibles via des URLs explicites.
- **Stateless** – Chaque requête contient toutes les informations nécessaires.
- **JSON** – Format de données unique pour les échanges.
- **JWT** – Authentification sécurisée par token.

## Composants principaux

| Composant         | Rôle                                                    |
|-------------------|----------------------------------------------------------|
| **Client**         | Application web, mobile ou tierce consommant l'API.     |
| **Serveur API**    | Gère la logique métier, expose les endpoints REST.      |
| **Base de données**| Stocke utilisateurs, commandes, menus, etc.             |
| **Services externes** | Paiements, notifications, envoi d’e-mails, etc.      |

## Flux typique d'une interaction

1. Le client s’authentifie (`/auth/login`) → reçoit un token JWT.
2. Il effectue des appels authentifiés (`/menus`, `/orders`, etc.).
3. Le serveur traite les requêtes, valide, et répond.
4. Les actions sont enregistrées pour audit ou statistiques.

## Ce que cette architecture permet

- **Scalabilité** : composants découplés, faciles à faire évoluer.
- **Sécurité** : grâce au JWT, aux statuts HTTP clairs et à la séparation des responsabilités.
- **Maintenance simplifiée** : structure modulaire et logique métier isolée.
