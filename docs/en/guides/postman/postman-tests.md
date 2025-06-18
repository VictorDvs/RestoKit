# Postman Integration

Quickly test the `Restokit API` in a visual interface — no code required.

## 1. Import the collection

1. Download [The Postman collection](../../assets/restokit.postman_collection.json).
2. In Postman:
    1. Click **_Import_**.
    2. Drag and drop the file or click **_Upload files_**.
    3. Confirm the import.

## 2. Set Up the Environment

1. Open the **_Environments_** tab.
2. Click **_Add_** to create a new environment named `restokit`.
3. Add the following variables:

    | Variable | Example Value |
    | --------- | --------------- |
    | `base_url` | `https: // api.restokit.io/v1` |
    | `token` | _(will be filled after login)_ |

4. Save, then select the `restokit` environment (top right corner).

## 3. Authenticate

Before calling any routes, get a JWT token:

1. In the collection, open `Auth → Login`.
2. In the **Body** tab, enter your **email** and **password**.
3. Click **_Send_**.
4. Copy the `access_token` from the response.
5. Paste it into the `token` environment variable.

## 4. Call the Routes

Once the token is set:

- Choose a request, e.g., `Menus → List`.
- Click **_Send_**.
- The token is automatically included in the `Authorization` header.

!!! Tip "Tips & Best Practices"
    - Create multiple environments: dev, staging, production, etc.
    - Automate token injection with a Postman script in the `Tests` tab of `Login`:
        ```javascript
        let token = pm.response.json().access_token;
        pm.environment.set("token", token);
        ```
    - Use the `Tests` tab to add assertions on responses (status codes, content, etc.).

## Example of a Simple Test

In a request:

```javascript
pm.test("Status 200 OK", function () {
    pm.response.to.have.status(200);
});
```
