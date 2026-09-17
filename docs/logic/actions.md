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
| `confirm_title`| String | No | Title for the confirmation dialog (for `show_confirmation_dialog` or `workflow`). |
| `confirm_message`| String| No | Message for the confirmation dialog (for `show_confirmation_dialog` or `workflow`). |
| `target_variable`| String| No | Name of the variable to store the result in (for `set_variable` or `http` results). |
| `value` | String | No | The value to set (supports JS interpolation for `set_variable`). |
| `permission` | String | No | Override permission key. Default is `{entity_id}_{action_id}`. |
| `export_format`| String | No | Format for export actions: `pdf`, `excel`, `csv`. |
| `export_columns`| Array | No | List of columns to export `[{ "header": "Name", "body": "field_ref" }]`. |
| `popup` | Boolean | No | If `true`, opening a layout form via `open_page` will automatically open it inside a modal dialog popup with a close button (**X** icon). Popups automatically cover full-screen backdrop including top navbar and sidebar. (Also supports `is_popup: true`). |
| `submit_button` | Boolean | No | Alias for `show_submit_button`. Controls whether bottom action buttons (Cancel / Submit bar) are shown in layout forms opened by this action. Default is `true`. Set to `false` to hide bottom action buttons. |
| `show_submit_button`| Boolean | No | Whether to show the submit button (default `true`) in layout forms opened by this action. |
| `print` | Boolean | No | For PDF action type `display_pdf`: whether to allow printing (default `true`). |
| `download` | Boolean | No | For PDF action type `display_pdf`: whether to allow downloading (default `true`). |
| `success_title` | String | No | Title for success dialog when using `on_success: "show_success_dialog_with_data"`. Supports JS interpolation. Default: `"Success"`. |
| `success_message` | String | No | Message body for success dialog. Supports JS interpolation (e.g. `With ID: {{data.id}}`). |
| `copy_label` | String | No | Button label for copy button in success dialog (e.g. `"Copy ID"`). |
| `copy_value` | String | No | Value to copy to clipboard (supports `{{data.id}}`). |
| `confirm_action` | Object | No | Action to execute when the user clicks the "Confirm" button on the success dialog. Supports `type: "navigate"` with `entity_id` and `params`. |
| `workflow` | Object | No* | The workflow configuration to execute (required for `workflow` type). See [Submit Workflow](./submit_workflow.md). |

---

## 2. Supported Types

| Type | Description | Required Parameters |
| --- | --- | --- |
| `http` | Executes a network request directly (no dialog). | `http` |
| `open_page` | Navigates to a new page using a specific layout. | `layout_form_id` |
| `show_dialog` | Opens a modal dialog. | `layout_form_id` |
| `show_confirmation_dialog` | Shows a confirmation prompt, then executes the `http` call on confirm. Use this for **delete actions**. | `confirm_title`, `confirm_message`, `http` |
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
| `display_pdf` | Displays a PDF in a preview dialog. | `http` or `value` (URL) |
| `download` | Downloads a file. | `http` or `value` (URL) |
| `clear_form` | Clears all form inputs. | - |
| `workflow` | Executes a custom workflow definition. | `workflow` |

> **💡 `workflow` is a valid action type.** Using `"type": "workflow"` will execute a custom workflow definition. See [submit_workflow.md](./submit_workflow.md) for details on how to configure the `workflow` object structure.


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
Displayed at the top of the entity page (e.g., Create, Export All, or contextual fallback actions). 

- **Contextual Data Inheritance**: When triggering an `open_page` action from `actions_home` (via `ActionButtonRegular`), if `parentData` is provided (e.g., from an ancestor header or detail table), `parentData.last` (the direct parent entity record) is automatically supplied as the `data` context of the opened `CreatePage` (both modal popup dialog and full-screen route). If `parentData` is empty, it falls back to `filters`. This allows layout forms opened from `actions_home` to access parent fields (such as `data.id`, `data.lbb_expense_transaction_header_id`, `data.chart_of_account_id`, `data.nip`, etc.) directly via `{{data.field_name}}`.
- **Table-State Aware Visibility**: Actions in `actions_home` can dynamically show or hide based on whether the table currently has data or is empty (see [Table State Variables](#table-state-variables-in-actions_home) below).

```json
"actions_home": [
  { "id": "create", "type": "open_page", "layout_form_id": "create", "name": "Create" }
]
```

### `action_primary`
The default action triggered when a row is clicked/tapped. Usually set to `view` or `edit`.

---

## 4. Rule-based Visibility

The `rule` object allows you to hide or show actions based on the data of the selected row, parent records, or table state.

### Structure
A rule consists of `all` (AND), `any` (OR), or `not` (NOT) groups of conditions.

| Key | Operator | Example |
| --- | --- | --- |
| `op` | `=`, `!=`, `>`, `>=`, `<`, `<=`, `in`, `not_in`, `is_empty`, `is_not_empty`, `contains` | `"op": "="` |

### Context Variables in Rules
Action rules automatically have access to:
- **Current row fields** (for row actions in `actions`): e.g. `is_detail`, `status`, `realization_submission`.
- **`parent`**: The direct parent record when rendering nested child or detail tables (automatically passed via `parentData.last`).
- **`parentData`**: Complete list of ancestor records (e.g. `parentData[0]` for root header, `parentData[1]` for detail).

#### Table State Variables in `actions_home`
When evaluating rules for top-level action buttons in `actions_home` (rendered via `MenuDataTableActions`), the evaluation data includes:

| Variable | Type | Description |
|---|---|---|
| `is_table_empty` | Boolean | `true` when table data has completed loading (`Status.loaded`) and contains **0 rows**. Useful for showing alternative actions when a child table has no rows. |
| `table_data_length` | Integer | Number of rows currently loaded in the table. `-1` while still loading. |
| `total_rows` | Integer | Total count of rows across pagination metadata. `-1` while still loading. |
| `is_table_loaded` | Boolean | `true` when table query execution has finished (`status == Status.loaded`). |
| `table_data` | Array | Raw list of loaded rows (`pageOptions.data`). |

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

### Example: Empty-Table Fallback Action in `actions_home`
Show a button in `actions_home` only when:
1. The table data query has finished loading and has **0 rows** (`is_table_empty == true`).
2. The root header transaction status is **not** `"INPUT"`.

```json
{
  "id": "lbb_realization",
  "type": "open_page",
  "name": "LBB Realization",
  "layout_form_id": "lbb_realization_without_detail_sub",
  "icon": "Add",
  "rule": {
    "all": [
      {
        "field": "{{ (function(){ var s = String(typeof parentData !== 'undefined' && Array.isArray(parentData) && parentData.length > 0 && parentData[0] && parentData[0].status ? parentData[0].status : (typeof parent !== 'undefined' && parent && parent.status ? parent.status : (typeof status !== 'undefined' ? status : ''))).trim().toUpperCase(); return s !== '' && s !== 'INPUT'; })() }}",
        "op": "=",
        "value": true
      },
      {
        "field": "{{ typeof is_table_empty !== 'undefined' ? is_table_empty : (typeof table_data_length !== 'undefined' ? table_data_length === 0 : (typeof total_rows !== 'undefined' ? total_rows === 0 : false)) }}",
        "op": "=",
        "value": true
      }
    ]
  }
}
```

### Advanced: JavaScript Expression in `field`
For complex conditions (e.g. compound logical checks, evaluating `parent` record fields, or handling multiple variations of empty/zero values), you can write a JavaScript expression inside `{{ ... }}` in `field` and compare it against `true` or `false`:

```json
"rule": {
  "all": [
    {
      "field": "{{ (parent.transaction_id == null || parent.transaction_id == '' || parent.transaction_id == '-') && (transaction_id == null || transaction_id == '' || transaction_id == '-') }}",
      "op": "=",
      "value": true
    },
    {
      "field": "{{ (typeof realization_submission === 'undefined' || realization_submission == null || realization_submission == '' || realization_submission == 0 || realization_submission == '0') }}",
      "op": "=",
      "value": true
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

> **State Synchronization**: When mutating state using `append_variable` or `remove_variable`, the underlying text controller (`controller.controllers[target_variable]`) is automatically updated with the serialized JSON string (`jsonEncode(list)`). This ensures any hidden inputs, form serializers, or dependent components bound to `target_variable` reflect the mutation immediately. If all items are removed (resulting in an empty list `[]`), bound `table` components preserve this empty state and will not trigger unwanted HTTP reloads from the backend.

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

## 8. Success Dialog with Follow-up Action (`confirm_action`)

When an action performs a submission (e.g. creating a header transaction) and needs to:
1. Show a success confirmation dialog with a Copy button (e.g. Copy ID).
2. Prompt the user with a **Confirm** button.
3. Automatically navigate/direct to a detail page upon clicking **Confirm**, passing interpolated filters (e.g. ID and normalized period).

Configure `on_success: "show_success_dialog_with_data"` along with `confirm_action`:

```json
{
  "id": "Create_Transaction",
  "type": "open_page",
  "name": "Transaction",
  "layout_form_id": "create general",
  "on_success": "show_success_dialog_with_data",
  "on_failure": ["toast"],
  "success_title": "Success",
  "success_message": "The transaction submission has been created!\nWith ID : {{data.id}}",
  "copy_label": "Copy ID",
  "copy_value": "{{data.id}}",
  "confirm_action": {
    "type": "navigate",
    "entity_id": "lbb_expense_transaction_details",
    "params": {
      "lbb_expense_transaction_header_id": "{{data.id || id}}",
      "period": "{{ (data.period || period || '').replaceAll('/', '') }}"
    }
  }
}
```

### Flow
1. **Form Submission**: The user fills and submits the layout form.
2. **Success Popup**: `CardSuccessWithData` appears showing the formatted ID with a `[Copy ID]` button and a `[Confirm]` button. The dialog is pushed to the root navigator (`useRootNavigator: true`), displaying a full-screen dimmed backdrop that covers the entire application window (including the top navigation bar and sidebar).
3. **On Confirm**: When the user clicks `[Confirm]`, the dialog closes and the app navigates to `entity_id` (`lbb_expense_transaction_details`) with `params` passed as `initialFilters` and `parentData`.
4. **Back Navigation**: The destination page displays an `AppBar` with a Back button that cleanly pops back to the previous screen.

### Full-Screen Backdrop Overlay
All confirmation, alert, and success popups now use `useRootNavigator: true`:
- **Confirmation Dialogs**: `show_confirmation_dialog` (via `ActionConfirmDialogExtension.showConfirmDialog`) for delete and action approvals.
- **Delete Buttons**: Table row / detail delete confirmation dialogs (`DeleteButton` and `BackendOther.showConfirmationDialog`).
- **Success Popups**: Post-submission dialogs (`show_success_dialog_with_data` and standard `show_dialog`).
- **Error Popups**: `show_error_dialog`.

This ensures that the dimmed backdrop covers the entire viewport (sidebar and top app bar included), creating a fully focused modal experience for the user.

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
