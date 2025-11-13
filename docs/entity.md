# Entity JSON Documentation

This document outlines the structure and fields of an entity's JSON configuration file. These files define the data models, backend interactions, and UI layouts for different modules within the application.

## Root Object

The root of the JSON file is a single object that contains all the properties for a single entity.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | The unique identifier for the entity (e.g., "products", "customers"). |
| `label` | String | Yes | The human-readable name for the entity, used in UI elements like titles and labels. |
| `description` | String | Yes | A brief summary of the entity's purpose. |
| `fields` | Array<Object> | Yes | An array of objects defining the data schema for the entity. See [Field Object](#field-object). |
| `backend` | Object | Yes | Defines the API endpoints for CRUD operations. See [Backend Object](#backend-object). |
| `layout_form` | Array<Object> | No | An array of objects that define the layout of the entity's creation and editing form. See [Layout Form Object](#layout-form-object). |
| `layout_list_tile`| Object | No | Defines the layout for displaying a single entity instance in a list. See [Layout List Tile Object](#layout-list-tile-object). |
| `layout_table` | Object | No | A map defining the columns and their flex-based widths in a data table view. The key is the field reference, and the value is an integer flex factor. |
| `views` | Array<Object> | No | A list of custom view configurations for displaying entity data in different ways. See [View Object](#view-object). |
| `exports` | Array<Object> | No | A list of configurations for exporting entity data. See [Export Object](#export-object). |
| `actions` | Array<Object> | No | A list of custom actions that can be performed on the entity. See [Action Object](#action-object). |

---

## Nested Objects

### Field Object

Defines a single data field within the entity's schema.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `reference` | String | Yes | The unique name for the field, used as the key in data objects. |
| `label` | String | Yes | The display name for the field in UI forms and tables. |
| `type` | String | Yes | The data type of the field (e.g., "String", "Int", "Double", "Bool", "DateTime", "Reference"). |
| `description` | String | No | A tooltip or help text for the field. |
| `is_required` | Boolean | No | Whether the field must have a value. Defaults to `false`. |
| `is_unique` | Boolean | No | Whether the field's value must be unique across all instances of the entity. Defaults to `false`. |
| `default_value` | Any | No | A default value for the field when creating a new entity instance. |
| `relation` | Object | No | Defines a relationship to another entity (for "Reference" type fields). See [Relation Object](#relation-object). |

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

Defines a component (often a single field) in the entity's form layout.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `widget` | String | Yes | The type of form widget to use (e.g., "Text", "Dropdown", "CheckBox"). |
| `reference` | String | Yes | The field `reference` that this form component is bound to. |

### Layout List Tile Object

Defines the fields to be displayed in a list item view of the entity.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `title` | String | Yes | The field `reference` to use for the main title of the list item. |
| `subtitle` | String | Yes | The field `reference` to use for the subtitle. |
| `leading` | String | No | The field `reference` to use for a leading element (e.g., an avatar or icon). |
| `trailing`| String | No | The field `reference` to use for a trailing element (e.g., a status indicator). |

### Relation Object

Defines a relationship for a "Reference" type field.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `entity` | String | Yes | The `id` of the entity being referenced. |
| `key` | String | Yes | The field in the referenced entity to use as the value. |
| `display` | String | Yes | The field in the referenced entity to display in the UI. |

### View, Export, and Action Objects

These objects define custom behaviors. Their structure can vary. Please refer to the source code for `DView`, `Export`, and `ActionD` for detailed implementation.

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
      "type": "String",
      "is_required": true,
      "is_unique": true
    },
    {
      "reference": "category_id",
      "label": "Category",
      "type": "Reference",
      "is_required": true,
      "relation": {
        "entity": "categories",
        "key": "id",
        "display": "category_name"
      }
    },
    {
      "reference": "price",
      "label": "Price",
      "type": "Double",
      "is_required": true
    },
    {
      "reference": "in_stock",
      "label": "In Stock",
      "type": "Bool",
      "default_value": true
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
