# Changelog

Historique des versions de RestoKit — dernières évolutions, nouvelles fonctionnalités et correctifs.

## [1.4.0] - 2025-06-01

=== "Ajouté"

    - Support initial des **notifications WebSocket** pour les mises à jour de commandes en temps réel.
    - Nouvelle route `GET /kitchen/orders/next` pour la gestion des files d’attente en cuisine.
    - Prise en charge de la **pagination** sur `GET /orders`.

=== "Changé"

    - Refactorisation de la logique d’authentification : séparation claire entre accès client et partenaire.
    - Meilleure gestion des en-têtes CORS pour les appels front-end publics.

=== "Corrigé"

    - Correction d’un bug empêchant la mise à jour du stock lors de suppressions multiples.
    - Résolution d’un problème d’encodage sur les champs `notes` dans les commandes.

---

## [1.3.2] - 2025-05-15

=== "Corrigé"

    - Token JWT invalide après un rafraîchissement dans certaines conditions de load balancer.
    - Paramètre `quantity` dans `PATCH /stock/items/{id}` acceptait des valeurs négatives.

---

## [1.3.0] - 2025-05-01

=== "Ajouté"

    - Endpoint `GET /delivery/zones` pour récupérer dynamiquement les zones de livraison actives.
    - Nouveau champ `estimated_ready_time` dans la réponse des commandes.

=== "Changé"

    - Mise à jour de la documentation OpenAPI pour tous les endpoints de livraison.
    - Ajustement du timeout serveur à 10s (anciennement 5s) pour les endpoints critiques.

---

## [1.2.0] - 2025-04-15

=== "Ajouté"

    - Endpoint `POST /auth/refresh` pour rafraîchir les tokens JWT.
    - Support de l’authentification OAuth2 pour les partenaires.

---

## [1.0.0] - 2025-04-01

🎉 Première version stable de RestoKit !

- Authentification JWT
- Gestion des stocks, commandes, cuisines et livraisons
- Documentation complète avec exemples Python, `curl` et Postman
- Déploiement local via Docker
- Intégration CI/CD avec GitHub Actions

---

## Versions préliminaires

Des versions alpha et beta ont été testées en environnement privé entre janvier et mars 2025. Merci à nos premiers testeurs pour leurs retours précieux.
