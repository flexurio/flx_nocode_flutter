# Action JSON Documentation

This document outlines the structure and fields of an `Action` object, which is used to define dynamic actions that can be triggered from the UI.

## Action Object

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the action. |
| `type` | String | Yes | The type of action, e.g., "print", "approve". |
| `name` | String | Yes | Display name shown on UI elements like buttons. |
| `http` | Object | No | Optional HTTP configuration for network-based actions. See [HttpData Object](#httpdata-object). |
| `on_success` | String | Yes | Defines behavior on success, e.g., "refresh", "toast". Defaults to `toast`. |
| `on_failure` | String | Yes | Defines behavior on failure, e.g., "show_error_dialog", "toast". Defaults to `toast`. |
| `is_multiple`| Boolean | No | Whether the action can be applied to multiple items. Defaults to `false`. |
| `reference` | String | No | A reference, particularly for `list_json_view_as_table` type. |

---

## Nested Objects

### HttpData Object

Defines the properties of an HTTP request for an action.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `path` | String | Yes | The URL path for the endpoint. |
| `method` | String | Yes | The HTTP method (e.g., "GET", "POST"). |
| `headers` | Object | No | A map of HTTP headers. |
| `body` | Object | No | The request body. |
| `query_params`| Object | No | A map of URL query parameters. |

---

## Example `action.json`

```json
{
  "id": "approve_item",
  "type": "approve",
  "name": "Approve",
  "http": {
    "path": "/items/:id/approve",
    "method": "POST"
  },
  "on_success": "refresh",
  "on_failure": "show_error_dialog",
  "is_multiple": false
}
```
