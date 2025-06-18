# Questions fréquentes

Bienvenue dans la FAQ de **RestoKit**. Vous y trouverez des réponses aux questions les plus courantes sur l’utilisation de notre API et SDK.

Cette FAQ est mise à jour régulièrement. Si une réponse manque, [contactez-nous](mailto:support@restokit.io).

---

## **Authentification**

???+ "Comment obtenir une clé API ?"
      Connectez-vous à votre espace partenaire RestoKit. Vous trouverez une clé dans l’onglet **API > Clés d'accès** pour générer une clé.

???+ "Quelle est la différence entre les clés Sandbox et Production ?"
    - **Sandbox** : environnement de test, données fictives.
    - **Production** : commandes réelles, paiements effectifs.

---

## **Tests et environnements**

???+ "Puis-je utiliser l’API sans clé ?"
    Non. Chaque requête doit inclure l’en-tête `Authorization: Bearer VOTRE_CLE_API`.

???+ "Comment simuler une commande en l’environnement de test ?"
    Utilisez votre **clé sandbox**, puis effectuez un `POST /orders`. Le traitement (livraison, paiement) est automatiquement simulé.

---

## **Erreurs fréquentes**

???+ "Je reçois une erreur 401 (Unauthorized)"
    Vérifiez :

    - La validité de votre clé API.
    - L’environnement utilisé (sandbox ou production).
    - Le format exact de l'en-tête : `Authorization: Bearer VOTRE_CLE`.

???+ "J’obtiens une erreur 422 (Unprocessable Entity)"
    L’API ne peut pas traiter votre requête. Assurez-vous que :

    - Tous les champs requis sont présents.
    - Le format des données est correct (types, valeurs, JSON bien formé).

---

## **SDK Python**

???+ "Le SDK est-il obligatoire ?"
    Non. Vous pouvez interagir directement avec l’API via HTTP (ex : via `curl`, Postman, `requests`).

???+ "Comment installer le SDK ?"
    ```bash
    pip install restokit
    ```

???+ "Comment initialiser le SDK ?"
    ```python
    from restokit import Client
    client = Client(api_key="VOTRE_CLE_API")
    ```

---

## **Commandes et stock**

???+ "Puis-je modifier une commande après sa création ?"
    Non, sauf si elle est encore en statut `pending`. Dans ce cas, utilisez `PATCH /orders/{id}` pour effectuer une mise à jour limitée.

???+ "Comment mettre à jour le stock ?"
    - API : `PATCH /stock/items/{id}`
    - SDK : `client.stock.update_item(...)`

---

## **Outils tiers**

???+ "Avez-vous une collection Postman ?"
    Oui. Télécharger-la [ici](../assets/restokit.postman_collection.json).

???+ "Votre API est-elle compatible OpenAPI / Swagger ?"
    Oui. La documentation complète est disponible à : `https://api.restokit.io/docs`.

---

## **Support**

???+ "Où poser mes questions techniques ?"
    - Ouvrez une **issue GitHub** (si vous utilisez le SDK).
    - Écrivez-nous à : [support@restokit.io](mailto:support@restokit.io)
    - Rejoignez notre **Slack partenaires** (sur invitation).

---

## **Astuces**

- Dupliquer une commande :

```python
client.orders.duplicate(order_id)
```

- Filtrer les commandes par statut :

```python
client.orders.list(status="delivered")
```

- Afficher les logs détaillés en sandbox :  
    Envoyez l’en-tête `X-RestoKit-Debug: true` dans vos requêtes.
