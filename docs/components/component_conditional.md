# ComponentConditional JSON Documentation

The `ComponentConditional` is a logic-based component that allows you to dynamically switch between two different components based on a JavaScript expression. 

This is extremely powerful for creating flexible UIs where a field might need to change its input type or display style depending on other data in the form or table row.

## Component Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the component. |
| `type` | String | Yes | Must be `"conditional"`. |
| `condition` | String | Yes | A JavaScript expression that evaluates to a boolean. Supports variable interpolation (e.g., `data.status == 'active'`). |
| `then` | Object | Yes | The component configuration to render if the `condition` is **true**. |
| `else` | Object | No | The component configuration to render if the `condition` is **false**. If omitted and the condition is false, nothing is rendered (`SizedBox.shrink`). |

---

## How It Works

1. **Context Injection**: The component receives the current `data` context (e.g., the current form state or the current table row).
2. **Evaluation**: It evaluates the `condition` string as a JavaScript boolean expression.
    - If the condition is wrapped in `{{ ... }}`, it strips them before evaluation.
    - It uses the same JS engine as `visibilityCondition` and `httpData.url`.
3. **Rendering**:
    - If **true**: Renders the component defined in `then`.
    - If **false**: Renders the component defined in `else` (if provided).

---

## Examples

### 1. Simple Switch in a Form
Switch between a Dropdown and a Text Field based on a checkbox.

```json
{
  "id": "input_method_conditional",
  "type": "conditional",
  "condition": "data.use_custom_input == true",
  "then": {
    "id": "custom_name",
    "type": "text_field",
    "label": "Enter Custom Name"
  },
  "else": {
    "id": "standard_selection",
    "type": "dropdown",
    "label": "Select Standard Name",
    "options": [
      { "id": "1", "name": "Option A" },
      { "id": "2", "name": "Option B" }
    ]
  }
}
```

### 2. Usage in a Table Column (`TColumn`)
This is the most common use case. Render a clickable button only for rows that are "Pending".

```json
{
  "header": "Action",
  "body": "status",
  "component": {
    "id": "action_conditional",
    "type": "conditional",
    "condition": "data.status == 'pending'",
    "then": {
      "id": "btn_approve",
      "type": "button",
      "text": "Approve",
      "events": {
        "onClick": { "type": "http", "method": "POST", "url": "/approve/${id}" }
      }
    },
    "else": {
      "id": "status_label",
      "type": "text",
      "value": "No actions available"
    }
  }
}
```

---

## Best Practices

### Mutually Exclusive IDs
While the `id` of the `ComponentConditional` itself must be unique, the components inside `then` and `else` can have their own IDs. If they are intended to update the same field in a form or table row, you can give them the same ID or use `mappings` in their events.

### Complex Conditions
You can use complex logic in the condition:
`"condition": "(data.age >= 18 && data.has_consent == true) || data.is_admin == 'true'"`

### Nesting
You can nest conditional components to create "if / else if / else" structures:
```json
"then": { ... },
"else": {
  "type": "conditional",
  "condition": "data.other_check",
  "then": { ... },
  "else": { ... }
}
```
