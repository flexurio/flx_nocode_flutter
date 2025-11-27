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
| `views` | Array<Object> | No | A list of custom view configurations for displaying entity data in different ways. See [View Object](#view-object). |
| `exports` | Array<Object> | No | A list of configurations for exporting entity data. See [Export Object](#export-object). |
| `actions` | Array<Object> | No | A list of custom actions that can be performed on the entity. See [Action Object](#action-object). |

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

### View, Export, and Action Objects

These objects define custom behaviors. Their structure can vary. Please refer to the source code for `DView` and `Export` for detailed implementation. For the `Action` object, see the [Action Documentation](./actions.md).

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
  }
}
```
