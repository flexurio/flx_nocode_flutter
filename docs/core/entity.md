# Entity JSON Documentation

This document outlines the structure and fields of an entity's JSON configuration file. These files define the data models, backend interactions, and UI layouts for different modules within the application.

## Root Object

The root of the JSON file is a single object that contains all the properties for a single entity.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | The unique identifier for the entity (e.g., "products", "customers"). |
| `label` | String | Yes | The human-readable name for the entity, used in UI elements like titles and labels. |
| `description` | String | Yes | A brief summary of the entity's purpose. |
| `fields` | Array<Object> | Yes | An array of objects defining the data schema for the entity. See the [Field Documentation](./field.md) for more details. |
| `backend` | Object | Yes | Defines the API endpoints for CRUD operations. See [Backend Object](#backend-object). |
| `layout_form` | Array<Object> | No | An array of objects that define the layout of the entity's creation and editing form. See the [Layout Form Documentation](./layout_form.md) for details. |
| `layout_list_tile`| Object | No | Defines the layout for displaying a single entity instance in a list. See [Layout List Tile Object](#layout-list-tile-object). |
| `layout_table` | Object | No | A map defining the columns and their flex-based widths in a data table view. The key is the field reference, and the value is an integer flex factor. |
| `custome_layout`| Array<Object> | No | An array of custom table column layout presets that can be dynamically switched using checkboxes. Defaults to showing only root `layout_table` columns when all checkboxes are unchecked. |
| `views` | Array<Object> | No | A list of custom view configurations for displaying entity data in different ways. See [View Object](#view-object). |
| `exports` | Array<Object> | No | A list of configurations for exporting entity data. See [Export Object](#export-object). |
| `actions` | Array<Object> | No | A list of custom actions that can be performed on the entity. See [Action Object](#action-object). |
| `hide_row_actions`| Boolean | No | Whether to hide row action buttons (default `false`) on the data table. |
| `pinned_columns` | Array<String> | No | List of field references to pin on the data table (e.g., `["subordinate_name", "description", "area_value"]`). Pinned columns stay fixed on the left during horizontal scrolling. |
| `freezed_column` | Boolean / String | No | Controls whether the first and last (actions) columns are frozen in the table. If `false`, no columns are frozen. If `true` (default), both first and last columns are frozen. String values `"first"` or `"last"` freeze only that specific column. |
| `freeze_first_column` | Boolean | No | Fine-grained override to freeze or unfreeze only the first column (`true`/`false`). |
| `freeze_last_column` | Boolean | No | Fine-grained override to freeze or unfreeze only the last column/actions (`true`/`false`). |

### Pinned Columns (`pinned_columns`)

The `pinned_columns` property allows pinning one or multiple columns on the data table so that they remain fixed on the left side while the user scrolls horizontally:

```json
{
  "id": "lbb_expense_transaction_details",
  "label": "Expense Transaction Detail",
  "description": "LBB marketing submission",
  "pinned_columns": [
    "subordinate_name",
    "description",
    "area_value"
  ],
  "layout_table": {
    "subordinate_name": 10,
    "description": 10,
    "area_value": 8,
    "nip": 4
  }
}
```

- Each field specified in `pinned_columns` (or with `"is_pinned": true` in field definition) is pinned to the left.
- When `layout_table` places pinned columns at the beginning, they align with the composite selection checkbox and stay permanently visible.

### Row Actions Visibility (`hide_row_actions`)

The `hide_row_actions` property controls whether the dynamic data table displays the "Actions" column (usually rendered as a column with three dots menu button containing operations like view, edit, delete, or custom actions).

- **`true`**: The actions column is hidden entirely, even if row-level actions are defined.
- **`false` (or omitted)**: The actions column is displayed on the right-hand side of the table if there is at least one active row-level action.

---

## Nested Objects

### Field Object

Defines a single data field within the entity's schema. For a more detailed explanation, see the [Field Documentation](./field.md).

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | Human-readable label to display in UI. |
| `reference` | String | Yes | Unique reference/key for the field. |
| `type` | String | Yes | The data type of the field. See [Supported Field Types](./field.md#supported-field-types) for a list of available types. |
| `column_width` | Number | No | Optional width of the column when rendered in tables/grids. |
| `auto_generated` | Boolean | No | Whether the field value is automatically generated. |
| `required` | Boolean | No | Whether the field value is required. Defaults to `false`. |
| `pattern` | String | No | Regex pattern for validating the field. |
| `pattern_error` | String | No | Error message shown if `pattern` does not match. |
| `options_source` | String | No | Source identifier for option-based fields. |
| `min_length` | Integer | No | Minimum text length for this field. |
| `max_length` | Integer | No | Maximum text length for this field. |
| `allow_create` | Boolean | No | Whether this field is allowed to be set on create. |
| `allow_update` | Boolean | No | Whether this field can be updated after creation. |
| `is_copyable` | Boolean | No | Whether the field value can be copied from UI. |
| `is_tooltip` | Boolean | No | Whether hovering over the cell shows a tooltip with the value. |
| `is_chip` | Boolean | No | Whether to render the field value as a colored status chip. |
| `chip_colors` | Object | No | Map of custom color overrides for chips (key is status name, value is hex color). |
| `options` | Object | No | Additional options for dropdown/lookup type fields. See [Field Options Object](#field-options-object). |

### Backend Object

Defines the API endpoints for the entity's Create, Read, Update, and Delete (CRUD) operations.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `find` | Object | No | Endpoint for retrieving multiple entity instances. See [Endpoint Object](#endpoint-object). |
| `find_one` | Object | No | Endpoint for retrieving a single entity instance by its ID. See [Endpoint Object](#endpoint-object). |
| `create` | Object | No | Endpoint for creating a new entity instance. See [Endpoint Object](#endpoint-object). |
| `update` | Object | No | Endpoint for updating an existing entity instance. See [Endpoint Object](#endpoint-object). |
| `delete` | Object | No | Endpoint for deleting an entity instance. See [Endpoint Object](#endpoint-object). |
| `others` | Array<Object> | No | A list of other, non-standard endpoints. See [Endpoint Object](#endpoint-object). |

### Endpoint Object

Defines the properties of a single API endpoint.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `path` | String | Yes | The URL path for the endpoint (e.g., "/users", "/users/:id"). |
| `method` | String | Yes | The HTTP method (e.g., "GET", "POST", "PUT", "DELETE"). |
| `mock_enabled` | Boolean | No | Whether to use mock data instead of calling the actual API. Defaults to `false`. |
| `mock_data` | Object \| Array | No | The data to return when `mock_enabled` is true. |

### Layout Form Object

Defines the layout of the entity's creation and editing forms. For a more detailed explanation, see the [Layout Form Documentation](./layout_form.md).

### Layout List Tile Object

Defines the fields to be displayed in a list item view of the entity.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `title` | String | Yes | The field `reference` to use for the main title of the list item. |
| `subtitle` | String | Yes | The field `reference` to use for the subtitle. |
| `leading` | String | No | The field `reference` to use for a leading element (e.g., an avatar or icon). |
| `trailing`| String | No | The field `reference` to use for a trailing element (e.g., a status indicator). |

### Field Options Object

Defines the options for a dropdown or lookup field.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `source` | String | Yes | The source of the data (e.g., an API endpoint or a Hive box name). |
| `label_field` | String | Yes | The field from the source data to use as the display label. |
| `value_field` | String | Yes | The field from the source data to use as the selected value. |

### Filter Object

Defines an inline filter configuration rendered on the data table action bar.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `reference` | String | Yes | The field reference that this filter applies to. |
| `type` | String | No | Input type override for the filter (e.g. `"select"`, `"dropdown"`). When set to `"select"` or when `options_source` is provided, renders a searchable dropdown filter. |
| `options_source` | String | No | Dynamic options source for dropdown filter. E.g. `backend.vw_search({key}:{value})?header_id.eq={{header_id}}`. Supports `{{field}}`, `{parent.field}`, `{field}`, and `{page[i].field}` placeholders. Options are automatically deduplicated and empty/null values are omitted. |
| `always_include` | Boolean | No | When `true`, the parameter is always included in backend requests (e.g. `field.eq=`) even when empty or reset. |
| `mode` | String | No | Filter mode for date type. Options: `"date_range"`, `"year_month"`, `"year"`, `"date"`. |
| `default` | String | No | Default value of filter. Can be `""` for empty default, or `"now"` for date type. |
| `backend_key` | String | No | Overrides the query parameter key sent to backend. E.g. `visit_customers.period.eq`. |
| `width` | Number | No | Custom width of the filter input in pixels (defaults to `240.0`). |

> **Layout Separation**:
> - **Inline Filters (`filters`)**: Rendered directly on the left side of the table toolbar (`actionLeft`), adjacent to action buttons on the right.
> - **Views / Parent Context Filters (`views.filter`)**: Rendered as dismissible chips on a **dedicated top row** above the toolbar, preventing horizontal layout crowding and overflow.

### View Object

Defines a custom view navigation action on a data table row to link to another entity page. Natively renders a back button and breadcrumb trails for navigation.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | No | Unique identifier of the view configuration (optional, defaults to label). |
| `label` | String | Yes | Display label on the UI (e.g., in row action popup menus). |
| `entity` | String | Yes | The ID of the target entity JSON configuration to navigate to. |
| `filter` | Object | Yes | A mapping of target filter references (keys) to source field names (values) used as initial filters on target entity page. |
| `rule` | Object | No | Optional conditional rule layout defining when the view action is visible. |

#### Dynamic Cascading Filter Resolution

When navigating to a target entity, each entry `{"target_filter_reference": "source_field_name"}` in `filter` is resolved dynamically without hardcoding, using the following cascading lookup order:

1. **Current Row Data (`data`)**: Checks if `source_field_name` exists on the clicked row (`data[source_field_name]`).
2. **Active Page Filters (`activeFilters`)**: If not found on the row, checks if `source_field_name` is present in the active filters applied to the current page (e.g. filters carried over from earlier parent navigations).
3. **Ancestor Parent Data (`parentData.reversed`)**: If still not found, traverses upward through the ancestor navigation stack from nearest parent to root, extracting the first match (`parent[source_field_name]`).

This allows passing parameters seamlessly across multi-tiered navigation chains (e.g., `Header` ➔ `Detail` ➔ `Detail Sub` ➔ `Realization`) without requiring redundant HTTP GET queries on each level:

```json
// In parent entity (e.g. expense_transaction_details.json):
"views": [
  {
    "id": "view_subs",
    "label": "Expense Transaction Detail Sub",
    "entity": "expense_transaction_detail_subs",
    "filter": {
      "subordinate_nip": "subordinate_nip",
      "expense_transaction_header_id": "expense_transaction_header_id",
      "expense_transaction_detail_id": "id"
    }
  }
]

// In child entity (e.g. expense_transaction_detail_subs.json):
"views": [
  {
    "id": "view_realizations",
    "label": "Realization Details",
    "entity": "realization_details",
    "filter": {
      "transaction_detail_sub_id": "id",
      "expense_transaction_header_id": "expense_transaction_header_id",
      "expense_transaction_detail_id": "expense_transaction_detail_id"
    }
  }
]
```
In the example above, `expense_transaction_detail_id` will be resolved automatically from the parent context when opening `Realization Details`, even if the intermediate `Detail Sub` table API response does not include that column.

### Custom Layout Object

Defines a custom table layout configuration. Multiple custom layouts can be defined to allow users to dynamically switch visible table columns via a multi-select checkbox group. By default, all checkboxes are unchecked and only the base columns defined in the root `layout_table` configuration are displayed. When one or more checkboxes are checked, their respective layout columns are appended dynamically to the base columns. Unchecking a checkbox hides the columns belonging to that layout, returning to the combination of the remaining active checkboxes (or only the root columns if no checkboxes are checked).

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | The display label of the layout option (rendered next to the checkbox). |
| `key` | String | Yes | Unique key for identifying the layout state. |
| `layout_table` | Object | Yes | A map of field references to column flex weights (e.g. `{"period": 5, "name": 8}`). |

### Export and Action Objects

These objects define custom behaviors. Their structure can vary. Please refer to the source code for `Export` for detailed implementation. For the `Action` object, see the [Action Documentation](./actions.md).

---

## Example `entity.json`

```json
{
  "id": "products",
  "label": "Products",
  "description": "Manages the company's product catalog.",
  "fields": [
    {
      "reference": "product_name",
      "label": "Product Name",
      "type": "text",
      "required": true,
      "allow_update": true,
      "is_copyable": true
    },
    {
      "reference": "category_id",
      "label": "Category",
      "type": "select",
      "required": true,
      "options": {
        "source": "categories",
        "value_field": "id",
        "label_field": "category_name"
      }
    },
    {
      "reference": "price",
      "label": "Price",
      "type": "number",
      "required": true
    },
    {
      "reference": "in_stock",
      "label": "In Stock",
      "type": "boolean"
    }
  ],
  "backend": {
    "find": {
      "path": "/products",
      "method": "GET"
    },
    "create": {
      "path": "/products",
      "method": "POST"
    },
    "update": {
      "path": "/products/:id",
      "method": "PUT"
    },
    "delete": {
      "path": "/products/:id",
      "method": "DELETE"
    }
  },
  "layout_form": [
    {
      "widget": "Text",
      "reference": "product_name"
    },
    {
      "widget": "Dropdown",
      "reference": "category_id"
    },
    {
      "widget": "Text",
      "reference": "price"
    },
    {
      "widget": "CheckBox",
      "reference": "in_stock"
    }
  ],
  "layout_list_tile": {
    "title": "product_name",
    "subtitle": "price",
    "trailing": "in_stock"
  },
  "layout_table": {
    "product_name": 3,
    "category_id": 2,
    "price": 1
  },
  "views": [
    {
      "id": "view_product_transactions",
      "label": "Product Transactions",
      "entity": "product_transactions",
      "filter": {
        "product_id": "id"
      }
    }
  ]
}
```
