# Component JSON Documentation

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
