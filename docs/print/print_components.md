# Layout Print Component Library

This document details the UI components available for use within the `LayoutPrint` engine. All components share common properties for positioning and dimensions.

---

## 1. Universal Properties

Every component in the library supports these base properties:

| Key | Type | Description |
| :--- | :--- | :--- |
| `type` | String | The component type (e.g., `"text"`, `"image"`). |
| `x` / `y` | Number | Absolute coordinates (Required for **Canvas Mode**). |
| `width` / `height` | Number | Fixed dimensions in the current `unit`. |
| `rotation` | Number | Rotation in degrees (0-360). |
| `margin` | Object/Num | Spacing outside the component. |
| `padding` | Object/Num | Spacing inside the component (if applicable). |
| `visible_if` | Rule Object | Standard `flx_nocode_flutter` visibility rule (`all`/`any`/`not`) supporting flat keys and dot-paths (`official_no`, `data.official_no`, `item.verification_url`). |

---

## 2. Standard Components

### 1. Text (`type: "text"`)
Renders a string of text with support for interpolation.
*   `value`: The string content (e.g., `"Hello {{data.name}}"`).
*   `font_size`: Font size in `pt` (default: `12`).
*   `is_bold`: If `true`, renders bold text.
*   `color`: Hex string (e.g., `"#333333"`).
*   `align`: Horizontal alignment: `"left"`, `"center"`, `"right"`, `"justify"`.
*   `soft_wrap`: If `false`, prevents wrapping to a second line (useful for dates or short codes in narrow table columns).
*   `max_lines`: Optional integer cap on rendered lines.

### 2. Image (`type: "image"`)
Renders an external image.
*   `url`: The public URL of the image.
*   `fit`: How the image fits its box: `"cover"`, `"contain"`, or `"fill"`.

### 3. QR Code (`type: "qrcode"`)
Generates a QR code from a string.
*   `value`: The data to encode.
*   `size`: Width and height of the code.

### 4. Barcode (`type: "barcode"`)
Generates a 1D barcode.
*   `value`: The data to encode.
*   `format`: Encoding format: `"CODE_128"`, `"CODE_39"`, etc.
*   `show_text`: If `true`, shows the raw value below the bars.

### 5. Shape (`type: "shape"`)
Renders primitive shapes.
*   `shape_type`: `"rect"`, `"circle"`, or `"line"`.
*   `border_width`: Thickness of the outline.
*   `border_color`: Hex color for the outline.
*   `fill_color`: Hex color for the interior.

---

## 3. Layout Components

### 1. Container (`type: "container"`)
A wrapper component used for grouping, borders, or backgrounds.
*   `background_color`: Hex color for the background.
*   `border_color`: Hex color for the border.
*   `border_width`: Border thickness.
*   `child`: A single nested component object.

### 2. Row / Column
Used to stack components horizontally or vertically.
*   `children`: An array of component objects.
*   `main_axis_alignment`: `"start"`, `"center"`, `"end"`, `"space_between"`.
*   `cross_axis_alignment`: `"start"`, `"center"`, `"end"`, `"stretch"`.

---

## 4. Advanced Component: Table (`type: "table"`)

The table component is specifically optimized for rendering lists and datasets with automatic pagination support in **Document Mode**.

### Table Properties:
| Key | Description |
| :--- | :--- |
| `data` | The array of objects to iterate over (e.g., `"{{sources.items}}"`). |
| `header` | Column definitions for the header (repeated on every page break). |
| `body` | Column definitions for the data rows. |
| `footer` | Column definitions for the table footer (rendered at the very end). |
| `header_background_color`| Hex color for the header row background. |
| `header_text_color` | Hex color for header text. |
| `cell_padding` | Internal padding for cells (e.g., `4`). |
| `empty_text` | Optional italic message shown when `data` resolves to an empty array (prevents raw template placeholders from rendering). |

### Column Configuration:
Columns in `header`, `body`, or `footer` can be defined as objects:
*   `content`: The component to render (usually `text`).
*   `flex`: Relative width (e.g., `1`, `2`, `3`).
*   `align`: Alignment of the cell content.

### Dynamic Scoping:
When iterating through `data`, the following variables are available inside the `body` cells:
*   `{{item}}`: The current row object (preferred; avoids clashing with root `data`).
*   `{{data}}`: Backward-compatible alias for the current row object.
*   `{{index}}`: 0-based row index.
*   `{{no}}`: 1-based row count (`index + 1`).

### Example Table Configuration:
```json
{
  "type": "table",
  "data": "{{data}}",
  "header": [
    { "content": "No", "flex": 0.5 },
    { "content": "Item", "flex": 3 },
    { "content": "Total", "flex": 1, "align": "right" }
  ],
  "body": [
    { "content": "{{no}}", "flex": 0.5 },
    { "content": "{{item.name}}", "flex": 3 },
    { "content": "{{item.price}}", "flex": 1, "align": "right" }
  ]
}
```

---

## 5. Repeating Grid Component (`type: "grid"`)

Renders a multi-column repeating card layout from an array data source. Every row automatically equalizes card heights (`TableCellVerticalAlignment.full`) and paginates cleanly between rows without splitting a single card across pages.

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | String/Array | *(required)* | Array binding (e.g. `"{{sources.attachments}}"`). |
| `columns` | Int | `3` | Number of cards per row. |
| `gap` | Number | `4` | Uniform horizontal & vertical spacing between cards in the document `unit`. |
| `row_gap` / `column_gap` | Number | `gap` | Optional independent vertical / horizontal gaps. |
| `keep_together` | Bool | `false` | If `true`, keeps the entire grid block on one page when possible. |
| `empty_text` | String | `null` | Italic empty-state banner displayed when `data` is empty. |
| `item_template` | Component | *(required)* | Component template rendered per item (supports `{{item.*}}`, `{{index}}`, `{{no}}`, root `{{data.*}}`, and nested `visible_if`). |

### Example Grid Configuration (Attachment Gallery):
```json
{
  "type": "grid",
  "data": "{{sources.attachments}}",
  "columns": 2,
  "gap": 5,
  "empty_text": "Tidak ada lampiran foto.",
  "item_template": {
    "type": "container",
    "border_color": "#E0E0E0",
    "border_width": 0.5,
    "padding": 3,
    "child": {
      "type": "column",
      "children": [
        { "type": "image", "url": "{{item.file_url}}", "height": 45, "fit": "contain" },
        { "type": "text", "value": "Lampiran {{no}}: {{item.caption}}", "font_size": 8, "margin": { "top": 2 } }
      ]
    }
  }
}
```

---

## 6. Signature Block Component (`type: "signature_block"`)

Configurable multi-column signature grid built on top of the shared `grid` layout engine (equal-height cards per row, atomic row pagination). Supports standard electronic audit-trail signatures (CPOB / 21 CFR Part 11), optional digital signature images, optional QR verification codes, and predefined approval slots for DRAF documents.

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | String/Array | *(required)* | Array binding (e.g. `"{{sources.signatures}}"`). |
| `columns` | Int | `3` | Number of signature boxes per row. |
| `gap` / `row_gap` / `column_gap` | Number | `4` | Spacing between boxes in the document `unit`. |
| `keep_together` | Bool | `true` | Keeps the entire signature block together across page breaks. |
| `fields` | Object | Flexurio defaults | Remaps API keys: `meaning` (`"meaning"`), `name` (`"signer_name"`), `id_number` (`"signer_nip"`), `role` (`"signer_role"`), `timestamp` (`"signed_at"`), `image` (`"signature_image_url"`), `qr` (`"verification_url"`). Empty/absent fields are automatically omitted. |
| `labels` | Object | CPOB defaults | Customizes static text: `id_prefix` (`"NIP: "`), `electronic_note` (`"Ditandatangani secara elektronik"`), `pending_note` (`"Menunggu persetujuan"`). Set any label to `""` to hide it. |
| `slots` | Array | `null` | Optional fixed approval slots (`[{ "key": "PREPARED", "meaning": "Disiapkan oleh" }, ...]`) so unsigned boxes render with a clean pending placeholder on DRAF documents. |
| `slot_match_field` | String | `"meaning_code"` | Field in each signature record matched against `slot.key` (also falls back to matching `fields.meaning`). |
| `date_format` | String | `null` | Optional `intl` `DateFormat` pattern for `timestamp` (e.g. `"dd MMM yyyy HH:mm"`). Falls back to raw string if unparseable. |
| `style` | Object | Subtle border | `border_color`, `border_width`, `padding`, `space_height`, `qr_size`, `image_height`. |
| `empty_text` | String | `null` | Message displayed when both `data` and `slots` are empty. |

### Example 1: Standard CPOB Electronic Signature (Minimal)
```json
{
  "type": "signature_block",
  "data": "{{sources.signatures}}",
  "columns": 3,
  "gap": 4,
  "keep_together": true,
  "date_format": "dd MMM yyyy HH:mm",
  "empty_text": "Belum ada tanda tangan elektronik."
}
```

### Example 2: Fixed Approval Slots + Custom Field Mapping
```json
{
  "type": "signature_block",
  "data": "{{sources.signatures}}",
  "columns": 3,
  "gap": 4,
  "keep_together": true,
  "fields": {
    "meaning": "meaning",
    "name": "signer_name",
    "id_number": "signer_nip",
    "role": "signer_role",
    "timestamp": "signed_at",
    "image": "signature_image_url",
    "qr": "verification_url"
  },
  "labels": {
    "id_prefix": "NIP: ",
    "electronic_note": "Ditandatangani secara elektronik",
    "pending_note": "Menunggu persetujuan"
  },
  "slots": [
    { "key": "PREPARED", "meaning": "Disiapkan oleh" },
    { "key": "REVIEWED", "meaning": "Diperiksa oleh" },
    { "key": "APPROVED", "meaning": "Disetujui oleh" }
  ],
  "slot_match_field": "meaning_code",
  "date_format": "dd MMM yyyy HH:mm",
  "style": {
    "border_color": "#BDBDBD",
    "border_width": 0.5,
    "padding": 4,
    "qr_size": 12
  }
}
```
