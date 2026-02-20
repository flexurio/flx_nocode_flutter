# Layout Form JSON Documentation

This document providing a detailed explanation of the `layout_form` object, which defines the structure and behavior of forms for creating, viewing, and updating entities.

## Root structure: `layout_form`

The `layout_form` is an **array** of `LayoutForm` objects. Each object define a specific form (e.g., for creating or updating an entity, or a custom modal).

### `LayoutForm` Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the form. Used to determine the form's role (see [Form Identifiers](#form-identifiers)). |
| `label` | String | Yes | Human-readable name for the form (e.g., "Create Product", "Edit User"). |
| `visible_if` | Object | No | A `Rule` object determining when this form is available based on current data. |
| `components` | Array<Object>| No | List of UI components to render. See [Component Documentation](./components.md). |
| `buttons` | Array<Object>| No | Custom action buttons for the form. |
| `multi_forms` | Array<Object>| No | An array of nested `LayoutForm` objects used for multi-step/wizard-style forms. |
| `submit_workflow`| Object | No | defines how the form should be submitted. See [Submit Workflow Documentation](./submit_workflow.md). |
| `on_init` | Array/Object | No | Actions (legacy or workflow) to run when the form is opened. |

---

## Form Identifiers

The `id` (or `type` in legacy configs) is used by the framework to infer the form's purpose and default actions.

| ID Pattern | Action Kind | Description |
| --- | --- | --- |
| `create*` / `add*` | **Create** | Used for creating new entity instances. |
| `update*` / `edit*` | **Update** | Used for modifying existing items. |
| `view*` / `detail*` | **View** | Read-only view of item details. |
| `home` | **Reprocess** | Often used for home/dashboard views or processing logs. |

---

## Multi-Step Forms (`multi_forms`)

When `multi_forms` is provided, the framework renders the form as a multi-step wizard. Each object in the `multi_forms` array is itself a `LayoutForm` representing one step.

- **Progress indicators** are automatically generated using the `label` of each step.
- **Navigation** (Back/Next) is handled automatically unless overridden.
- **Validation** is performed for each step before proceeding to the next.

---

## Example

```json
{
  "layout_form": [
    {
      "id": "create_product",
      "label": "Create New Product",
      "components": [
        {
          "id": "name",
          "type": "text_field",
          "label": "Product Name",
          "required": true
        },
        {
          "id": "price",
          "type": "number_field",
          "label": "Price",
          "initialValue": "0"
        }
      ],
      "submit_workflow": {
        "type": "workflow",
        "submit_label": "Save Product",
        "actions": [
          {
            "type": "validate"
          },
          {
            "type": "http",
            "name": "save",
            "http": {
              "method": "POST",
              "path": "/products",
              "body": "{{ current }}"
            }
          },
          {
            "type": "toast",
            "variant": "success",
            "message": "Product created!"
          },
          {
            "type": "close_modal"
          }
        ]
      }
    }
  ]
}
```

## Key Related Guides

- **[UI Components](./components.md)**: Details on available widgets like `text_field`, `dropdown`, `table`, etc.
- **[Submission Workflow](./submit_workflow.md)**: Advanced logic for handling form submission, conditions, and API calls.
