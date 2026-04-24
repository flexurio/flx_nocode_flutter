# Layout Form JSON Documentation

`LayoutForm` defines the structure, UI components, and behavioral logic of forms used for creating, updating, and viewing entity data.

---

## 1. Root Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier (e.g., `create`, `update`, `view`). See [Form Roles](#2-form-roles). |
| `label` | String | Yes | Title displayed at the top of the form or modal. |
| `components` | Array | No* | List of [UI Components](./components.md) to render. *Required if `multi_forms` is not used. |
| `multi_forms` | Array | No | List of `LayoutForm` objects for [Multi-Step Wizards](#3-multi-step-forms). |
| `visible_if` | Object | No | A [Rule](./actions.md#4-rule-based-visibility) determining when this form is available. |
| `buttons` | Array | No | Custom [Action](./actions.md) buttons for the form footer. |
| `submit_workflow`| Object | No | Configuration for form submission. See [Submit Workflow Documentation](./submit_workflow.md). |
| `on_init` | Array/Obj| No | Actions or Workflow to execute when the form is opened. |

---

## 2. Form Roles

The framework uses the form's `id` to determine its behavior and initial state:

| ID Pattern | Behavior | Data Context |
| --- | --- | --- |
| `create*`, `add*` | **Create Mode** | Starts with empty state or `initialValue` from components. |
| `update*`, `edit*`| **Update Mode** | Pre-populated with the data of the selected row (`data`). |
| `view*`, `detail*`| **View Mode** | Pre-populated and usually sets all components to `enabled: false`. |
| `home` | **Process** | Used for global dashboard processing or re-running workflows. |

---

## 3. Multi-Step Forms (`multi_forms`)

If `multi_forms` is provided, the form renders as a **Wizard (Stepper)**. Each object in the array represents one step.

### Features
- **Automatic Stepper**: Progress indicators are generated from the `label` of each step.
- **State Management**: Data entered in Step 1 is carried over to subsequent steps and is available via `{{form.field_id}}`.
- **Validation**: Each step is validated before the "Next" button becomes active.
- **Final Submission**: The `submit_workflow` of the **root** form is executed on the last step.

### Example Structure
```json
{
  "id": "create_wizard",
  "label": "New Request",
  "multi_forms": [
    { "id": "step1", "label": "Information", "components": [...] },
    { "id": "step2", "label": "Review", "components": [...] }
  ],
  "submit_workflow": { ... }
}
```

---

## 4. Initialization Logic (`on_init`)

`on_init` allows you to fetch data or set variables as soon as the form opens. It supports two formats:
1.  **Legacy**: An array of [Action](./actions.md) objects.
2.  **Workflow**: A [SubmitWorkflow](./submit_workflow.md) object.

**Example: Fetching user profile on init**
```json
"on_init": [
  {
    "type": "http",
    "http": {
      "method": "GET",
      "url": "{{backend_host}}/me"
    },
    "target_variable": "current_user"
  }
]
```

---

## 5. Templating in Forms

Forms provide a rich context for [Interpolation](./string_interpolation.md):

- `{{form.id}}`: Access the value of a component in the **current form**.
- `{{data.id}}`: Access the original record's data (available in `update` and `view` modes).
- `{{parentData.0.id}}`: Access data from a parent entity if this is a nested sub-form.

---

## 6. Full Example: 3-Step Wizard

```json
{
  "id": "create_change_control",
  "label": "Change Control Wizard",
  "multi_forms": [
    {
      "id": "header",
      "label": "Header",
      "components": [
        { "id": "name", "type": "text_field", "label": "Change Name", "required": true }
      ]
    },
    {
      "id": "details",
      "label": "Details",
      "components": [
        { "id": "desc", "type": "text_field", "label": "Description", "maxLines": 3 }
      ]
    },
    {
      "id": "summary",
      "label": "Summary",
      "components": [
        { "id": "confirm_name", "type": "field_display", "label": "Confirm Name", "value": "{{form.name}}" }
      ]
    }
  ],
  "submit_workflow": {
    "type": "workflow",
    "actions": [
      {
        "type": "http",
        "http": {
          "method": "POST",
          "url": "{{backend_host}}/change_controls",
          "body": {
            "name": "{{form.name}}",
            "description": "{{form.desc}}"
          }
        }
      }
    ]
  }
}
```
