# Submit Workflow JSON Documentation

The `SubmitWorkflow` is a powerful engine in **FlxNocode** that allows you to define complex, multi-step business logic directly in your JSON layouts. It is executed when a form is submitted or an action is triggered.

---

## 📋 Table of Contents
- [Core Configuration](#core-configuration)
- [Template Syntax & Expressions](#template-syntax--expressions)
- [Workflow Actions](#workflow-actions)
    - [HTTP Request](#1-http-request-http)
    - [Validation](#2-validation-validate)
    - [Variables](#3-variables-set_var-append_var)
    - [UI Interactions](#4-ui-interactions-toast-close_modal-refresh)
    - [Control Flow](#5-control-flow-condition-loop-try_catch)
    - [Data Export](#6-data-export-export)
- [Full Example](#full-example)

---

## ⚙️ Core Configuration

The `SubmitWorkflow` object is the root configuration for submission logic.

| Key | Type | Required | Default | Description |
| :--- | :--- | :---: | :---: | :--- |
| `type` | String | Yes | `workflow` | Must be exactly `"workflow"`. |
| `lock_ui_while_submitting` | Boolean | No | `true` | If true, disables the form UI during execution. |
| `submit_label` | String | No | - | Custom label for the primary submit button. |
| `show_submit_button` | Boolean | No | `true` | Whether to display the default submit button. |
| `actions` | Array<Action> | Yes | - | The main sequence of actions to execute. |
| `on_success` | Array<Action> | No | `[]` | Actions to run if the main sequence completes without errors. |
| `on_error` | Array<Action> | No | `[]` | Actions to run if any action in the sequence fails. |

---

## 🧪 Template Syntax & Expressions

Workflows support dynamic data through the `{{ }}` interpolation syntax.

### Available Scopes:
- `{{ form }}`: The current form input values.
- `{{ data }}`: The initial data/record values.
- `{{ vars }}`: Temporary variables created during the workflow (via `set_var`).
- `{{ http.STEP_NAME }}`: Results of previous HTTP steps (contains `status`, `data`, and `headers`).
- `{{ auth }}`: Current user authentication state (permissions, token).

### Expression Examples:
- `{{ form.first_name + " " + form.last_name }}`
- `{{ http.login.status == 200 }}`
- `{{ vars.items.length > 0 }}`

---

## 🚀 Workflow Actions

### 1. HTTP Request (`http`)
Performs a network request (GET, POST, PUT, DELETE, etc.).

| Key | Type | Required | Description |
| :--- | :--- | :---: | :--- |
| `name` | String | Yes | Unique name for this step. Result will be stored in `http.NAME`. |
| `http` | Object | Yes | `HttpData` config (method, url, body, headers). |
| `retry` | Object | No | Optional `WorkflowRetryPolicy` (max attempts, delay). |
| `save_result_to` | String | No | Optional alias path to save results (e.g., `vars.last_response`). |
| `error_message_path` | String | No | Optional JSON path to extract error message from response (e.g. `error.detail`). Defaults to `message`, `error`, or `detail` fields. |

**Example:**
```json
{
  "type": "http",
  "name": "create_user",
  "http": {
    "method": "POST",
    "url": "{{ backend_host }}/users",
    "body": { "email": "{{ form.email }}", "role": "admin" }
  }
}
```

### 2. Validation (`validate`)
Triggers form validation. If validation fails, the workflow stops.

| Key | Type | Default | Description |
| :--- | :--- | :---: | :--- |
| `scope` | String | `all` | `all` (entire form) or `current_step` (for multi-step forms). |

### 3. Variables (`set_var`, `append_var`)
Manage temporary state within the workflow.

- **`set_var`**: Assigns a value to a key.
- **`append_var`**: Adds a value to a list.

| Key | Type | Required | Description |
| :--- | :--- | :---: | :--- |
| `key` | String | Yes | The variable name (accessible via `vars.KEY`). |
| `value` | Any | Yes | The value to store (supports expressions). |

### 4. UI Interactions (`toast`, `close_modal`, `refresh`)

- **`toast`**: Shows a message to the user. `variant` can be `success`, `error`, `info`, or `warning`.
- **`close_modal`**: Closes the current view.
- **`refresh`**: Reloads a component or data source by ID.

### 5. Control Flow (`condition`, `loop`, `try_catch`)

- **`condition`**: Basic `if/then/else` logic.
- **`loop`**: Iterates through a list. Exposes current item as `vars.ITEM_VAR`.
- **`try_catch`**: Wraps actions in a safety block. If `try` fails, `catch` runs.

**Loop Example:**
```json
{
  "type": "loop",
  "items": "{{ form.selected_ids }}",
  "item_var": "id",
  "actions": [
    {
      "type": "http",
      "name": "delete_item",
      "http": { "method": "DELETE", "url": "/items/{{ vars.id }}" }
    }
  ]
}
```

### 6. Data Export (`export`)
Generates and downloads files (Excel, CSV, PDF).

| Key | Type | Required | Description |
| :--- | :--- | :---: | :--- |
| `format` | String | Yes | `xlsx`, `csv`, or `pdf`. |
| `data_source` | String | Yes | Path to the list of items to export. |
| `columns` | Array | Yes | List of objects with `header` and `body` (expression). |

---

## 🛠️ Utility Objects

### WorkflowRetryPolicy
Used in HTTP actions to handle transient network errors.

| Key | Type | Default | Description |
| :--- | :--- | :---: | :--- |
| `max` | Integer | `0` | Maximum number of retry attempts. |
| `delay_ms` | Integer | `0` | Wait time between attempts in milliseconds. |

---

## 💡 Full Example

```json
{
  "type": "workflow",
  "lock_ui_while_submitting": true,
  "submit_label": "Process Order",
  "actions": [
    { "type": "validate" },
    {
      "type": "try_catch",
      "try": [
        {
          "type": "http",
          "name": "order_api",
          "http": {
            "method": "POST",
            "url": "/api/orders",
            "body": "{{ form }}"
          }
        },
        {
          "type": "toast",
          "variant": "success",
          "message": "Order #{{ http.order_api.data.id }} processed!"
        }
      ],
      "catch": [
        {
          "type": "toast",
          "variant": "error",
          "message": "{{ vars.last_error }}"
        }
      ]
    }
  ],
  "on_success": [
    { "type": "refresh", "target": "order_list" },
    { "type": "close_modal" }
  ]
}
```
