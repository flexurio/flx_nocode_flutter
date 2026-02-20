# Submit Workflow JSON Documentation

This document explains the structure and configuration of the `SubmitWorkflow` object, which defines a sequence of actions executed when a form is submitted.

## `SubmitWorkflow` Object

The root object for form submission logic.

| Key | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `type` | String | Yes | `workflow` | Must be "workflow". |
| `lock_ui_while_submitting` | Boolean | No | `true` | Whether to disable UI interactions during execution. |
| `submit_label` | String | No | - | Custom label for the submit button. |
| `show_submit_button` | Boolean | No | - | Whether to show the default submit button. |
| `actions` | Array<Action> | Yes | - | Main sequence of actions to execute. |
| `on_success` | Array<Action> | No | `[]` | Actions to run if the main sequence completes successfully. |
| `on_error` | Array<Action> | No | `[]` | Actions to run if any action in the sequence fails. |

---

## Workflow Actions

Each action in the `actions`, `on_success`, or `on_error` lists must have a `type` field.

### 1. Validate (`validate`)
Validates the current form state before proceeding.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `scope` | String | `all` | Validation scope: `all` or `current_step`. |

### 2. HTTP Request (`http`)
Performs a network request.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `name` | String | Yes | A unique name for this step for logging/debugging. |
| `http` | Object | Yes | `HttpData` configuration (method, path, body, etc.). |
| `retry` | Object | No | Optional `WorkflowRetryPolicy`. |
| `save_result_to` | String | No | Variable name to store the response data. |

### 3. Set Variable (`set_var`)
Sets a value in the workflow context.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `key` | String | Yes | The variable name. |
| `value` | Any | Yes | The value to set (can include expressions). |

### 4. Append Variable (`append_var`)
Appends a value to an existing list variable.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `key` | String | Yes | The list variable name. |
| `value` | Any | Yes | The value to append. |

### 5. Toast Notification (`toast`)
Shows a brief notification message.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `variant` | String | `info` | One of: `success`, `error`, `info`, `warning`. |
| `message` | String | - | The message text to display. |

### 6. Close Modal (`close_modal`)
Closes the current form or modal dialog. No additional parameters.

### 7. Refresh (`refresh`)
Triggers a refresh of a specific UI component.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `target` | String | Yes | The ID or reference of the component to refresh. |

### 8. Condition (`condition`)
Branching logic based on an expression.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `if` | String | Yes | Expression to evaluate (must return boolean). |
| `then_actions` | Array<Action> | Yes | Actions to run if condition is true. |
| `else_actions` | Array<Action> | No | Actions to run if condition is false. |

### 9. Loop (`loop`)
Iterates over a list of items.

| Key | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `items` | String | Yes | - | Path to items (e.g., `{{ form.data.items }}`). |
| `item_var` | String | No | `item` | Variable name for the current item. |
| `index_var` | String | No | - | Variable name for the current index. |
| `actions` | Array<Action> | Yes | - | Actions to run for each item. |

### 10. Try Catch (`try_catch`)
Error handling block.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `try_actions` | Array<Action> | Yes | Actions to attempt. |
| `catch_actions` | Array<Action> | Yes | Actions to run if `try_actions` fail. |

### 11. Stop Workflow (`stop_workflow`)
Immediately terminates the workflow execution.

---

## Nested Configuration Objects

### `WorkflowRetryPolicy`
Used in HTTP actions to handle transient failures.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `max` | Integer | `0` | Maximum number of retry attempts. |
| `delay_ms` | Integer | `0` | Delay between retries in milliseconds. |

---

## Example JSON

```json
{
  "type": "workflow",
  "lock_ui_while_submitting": true,
  "submit_label": "Submit Application",
  "actions": [
    {
      "type": "validate",
      "scope": "all"
    },
    {
      "type": "http",
      "name": "submit_data",
      "http": {
        "method": "POST",
        "path": "/api/applications",
        "body": "{{ form.data }}"
      },
      "save_result_to": "submission_response"
    },
    {
      "type": "condition",
      "if": "{{ submission_response.status == 200 }}",
      "then_actions": [
        {
          "type": "toast",
          "variant": "success",
          "message": "Application submitted successfully!"
        },
        {
          "type": "close_modal"
        }
      ],
      "else_actions": [
        {
          "type": "toast",
          "variant": "error",
          "message": "Failed to submit: {{ submission_response.error }}"
        }
      ]
    }
  ]
}
```
