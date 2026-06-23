# Layout Components

Containers for arranging children.

---

### `column`
Arranges children vertically.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `children` | Array | `[]` | Nested components. |
| `x_align` | String | `left` | Horizontal alignment (`left`, `center`, `right`, `stretch`). |
| `y_align` | String | `top` | Vertical alignment (`top`, `center`, `bottom`, `between`, `around`, `evenly`). |
| `gap` | Double | `12.0` | Vertical spacing. |
| `widthMode` / `heightMode` | String | - | `fill`, `hug`, or `fixed`. |
| `width` / `height` | Double | - | Fixed dimensions. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "summary_column",
  "type": "column",
  "x_align": "stretch",
  "gap": 8,
  "children": [
    {
      "id": "title",
      "type": "text",
      "value": "Summary"
    },
    {
      "id": "total",
      "type": "field_display",
      "label": "Total",
      "value": "{{data.total}}"
    }
  ]
}
```

---

### `row`
Arranges children horizontally.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `children` | Array | `[]` | Nested components. |
| `x_align` | String | `left` | Horizontal alignment (`left`, `center`, `right`, `between`, `around`, `evenly`). |
| `y_align` | String | `top` | Vertical alignment (`top`, `center`, `bottom`, `stretch`). |
| `horizontal_gap` | Double | `12.0` | Horizontal spacing. |
| `widthMode` / `heightMode` | String | `widthMode` defaults to `fill` | `fill`, `hug`, or `fixed`. |
| `width` / `height` | Double | - | Fixed dimensions. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "filter_row",
  "type": "row",
  "x_align": "between",
  "y_align": "center",
  "horizontal_gap": 12,
  "children": [
    {
      "id": "search",
      "type": "text_field",
      "label": "Search",
      "widthMode": "fill",
      "flex": 1
    },
    {
      "id": "apply_filter",
      "type": "button",
      "text": "Apply"
    }
  ]
}
```

---

### `container`
General purpose box with styling.

| Key | Type | Description |
| --- | --- | --- |
| `child` | Object | Nested component. |
| `padding` / `margin` | Double | Spacing in pixels for all sides. |
| `paddingLeft` / `paddingTop` / `paddingRight` / `paddingBottom` | Double | Per-side padding override. |
| `marginLeft` / `marginTop` / `marginRight` / `marginBottom` | Double | Per-side margin override. |
| `width` / `height` | Double | Fixed dimensions. |
| `widthMode` / `heightMode` | String | `fill`, `hug`, or `fixed`. |
| `color` | String | Hex background color. |
| `borderRadius` | Double | Corner rounding radius. |
| `borderColor` | String | Border color. |
| `borderWidth` | Double | Border thickness. |

Example:

```json
{
  "id": "info_box",
  "type": "container",
  "padding": 16,
  "color": "#F9FAFB",
  "borderColor": "#E5E7EB",
  "borderWidth": 1,
  "borderRadius": 8,
  "widthMode": "fill",
  "child": {
    "id": "info_text",
    "type": "text",
    "value": "Readonly information"
  }
}
```
