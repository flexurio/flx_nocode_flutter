# ComponentFieldArray JSON Documentation

The `ComponentFieldArray` (`type: "field_array"`) is a first-class repeatable form input component designed for **master-detail child rows** (such as deviation sources, PO line items, or batch details) inside forms and `multi_forms` wizards.

Unlike `type: "table"` (which is designed for server-backed data grids and row actions), `field_array` is a native `FormField<List<Map<String, dynamic>>>`:
- Its value is exposed directly as a **native JSON Array** in `{{ form.<id> }}` (no `JSON.parse(...)` workaround needed).
- It integrates natively with Flutter `FormState` validation — blocking wizard `Next` and `Submit` when collection constraints (`min_rows`, `max_rows`, `unique_by`) or any per-cell `required` validator fails.
- It supports both **`table`** (inline editable grid) and **`card`** (stacked repeatable cards) presentations from the same schema.
- It automatically enters read-only mode when `read_only: true`, `enabled: false`, or when rendered inside a `view` form (`DataAction.view`).

---

## Component Properties

| Key | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `id` | String | Yes | - | Unique identifier and form value key (`{{ form.<id> }}`). |
| `type` | String | Yes | - | Must be `"field_array"`. |
| `label` | String | No | `""` | Section label displayed above the component along with the row count badge. |
| `presentation` | String | No | `"table"` | Layout mode: `"table"` (rendered with `YuhuTable`) or `"card"` (repeatable cards). |
| `row_height` | Double | No | `78` (`48` read-only) | Optional row height in logical pixels for `YuhuTable` in `"table"` mode. |
| `columns` | Array<Object> | Yes | `[]` | Column/field definitions for each row. Alias: `fields`. |
| `constraints` | Object | No | `{}` | Collection-level validation rules (`min_rows`, `max_rows`, `unique_by`). |
| `row_actions` | Object | No | `{}` | Row interaction controls (`allow_add`, `allow_delete`, `add_label`, `empty_message`). |
| `default_row` | Object | No | `null` | Template object for newly added rows. Supports `{{ ... }}` JS interpolation. |
| `initial_value` | List / String | No | `null` | Initial rows (JSON array, JSON string, or template like `{{ form.sources }}`). Alias: `initialValue`, `data`. |
| `reference_id` | String | No | `null` | Optional shared form variable key (useful for binding a Step 3 read-only summary to Step 2's rows). |
| `read_only` | Boolean | No | `false` | Disables editing and hides Add/Delete buttons. Automatically `true` in `view` forms. |
| `enabled` | Boolean | No | `true` | If `false`, disables editing and hides Add/Delete buttons. |
| `width` | Double | No | `null` | Optional fixed width in logical pixels. |
| `visibilityCondition` | String | No | `null` | Logic expression controlling visibility. |

---

## `columns` (or `fields`) Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `header` | String | Yes | Column header (in `table` mode) or field label fallback. Alias: `label`. |
| `body` | String | Yes | Row object key bound to this column (e.g. `source_type`). Alias: `field`, `key`. |
| `width` | Double | No | Column width weight/minimum width in logical pixels (default `180`). |
| `component` | Object | No | Input component rendered per row (`text_field`, `number_field`, `dropdown`, `date_picker`, etc.). If `component.id` or `component.label` is omitted, it defaults to `body` and `header` respectively. If `component` is omitted, the cell renders as read-only text. |

---

## `constraints` Properties

| Key | Type | Description |
| --- | --- | --- |
| `min_rows` | Integer | Minimum number of rows required for step/form validation to pass. |
| `max_rows` | Integer | Maximum number of rows allowed; disables the Add button once reached. |
| `unique_by` | Array<String> | List of row keys whose composite value must be unique across all rows. |

*(Shorthand top-level aliases `min_rows`, `max_rows`, and `unique_by` are also supported.)*

---

## `row_actions` Properties

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `allow_add` | Boolean | `true` | Shows the Add Row button. |
| `allow_delete` | Boolean | `true` | Shows the per-row Delete button. |
| `add_label` | String | `"Add row"` | Label text for the Add Row button. |
| `empty_message` | String | `"No rows added yet."` | Placeholder shown when there are 0 rows. |

*(Shorthand top-level aliases `allow_add`, `allow_delete`, `allow_delete_row`, `add_row_label`, and `empty_message` are also supported.)*

---

## Example: Editable Table with Validation (Plant CPOB)

```json
{
  "id": "sources",
  "type": "field_array",
  "label": "Sumber Deviasi",
  "presentation": "table",
  "constraints": {
    "min_rows": 1,
    "max_rows": 10,
    "unique_by": ["source_type", "source_record_no"]
  },
  "row_actions": {
    "allow_add": true,
    "allow_delete": true,
    "add_label": "Tambah baris",
    "empty_message": "Belum ada baris. Klik Tambah baris untuk menambahkan."
  },
  "default_row": {
    "source_type": "",
    "source_record_no": "",
    "known_date": ""
  },
  "columns": [
    {
      "header": "Jenis sumber",
      "body": "source_type",
      "width": 200,
      "component": {
        "type": "dropdown",
        "required": true,
        "options": ["Batch Record", "Inspeksi", "Keluhan"]
      }
    },
    {
      "header": "Nomor rekaman",
      "body": "source_record_no",
      "width": 220,
      "component": {
        "type": "text_field",
        "required": true
      }
    },
    {
      "header": "Tanggal diketahui",
      "body": "known_date",
      "width": 180,
      "component": {
        "type": "date_picker",
        "date_format": "yyyy-MM-dd"
      }
    }
  ]
}
```

## Example: Card Presentation (`presentation: "card"`)

Use `"presentation": "card"` when each child record has many fields or needs to fit narrow viewports comfortably:

```json
{
  "id": "items",
  "type": "field_array",
  "label": "Daftar Item Material",
  "presentation": "card",
  "constraints": { "min_rows": 1 },
  "row_actions": { "add_label": "Tambah item" },
  "fields": [
    {
      "header": "Nama Material",
      "body": "material_name",
      "component": { "type": "text_field", "required": true }
    },
    {
      "header": "Qty",
      "body": "qty",
      "component": { "type": "number_field", "required": true }
    }
  ]
}
```

## Submitting `{{ form.<id> }}` as a Native JSON Array

Because `ComponentFieldArray` outputs a typed `List<Map<String, dynamic>>`, you can bind it directly in `submit_workflow` without `JSON.parse`:

```json
"body": {
  "title": "{{ form.title }}",
  "details": "{{ form.sources }}"
}
```
