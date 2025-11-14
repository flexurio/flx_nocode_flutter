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
| `components` | Array<Object> | No | An array of `Component` objects that define custom components to be rendered on the form. |

### `Component` Object

The `components` property is an array of `Component` objects. Each object must have an `id` and a `type`. The `type` determines the component's behavior and other available properties.

| Type | Description |
| --- | --- |
| `text` | A simple text component. |
| `table` | Renders data in a tabular format. |
| `column` | A container that arranges its children vertically. |
| `row` | A container that arranges its children horizontally. |
| `field_display` | A non-editable field for displaying read-only values. |

---

#### `text` Component

A basic component for displaying static text.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | A unique identifier for the component. |
| `type` | String | Yes | Must be `text`. |

**Example:**
```json
{
  "id": "welcome_message",
  "type": "text",
  "value": "Welcome to the dashboard!"
}
```

---

#### `table` Component

A component for displaying data fetched from an API in a table.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | A unique identifier for the component. |
| `type` | String | Yes | Must be `table`. |
| `http` | Object | Yes | An `HttpData` object specifying the API endpoint to fetch data from. |
| `columns` | Array<Object> | Yes | An array of `TColumn` objects defining the table's columns. |

**`TColumn` Object:**

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `header` | String | Yes | The text to display in the column header. |
| `body` | String | Yes | The key used to extract the value from each row's data object. |

**Example:**
```json
{
  "id": "user_list_table",
  "type": "table",
  "http": {
    "method": "GET",
    "url": "/api/users"
  },
  "columns": [
    { "header": "Name", "body": "fullName" },
    { "header": "Email", "body": "emailAddress" }
  ]
}
```

---

#### `column` and `row` Components

Layout components used to arrange other components either vertically (`column`) or horizontally (`row`).

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | A unique identifier for the component. |
| `type` | String | Yes | Must be `column` or `row`. |
| `children` | Array<Object> | Yes | An array of nested `Component` objects. |
| `x_align` | String | No | Horizontal alignment. For `column`: `left`, `center`, `right`, `stretch`. For `row`: `left`, `center`, `right`, `between`, `around`, `evenly`. |
| `y_align` | String | No | Vertical alignment. For `column`: `top`, `center`, `bottom`, `between`, `around`, `evenly`. For `row`: `top`, `center`, `bottom`, `stretch`. |

**Example:**
```json
{
  "id": "user_profile_layout",
  "type": "row",
  "x_align": "center",
  "children": [
    { "id": "avatar", "type": "image", "url": "..." },
    {
      "id": "user_details",
      "type": "column",
      "children": [
        { "id": "user_name", "type": "text", "value": "..." },
        { "id": "user_email", "type": "text", "value": "..." }
      ]
    }
  ]
}
```

---

#### `field_display` Component

A simple component for displaying a labeled, read-only value.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | A unique identifier for the component. |
| `type` | String | Yes | Must be `field_display`. |
| `label` | String | Yes | The label for the value. |
| `value` | String | Yes | The value to display. |

**Example:**
```json
{
  "id": "order_status_display",
  "type": "field_display",
  "label": "Current Status",
  "value": "Shipped"
}
```

---

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
