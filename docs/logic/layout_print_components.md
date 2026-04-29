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

---

## 2. Standard Components

### 1. Text (`type: "text"`)
Renders a string of text with support for interpolation.
*   `value`: The string content (e.g., `"Hello {{data.name}}"`).
*   `font_size`: Font size (default: `12`).
*   `is_bold`: If `true`, renders bold text.
*   `color`: Hex string (e.g., `"#333333"`).
*   `align`: Horizontal alignment: `"left"`, `"center"`, `"right"`.

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

### Column Configuration:
Columns in `header`, `body`, or `footer` can be defined as objects:
*   `content`: The component to render (usually `text`).
*   `flex`: Relative width (e.g., `1`, `2`, `3`).
*   `align`: Alignment of the cell content.

### Dynamic Scoping:
When iterating through `data`, the following variables are available inside the `body` cells:
*   `{{data}}`: The current row object.
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
    { "content": "{{data.name}}", "flex": 3 },
    { "content": "{{data.price}}", "flex": 1, "align": "right" }
  ]
}
```
