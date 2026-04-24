# Input Components

These components are used to capture user input within forms.

## Common Properties

| Key | Type | Description |
| --- | --- | --- |
| `id` | String | Unique identifier. |
| `visibilityCondition` | String | Logic expression to show/hide. |
| `widthMode` | String | `fill`, `hug`, or `fixed`. |
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

---

### `number_field`
Input field for numeric values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Number Field` | Display label. |
| `initialValue` | String | - | Initial numeric value. |

---

### `file_picker`
A component for selecting files.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Upload File` | Display label. |
| `required` | Boolean | `false` | Requirement. |
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
| `dependsOn` | Array | No | IDs that trigger a reload on change. |

> **Note on Option Resolution:**
> `optionKey` and `optionLabel` are "smart". They first try to find a matching field in the data object (including nested fields like `user.name`). If no matching field is found, they fall back to evaluating the string as a JavaScript template if it contains `{{ ... }}`.
