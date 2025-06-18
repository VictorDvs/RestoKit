# Using the REST API

This section shows you how to interact with the RestoKit API without the SDK — just using classic REST requests.  

Check out all the [available endpoints](../reference/api/openapi.md) to move on to full API calls.

> Using Python? You might prefer the [RestoKit SDK for Python](python.md).

---

## JWT Authentication

Authenticate by sending a `POST` request to `/auth/login` with your credentials:

=== "Request"

    ```bash
    curl -X POST https://api.restokit.io/v1/auth/login \
      -H "Content-Type: application/json" \
      -d '{
        "email": "your.email@example.com",
        "password": "your_password"
        }'
    ```

=== "Response"

    ```json
    {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "token_type": "Bearer"
    }
    ```

    Then use this token in the `Authorization` header of your requests.

## Example: list available menus

```bash
curl  -X GET https://api.restokit.io/v1/menus \
      -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

!!! info ""
    Response: a JSON array with the available menus.

## Most Common Endpoints

|      Resource | Endpoint |
| : ---------: | : ------: |
| Orders | `/orders` |
| Inventory | `/stock` |
| Partners | `/partners` |
| Deliveries | `/delivery` |

All routes require an `Authorization` header with a valid JWT token:

```http
Authorization: Bearer YOUR_JWT_TOKEN
```

## Error Handling

The API uses standard REST practices for errors (HTTP status codes + clear messages):

   ```json
   {
     "error": "Unauthorized",
     "message": "Invalid or expired token."
   }
   ```

Here are some common cases:

| HTTP Code | Meaning                  |
| --------- | ------------------------ |
| 401       | Invalid or missing token |
| 403       | Access denied            |
| 404       | Resource not found       |
| 500       | Server error             |
