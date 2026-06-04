# `radio`

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
