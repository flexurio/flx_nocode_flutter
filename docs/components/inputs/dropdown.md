# `dropdown`

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

## Static Options with Explicit Key and Label

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
