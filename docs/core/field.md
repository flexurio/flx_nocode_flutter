# Entity Field JSON Documentation

This document provides a detailed explanation of the `EntityField` and `FieldOptions` models, which are used for dynamic entity configuration in the application. These models define the structure, behavior, and validation for each field within an entity.

---

## `EntityField` Class

The `EntityField` class represents a single field definition. It describes how a field should be rendered in the UI, how it should be validated, and what actions (like create, update, copy) are permitted.

### Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | A human-readable label for the field, displayed in UI elements like forms and table headers. |
| `reference` | String | Yes | A unique identifier or key for the field. This is used to access the field's value within a data object. |
| `type` | String | Yes | Defines the data type of the field. See [Supported Field Types](#supported-field-types) for a list of available types. |
| `column_width` | double? | No | An optional value that specifies the width of the column when the field is displayed in a table or grid. |
| `auto_generated` | bool? | No | A flag indicating whether the field's value is generated automatically by the system. |
| `required` | bool | No | If `true`, this field must have a value. Defaults to `false`. |
| `pattern` | String? | No | A regular expression pattern used to validate the field's input. |
| `pattern_error` | String? | No | The error message to display if the input does not match the specified `pattern`. |
| `options_source` | String? | No | An identifier for the source of data for option-based fields like dropdowns or lookups (e.g., an API endpoint or a local data source). |
| `min_length` | int? | No | The minimum required length for a text-based field. |
| `max_length` | int? | No | The maximum allowed length for a text-based field. |
| `allow_create` | bool? | No | A flag that determines if this field should be included in creation forms. |
| `allow_update` | bool? | No | A flag that determines if this field can be modified after its initial creation. |
| `is_copyable` | bool? | No | A flag that indicates whether the field's value can be copied from the UI, often used for displaying a copy icon next to the field. |
| `is_tooltip` | bool? | No | A flag that indicates whether hovering over the field cell in a table shows a tooltip with the value. |
| `is_pinned` | bool? | No | Whether this column is pinned on the table. When true, the column remains fixed on the left during horizontal scrolling. |
| `is_badge` | bool? | No | Whether to render the field value as a context badge at the top of entity views (above the table or card grid) instead of repeating identical values as redundant columns across rows. |
| `icon` | String? | No | Custom icon name for context badges or field headers (e.g. `calendar`, `user`, `location`, `category`, `money`, `info`). If omitted, auto-resolved from reference and type. |
| `is_chip` | bool? | No | Whether to render the field value as a colored status chip. |
| `value_labels` | Map<String, String>? | No | Maps raw system/database codes (e.g. `"EVALUATION_APPROVAL"`) to human-readable display labels (e.g. `"Evaluasi & Persetujuan"`). Works for both chip and non-chip fields across table, detail (`field_display`), inline filter dropdown, export (XLSX/PDF), and `layout_print` (`{{<ref>_label}}`). Backward-compatible alias: `chip_labels`. |
| `chip_colors` | Map<String, String>? | No | Custom color overrides for status chips. Always matched against the **raw value code** (exact case-insensitive match first, then substring fallback), value is hex color (e.g., `"#FF9800"`). |
| `background_colors` | Map<String, String>? or String? | No | Custom background colors. Can be a map mapped to values (e.g. `{"BFW": "#E8F5E9"}`) or a single string (e.g. `"#E8F5E9"`) to apply the color to all values. |
| `text_colors` | Map<String, String>? or String? | No | Custom text colors. Can be a map mapped to values (e.g. `{"BFW": "#2E7D32"}`) or a single string (e.g. `"#2E7D32"`) to apply to all values. Automatically selects contrast color if omitted. |
| `action` | Object? | No | Optional action triggered when clicking this cell in the data table (e.g., opening a popup table or form). See [Field Actions / Clickable Table Cells](#field-actions--clickable-table-cells). |
| `options` | FieldOptions? | No | A nested configuration object for fields that require a list of options, such as dropdowns. See [FieldOptions Class](#fieldoptions-class) for more details. |

### JSON Representation

The `EntityField` is typically created from a JSON object. Here is an example of its structure:

```json
{
  "label": "Name",
  "reference": "name",
  "type": "text",
  "column_width": 150,
  "auto_generated": false,
  "required": true,
  "is_copyable": true,
  "is_tooltip": true,
  "is_chip": true,
  "chip_colors": {
    "REJECT": "#E53935",
    "APPROVE": "#43A047"
  },
  "pattern": "^[A-Za-z]+$",
  "pattern_error": "Only letters are allowed.",
  "min_length": 2,
  "max_length": 50,
  "allow_create": true,
  "allow_update": true,
  "options_source": "user_roles"
}
```

---

## Supported Field Types

The `type` property in an `EntityField` determines its data type and how it is rendered in the UI. The following types are supported:

| Type String | Description |
| --- | --- |
| `text` | For string values. Renders as a standard text input field. |
| `number` | For numeric values (integers or doubles). Renders as a numeric input field. |
| `date` or `date(<format>)` | For date-only values (defaults to `yyyy-MM-dd`). Renders as a date picker. Supports custom formats (e.g. `date(MMMM DD, YYYY)`). |
| `datetime` or `datetime(<format>)` | For date and time values (defaults to `yyyy-MM-dd HH:mm:ss`). Renders as a date and/or time picker. Supports custom formats. |
| `bool` | For boolean (true/false) values. Renders as a switch or checkbox. |

### Date & Datetime Custom Formats

For `date` and `datetime` fields, you can optionally supply a format inside parentheses, such as `date(MMMM DD, YYYY)` or `datetime(YYYY-MM-DD HH:mm:ss)`.

The framework supports JavaScript-style (e.g., Moment.js) date tokens, which are automatically translated to Dart `DateFormat` patterns under the hood:

- `YYYY` or `yyyy` -> Full year (e.g. `2026`)
- `YY` or `yy` -> Two-digit year (e.g. `26`)
- `MMMM` -> Full month name (e.g. `May`)
- `MMM` -> Short month name (e.g. `May`)
- `MM` -> Two-digit month number (e.g. `05`)
- `M` -> Month number (e.g. `5`)
- `DD` or `dd` -> Two-digit day of month (e.g. `16`)
- `D` or `d` -> Day of month (e.g. `16`)
- `HH` -> Hour 24h format (e.g. `14`)
- `mm` -> Minutes (e.g. `30`)
- `ss` -> Seconds (e.g. `45`)

#### Example

```json
{
  "label": "Date Created",
  "reference": "created_at",
  "type": "date(MMMM DD, YYYY)",
  "required": true
}
```
This configuration renders the date in a format like `May 16, 2026`.

### Custom Column & Background Colors

You can customize the background and text colors of cells in a column. The framework supports two formats for `background_colors` and `text_colors`:

1. **Mapping by specific values (Map format)**: Key names are case-insensitive substrings of the values to match.
2. **Applying to all values (String format)**: A single hex string color is applied to all values in the column.

If `text_colors` are not specified or omitted, the framework automatically uses white text for dark background colors and black text for light background colors based on brightness estimation.

#### Example: Specific Value Matching (Map format)
```json
{
  "label": "PIC Initial",
  "reference": "initiator_initials",
  "type": "text",
  "background_colors": {
    "BFW": "#E8F5E9",
    "ABN": "#E3F2FD",
    "MAL": "#FFF3E0"
  },
  "text_colors": {
    "BFW": "#2E7D32",
    "ABN": "#1565C0",
    "MAL": "#EF6C00"
  }
}
```

#### Example: All Values (String format)
```json
{
  "label": "Change Control Number",
  "reference": "change_control_number",
  "type": "text",
  "background_colors": "#E8F5E9",
  "text_colors": "#2E7D32"
}
```

### Context Badges (`is_badge`, `icon`)

When a field represents high-level contextual information that is uniform across all rows (such as fiscal year, period, branch, or area), marking `"is_badge": true` displays the field as a clean visual badge at the top of the table/card grid instead of repeating it as a redundant column across all rows.

- **`is_badge`** (`bool`): When `true`, this field will be resolved as a top context badge.
- **`icon`** (`String`): Optional custom icon key (`calendar`, `user`/`person`, `business`, `location`/`area`, `product`/`box`, `category`/`type`, `money`, `flag`/`status`, `phone`, `email`, `document`, `info`). If not specified, the system automatically resolves an icon from the field reference and type.

#### Example
```json
{
  "label": "Year",
  "reference": "tahun",
  "type": "text",
  "is_badge": true,
  "icon": "calendar"
}
```

### Field Actions / Clickable Table Cells

Fields displayed in data tables can define an `action` (or alias `click_action`). When defined, the cell values are rendered as clickable elements (styled with blue underline link styling) and trigger the configured action on tap.

The action can execute any supported behavior, including opening a popup dialog with another entity's table (`"view_type": "table"`), opening a form, or running an HTTP request. Dynamic variables from the clicked row (such as `{{row.tahun}}` or `{{field.reference}}`) are interpolated into `filters` or `params`.

#### Example: Clickable Column Opening a Detail Table Dialog
```json
{
  "label": "01",
  "reference": "1",
  "type": "number",
  "column_width": 8,
  "action": {
    "id": "view_detail_01",
    "name": "Detail Sales Target Bulan 01",
    "type": "show_dialog",
    "view_type": "table",
    "target_entity": "sales_target_monthly_trend_details",
    "title": "Sales Target Monthly Trend Detail - Bulan 01",
    "filters": [
      {
        "reference": "tahun",
        "value": "{{row.tahun}}"
      },
      {
        "reference": "bulan",
        "value": "1"
      }
    ]
  }
}
```

---

## Value Labels (`value_labels` & Static `options_source`)

Use `value_labels` on an `EntityField` to map raw system/database codes (e.g. `EVALUATION_APPROVAL`) to human-readable labels (e.g. `"Evaluasi & Persetujuan"`) once as a **Single Source of Truth** across the entire entity lifecycle.

### Design Principle: `type` vs `is_chip` vs `value_labels`

Keep data type, visual presentation, and value mapping orthogonal:
- **`type`** defines the data & form input behavior (`text`, `select`, `date`, `number`, `bool`, etc.).
- **`is_chip`** (`true`/`false`) is purely a read-only visual modifier (renders as a colored pill/badge). Do **not** invent a separate `"type": "chip"` — keep `is_chip: true` composable with any `type`.
  - Use `"type": "text"` + `"is_chip": true` + `"value_labels"` for **read-only / workflow-managed** fields (e.g. `status`).
  - Use `"type": "select"` + `"is_chip": true` + `"options_source"` for **user-editable** fields in forms.
- **`value_labels`** maps raw codes to human-readable text for **both chip and non-chip** fields (e.g. `severity: { "MAJOR": "Mayor", "MINOR": "Minor" }`).

### Resolution Priority

When resolving a raw value to its display label (`FieldValueLabelResolver`), the engine checks in order:
1. **`value_labels`** (or backward-compatible aliases `valueLabels`, `chip_labels`, `chipLabels`) — exact key match first, then case-insensitive key match.
2. **Static `options_source`** (`values('KEY':'Label', ...)`) — exact key match first, then case-insensitive key match.
3. **Dynamic `display_source`** (or auto-derived from `backend.<entity>` in `options_source`) — resolved and cached in memory via `ReferenceLabelCache`.
4. **Raw fallback** — returns `rawValue.toString()` unchanged so newly added backend codes never break the UI.

If both `value_labels` and static `options_source` or `display_source` are defined on the same field, `value_labels` overrides matching keys.

### Raw Code vs Display Label Contract

The framework strictly separates **raw system codes** from **translated display labels**:
- **Always uses `rawValue` (code)**:
  - `chip_colors`, `background_colors`, and `text_colors` matching
  - API query parameters emitted by `InlineFilter` (e.g. `status.eq=EVALUATION_APPROVAL`)
  - Visibility rules / conditional logic and `layout_print` raw placeholders (`{{status}}`)
- **Always uses `displayValue` (label)**:
  - Table cells (`EntityFieldDisplay`) and tooltips
  - Detail views (`field_display` / `ComponentFieldDisplay`)
  - Dropdown item labels in `InlineFilter`
  - Exported spreadsheet/PDF cells (`xlsx` / `pdf`)
  - Formatted print placeholders (`{{status_label}}`)

### Chip Color Resolution (`chip_colors`)

Colors are always resolved from the **raw code** before translating to the display label:
1. **Exact case-insensitive key match** in `chip_colors` (prevents substring collisions such as `APPROVAL` vs `EVALUATION_APPROVAL`).
2. **Substring match** in `chip_colors` (preserves backward compatibility with legacy partial keys).
3. **Built-in semantic fallback**: `REJECT`/`FAIL` (red), `APPROVE`/`SUCCESS`/`DONE`/`OK` (green), `INPUT`/`DRAFT`/`PENDING` (blue), `CANCEL`/`CLOSE` (grey), `PROGRESS`/`PROCESS`/`ACTIVE` (orange), default (grey-blue).

### Integration Across All 5 Consumers

| Consumer | How It Works | Extra Config Required? |
| --- | --- | --- |
| **Table** (`EntityFieldDisplay`) | Renders display label (chip or plain text); resolves colors against raw code. | None — reads `EntityField` directly. |
| **Detail** (`field_display`) | Inherits `value_labels`, static `options_source`, and `chip_colors` via `field_ref` (or auto-inferred from `{{current.status}}`). Local properties override entity defaults. | Optional `field_ref: "status"`. |
| **Filter** (`InlineFilter`) | Any field with `value_labels` or static `options_source` automatically renders as a searchable dropdown showing labels and emitting raw codes (unless filter `type` is explicitly `"text"`). | None — just `{"reference": "status"}`. |
| **Export** (`xlsx` / `pdf`) | `generalXlsxNoCode` and `pdfGeneral` automatically format cells using entity field definitions without mutating source rows. | None — `fields: ["code", "status"]` works automatically. |
| **Print** (`layout_print`) | Non-destructively injects `{{<reference>_label}}` into root data and nested table rows while keeping raw `{{<reference>}}` intact. | Use `{{status_label}}` in print template. |

### Complete Best-Practice JSON Examples

#### Pattern A — Workflow Status Chip (`value_labels` + `chip_colors`)
```json
{
  "reference": "status",
  "label": "Status",
  "type": "text",
  "is_chip": true,
  "value_labels": {
    "DRAFT": "Draf",
    "EVALUATION_APPROVAL": "Evaluasi & Persetujuan",
    "CLOSED": "Ditutup"
  },
  "chip_colors": {
    "DRAFT": "#9E9E9E",
    "EVALUATION_APPROVAL": "#F57C00",
    "CLOSED": "#2E7D32"
  }
}
```

#### Pattern B — Editable Select Field (Reusing Static `options_source`)
```json
{
  "reference": "department",
  "label": "Departemen",
  "type": "select",
  "options_source": "values('PROD':'Produksi','QA':'Penjaminan Mutu','QC':'Pengawasan Mutu')"
}
```
> Static `options_source` is automatically honored in table, detail, filter, export, and print without repeating `value_labels`.

#### Pattern C — Non-Chip Coded Field
```json
{
  "reference": "severity",
  "label": "Tingkat Keparahan",
  "type": "text",
  "value_labels": {
    "CRITICAL": "Kritis",
    "MAJOR": "Mayor",
    "MINOR": "Minor"
  }
}
```

#### Consumer Snippets (Zero Duplication)
```json
// Inline filter — displays Indonesian labels, sends raw code (e.g. status.eq=EVALUATION_APPROVAL)
{ "reference": "status" }

// Detail view (field_display) — inherits value_labels & chip_colors from EntityField "status"
{
  "id": "v_status",
  "type": "field_display",
  "label": "Status",
  "value": "{{current.status}}",
  "field_ref": "status",
  "is_chip": true
}

// Print template (layout_print) — raw {{status}} preserved, {{status_label}} formatted
{ "type": "text", "value": "Status: {{status_label}}" }
```

---

## Foreign Key Reference Resolution (`display_source`)

When relational tables store raw foreign-key identifiers (e.g. `capa_category_id: 3`, `site_id: 1`, `pic_nip: "SPV-QC-01"`), use `display_source` on `EntityField` to resolve and format them into human-readable labels (e.g. `"CAT-01 - Deviasi Mayor"`) automatically across all UI and export surfaces.

### Design Principles

1. **Anti-N+1 Batch Fetching & Per-ID In-Flight Coalescing (DataLoader Pattern)**:
   When rendering a table page or exporting records, `ReferenceLabelCache.ensureLoadedForRows` groups distinct IDs per column into a single batch HTTP request (e.g. `GET /plant_capa_categories?id.in=1,2,3`). Every in-flight ID is indexed individually (`_inFlightByKey`), so concurrent single-cell `resolveOne()` calls automatically attach to the active page batch without firing duplicate single-ID HTTP requests.
2. **Template-Scoped Global In-Memory TTL Cache & Logout Hygiene**:
   Resolved references are stored in memory keyed by `(path, key, labelTemplate, rawValue)` (`cache_ttl_seconds`, default 300s). Including `labelTemplate` in the cache key ensures two fields referencing the same entity with different formats (e.g. `{{item.code}} - {{item.name}}` vs `{{item.name}}`) never collide. Calling `UserRepositoryAppNocode.logout()` automatically clears `ReferenceLabelCache` for shared-workstation GMP/CPOB safety.
3. **Automatic Auto-Derivation from `options_source`**:
   If a field already defines an `options_source` with `backend.<entity>({key}:{label})` (e.g. in form dropdowns), `display_source` is auto-derived automatically with zero duplicate configuration.
4. **Consistency Across 5 Surfaces**:
   - **Table**: Renders `"KODE - NAMA"` synchronously from cache (or coalesces onto the page batch via `FutureBuilder`).
   - **Detail**: Component `field_display` automatically resolves foreign-key labels via `field_ref`.
   - **Filter**: `InlineFilter` automatically displays searchable options while emitting raw foreign key IDs.
   - **Export XLSX**: `generalXlsxNoCode` formats cells with resolved display labels after `ButtonExport` preloads all rows.
   - **Print PDF**: `JsonPdfGenerator` preloads foreign keys for both root `contextData` and nested `sources.*` lists, enriching `<field>_label` placeholders non-destructively.

### Schema & Properties

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `String` | Required* | Relative API path (e.g. `/plant_capa_categories`). Auto-prefixed with `backend_host`. |
| `entity` | `String` | Optional | Alias for `path` (e.g. `"plant_capa_categories"`). |
| `key` | `String` | `"id"` | Identifier column on the referenced endpoint. |
| `label` | `String` | `"{{item.name}}"` | Label template string. Supports `{{item.code}} - {{item.name}}`, `{code} - {name}`, or dot notation `{{item.department.name}}`. |
| `batch_param` | `String` | `"{key}.in"` | Query parameter for batch fetching (e.g. `id.in`, `nip.in`). |
| `cache_ttl_seconds` | `int` | `300` | In-memory cache duration in seconds. |
| `fallback` | `String` | `"raw"` | Fallback value if item not found: `"raw"` (returns raw ID), `"empty"` (`""`), or `"dash"` (`"-"`). |
| `url` | `String` | Optional | Direct custom URL format (backward-compatible). |

### Example Configurations

#### Standard Foreign Key Field
```json
{
  "reference": "capa_category_id",
  "label": "Kategori CAPA",
  "type": "number",
  "display_source": {
    "path": "/plant_capa_categories",
    "key": "id",
    "label": "{{item.code}} - {{item.name}}",
    "batch_param": "id.in",
    "cache_ttl_seconds": 600
  }
}
```

#### User / Employee NIP Reference
```json
{
  "reference": "pic_nip",
  "label": "Penanggung Jawab (PIC)",
  "type": "text",
  "display_source": {
    "path": "/users",
    "key": "nip",
    "batch_param": "nip.in",
    "label": "{{item.nip}} - {{item.name}}"
  }
}
```

#### Shorthand Backend Syntax (Compatible with `options_source`)
```json
{
  "reference": "site_id",
  "label": "Pabrik / Site",
  "type": "number",
  "display_source": "backend.plant_sites({id}:{code} - {name})"
}
```

---

## `FieldOptions` Class

The `FieldOptions` class provides configuration for fields that display a list of selectable options, such as dropdowns or lookups. It is used when the `type` is `select` or a similar option-based field.

### Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `source` | String | Yes | The source of the data for the options (e.g., an API endpoint, a Hive box name, or another identifier). |
| `label_field` | String | Yes | The name of the field in the source data to be used as the display label for each option in the UI. |
| `value_field` | String | Yes | The name of the field in the source data to be used as the actual value when an option is selected. |

### JSON Representation

Here is an example of a JSON object for `FieldOptions`, which would be nested inside an `EntityField` object:

```json
{
  "reference": "category_id",
  "label": "Category",
  "type": "select",
  "required": true,
  "options": {
    "source": "api/categories",
    "label_field": "category_name",
    "value_field": "id"
  }
}
```
