# Action JSON Documentation

This document outlines the structure of the `Action` object (`ActionD`), used to define dynamic behaviors triggered from the UI such as buttons, table row actions, and primary actions.

---

## 1. Action Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the action. |
| `type` | String | Yes | The type of behavior (see [Supported Types](#2-supported-types)). |
| `name` | String | Yes | Display text for the action button. |
| `icon` | String | No | Icon name matching one of the supported keys (e.g., `Edit`, `Delete`, `Visibility`). See [Available Icons](#available-icons) below. |
| `icon_color` | String | No | Hex color code for the icon (e.g., `#4CAF50`), or a color name like `red`. |
| `http` | Object | No | [HttpData](./http_data.md) configuration if the action involves a network request. |
| `on_success` | String \| Array\<String\> | No | Behavior(s) on success. Must be a **plain string** or **array of strings**. Valid values: `toast`, `refresh`, `navigate_back`, `navigate_home`, `navigate_home`, `clear_form`, `show_success_dialog_with_data`. |
| `on_failure` | String \| Array\<String\> | No | Behavior(s) on failure. Must be a **plain string** or **array of strings**. Valid values: `toast`, `show_error_dialog`, `navigate_back`. |
| `is_multiple`| Boolean | No | If `true`, this action is enabled when multiple items are selected in a table. |
| `rule` | Object | No | A [Rule](#4-rule-based-visibility) object to determine if this action is visible for a specific row. |
| `layout_form_id`| String| No* | The ID of the form layout to open (required for `open_page` or `show_dialog`). |
| `layout_print_id`| String| No* | The ID of the print layout to use (required for `print`). |
| `width` | Double | No | Custom width for the dialog or side panel (default depends on platform). |
| `confirm_title`| String | No | Title for the confirmation dialog (for `show_confirmation_dialog`). |
| `confirm_message`| String| No | Message for the confirmation dialog. |
| `target_variable`| String| No | Name of the variable to store the result in (for `set_variable` or `http` results). |
| `value` | String | No | The value to set (supports JS interpolation for `set_variable`). |
| `permission` | String | No | Override permission key. Default is `{entity_id}_{action_id}`. |
| `export_format`| String | No | Format for export actions: `pdf`, `excel`, `csv`. |
| `export_columns`| Array | No | List of columns to export `[{ "header": "Name", "body": "field_ref" }]`. |
| `show_submit_button`| Boolean | No | Whether to show the submit button (default `true`) in layout forms opened by this action. |
| `print` | Boolean | No | For PDF action type `display_pdf`: whether to allow printing (default `true`). |
| `download` | Boolean | No | For PDF action type `display_pdf`: whether to allow downloading (default `true`). |

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
| `remove_variable` | Removes a value from a local state list (matches by content). | `target_variable` |
| `refresh` | Reloads the current entity data. | - |
| `toast` | Shows a simple notification. | `name` (as message) |
| `navigate_home` | Returns the user to the dashboard. | - |
| `navigate_back` | Navigates to the previous screen. | - |
| `print` | Triggers a PDF print workflow. | `layout_print_id`, `http` (optional) |
| `list_json_view_as_table` | Renders nested JSON as a sub-table. | `reference` (field name) |
| `update_row` | Updates the data of the current row in a table. | `reference` (optional field name) |

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

## 5. `on_success` / `on_failure` Format Rules

> **⚠️ Note:** `on_success` and `on_failure` on an `ActionD` (row actions, home actions, primary action) must be a **plain string** or an **array of strings**.

```json
"on_success": "refresh"
```
```json
"on_success": ["refresh", "toast"]
```

### Context distinction

There are **two different parsers** for `on_success` in this system:

| Context | Parser | `on_success` format |
|---|---|---|
| `ActionD` (row/home/primary actions) | `ActionD.fromJson` | **String** or **Array\<String\>** |
| `SubmitWorkflow` (inside `submit_workflow`) | `SubmitWorkflow.fromMap` → `WorkflowAction.fromMap` | **Array\<WorkflowAction object\>** |

The `submit_workflow.on_success` uses full `WorkflowAction` objects (e.g. `{ "type": "close_modal" }`, `{ "type": "refresh" }`) because it has access to the full workflow engine. The `ActionD.on_success` is a simpler post-action handler that only resolves string identifiers.

---

## 6. Templating & Variables

You can use `{{ ... }}` syntax in many properties (URLs, Headers, Body, `value`) to access dynamic data.

- `{{data.field_name}}`: Access fields from the current row.
- `{{form.field_name}}`: Access fields from the current form state.
- `{{auth_token}}`: Injected automatically for Authorization headers.
- `{{backend_host}}`: Current flavor's backend URL.

---

## 7. Comprehensive Example

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

### Print Action (Global/Home)
This example shows a "Print Report" action placed in `actions_home` that uses a specific layout.
```json
{
  "id": "print_report",
  "type": "print",
  "name": "Print Monthly Report",
  "icon": "print",
  "layout_print_id": "monthly_report_layout",
  "http": {
    "method": "GET",
    "url": "{{backend_host}}/reports/monthly?period={{form.period}}",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  }
}
```

### Interactive List using `append_variable`
This example demonstrates how to capture input from a form and append it to a local list variable, which can then be displayed in a table.

```json
{
  "id": "add_to_inventory",
  "type": "append_variable",
  "name": "Add to List",
  "target_variable": "inventory_items"
}
```
*Note: The table displaying this data should have `"reference_id": "inventory_items"`.*

### Interactive List Removal using `remove_variable`
This example demonstrates how to remove an item from a local list variable when a row action is triggered.

```json
{
  "id": "remove_from_inventory",
  "type": "remove_variable",
  "name": "Delete",
  "target_variable": "inventory_items",
  "icon": "delete"
}
```

### Reactive Table Row Update using `update_row`
This example shows how to use a dropdown inside a table to update a specific field in the row.

```json
{
  "id": "dic_dropdown",
  "type": "dropdown",
  "on_change": {
    "type": "update_row",
    "reference": "department_id"
  }
}
```
When a value is selected in this dropdown, it will update the `department_id` field in the current table row and notify the parent form of the change.

---

## Available Icons

The `icon` value must exactly match one of the following keys (case-sensitive):

| Key | Description |
|---|---|
| `Add` | Plus / Add |
| `Edit` | Pencil / Edit |
| `Delete` | Trash / Delete |
| `Print` | Printer |
| `Save` | Save |
| `Search` | Magnifier |
| `Refresh` | Refresh / Reload |
| `Home` | House / Home |
| `Settings` | Gear |
| `Table` | Table / Grid |
| `List` | List |
| `Visibility` | Eye / View |
| `Upload` | Upload Arrow |
| `Download` | Download Arrow |
| `Check` | Checkmark |
| `Close` | X / Close |
| `Info` | Info Circle |
| `Warning` | Warning Triangle |
| `Error` | Error Circle |
| `Open in New` | Open External |
| `Launch` | Launch |
| `Touch App` | Touch / Hand |
| `Person` | Person |
| `Email` | Envelope |
| `Phone` | Phone |
| `Location` | Map Pin |
| `Date` | Calendar |
| `Time` | Clock |
