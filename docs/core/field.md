# Entity Field JSON Documentation

This document provides a detailed explanation of the `EntityField` and `FieldOptions` models, which are used for dynamic entity configuration in the application. These models define the structure, behavior, and validation for each field within an entity.

---

## `EntityField` Class

The `EntityField` class represents a single field definition. It describes how a field should be rendered in the UI, how it should be validated, and what actions (like create, update, copy) are permitted.

### Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | A human-readable label for the field, displayed in UI elements like forms and table headers. |
| `reference` | String | Yes | A unique identifier or key for the field. This is used to access the field's value within a data object. |
| `type` | String | Yes | Defines the data type of the field. See [Supported Field Types](#supported-field-types) for a list of available types. |
| `column_width` | double? | No | An optional value that specifies the width of the column when the field is displayed in a table or grid. |
| `auto_generated` | bool? | No | A flag indicating whether the field's value is generated automatically by the system. |
| `required` | bool | No | If `true`, this field must have a value. Defaults to `false`. |
| `pattern` | String? | No | A regular expression pattern used to validate the field's input. |
| `pattern_error` | String? | No | The error message to display if the input does not match the specified `pattern`. |
| `options_source` | String? | No | An identifier for the source of data for option-based fields like dropdowns or lookups (e.g., an API endpoint or a local data source). |
| `min_length` | int? | No | The minimum required length for a text-based field. |
| `max_length` | int? | No | The maximum allowed length for a text-based field. |
| `allow_create` | bool? | No | A flag that determines if this field should be included in creation forms. |
| `allow_update` | bool? | No | A flag that determines if this field can be modified after its initial creation. |
| `is_copyable` | bool? | No | A flag that indicates whether the field's value can be copied from the UI, often used for displaying a copy icon next to the field. |
| `options` | FieldOptions? | No | A nested configuration object for fields that require a list of options, such as dropdowns. See [FieldOptions Class](#fieldoptions-class) for more details. |

### JSON Representation

The `EntityField` is typically created from a JSON object. Here is an example of its structure:

```json
{
  "label": "Name",
  "reference": "name",
  "type": "text",
  "column_width": 150,
  "auto_generated": false,
  "required": true,
  "is_copyable": true,
  "pattern": "^[A-Za-z]+$",
  "pattern_error": "Only letters are allowed.",
  "min_length": 2,
  "max_length": 50,
  "allow_create": true,
  "allow_update": true,
  "options_source": "user_roles"
}
```

---

## Supported Field Types

The `type` property in an `EntityField` determines its data type and how it is rendered in the UI. The following types are supported:

| Type String | Description |
| --- | --- |
| `text` | For string values. Renders as a standard text input field. |
| `number` | For numeric values (integers or doubles). Renders as a numeric input field. |
| `datetime` | For date and time values. Renders as a date and/or time picker. |
| `bool` | For boolean (true/false) values. Renders as a switch or checkbox. |

---

## `FieldOptions` Class

The `FieldOptions` class provides configuration for fields that display a list of selectable options, such as dropdowns or lookups. It is used when the `type` is `select` or a similar option-based field.

### Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `source` | String | Yes | The source of the data for the options (e.g., an API endpoint, a Hive box name, or another identifier). |
| `label_field` | String | Yes | The name of the field in the source data to be used as the display label for each option in the UI. |
| `value_field` | String | Yes | The name of the field in the source data to be used as the actual value when an option is selected. |

### JSON Representation

Here is an example of a JSON object for `FieldOptions`, which would be nested inside an `EntityField` object:

```json
{
  "reference": "category_id",
  "label": "Category",
  "type": "select",
  "required": true,
  "options": {
    "source": "api/categories",
    "label_field": "category_name",
    "value_field": "id"
  }
}
```
