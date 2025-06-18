# 🚀 Quick Start

Try RestoKit in just a few minutes. Choose your preferred method (SDK, API, or Postman) and start making your first calls now.

---

## 1. Install and Connect

=== "💻 Using the Python SDK"

    ```bash
    pip install restokit
    ```

    ```python
    from restokit import Client

    client = Client(api_key="YOUR_API_KEY")
    ```

    !!! success "You're connected"
        The client is ready to make requests.

=== "🌐 Using the REST API (curl)"

    ```bash
    curl -X GET https://api.restokit.io/v1/menus \
         -H "Authorization: Bearer YOUR_JWT_TOKEN"
    ```

    !!! info
        You can obtain a JWT token via `/auth/login` (see below).

=== "📫 Test with Postman"

    1. Import the [RestoKit Postman collection](assets/restokit.postman_collection.json).
    2. Set the `base_url` variable:  
        `https: // api.restokit.io/v1`.
    3. Add your **JWT** in the **Authorization** tab.

---

## 2. Get an Access Token

=== "💻 Python SDK"

    ```python
    from restokit import Auth

    auth = Auth()
    token = auth.login("admin@restokit.io", "your_password")
    print(token.access_token)
    ```

=== "🌐 REST API (curl)"

    ```bash
    curl -X POST https://api.restokit.io/v1/auth/login \
         -H "Content-Type: application/json" \
         -d '{
               "email": "admin@restokit.io",
               "password": "your_password"
             }'
    ```

    Response :

    ```json
    {
      "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "token_type": "Bearer"
    }
    ```

---

## 3. Make Your First Call

=== "💻 Python SDK"

    ```python
    orders = client.orders.list()
    for order in orders:
        print(order)
    ```

=== "🌐 REST API (curl)"

    ```bash
    curl -X GET https://api.restokit.io/v1/orders \
         -H "Authorization: Bearer YOUR_JWT_TOKEN"
    ```

!!! success ""
    You are now successfully querying the RestoKit API.

---

## 4. Postman Option

- Import the collection.
- Set your variables (`base_url`, `token`).
- Test all endpoints in just a few clicks.

---

## What’s Next?

You're ready to use RestoKit. Continue with the full installation or explore the API:

> [📘 Full Installation](install/python.md) · [📚 All Endpoints](reference/api/openapi.md)
