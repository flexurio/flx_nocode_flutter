# HttpData JSON Documentation

`HttpData` is a reusable configuration object used to define network requests within the NOCode framework. It is used in [Entity Backend](./entity.md#backend-object), [Field Options](./field.md#field-options-object), and [Actions](./actions.md).

---

## 1. Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `method` | String | Yes | HTTP Method: `GET`, `POST`, `PUT`, `DELETE`, `PATCH`. |
| `url` | String | Yes | The full URL or path. Supports templating (e.g., `{{backend_host}}/users`). |
| `headers` | Map | No | A map of key-value pairs for HTTP headers. |
| `body` | Map/List | No | The request payload. Supports nested objects and templating. |
| `use_form_data`| Boolean | No | If `true`, the body is sent as `multipart/form-data`. Useful for file uploads. |
| `mock_enabled` | Boolean | No | If `true`, the system returns `mock_data` instead of making a real request. |
| `mock_data` | Dynamic | No | The data to return when mocked. |

---

## 2. Templating in HttpData

Properties like `url`, `headers`, and `body` support **String JS Interpolation**.

### Common Variables
- `{{auth_token}}`: Injects the current user's session token.
- `{{backend_host}}`: The base URL defined in the current application flavor.
- `{{data.id}}`: Accesses the ID of the current row (when used in a row action).
- `{{form.field_name}}`: Accesses the current value of a form field.

### Example: Authorization Header
```json
"headers": {
  "Authorization": "Bearer {{auth_token}}",
  "Content-Type": "application/json"
}
```

---

## 3. Usage Examples

### Simple GET Request
```json
{
  "method": "GET",
  "url": "{{backend_host}}/categories?status=active",
  "headers": { "Authorization": "Bearer {{auth_token}}" }
}
```

### POST with Body and Variables
```json
{
  "method": "POST",
  "url": "{{backend_host}}/orders",
  "headers": { "Authorization": "Bearer {{auth_token}}" },
  "body": {
    "product_id": "{{data.id}}",
    "quantity": "{{form.qty}}",
    "notes": "Order placed via mobile app"
  }
}
```

### File Upload (Form Data)
```json
{
  "method": "POST",
  "url": "{{backend_host}}/upload",
  "use_form_data": true,
  "body": {
    "file": "{{form.picked_file}}",
    "category": "documents"
  }
}
```
