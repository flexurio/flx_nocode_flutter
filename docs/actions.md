# Action JSON Documentation

This document outlines the structure of the `Action` object (`ActionD`), used to define dynamic behaviors triggered from the UI (buttons, table rows, etc.).

## Action Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the action. |
| `type` | String | Yes | The type of behavior (see [Supported Types](#supported-types)). |
| `name` | String | Yes | Display text for the action button. |
| `icon` | String | No | Icon name (e.g., `check`, `print`). |
| `icon_color` | String | No | Hex color code for the icon. |
| `http` | Object | No | `HttpData` config if the action involves a network request. |
| `on_success` | String | No | Behavior on success: `toast`, `refresh`, `navigate_back`, etc. |
| `on_failure` | String | No | Behavior on failure: `toast`, `show_error_dialog`. |
| `is_multiple`| Boolean | No | If `true`, this action is enabled when multiple items are selected. |
| `rule` | Object | No | A `Rule` to determine if this action is visible for a specific row. |
| `confirm_title`| String | No | Title for the confirmation dialog (if type is `show_confirmation_dialog`). |
| `confirm_message`| String| No | Message for the confirmation dialog. |
| `layout_form_id`| String| No | The ID of the form to open (for `open_page` or `show_dialog`). |
| `target_variable`| String| No | Name of the variable to store the result in. |
| `value` | String | No | The value to set (for `set_variable`). |

---

## Supported Types

| Type | Description |
| --- | --- |
| `http` | Executes a network request defined in the `http` property. |
| `open_page` | Navigates to a new page using the form specified in `layout_form_id`. |
| `show_dialog` | Opens a modal dialog using the form specified in `layout_form_id`. |
| `show_confirmation_dialog` | Shows a Yes/No dialog before proceeding. |
| `toast` | Shows a simple notification. |
| `refresh` | Reloads the current entity data. |
| `navigate_home` | Returns the user to the dashboard. |
| `navigate_back` | Navigates to the previous screen. |
| `print` | Triggers a print operation for the selected item. |
| `list_json_view_as_table` | Renders a nested JSON list as a secondary table. |
| `show_success_dialog_with_data` | Shows a detailed success modal with copyable data. |
| `set_variable` | Updates a value in the local state. |

---

## Example Action

```json
{
  "id": "approve_request",
  "type": "show_confirmation_dialog",
  "name": "Approve",
  "icon": "check",
  "icon_color": "#4CAF50",
  "confirm_title": "Approve Request?",
  "confirm_message": "Are you sure you want to approve this document?",
  "http": {
    "method": "POST",
    "path": "/api/requests/:id/approve"
  },
  "on_success": "refresh"
}
```
