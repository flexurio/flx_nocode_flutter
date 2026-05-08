# ComponentForm JSON Documentation

The `ComponentForm` is a structural component that wraps other components in an internal `Form` widget. This allows for isolated validation groups within a larger form.

## Why use ComponentForm?

In complex forms, you might have sections where the user needs to fill out some fields and click a button (e.g., "Add to Table") multiple times before submitting the whole form. 

By default, the main "Submit" button validates ALL fields in the form. If you have inputs for "Add to Table" that are marked as `required`, the main Submit button will fail if those inputs are empty—even if the user has already added several items to the table and is done with those inputs.

Wrapping the entry inputs and the "Add" button in a `ComponentForm` solves this:
1.  **Isolated Validation**: The main form validation will skip fields inside a `ComponentForm` because they register with the internal form.
2.  **Targeted Validation**: The "Add" button can be configured to validate only its immediate parent `ComponentForm`.

## Component Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the component. |
| `type` | String | Yes | Must be `"form"`. |
| `children` | Array<Component> | Yes | List of components to be rendered inside this form group. |
| `visibilityCondition`| String | No | Logic expression to determine if the form group should be visible. |

---

## Action Validation

To trigger validation for a `ComponentForm`, set the `"validate": true` property in the action (on_click) of a button inside that form.

| Key | Type | Description |
| --- | --- | --- |
| `validate` | Boolean | If `true`, the action will find the nearest parent `Form` and call `validate()` before proceeding. |

---

## Example Usage

In this example, the `item_id` and `type_id` are only validated when "Add to Table" is clicked. The main form submission will ignore them.

```json
{
  "id": "entry_section",
  "type": "form",
  "children": [
    {
      "id": "item_id",
      "type": "dropdown",
      "label": "Item",
      "required": true,
      ...
    },
    {
      "id": "add_button",
      "type": "button",
      "text": "Add to Table",
      "on_click": {
        "type": "append_variable",
        "target_variable": "list_data",
        "validate": true,
        "on_success": "clear_form"
      }
    }
  ]
}
```
