# 🗒️ Changelog

RestoKit version history — latest changes, new features, and bug fixes.

## [1.4.0] - 2025-06-01

=== "Added"

    - Initial support for WebSocket notifications for real-time order updates.
    - New GET /kitchen/orders/next route for kitchen queue management.
    - Pagination support added to GET /orders.

=== "Changed"

    - Refactored authentication logic with a clear split between client and partner access.
    - Improved CORS header handling for public front-end calls.

=== "Fixed"

    - Fixed a bug preventing stock updates when deleting multiple items at once.
    - Resolved an encoding issue in the notes field of orders.

## [1.3.2] - 2025-05-15

=== "Fixed"

    - JWT token became invalid after refresh in certain load balancer conditions.
    - The quantity parameter in PATCH /stock/items/{id} accepted negative values.

## [1.3.0] - 2025-05-01

=== "Added"

    - New GET /delivery/zones endpoint to dynamically fetch active delivery zones.
    - New estimated_ready_time field added to order responses.

=== "Changed"

    - OpenAPI documentation updated for all delivery-related endpoints.
    - Server timeout increased to 10s (previously 5s) for critical endpoints.

## [1.2.0] - 2025-04-15

=== "Added"

    - POST /auth/refresh endpoint to refresh JWT tokens.
    - OAuth2 authentication support for technical partners.

## [1.0.0] - 2025-04-01

🎉 First stable release of RestoKit!

- JWT-based authentication

- Full stock, order, kitchen, and delivery management

- Complete documentation with Python, curl, and Postman examples

- Local deployment via Docker

- CI/CD integration with GitHub Actions

## Pre-release versions

Alpha and beta versions were tested in private environments between January and March 2025.
Thanks to our early testers for their valuable feedback.
