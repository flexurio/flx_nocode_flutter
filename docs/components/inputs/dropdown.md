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
| `select_first_option` / `auto_select_first` | Boolean | No | If `true`, automatically selects the first candidate option when initial value is empty or when parent dependencies change. |
| `dependsOn` | Array | No | IDs that trigger a reload on change. |
| `onChangeActions` / `on_change` | Array/Object | No | Component-level actions run when value changes. |
| `required` | Boolean | No | Validation requirement. |
| `enabled` | Boolean | No | Editability. |

> **Note on Option Resolution:**
> `optionKey` and `optionLabel` are "smart". They first try to find a matching field in the data object (including nested fields like `user.name`). If no matching field is found, they fall back to evaluating the string as a JavaScript template if it contains `{{ ... }}`.

## Auto-Selecting First Option (`select_first_option`)

When `select_first_option` (or alias `auto_select_first`) is set to `true`:
- If `initialValue` is empty or does not match any option, the first available option is selected automatically.
- If static placeholder options with empty keys exist (e.g. `{"key": "", "label": "Pilih..."}`), it will select the first non-empty option.
- In dependent dropdowns (`dependsOn`), whenever the parent component changes and new options are fetched via `httpData`, the dropdown automatically resets and selects the first option from the newly loaded dataset.

```json
{
  "id": "account_bank_id",
  "type": "dropdown",
  "label": "Account Bank No",
  "select_first_option": true,
  "dependsOn": ["account_bank_nip"],
  "httpData": {
    "method": "GET",
    "url": "{{backend_host}}/lbb_account_banks?nip.eq={{ form.account_bank_nip }}&is_active.eq=1",
    "headers": {
      "Authorization": "Bearer {{ auth_token }}"
    }
  },
  "optionKey": "{{item.id}}",
  "optionLabel": "{{item.id}} - {{item.account_name}}"
}
```

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

## Widget Lifecycle & Controller Re-initialization

When rendering dropdown components with `toWidget()`, the returned `ComponentDropdownWidget` is automatically keyed with `ValueKey(id)`.

If the underlying component ID or component configuration changes dynamically (such as during component switching in dynamic layout forms), `ComponentDropdownWidget` automatically detects the change in `didUpdateWidget`, deletes the previous `ComponentDropdownController` instance, and cleanly initializes a fresh controller with updated properties.

