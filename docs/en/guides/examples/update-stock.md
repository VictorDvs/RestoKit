# Updating the stock

The API allows you to dynamically update the quantity of an item in stock via the **Python SDK** or through a **direct REST call**.

=== "💻 SDK Python"

    === "Step 1: Authentication"

        ```python
        from restokit import Auth

        auth = Auth()
        token = auth.login("admin@restokit.io", "password")
        ```

    === "Step 2: Update the stock"

        ```python
        from restokit_client.client import get_restokit_client

        client = get_restokit_client(api_key=token.access_token)

        updated = client.stock.update(item_id=42, quantity=10)
        print(f"Stock updated : {updated}")
        ```

=== "🌐 REST API (cURL)"

    === "Step 1: Authentication"

        ```bash
        curl -X POST https://api.restokit.io/v1/auth/login \
             -H "Content-Type: application/json" \
             -d '{
                   "email": "admin@restokit.io",
                   "password": "password"
                 }'
        ```

    === "Step 2: Update the stock"

        ```bash
        curl -X PATCH https://api.restokit.io/v1/stock/42 \
             -H "Authorization: Bearer jwt.token.string" \
             -H "Content-Type: application/json" \
             -d '{
                  "quantity": 10
                 }'
        ```

        Response :

        ```json
        {
          "item_id": 42,
          "new_quantity": 10
        }
        ```

## Best Practices

- Partial updates are supported using the `PATCH` method.

- The quantity field is required.

- If the item does not exist, a `404` status code will be returned.
