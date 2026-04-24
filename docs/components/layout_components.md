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

---

### `row`
Arranges children horizontally.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `children` | Array | `[]` | Nested components. |
| `x_align` | String | `left` | Horizontal alignment (`left`, `center`, `right`, `between`, `around`, `evenly`). |
| `y_align` | String | `top` | Vertical alignment (`top`, `center`, `bottom`, `stretch`). |
| `horizontal_gap` | Double | `12.0` | Horizontal spacing. |

---

### `container`
General purpose box with styling.

| Key | Type | Description |
| --- | --- | --- |
| `child` | Object | Nested component. |
| `padding` / `margin` | Double | Spacing in pixels. |
| `color` | String | Hex background color. |
| `borderRadius` | Double | Corner rounding radius. |
| `borderColor` | String | Border color. |
