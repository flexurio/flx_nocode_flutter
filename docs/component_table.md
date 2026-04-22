# ComponentTable JSON Documentation

The `ComponentTable` is a powerful component designed to display dynamic data fetched from an API in a grid format. It supports custom column widths, deep data paths, and even nested components within table cells.

## Component Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the component. |
| `type` | String | Yes | Must be `"table"`. |
| `http` | Object | Yes | Configuration for fetching table data. See [HttpData Properties](#httpdata-properties). |
| `columns` | Array<Object> | Yes | List of column definitions. See [TColumn Properties](#tcolumn-properties). |
| `actions` | Array<Object> | No | List of actions available for each row. See [Action Properties](#action-properties). |
| `width` | Double | No | The total width of the table in pixels. |
| `reference_id` | String | No | Optional identifier used for referencing this table in other parts of the system. |
| `visibilityCondition` | String | No | A logic expression to determine if the table should be visible. |
| `events` | Object | No | A map of event listeners (e.g., `onLoad`). |

---

## TColumn Properties

Each object in the `columns` array defines a single column.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `header` | String | Yes | The label displayed in the table header. |
| `body` | String | Yes | The key or expression used to extract a value from each row. Supports dot notation (e.g., `user.name`) or simple templates. |
| `width` | Double | No | The width of this specific column in pixels. |
| `component` | Object | No | A nested component to be rendered inside every cell of this column. The component will have access to the specific row data. |

---

## HttpData Properties

Defines how the table fetches its data.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `method` | String | `"GET"` | HTTP method (`GET`, `POST`, `PUT`, etc.). |
| `url` | String | - | API endpoint URL. Supports variable interpolation using `${var}`. |
| `headers` | Object | `{}` | HTTP headers to include in the request. |
| `body` | Object | `{}` | Request body (for `POST`/`PUT`) or query parameters (for `GET`). |
| `use_form_data`| Boolean | `false` | Whether to send the body as `multipart/form-data`. |
| `mock_enabled` | Boolean | `false` | If true, uses `mock_data` instead of making a real request. |
| `mock_data` | Object | - | The data returned when `mock_enabled` is true. |

---

## Action Properties

Row actions define structured operations that can be performed on each row (e.g., Edit, Delete, View).

| Key | Type | Description |
| --- | --- | --- |
| `id` | String | Unique identifier for the action. |
| `type` | String | Type of action (`http`, `open_page`, `show_dialog`, etc.). |
| `name` | String | Display label for the action. |
| `icon` | String | Name of the icon to display. |
| `permission` | String | Optional. Specific permission string. If not provided, it defaults to `{table_id}_{action_id}` (e.g., `customer_table_edit`). |
| `http` | Object | Config for network requests (for `type: "http"`). |
| `layout_form_id` | String | ID of the form to open (for `type: "open_page"` or `"show_dialog"`). |
| `on_success` | String | What to do on success (`toast`, `refresh`). |

---

## Row Actions vs. Custom Cell Components

There are two ways to add interaction to a table row:

### 1. Structured Row Actions (`actions` array)
Recommended for standard operations like "Edit" or "Delete". These are typically rendered in a dedicated "Actions" column at the end of the row and support built-in permission checks.

### 2. Custom Cell Components (`component` in `TColumn`)
Recommended for inline interactions (like a status toggle or a navigation link on a specific field). These give you full control over the UI of a specific cell.

When a `component` is defined in a `TColumn`:
1. The table renders that component for every row in that column.
2. The component's context is automatically injected with the current row's data.
3. Use `${body}` or standard interpolation to access row fields within the nested component.

### Example: Table with a "Delete" Button in a column

```json
{
  "header": "Action",
  "body": "id",
  "component": {
    "id": "btn_delete",
    "type": "icon_button",
    "icon": "delete",
    "onClick": {
      "type": "http",
      "method": "DELETE",
      "url": "https://api.example.com/items/${id}"
    }
  }
}
```

---

## Full Example

Below is a complete JSON configuration for a customer table with a nested "View Detail" button.

```json
{
  "id": "customer_list",
  "type": "table",
  "width": 1200,
  "http": {
    "method": "GET",
    "url": "https://api.example.com/customers",
    "headers": {
      "Authorization": "Bearer ${user_token}"
    }
  },
  "columns": [
    {
      "header": "ID",
      "body": "id",
      "width": 80
    },
    {
      "header": "Customer Name",
      "body": "full_name",
      "width": 250
    },
    {
      "header": "Email",
      "body": "contact.email",
      "width": 300
    },
    {
      "header": "Status",
      "body": "status",
      "width": 150
    }
  ],
  "actions": [
    {
      "id": "edit",
      "type": "open_page",
      "name": "Edit Customer",
      "icon": "edit",
      "layout_form_id": "customer_editor_form",
      "permission": "customer_edit_permission"
    },
    {
      "id": "delete",
      "type": "http",
      "name": "Delete",
      "icon": "delete",
      "permission": "customer_delete_permission",
      "http": {
        "method": "DELETE",
        "url": "https://api.example.com/customers/${id}"
      },
      "on_success": "refresh"
    }
  ]
}
```

- **Data Loading**: The table executes the `http` request on initialization (or when dependencies change). 
- **Data Parsing**: The component is flexible with response formats:
    - If the response is a **List**, it uses it directly.
    - If the response is a **Map**, it looks for a `"data"` key containing a list.
    - If neither, it wraps the response object in a single-row list.
- **Path Resolution**: The `body` field supports deep resolution (dot notation). If a row is `{"user": {"name": "John"}}`, setting `body: "user.name"` will correctly display "John".
- **Dynamic Updates**: If the `http.url` contains variables that change (e.g., a search query), the table will automatically re-fetch data.

## Advanced Usage

### Context Variables

When rendering cells or executing actions, you can pass special flags in the `data` context provided to `toWidget(data)`:

| Key | Description |
| --- | --- |
| `bypassPermission` | If set to `true`, all row actions will be visible and clickable regardless of user permissions. Primarily used for Widgetbook or development demos. |
| `parentData` | A list of objects from the parent context, accessible by actions for complex workflows. |
