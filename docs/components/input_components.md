# Input Components

These components are used to capture user input within forms.

## Common Properties

| Key | Type | Description |
| --- | --- | --- |
| `id` | String | Unique identifier. |
| `label` | String | User-facing label. |
| `required` | Boolean | Whether validation requires a value. |
| `enabled` | Boolean | Whether the input can be edited. |
| `dependsOn` | Array<String> | IDs that can trigger reload/recalculation where supported. |
| `visibilityCondition` | String | Logic expression to show/hide. |
| `widthMode` | String | `fill`, `hug`, or `fixed`. |
| `width` | Double | Fixed width when needed. |
| `flex` | Integer | Flex factor in rows/columns. |

---

### `text_field`
A standard text input field.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Label` | Display label. |
| `initialValue` | String | - | Default value (supports interpolations). |
| `hintText` | String | - | Placeholder text. |
| `maxLength` | Integer | `50` | Max characters. |
| `maxLines` | Integer | `1` | Max visible lines. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |
| `regex` | String | - | Regex validation. |
| `regexErrorMessage` | String | - | Error text shown when regex validation fails. |
| `helperText` | String | - | Helper text below the field. |
| `obscure` | Boolean | `false` | Hides entered text, useful for password fields. |

Example:

```json
{
  "id": "email",
  "type": "text_field",
  "label": "Email",
  "hintText": "name@example.com",
  "required": true,
  "regex": "^[^@]+@[^@]+\\.[^@]+$",
  "regexErrorMessage": "Email is not valid",
  "widthMode": "fill"
}
```

---

### `number_field`
Input field for numeric values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Number Field` | Display label. |
| `initialValue` | String | - | Initial numeric value. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

Example:

```json
{
  "id": "quantity",
  "type": "number_field",
  "label": "Quantity",
  "initialValue": "1",
  "required": true
}
```

---

### `date_picker`
Input for date values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Date Picker` | Display label. |
| `initialValue` | String | - | Initial date value. |
| `minDate` | String | - | Minimum selectable date. |
| `maxDate` | String | - | Maximum selectable date. |
| `dateFormat` | String | - | Date display/parse format used by renderer. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

Example:

```json
{
  "id": "delivery_date",
  "type": "date_picker",
  "label": "Delivery Date",
  "initialValue": "{{current.delivery_date}}",
  "dateFormat": "yyyy-MM-dd",
  "required": true
}
```

---

### `time_field`
Input for time values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Time Field` | Display label. |
| `initialValue` | String | - | Initial time value. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

---

### `file_picker`
A component for selecting files.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Upload File` | Display label. |
| `initialValue` | String | - | Existing file value/path/URL. |
| `required` | Boolean | `false` | Requirement. |
| `enabled` | Boolean | `true` | Editability. |
| `allowedExtensions` | Array | - | e.g., `["pdf", "doc"]`. |

---

### `dropdown`
A selectable list of options.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | Display label. |
| `options` | Array | No | Static options. |
| `httpData` | Object | No | Dynamic options via API. |
| `optionKey` | String | No | Key, dot-notation path, or JS template for the item value. |
| `optionLabel` | String | No | Key, dot-notation path, or JS template for the display label. |
| `initialValue` | String | No | Initial selected value. |
| `dependsOn` | Array | No | IDs that trigger a reload on change. |
| `onChangeActions` / `on_change` | Array/Object | No | Component-level actions run when value changes. |
| `required` | Boolean | No | Validation requirement. |
| `enabled` | Boolean | No | Editability. |

> **Note on Option Resolution:**
> `optionKey` and `optionLabel` are "smart". They first try to find a matching field in the data object (including nested fields like `user.name`). If no matching field is found, they fall back to evaluating the string as a JavaScript template if it contains `{{ ... }}`.

#### Static Options with Explicit Key and Label

Static dropdown options can be declared as objects when the stored value and displayed text need to differ.

This is useful when a dropdown loads dynamic options from `httpData` but still needs one local option, such as returning to the current/latest record after viewing history:

```json
{
  "id": "history_selector",
  "type": "dropdown",
  "label": "Lihat Riwayat",
  "options": [
    {
      "key": "",
      "label": "Versi Terakhir (Latest)"
    }
  ],
  "httpData": {
    "method": "GET",
    "url": "https://example.com/header_histories?id.eq={{data.id}}",
    "headers": {
      "Authorization": "Bearer {{auth_token}}"
    },
    "body": {},
    "use_form_data": false
  },
  "optionKey": "id",
  "optionLabel": "History - {{formatDate(new Date(item.created_at), 'dd/MM/yyyy HH:mm')}}",
  "initialValue": ""
}
```

In this example, selecting `Versi Terakhir (Latest)` sets the dropdown value to an empty string. That empty value can be used in `visibilityCondition` or interpolation logic to switch the page back to editable latest-data mode:

```json
{
  "id": "btn_edit",
  "type": "icon_button",
  "visibilityCondition": "form.history_selector == null || form.history_selector == ''",
  "icon": "Edit"
}
```

---

### `dropdown_multi_value`
Selectable list that allows multiple values.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | Display label. |
| `options` | Array | No | Static options. Strings and `{ "key": ..., "label": ... }` objects are supported. |
| `httpData` | Object | No | Dynamic options via API. |
| `optionKey` | String | No | Key, dot-notation path, or JS template for stored value. |
| `optionLabel` | String | No | Key, dot-notation path, or JS template for display label. |
| `initialValues` | Array<String> | No | Initial selected values. |
| `initialValue` | String/Array | No | Alias accepted by parser; comma-separated strings are split. |
| `dependsOn` | Array | No | IDs that trigger reload. |
| `onChangeActions` / `on_change` | Array/Object | No | Actions run when selection changes. |

Example:

```json
{
  "id": "tag_ids",
  "type": "dropdown_multi_value",
  "label": "Tags",
  "httpData": {
    "method": "GET",
    "url": "/api/tags",
    "headers": {},
    "body": {},
    "use_form_data": false
  },
  "optionKey": "id",
  "optionLabel": "name",
  "initialValues": ["urgent", "internal"]
}
```

---

### `checkbox`
Boolean checkbox.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Checkbox` | Display label. |
| `value` | Boolean | `false` | Initial checked value. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

---

### `switch`
Boolean switch.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Switch` | Display label. |
| `initialValue` | Boolean | `false` | Initial checked value. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

---

### `radio`
Single-choice radio list.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Radio` | Display label. |
| `options` | Array<String> | `["Option 1", "Option 2"]` | Available choices. |
| `initialValue` | String | - | Initial selected option. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

Example:

```json
{
  "id": "priority",
  "type": "radio",
  "label": "Priority",
  "options": ["Low", "Normal", "High"],
  "initialValue": "Normal"
}
```
