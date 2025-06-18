# Frequent questions

Welcome to the Restokit FAQ. Here are the answers to the most common questions about the use of our API and SDK.

We update this FAQ regularly. If an answer is missing, do not hesitate to tell us.

---

## **Authentication**

???+ "How to get an API key?"
    Connect to your Restokit partner space. You will find a key in the **API tab > Access keys**.

???+ "What is the difference between the sandbox and production keys?"
    - **Sandbox**: For tests, data is not real.
    - **Production**: For real orders, deliveries and payments.

---

## **Tests and environments**

???+ "Can I use the API without a key?"
    No. All requests must include an API key in the `Authorization` header.

???+ "How to simulate an order in the test environment?"
    Use your **sandbox key**, and create a command via the `POST /orders` endpoint. Deliveries and payments are simulated automatically.

---

## **Frequent errors**

???+ "I receive a 401 error (Unauthorized)"
    Check that:

    - Your API key is correct.
    - You use the right environment (sandbox VS production).
    - The format of the header is `Authorization: Bearer YOUR_KEY`.

???+ "I get a 422 error (Unprocessable Entity)"
    This means that the structure or data of your request is invalid. Check the JSON format sent (e.g. missing fields, incorrect types).

---

## **SDK Python**

???+ "Is the SDK mandatory?"
    No. You can interact with the API using plain HTTP (e.g. via `curl`, Postman or `requests`).

???+ "How to install the SDK?"
    Run the following command:

    ```bash
    pip install restokit
    ```

???+ "How to initialize the SDK?"
    Run the following command:

    ```python
    from restokit import Client
    client = Client(api_key="YOUR_API_KEY")
    ```

---

## **Commands and stock**

???+ "Can I modify an order after creation?"
    No. Once created, an order can only be modified in a very limited time (as long as it is still in pending status). Consult the `PATCH /orders/{id}` endpoint for accepted cases.

???+ "How to update stock levels?"
    Use the `PATCH /stock/items/{id}` endpoint or the `client.stock.update_item()` method in the SDK.

---

## **Third-party tools**

???+ "Do you have a Postman collection?"
    Yes. You can [download it here](../assets/restokit.postman_collection.json).

???+ "Is the API compatible with Swagger or OpenAPI?"
    Yes. OpenAPI documentation is available at the URL: `https://api.restokit.io/docs`.

---

## **Assistance**

???+ "Where to ask my technical questions?"
    - Open a GitHub issue if you use the SDK.
    - Contact us by e-mail to `support@restokit.io`.
    - Consult our Slack Partners space (by invitation).

---

## **Tips**

- To duplicate an order in the SDK: use `customer.orders.duplicate (order_id)`.

- To filter orders by status: `client.orders.list(status="delivered")`.

- Use the `X-Restokit-Debug: true` header to activate the detailed logs in sandbox mode.
