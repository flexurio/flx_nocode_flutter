# Layout Print JSON Documentation

`LayoutPrint` defines a fully customizable engine for generating pixel-perfect PDF documents. It supports two main layout paradigms to handle *any* kind of print format:
1. **Canvas Mode**: For absolute, free-form positioning (ideal for Certificates, ID Cards, POS Receipts, Custom Tickets).
2. **Bands Mode**: For traditional, repeating data reports (ideal for Invoices, Data Tables, ledgers).

---

## 1. Root Properties

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the print layout (e.g., `print_invoice`). |
| `name` | String | Yes | Human-readable name for the report. |
| `layout_type` | String | Yes | `"canvas"` or `"bands"`. Determines how the engine renders the document. |
| `unit` | String | No | Measurement unit: `"pt"`, `"px"`, `"mm"`, `"cm"`, or `"in"`. Default is `"pt"`. |
| `page_size` | String/Array | No | Standard sizes (`"A4"`, `"LETTER"`) or custom array `[width, height]`. Default is `"A4"`. |
| `orientation` | String | No | `"portrait"` or `"landscape"`. Default is `"portrait"`. |
| `header` | Array | No | Global components that are prepended to *every* page's component list. |
| `footer` | Array | No | Global components that are appended to *every* page's component list. |
| `margins` | Object | No | Page margins: `{ "top": 20, "bottom": 20, "left": 20, "right": 20 }`. |
| `data_sources` | Object | No | Key-value pairs for dynamic data using `HttpData`. |
| `styles` | Object | No | Reusable style definitions for components (fonts, colors). |

---

## 2. Layout Type: Canvas Mode (`pages`)

When `layout_type: "canvas"`, the document is built using an array of `pages`. Every component is placed using absolute `x` and `y` coordinates based on the defined `unit`.

| Key | Type | Description |
| --- | --- | --- |
| `background_color`| String | Hex color for the page background (e.g., `"#FFFFFF"`). |
| `background_image`| String | URL or Base64 for a full-bleed background image. |
| `components` | Array | List of UI components drawn on this page. |

**Example: ID Card / Certificate Layout**
```json
"pages": [
  {
    "background_image": "https://example.com/certificate_bg.png",
    "components": [
      {
        "type": "text",
        "value": "{{sources.student.name}}",
        "x": 100, "y": 150,
        "width": 200, "height": 30,
        "alignment": "center",
        "style": "title_font"
      },
      {
        "type": "qrcode",
        "value": "{{sources.student.verification_url}}",
        "x": 250, "y": 250, "size": 50
      }
    ]
  }
]
```

---

## 3. Layout Type: Bands Mode (`bands`)

When `layout_type: "bands"`, the document flows vertically, automatically creating new pages when content overflows.

| Band Name | Description | Repeated |
| --- | --- | --- |
| `title` | Prints once at the very beginning of the report. | No |
| `page_header` | Prints at the top of every page. | On every page |
| `column_header` | Prints at the top of detail columns. | On every page where details are rendered |
| `detail` | The main data band. Iterates over `data_source_key`. | For each row in data source |
| `column_footer` | Prints at the bottom of detail columns. | On every page where details are rendered |
| `page_footer` | Prints at the bottom of every page. | On every page |
| `summary` | Prints once at the very end of the report. | No |

*Inside bands, components are also placed using `x` and `y` relative to the band's top-left corner.*

---

## 4. Components & Absolute Positioning

To support *any* format, all components support advanced styling and positioning properties:

### Universal Component Properties
| Key | Type | Description |
| --- | --- | --- |
| `x` / `y` | Number | Absolute X/Y position from the top-left of the container (Page or Band). |
| `width`/`height`| Number | Dimensions of the component. |
| `rotation` | Number | Rotation angle in degrees (0-360). Useful for vertical text or rotated barcodes. |
| `z_index` | Number | Layer stacking order. Higher numbers draw on top. |
| `opacity` | Number | Transparency from `0.0` (invisible) to `1.0` (solid). |

### Component Types

1. **`text`**: Supports `font_family`, `font_size`, `color`, `bold`, `is_bold`, `italic`, `alignment` (left, center, right, justify), `max_lines`.
2. **`image`**: Supports `url`, `base64`, `fit` (cover, contain, fill).
3. **`shape`**: Draws primitives. Supports `shape_type` (`rect`, `circle`, `line`), `fill_color`, `border_color`, `border_width`, `border_radius`.
4. **`qrcode`**: Generates a QR Code. Supports `value`, `size`, `fg_color`, `bg_color`.
5. **`barcode`**: Generates a Barcode (e.g., Code128). Supports `value`, `format`, `show_text`.
6. **`html`**: Parses a simple HTML string into PDF elements (useful for rich text).
7. **`table`**: Renders structured tabular data. Supports `columns` (with flex/fixed widths), `data_source_key` for dynamic rows, custom styling, and `show_header` (boolean). **Note:** Table cells can contain plain strings *or* nested component objects (e.g., an `image` or `column` component).
8. **`container`**: Wrapper component. Supports `width`, `height`, `padding`, `margin`, `background_color`, `border_color`, `border_width`, and a single `child` component. Can be used without a `child` to act as a spacer.
9. **`column` / `row`**: Group components vertically or horizontally. Supports `children` array, `main_axis_alignment`, and `cross_axis_alignment` (`start`, `center`, `end`, `space_between`, etc.).
10. **`iterator`** *(Canvas Mode Only)*: Repeats its inner `components` based on a data array in a grid or flex layout (useful for printing multiple labels/tickets on a single A4 page).

---

## 5. Full Example: Fully Custom Event Ticket (Canvas Mode)

This example generates a custom landscape ticket measuring exactly 150mm x 50mm, using precise millimeters, rotation, and barcodes.

```json
{
  "id": "print_concert_ticket",
  "name": "Concert Ticket",
  "layout_type": "canvas",
  "unit": "mm",
  "page_size": [150, 50],
  "orientation": "landscape",
  
  "data_sources": {
    "ticket": {
      "type": "http",
      "http": {
        "method": "GET",
        "url": "{{backend_host}}/tickets/{{data.id}}"
      }
    }
  },
  
  "styles": {
    "title": { "fontSize": 16, "bold": true, "color": "#000000" },
    "sub": { "fontSize": 10, "color": "#666666" }
  },

  "pages": [
    {
      "background_color": "#F9F9F9",
      "components": [
        // Left side: Event Image
        {
          "type": "image",
          "url": "https://example.com/event_banner.jpg",
          "x": 0, "y": 0, "width": 50, "height": 50,
          "fit": "cover"
        },
        
        // Middle: Ticket Info
        {
          "type": "text",
          "value": "SUMMER FESTIVAL 2026",
          "style": "title",
          "x": 55, "y": 5
        },
        {
          "type": "text",
          "value": "Attendee: {{sources.ticket.owner_name}}",
          "style": "sub",
          "x": 55, "y": 20
        },
        {
          "type": "text",
          "value": "Date: 28 Apr 2026",
          "style": "sub",
          "x": 55, "y": 30
        },

        // Perforated Line Separator
        {
          "type": "shape",
          "shape_type": "line",
          "x": 115, "y": 0, "width": 0, "height": 50,
          "border_color": "#CCCCCC", "border_width": 0.5
          // (Can add stroke_dasharray for dashed lines in actual implementation)
        },

        // Right side: Rotated Barcode
        {
          "type": "barcode",
          "value": "{{sources.ticket.barcode_number}}",
          "format": "CODE_128",
          "x": 125, "y": 5, "width": 40, "height": 15,
          "rotation": 90
        }
      ]
    }
  ]
}
```
