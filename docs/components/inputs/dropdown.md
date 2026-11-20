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
| `search_live` / `searchLive` | Boolean | No | If `true`, fetches options dynamically from API based on user search input with a debounce. Prevents loading excessive data. |
| `search_live_limit` / `searchLiveLimit` | Integer | No | Maximum number of records fetched per live search request (default: 20). |
| `search_live_parameter` / `searchLiveParameter` | String | No | Endpoint query parameter used for search text (e.g. `"outlet_name.like"` or `"name.like"`). |
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

## Live Search from API (`search_live`)

When working with large datasets (such as thousands of customers or outlets), loading all records at once causes significant network overhead and memory usage.

Setting `"search_live": true` converts the dropdown to fetch data on-demand as the user types into the search box:
- **`search_live`**: Set to `true` to enable live search mode.
- **`search_live_limit`**: Limits the number of results returned per query (e.g. `20`). Defaults to 20 if omitted.
- **`search_live_parameter`**: Specifies the query parameter name sent to the API endpoint (e.g. `"outlet_name.like"` or `"name.like"`).
- **Debounce**: Automatically debounces keystrokes (350ms) before issuing the HTTP request to prevent rapid duplicate requests.
- **Query Parameter Preservation**: Existing query parameters in the `httpData.url` (such as `period.eq` or `marketing_structure_id.eq`) are preserved. When the user types a search term, `${search_live_parameter}=<query>` and `limit=<limit>` are dynamically appended.

```json
{
  "id": "outlet_id",
  "type": "dropdown",
  "label": "Outlet ID",
  "search_live": true,
  "search_live_limit": 20,
  "search_live_parameter": "outlet_name.like",
  "httpData": {
    "method": "GET",
    "url": "https://api.example.com/outlets?marketing_structure_id.eq={{ parent.area_code }}&period.eq={{ form.period }}",
    "headers": {
      "Authorization": "Bearer {{ auth_token }}"
    }
  },
  "optionKey": "{{item.outlet_id}}",
  "optionLabel": "{{item.outlet_id}} - {{item.outlet_name}}",
  "dependsOn": ["period"]
}
```

## Widget Lifecycle & Controller Re-initialization

When rendering dropdown components with `toWidget()`, the returned `ComponentDropdownWidget` is automatically keyed with `ValueKey(id)`.

If the underlying component ID or component configuration changes dynamically (such as during component switching in dynamic layout forms), `ComponentDropdownWidget` automatically detects the change in `didUpdateWidget`, deletes the previous `ComponentDropdownController` instance, and cleanly initializes a fresh controller with updated properties.

