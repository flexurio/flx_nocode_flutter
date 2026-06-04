# `date_picker`

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
