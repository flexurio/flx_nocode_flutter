# `number_field`

Input field for numeric values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Number Field` | Display label. |
| `initialValue` | String | - | Initial numeric value. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |
| `is_currency` / `isCurrency` / `separator` | Boolean | `false` | Enables money / thousand separator formatting on input. Automatically unformatted upon form data extraction. |

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

Example with Money Separator enabled (`is_currency: true`):

```json
{
  "id": "submission_total",
  "type": "number_field",
  "label": "Submission Total",
  "is_currency": true,
  "required": true
}
```
