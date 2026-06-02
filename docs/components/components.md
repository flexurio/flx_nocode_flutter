# Components Index

Components are the building blocks of `flx_nocode_flutter` applications. They are used within `layout_form` to define UI elements and their behavior.

Every component must have an `id` and a `type`. The parser rejects missing or empty values, and unknown component `type` values.

## Common Properties

Many components share these layout and behavioral properties:

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | String | Yes | Unique identifier for the component. This is also the form value key for input components. |
| `type` | String | Yes | Component type, for example `text`, `text_field`, `button`. |
| `visibilityCondition` | String | No | Logic expression that controls whether the component is rendered. |
| `events` | Map | No | Custom event listeners, for example `onLoad`. |
| `widthMode` | String | No | `fill`, `hug`, or `fixed`. Supported by most visual/input/layout components. |
| `heightMode` | String | No | `fill`, `hug`, or `fixed`. Supported by layout, container, image, and list components. |
| `width` | Double | No | Fixed width in logical pixels. Commonly paired with `widthMode: "fixed"`. |
| `height` | Double | No | Fixed height in logical pixels. Commonly paired with `heightMode: "fixed"`. |
| `flex` | Integer | No | Flex factor when this component is placed inside a `row` or `column`. |

## Supported Component Types

| Type | Category | Description |
| --- | --- | --- |
| `text` | Display | Static or interpolated text. |
| `field_display` | Display | Read-only label and value pair. |
| `image` | Display | Image from URL. |
| `table` | Display/Data | Configurable data grid. |
| `list_view` | Display/Data | Repeated item renderer from HTTP, local reference, or inline data. |
| `text_field` | Input | Text entry. |
| `number_field` | Input | Numeric entry. |
| `date_picker` | Input | Date selection. |
| `time_field` | Input | Time selection/input. |
| `file_picker` | Input | File upload field. |
| `dropdown` | Input | Single-value dropdown. |
| `dropdown_multi_value` | Input | Multi-value dropdown. |
| `checkbox` | Input | Boolean checkbox. |
| `switch` | Input | Boolean switch. |
| `radio` | Input | Single choice radio group. |
| `button` | Interaction | Text button with action. |
| `icon_button` | Interaction | Icon-only button with action. |
| `column` | Layout | Vertical child layout. |
| `row` | Layout | Horizontal child layout. |
| `container` | Layout | Box with spacing, size, color, and optional child. |
| `divider` | Other | Visual separator. |
| `donut_chart` | Chart | Donut chart. |
| `pie_chart` | Chart | Pie chart. |
| `bar_chart` | Chart | Bar chart. |
| `form` | Structural | Nested validation group. |
| `conditional` | Logic | Render `then` or `else` component based on a condition. |

## Data Binding Notes

String values commonly support interpolation against the active page/form data, such as `{{data.id}}`, `{{current.name}}`, or JavaScript expressions in templates where supported by the consuming component. Input component values are stored under their component `id`.

Use `dependsOn` on inputs and data-driven components when an option list or remote request must reload after another field changes.

---

## Component Categories

Detailed documentation for each category of components:

- [**Input Components**](./input_components.md): Fields for user data entry (`text_field`, `dropdown`, etc.).
- [**Display Components**](./display_components.md): Elements for presenting information (`text`, `field_display`, `table`).
- [**Interaction Components**](./interaction_components.md): Buttons and clickable elements.
- [**Layout Components**](./layout_components.md): Containers for arranging UI elements (`row`, `column`, `container`).
- [**Other Components**](./other_components.md): Selection toggles, dividers, and other UI utilities.
- [**Chart Components**](./charts.md): Data visualization tools.
- [**Logic Components**](./component_conditional.md): Dynamic UI switching (`conditional`).
- [**Form Component**](./component_form.md): Nested validation group (`form`).
