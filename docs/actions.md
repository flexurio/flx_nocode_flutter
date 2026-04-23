# Action JSON Documentation

This document outlines the structure of the `Action` object (`ActionD`), used to define dynamic behaviors triggered from the UI such as buttons, table row actions, and primary actions.

---

## 1. Action Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the action. |
| `type` | String | Yes | The type of behavior (see [Supported Types](#2-supported-types)). |
| `name` | String | Yes | Display text for the action button. |
| `icon` | String | No | Material Icon name (e.g., `check`, `print`, `visibility`). |
| `icon_color` | String | No | Hex color code for the icon (e.g., `#4CAF50`). |
| `http` | Object | No | [HttpData](./http_data.md) configuration if the action involves a network request. |
| `on_success` | String | No | Behavior on success: `toast`, `refresh`, `navigate_back`, `navigate_home`, `show_success_dialog_with_data`. |
| `on_failure` | String | No | Behavior on failure: `toast`, `show_error_dialog`. |
| `is_multiple`| Boolean | No | If `true`, this action is enabled when multiple items are selected in a table. |
| `rule` | Object | No | A [Rule](#4-rule-based-visibility) object to determine if this action is visible for a specific row. |
| `layout_form_id`| String| No* | The ID of the form layout to open (required for `open_page` or `show_dialog`). |
| `width` | Double | No | Custom width for the dialog or side panel (default depends on platform). |
| `confirm_title`| String | No | Title for the confirmation dialog (for `show_confirmation_dialog`). |
| `confirm_message`| String| No | Message for the confirmation dialog. |
| `target_variable`| String| No | Name of the variable to store the result in (for `set_variable` or `http` results). |
| `value` | String | No | The value to set (supports JS interpolation for `set_variable`). |
| `permission` | String | No | Override permission key. Default is `{entity_id}_{action_id}`. |
| `export_format`| String | No | Format for export actions: `pdf`, `excel`, `csv`. |
| `export_columns`| Array | No | List of columns to export `[{ "header": "Name", "body": "field_ref" }]`. |

---

## 2. Supported Types

| Type | Description | Required Parameters |
| --- | --- | --- |
| `http` | Executes a network request. | `http` |
| `open_page` | Navigates to a new page using a specific layout. | `layout_form_id` |
| `show_dialog` | Opens a modal dialog. | `layout_form_id` |
| `show_confirmation_dialog` | Shows a confirmation prompt before execution. | `confirm_title`, `confirm_message` |
| `export` | Exports data to a file (Excel/PDF). | `export_format`, `http` (to fetch data) |
| `set_variable` | Updates a local state variable. | `target_variable`, `value` |
| `append_variable` | Appends a value to a local state list. | `target_variable`, `value` |
| `refresh` | Reloads the current entity data. | - |
| `toast` | Shows a simple notification. | `name` (as message) |
| `navigate_home` | Returns the user to the dashboard. | - |
| `navigate_back` | Navigates to the previous screen. | - |
| `print` | Triggers a PDF print workflow. | `http` (to fetch print data) |
| `list_json_view_as_table` | Renders nested JSON as a sub-table. | `reference` (field name) |

---

## 3. Action Contexts

Actions can be defined in three main areas within an entity configuration:

### `actions` (Row Actions)
Displayed as buttons on each row of a table. These actions have access to the current row's `data`.
```json
"actions": [
  { "id": "edit", "type": "open_page", "layout_form_id": "update", "name": "Edit" }
]
```

### `actions_home` (Global Actions)
Displayed at the top of the entity page (e.g., Create, Export All). These actions use global `filters` or state as their context.
```json
"actions_home": [
  { "id": "create", "type": "open_page", "layout_form_id": "create", "name": "Create" }
]
```

### `action_primary`
The default action triggered when a row is clicked/tapped. Usually set to `view` or `edit`.

---

## 4. Rule-based Visibility

The `rule` object allows you to hide or show actions based on the data of the selected row.

### Structure
A rule consists of `all` (AND), `any` (OR), or `not` (NOT) groups of conditions.

| Key | Operator | Example |
| --- | --- | --- |
| `op` | `=`, `!=`, `>`, `>=`, `<`, `<=`, `in`, `not_in`, `is_empty`, `is_not_empty`, `contains` | `"op": "="` |

### Example: Show "Approve" only for "PENDING" status
```json
"rule": {
  "all": [
    {
      "field": "status",
      "op": "=",
      "value": "PENDING"
    }
  ]
}
```

---

## 5. Templating & Variables

You can use `{{ ... }}` syntax in many properties (URLs, Headers, Body, `value`) to access dynamic data.

- `{{data.field_name}}`: Access fields from the current row.
- `{{form.field_name}}`: Access fields from the current form state.
- `{{auth_token}}`: Injected automatically for Authorization headers.
- `{{backend_host}}`: Current flavor's backend URL.

---

## 6. Comprehensive Example

### Confirmation with HTTP Request & Refresh
```json
{
  "id": "cancel_order",
  "type": "show_confirmation_dialog",
  "name": "Cancel Order",
  "icon": "cancel",
  "icon_color": "#F44336",
  "confirm_title": "Cancel Order #{{data.order_no}}?",
  "confirm_message": "This action cannot be undone. Do you want to proceed?",
  "http": {
    "method": "PUT",
    "url": "{{backend_host}}/orders/{{data.id}}/cancel",
    "headers": { "Authorization": "Bearer {{auth_token}}" },
    "body": { "reason": "User cancelled" }
  },
  "on_success": "refresh",
  "on_failure": "toast",
  "rule": {
    "all": [
      { "field": "status", "op": "in", "value": ["DRAFT", "OPEN"] }
    ]
  }
}
```
