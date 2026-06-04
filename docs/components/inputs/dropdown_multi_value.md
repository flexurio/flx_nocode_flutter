# `dropdown_multi_value`

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
