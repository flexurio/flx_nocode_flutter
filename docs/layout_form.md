# Layout Form JSON Documentation

This document provides a detailed explanation of the `layout_form` object, which is used to define the structure and behavior of forms for creating, viewing, and updating entities.

## `layout_form` Object

The `layout_form` is an array of `LayoutForm` objects. Each object defines a specific form type (e.g., for creating or updating an entity).

### `LayoutForm` Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | A human-readable name for the form (e.g., "Create Product", "User Details"). |
| `type` | String | Yes | The type of form. Supported values are: `create`, `update`, `view`, `home`. |
| `groups` | Array<Object> | Yes | An array of `GroupLayout` objects that define the sections and fields of the form. Must not be empty. |
| `buttons` | Array<Object> | No | An array of `LayoutButton` objects that define custom action buttons for the form. |
| `visible_if` | Object | No | A `Rule` object that defines conditions under which the form is visible. |

### `GroupLayout` Object

Each object in the `groups` array defines a section within the form.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | A unique identifier for the group within the form. |
| `label` | String | No | A display label for the group, often rendered as a section header. |
| `fields` | Array<Object> | Yes | An array of `FormField` objects. |

### `FormField` Object

Each object inside the `fields` array of a `GroupLayout` defines a single input component.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `widget` | String | Yes | The type of form widget to use (e.g., "Text", "Dropdown", "CheckBox"). |
| `reference` | String | Yes | The `reference` of the entity field this widget is bound to. |

### `LayoutButton` Object

Each object in the `buttons` array defines a button in the form.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | No | A unique identifier for the button. |
| `label` | String | Yes | The text displayed on the button. |
| `action` | Object | Yes | A `ButtonAction` object that defines what the button does when clicked. |

### `ButtonAction` Object

This object is nested within a `LayoutButton` and specifies the button's behavior.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `kind` | String | Yes | The kind of action (e.g., "api", "navigation"). |
| `method` | String | Yes | The method for the action (e.g., "POST", "GET"). |
| `url` | String | Yes | The target URL or path for the action. |
| `content_type` | String | No | The content type for API requests (e.g., "application/json"). |
| `payload` | Object | No | The data to be sent with the action. |

### Example

```json
"layout_form": [
  {
    "label": "Create Product Form",
    "type": "create",
    "groups": [
      {
        "id": "basic_info",
        "label": "Basic Information",
        "fields": [
          {
            "widget": "Text",
            "reference": "product_name"
          },
          {
            "widget": "Dropdown",
            "reference": "category_id"
          }
        ]
      },
      {
        "id": "pricing_stock",
        "label": "Pricing and Stock",
        "fields": [
          {
            "widget": "Text",
            "reference": "price"
          },
          {
            "widget": "CheckBox",
            "reference": "in_stock"
          }
        ]
      }
    ],
    "buttons": [
      {
        "label": "Save Product",
        "action": {
          "kind": "api",
          "method": "POST",
          "url": "/products"
        }
      }
    ]
  }
]
```
