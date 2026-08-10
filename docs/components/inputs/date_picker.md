# `date_picker`

Input for date values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Date Picker` | Display label. |
| `initialValue` | String | - | Initial date value. |
| `minDate` | String | - | Minimum selectable date. |
| `maxDate` | String | - | Maximum selectable date. |
| `dateFormat` | String | - | Date display/parse format (e.g. `yyyyMMdd`, `yyyy-MM-dd`). Supports 8-digit string parsing (`YYYYMMDD`). |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |

Example (using `yyyyMMdd` payload format):

```json
{
  "id": "period_start",
  "type": "date_picker",
  "label": "Period Monitoring Start",
  "initialValue": "{{data.period_start}}",
  "dateFormat": "yyyyMMdd",
  "required": true
}
```

> **Note**: Both initial value parsing and payload output automatically handle 8-digit date strings such as `"20251231"` or `"20250401"`.
