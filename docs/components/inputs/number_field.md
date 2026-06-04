# `number_field`

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
