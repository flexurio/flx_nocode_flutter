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
| `is_tooltip` | bool? | No | A flag that indicates whether hovering over the field cell in a table shows a tooltip with the value. |
| `is_chip` | bool? | No | Whether to render the field value as a colored status chip. |
| `chip_colors` | Map<String, String>? | No | Custom color overrides for status chips. Key is status name (case-insensitive substring match), value is hex color (e.g., `"#FF9800"`). |
| `background_colors` | Map<String, String>? or String? | No | Custom background colors. Can be a map mapped to values (e.g. `{"BFW": "#E8F5E9"}`) or a single string (e.g. `"#E8F5E9"`) to apply the color to all values. |
| `text_colors` | Map<String, String>? or String? | No | Custom text colors. Can be a map mapped to values (e.g. `{"BFW": "#2E7D32"}`) or a single string (e.g. `"#2E7D32"`) to apply to all values. Automatically selects contrast color if omitted. |
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
  "is_tooltip": true,
  "is_chip": true,
  "chip_colors": {
    "REJECT": "#E53935",
    "APPROVE": "#43A047"
  },
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
| `date` or `date(<format>)` | For date-only values (defaults to `yyyy-MM-dd`). Renders as a date picker. Supports custom formats (e.g. `date(MMMM DD, YYYY)`). |
| `datetime` or `datetime(<format>)` | For date and time values (defaults to `yyyy-MM-dd HH:mm:ss`). Renders as a date and/or time picker. Supports custom formats. |
| `bool` | For boolean (true/false) values. Renders as a switch or checkbox. |

### Date & Datetime Custom Formats

For `date` and `datetime` fields, you can optionally supply a format inside parentheses, such as `date(MMMM DD, YYYY)` or `datetime(YYYY-MM-DD HH:mm:ss)`.

The framework supports JavaScript-style (e.g., Moment.js) date tokens, which are automatically translated to Dart `DateFormat` patterns under the hood:

- `YYYY` or `yyyy` -> Full year (e.g. `2026`)
- `YY` or `yy` -> Two-digit year (e.g. `26`)
- `MMMM` -> Full month name (e.g. `May`)
- `MMM` -> Short month name (e.g. `May`)
- `MM` -> Two-digit month number (e.g. `05`)
- `M` -> Month number (e.g. `5`)
- `DD` or `dd` -> Two-digit day of month (e.g. `16`)
- `D` or `d` -> Day of month (e.g. `16`)
- `HH` -> Hour 24h format (e.g. `14`)
- `mm` -> Minutes (e.g. `30`)
- `ss` -> Seconds (e.g. `45`)

#### Example

```json
{
  "label": "Date Created",
  "reference": "created_at",
  "type": "date(MMMM DD, YYYY)",
  "required": true
}
```
This configuration renders the date in a format like `May 16, 2026`.

### Custom Column & Background Colors

You can customize the background and text colors of cells in a column. The framework supports two formats for `background_colors` and `text_colors`:

1. **Mapping by specific values (Map format)**: Key names are case-insensitive substrings of the values to match.
2. **Applying to all values (String format)**: A single hex string color is applied to all values in the column.

If `text_colors` are not specified or omitted, the framework automatically uses white text for dark background colors and black text for light background colors based on brightness estimation.

#### Example: Specific Value Matching (Map format)
```json
{
  "label": "PIC Initial",
  "reference": "initiator_initials",
  "type": "text",
  "background_colors": {
    "BFW": "#E8F5E9",
    "ABN": "#E3F2FD",
    "MAL": "#FFF3E0"
  },
  "text_colors": {
    "BFW": "#2E7D32",
    "ABN": "#1565C0",
    "MAL": "#EF6C00"
  }
}
```

#### Example: All Values (String format)
```json
{
  "label": "Change Control Number",
  "reference": "change_control_number",
  "type": "text",
  "background_colors": "#E8F5E9",
  "text_colors": "#2E7D32"
}
```

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
