# Layout Print Documentation

`LayoutPrint` is a high-performance, JSON-driven engine for generating pixel-perfect PDF documents in the `flx_nocode_flutter` framework. It supports high-fidelity layout control, dynamic data interpolation, and automated multi-page report generation.

---

## 1. Core Layout Paradigms

The engine supports two primary layout modes:

1.  **Canvas Mode (`layout_type: "canvas"`)**:
    *   **Best for**: Fixed-format documents like Certificates, ID Cards, Tickets, or Labels.
    *   **Behavior**: Components are placed using absolute `x` and `y` coordinates.
    *   **Pages**: You define an array of `pages`, each containing its own absolute components.

2.  **Document Mode (`layout_type: "document"`)**:
    *   **Best for**: Flowing reports like Invoices, Personnel Lists, or Data Ledgers.
    *   **Behavior**: Components flow vertically. If a component (e.g., a large table) exceeds the page height, it automatically overflows to the next page.
    *   **Headers/Footers**: Supports global headers and footers that repeat on every page.

---

## 2. Root Properties

| Key | Type | Required | Description |
| :--- | :--- | :---: | :--- |
| `id` | String | Yes | Unique identifier for the layout (e.g., `invoice_print`). |
| `name` | String | Yes | Human-readable name for the report. |
| `layout_type` | String | Yes | `"canvas"` or `"document"`. |
| `unit` | String | No | Measurement unit: `"pt"`, `"mm"`, `"cm"`, or `"in"`. (Default: `"pt"`) |
| `page_size` | String/Array | No | Standard size (`"A4"`, `"LETTER"`) or custom array `[width, height]`. |
| `orientation` | String | No | `"portrait"` or `"landscape"`. |
| `margins` | Object/Num | No | Page margins. e.g., `20` or `{"top": 15, "right": 15, "bottom": 15, "left": 15}`. (Alias: `margin`) |
| `data_sources` | Object | No | Named external HTTP endpoints fetched in parallel and stored under `{{sources.<key>}}`. |
| `watermark` | Object | No | Page-level watermark rendered on every page (`value`, `font_size`, `color`, `opacity`, `rotation`, `layer`, `repeat`, `visible_if`). |
| `header` | Array | No | Global components prepended to every page. Supports both flow components (`row`, `table`, `text`) and absolute `x`/`y` components. |
| `header_height`| Number | No | Reserved height for global header (Document mode only). |
| `footer` | Array | No | Global components appended to every page. Supports both flow components and absolute `x`/`y` components. |
| `footer_height`| Number | No | Reserved height for global footer (Document mode only). |
| `content` | Array | Yes* | List of components to render (Required for **Document** mode). |
| `pages` | Array | Yes* | List of page definitions (Required for **Canvas** mode). |

---

## 3. Data & Interpolation

The engine uses a double-brace syntax `{{variable}}` for dynamic data injection.

### Data Scopes:
*   **`{{data.key}}`**: Accesses data passed from the triggering action (e.g., `WorkflowContext`).
*   **`{{sources.<name>}}`**: Accesses named datasets fetched from root `data_sources` without overwriting `data`.
*   **`{{_page.number}}` / `{{_page.total}}`**: Runtime current page number and total pages available inside `header` and `footer` (aliases: `{{page}}`, `{{pages}}`).
*   **`{{backend_host}}`**: Automatically injected environment variable for API endpoints.
*   **API Data**: Legacy inline `http_data` blocks are merged into the root scope.
*   **Formatted Field Labels (`{{<field>_label}}`)**: For any entity field configured with `value_labels` (or static `options_source: "values(...)"`), the engine non-destructively injects a sibling `<field>_label` key into both root data and nested table rows. Raw keys such as `{{status}}` remain untouched for conditions and queries, while `{{status_label}}` renders the human-readable label (e.g., `"Evaluasi & Persetujuan"`).

### Formatted Field Labels (`{{<field>_label}}`):
When an entity defines `value_labels` (or static `options_source: "values(...)"`) on its `fields`, `JsonPdfGenerator.generate` automatically enriches both the root context and nested table row lists with `<reference>_label` sibling keys.

- **Non-destructive**: Raw keys such as `{{status}}` remain untouched (e.g., `"EVALUATION_APPROVAL"`), so URL queries (`status.eq={{filter.status}}`) and conditional logic continue working safely.
- **Human-readable**: Use `{{status_label}}` in text components or table cell templates to render `"Evaluasi & Persetujuan"`.

```json
{
  "content": [
    {
      "type": "text",
      "value": "Status Dokumen: {{status_label}}",
      "font_size": 11,
      "is_bold": true
    },
    {
      "type": "table",
      "body": [
        [
          { "content": { "type": "text", "value": "{{deviation_no}}" }, "flex": 3 },
          { "content": { "type": "text", "value": "{{status_label}}" }, "flex": 4 }
        ]
      ]
    }
  ]
}
```

### Dynamic Data Fetching (`data_sources`):
You can fetch multiple external endpoints in parallel within the print configuration. Each named source is stored under its own isolated `sources.<name>` namespace (so multiple sources never overwrite each other or root `data`):

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `http_data` | Object | *(required)* | Standard `HttpData` request definition (`method`, `url`, `headers`, `body`). |
| `data_path` | String | `null` | Optional dot-separated path to extract from the JSON response (e.g. `"data"` or `"result.items"`). When omitted, `{ "data": [...] }` is automatically unwrapped to the list. |
| `on_error` | String | `"empty"` | Error policy: `"empty"` falls back to `[]` so the rest of the PDF still renders; `"fail"` aborts PDF generation with an exception. |

```json
"data_sources": {
  "actions": {
    "http_data": {
      "method": "GET",
      "url": "{{backend_host}}/capa/{{data.id}}/actions"
    },
    "data_path": "data",
    "on_error": "empty"
  },
  "signatures": {
    "http_data": {
      "method": "GET",
      "url": "{{backend_host}}/documents/{{data.id}}/signatures"
    },
    "data_path": "data",
    "on_error": "empty"
  }
}
```

### Root Watermark (`watermark`):
Renders a full-page watermark on every page (in both **Document** and **Canvas** modes), controlled by the standard `flx_nocode_flutter` `visible_if` Rule object (`all` / `any` / `not`):

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `value` | String | `""` | Watermark text (alias: `text`). Supports interpolation (e.g. `"DRAF - {{data.status_label}}"`). |
| `image_url` | String | `null` | Optional image URL for logo/stamp watermark instead of text. |
| `font_size` | Number | `42` | Font size in `pt`. |
| `color` | String | `"#9E9E9E"` | Hex color string (e.g. `"#999999"` for draft, `"#D32F2F"` for obsolete). |
| `opacity` | Number | `0.12` | Opacity between `0.0` and `1.0`. |
| `rotation` | Number | `-30` | Rotation angle in degrees (alias: `angle`). |
| `layer` | String | `"background"` | `"background"` (behind content) or `"foreground"` (over content). |
| `repeat` | String | `"single"` | `"single"` (centered once per page) or `"tiled"` (3x2 repeating grid pattern). |
| `visible_if` | Rule Object | `null` | Standard `Rule` (`all`/`any`/`not`) supporting flat keys and dot-paths (`official_no`, `data.official_no`). |

```json
"watermark": {
  "value": "DRAF - NOMOR BELUM TERBIT",
  "font_size": 36,
  "color": "#999999",
  "opacity": 0.12,
  "rotation": -30,
  "layer": "background",
  "repeat": "single",
  "visible_if": {
    "all": [
      { "field": "official_no", "op": "is_empty" }
    ]
  }
}
```

### Header, Footer & Runtime Page Variables (`{{_page.*}}`):
In **Document Mode**, `header` and `footer` automatically detect how to lay out their children:
- **Flow mode (recommended for reports/CPOB):** When none of the components specify `x` or `y`, components flow vertically at full page width (`table`, `row`, `column`, `text`) and `header_height` / `footer_height` are optional.
- **Absolute mode (backward-compatible):** When any component specifies `x` or `y`, components are placed inside a `Stack` using `header_height` / `footer_height`.

Runtime page variables are interpolated per page in both `header` and `footer` (as well as Canvas pages):
- `{{_page.number}}` / `{{_page.total}}` (preferred; avoids clashing with API `page` fields)
- `{{page}}` / `{{pages}}` (convenience aliases)

```json
"footer": [
  {
    "type": "row",
    "main_axis_alignment": "space_between",
    "children": [
      { "type": "text", "value": "Dokumen terkendali secara elektronik", "font_size": 7, "color": "#777777" },
      { "type": "text", "value": "Halaman {{_page.number}} dari {{_page.total}}", "font_size": 7, "color": "#777777" }
    ]
  }
]
```

---

## 4. Component Library

To keep the documentation organized, all available UI components (Text, Image, Table, Containers, etc.) and their properties are documented in a separate file:

👉 **[View Component Library Documentation](file:///Users/suhal/Documents/Development/projects/vneu/flx_studio/packages/flx_nocode_flutter/docs/logic/layout_print_components.md)**

---

## 5. Action Integration

To trigger a print layout from an interaction (e.g., clicking a "Print" button), use the `print` action:

```json
{
  "type": "print",
  "layout_print_id": "personnel_list_report",
  "data": {
    "dept_id": "D01"
  }
}
```

### Execution Flow:
1.  **Resolve Config**: Engine fetches the `LayoutPrint` with the matching ID.
2.  **Fetch Data**: All `http_data` blocks are executed recursively.
3.  **Interpolate**: The entire JSON config is processed with the merged data context.
4.  **Render**: The PDF is generated and presented in the system's PDF viewer.

---

## 6. Complete Example: Landscape ID Card (Canvas Mode)

```json
{
  "id": "student_id_card",
  "name": "Student ID Card",
  "layout_type": "canvas",
  "unit": "mm",
  "page_size": [85.6, 54],
  "orientation": "landscape",
  "pages": [
    {
      "components": [
        {
          "type": "image",
          "url": "https://example.com/logo.png",
          "x": 5, "y": 5, "width": 15, "height": 15
        },
        {
          "type": "text",
          "value": "{{data.student_name}}",
          "is_bold": true,
          "font_size": 12,
          "x": 25, "y": 10
        },
        {
          "type": "qrcode",
          "value": "{{data.id_number}}",
          "size": 20,
          "x": 60, "y": 30
        }
      ]
    }
  ]
}
```
