# Error Handling

RestoKit follows REST API best practices by using standard HTTP status codes to indicate errors.  
Each error response includes a clear message in a simple JSON format.

---

## Typical Error Format

```json
{
  "detail": "Clear error message"
}
```

The `detail` field can be used for client-side display or debugging purposes.

## Common Status Codes

| Code  | Meaning               | Common Cause                                             |
| ----- | --------------------- | -------------------------------------------------------- |
| `400` | Bad Request           | Missing parameter, malformed request body                |
| `401` | Unauthorized          | JWT token missing or expired                             |
| `403` | Forbidden             | Authenticated but lacking necessary permissions          |
| `404` | Not Found             | Incorrect endpoint or nonexistent resource               |
| `422` | Unprocessable Entity  | Invalid data (e.g. badly formatted email, missing field) |
| `500` | Internal Server Error | Unhandled exception or unexpected server issue           |

## Client-Side Recommendations

- Watch for `401` errors to trigger re-authentication when needed.

- Gracefully handle `422` errors to provide clear feedback to users.

- `500` errors should not occur during normal use — contact the support team if they persist.
