# Intégration avec Postman

Testez rapidement l’API **Restokit** dans une interface visuelle, sans écrire une seule ligne de code.

## 1. Importer la collection

1. Téléchargez [la collection Postman](../../assets/restokit.postman_collection.json).
2. Dans Postman :
    1. Cliquez sur **_Import_**.
    2. Glissez-déposez le fichier ou cliquez sur **_Upload Files_**.
    3. Validez l'importation.

## 2. Configurer l'environnement'

1. Ouvrez l'onglet **Environnements**.
2. Cliquez sur **_Add_** pour créer un environnement nommé `restokit`.
3. Ajoutez les variables suivantes :  

    | Variable | Valeur Exemple |
    |----------|----------------|
    |`base_url`| `https://api.restokit.io/v1` |
    | `token`  | _(sera rempli après authentification)_ |

4. Enregistrez, puis sélectionnez l’environnement `restokit` (coin supérieur droit).

## 3. S’authentifier

Avant d'appeler d'autres routes, obtenez un token JWT :

1. Dans la collection, ouvrez **`Auth → Login`**.
2. Dans l’onglet **Body**, saisissez votre **email** et **mot de passe**.
3. Cliquez sur **_Send_**.
4. Copiez le champ `access_token` de la réponse.
5. Collez-le dans la variable d'environnement `token`.

## 4. Appeler les routes

Une fois le token configuré :

- Choisissez une requête, ex : `Menus → Liste`.
- Cliquez sur **_Send_**.
- Le token est automatiquement ajouté à l'en-tête `Authorization`.

!!! tip "Tips & bonnes pratiques"
    - Créez plusieurs environnements : dev, staging, prod…
    - Automatisez l’injection du token avec un **script Postman** dans l’onglet `Tests` de `Login` :
        ```javascript
        let token = pm.response.json().access_token;
        pm.environment.set("token", token);
        ```
    - Utilisez l’onglet **`Tests`** pour ajouter des assertions sur les réponses (statuts, contenu…).

## Exemple de test simple

Dans une requête :

```javascript
pm.test("Status 200 OK", function () {
    pm.response.to.have.status(200);
});
```
