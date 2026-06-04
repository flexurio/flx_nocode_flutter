# HTTP-based Action Visibility

This document outlines the structure of the `visibility_http` configuration within an `Action` object (`ActionD`). It is used to conditionally show or hide action buttons based on the response of a dynamic HTTP request.

---

## 1. Schema Properties

The `visibility_http` object consists of two main blocks:

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `http` | Object | Yes | [HttpData](./http_data.md) configuration to fetch the visibility criteria. |
| `rule` | Object | No | A [Rule](./actions.md#4-rule-based-visibility) object evaluated against the HTTP response payload to decide visibility. |

---

## 2. Behavior and Evaluation

1. **HTTP Request Execution**: The request is triggered dynamically using the provided `http` block. All system variables (e.g. `{{auth_token}}`, `{{user_id}}`) and row/context values (e.g. `{{data.id}}`) are resolved at runtime.
2. **Result Caching**: To prevent UI performance lag and redundant requests, calls are automatically cached using a unique key derived from the request configuration (Method + URL + Body).
3. **Visibility Rule Checking**:
   - If a `rule` is specified, the JSON response body is evaluated against the rule. If the rule matches, the action button is displayed.
   - If no `rule` is specified, the button is shown by default if the HTTP request succeeds (`statusCode` between 200-299) and the data returned is not empty (e.g., a non-empty list or map).

---

## 3. Configuration Example

### Showing a Button if a User Belongs to a Department

The following config hits the department endpoint for the current user and checks if the department ID is `DR` (Direksi) by verifying if the returned data is not empty:

```json
{
  "id": "edit_document_review_detail",
  "type": "open_page",
  "name": "Edit Detail",
  "icon": "Edit",
  "layout_form_id": "edit_document_review_detail",
  "visibility_http": {
    "http": {
      "method": "GET",
      "url": "{{backend_host}}/users/departments?nip.eq={{user_id}}&page=1&search=&sort=name&ascending=true&limit=90000&department_id.eq=DR",
      "headers": {
        "Authorization": "Bearer {{auth_token}}"
      },
      "body": {},
      "use_form_data": false
    },
    "rule": {
      "all": [
        {
          "field": "data",
          "op": "is_not_empty"
        }
      ]
    }
  }
}
```
