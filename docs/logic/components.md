# UI Components JSON Documentation

Components are the building blocks of `LayoutForm` and other UI structures. They define how data is displayed and captured.

---

## 1. Base Properties

All components share these common properties:

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier. For fields, this should match the entity reference. |
| `type` | String | Yes | The type of component (e.g., `text_field`, `row`). |
| `visibilityCondition` | String | No | A JS expression determining if the component is visible. |
| `events` | Object | No | Map of event handlers. |
| `on_click` | Object | No | Specific to clickable components. Defines an [Action](./actions.md) to execute. |

---

## 2. Layout Components

Layout components are used to structure other components.

### `row`
Arranges children horizontally.
- `children`: Array of components.

### `column`
Arranges children vertically.
- `children`: Array of components.

### `container`
Wraps a single child with styling or constraints.
- `child`: A single component object.
- `padding`: Optional padding configuration.
- `margin`: Optional margin configuration.

**Example: Grid-like layout using Row/Column**
```json
{
  "id": "grid_row",
  "type": "row",
  "children": [
    { "id": "field_1", "type": "text_field", "label": "Left", "flex": 1 },
    { "id": "field_2", "type": "text_field", "label": "Right", "flex": 1 }
  ]
}
```

---

## 3. Input Components

Used to capture user input in forms.

### `text_field`
Standard text input.
- `label`: Display label.
- `initialValue`: Value or template (e.g., `{{current.name}}`).
- `required`: Boolean validation.
- `maxLines`: Number of lines (default 1).

### `number_field`
Numeric input with specific keyboard and formatting.
- `label`: Display label.
- `initialValue`: Numeric value.

### `dropdown`
Selection from a list of options.
- `label`: Display label.
- `options`: Array of strings or objects.
- `initialValue`: Selected key.
- `httpData`: Optional dynamic data source.

### `date_picker` & `time_field`
Specialized inputs for dates and times.

### `checkbox`, `radio`, `switch`
Boolean or single-selection inputs.

---

## 4. Interaction Components

### `button`
A clickable button that can trigger actions.
- `text`: The button label.
- `on_click`: The [Action](./actions.md) to execute.
- `color`: Hex color (e.g., `#2196F3`).
- `variant`: `primary`, `secondary`, `outline`, `ghost`, `destructive`.

### `icon_button`
A compact button displaying only an icon.
- `icon`: Material icon name.
- `on_click`: The [Action](./actions.md) to execute.

---

## 5. Display & Data Components

### `field_display`
Shows a read-only value with a label.
- `label`: Display label.
- `value`: The value to show (supports templating).

### `table`
Renders a data table.
- `columns`: Array of column definitions.
- `data`: Source (e.g., `{{current.items}}`).
- `reference_id`: **(New)** Bind the table to a local state variable (e.g., a list updated via `append_variable`).

### `text`
Renders raw or formatted text.
- `value`: String or template.
- `style`: Typography options.

### `image`
Displays an image from a URL or asset.
- `url`: The image source.

---

## 6. Charts

Visual data representations.
- `bar_chart`
- `pie_chart`
- `donut_chart`

Each requires a `title` and a data source mapping.
