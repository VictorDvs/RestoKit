# Creating an order

Here are two approaches to create an order: using the `Python SDK` or the `RESTful API` via HTTP.

=== "💻 SDK Python"

    === "Step 1: Authentication"

        ```python
        from restokit import Auth

        auth = Auth()
        token = auth.login("user@example.com", "your_password")
        print(token.access_token)
        ```

    === "Step 2: Create an order"

        ```python
        from restokit_client.client import get_restokit_client

        client = get_restokit_client(api_key="YOUR_API_KEY")

        order_data = {
            "items": [
                {"menu_id": 5, "qty": 2},
                {"menu_id": 9, "qty": 1}
            ],
            "delivery_type": "delivery",
            "address_id": 12
        }

        order = client.orders.create(order_data)
        print(f"Command created with ID: {order['order_id']}, statut: {order['status']}")
        ```

=== "🌐 REST API (cURL)"

    === "Step 1: Authentication"

        ```bash
        curl -X POST https://api.restokit.io/v1/auth/login \
             -H "Content-Type: application/json" \
             -d '{
                   "email": "user@example.com",
                   "password": "your_password"
                 }'
        ```

        Answer :

        ```json
        {
          "access_token": "jwt.token.string",
          "token_type": "Bearer"
        }
        ```

    === "Step 2: Create the order"

        ```bash
        curl -X POST https://api.restokit.io/v1/orders \
             -H "Authorization: Bearer jwt.token.string" \
             -H "Content-Type: application/json" \
             -d '{
                   "items": [
                     {"menu_id": 5, "qty": 2},
                     {"menu_id": 9, "qty": 1}
                   ],
                   "delivery_type": "delivery",
                   "address_id": 12
                 }'
        ```

        Answer :

        ```json
        {
          "order_id": 1002,
          "status": "in progress"
        }
        ```

## Result

In both cases, an order is created with a unique ID and an initial status (`in progress`, `preparing`, etc.).
