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
| `margins` | Object/Num | No | Page margins. e.g., `20` or `{"top": 15, "left": 10}`. |
| `header` | Array | No | Global components prepended to every page. |
| `header_height`| Number | No | Reserved height for global header (Document mode only). |
| `footer` | Array | No | Global components appended to every page. |
| `footer_height`| Number | No | Reserved height for global footer (Document mode only). |
| `content` | Array | Yes* | List of components to render (Required for **Document** mode). |
| `pages` | Array | Yes* | List of page definitions (Required for **Canvas** mode). |

---

## 3. Data & Interpolation

The engine uses a double-brace syntax `{{variable}}` for dynamic data injection.

### Data Scopes:
*   **`{{data.key}}`**: Accesses data passed from the triggering action (e.g., `WorkflowContext`).
*   **`{{backend_host}}`**: Automatically injected environment variable for API endpoints.
*   **API Data**: Any keys returned by an `http_data` request (see below) are added to the root scope.

### Dynamic Data Fetching (`http_data`):
You can fetch external data directly within the print configuration. The result is automatically merged into the data context.

```json
"data_sources": {
  "profile": {
    "http_data": {
      "method": "GET",
      "url": "{{backend_host}}/users/{{data.user_id}}"
    }
  }
}
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
