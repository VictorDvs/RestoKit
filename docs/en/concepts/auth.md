# Authentication

The RestoKit API uses JWT tokens to secure access to its endpoints.  
Each request to a protected resource must include a valid token in the `Authorization` header.

---

## Obtaining a Token

Send a `POST` request to the `/auth/login` endpoint with your credentials.

=== "Request Example"

    ```bash
    curl -X POST https://api.restokit.io/v1/auth/login \
     -H "Content-Type: application/json" \
     -d '{
           "email": "admin@restokit.io",
           "password": "yourpassword"
         }'
    ```

=== "Expected Response"

    ```json
    {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "token_type": "Bearer"
    }
    ```

## Making an Authenticated Request

Include the JWT token in the `Authorization` header of your requests:

```bash
curl -X GET https://api.restokit.io/v1/menus \
     -H "Authorization: Bearer YOUR_TOKEN"
```

!!! note ""
    The Bearer prefix is required.

## Token Lifetime

- Token is valid for: 30 minutes

- No automatic refresh (`/refresh-token` is not available)

- Users must re-authenticate once the token expires

## Best Practices

- Store the token on the client side (an HTTP-only cookie is recommended for web apps).

- Plan for expiration with a silent re-login mechanism if needed.

- Always check for HTTP `401` errors to detect expired or invalid tokens.
