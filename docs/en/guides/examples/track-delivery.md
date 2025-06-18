# Tracking a delivery

Allows you to check the **delivery status** of an existing order, either via the Python SDK or through a direct REST API call.

=== "💻 SDK Python"

    === "Step 1: Authentication"

        ```python
        from restokit import Auth

        auth = Auth()
        token = auth.login("user@restokit.io", "password")
        ```

    === "Step 2: Track Delivery"

        ```python
        from restokit_client.client import get_restokit_client

        client = get_restokit_client(api_key=token.access_token)

        delivery = client.delivery.get_status(order_id=1002)
        print(f"Order #{delivery['order_id']} - status : {delivery['status']}")
        ```

=== "🌐 REST API (cURL)"

    === "Step 1: Authentication"

        ```bash
        curl -X POST https://api.restokit.io/v1/auth/login \
            -H "Content-Type: application/json" \
            -d '{
                "email": "user@restokit.io",
                "password": "password"
                }'
        ```

    === "Step 2: Track Delivery"

        ```bash
        curl -X GET https://api.restokit.io/v1/delivery/status/1002 \
             -H "Authorization: Bearer jwt.token.string"
        ```

        Response :

        ```json
        {
          "order_id": 1002,
          "status": "out for delivery"
        }
        ```

## Tips

- Possible statuses include: `prepared`, `out for delivery`, `delivered`, `canceled`.

- The endpoint returns a `404` error if the order doesn’t exist or has no associated delivery.

- Authentication is required.
