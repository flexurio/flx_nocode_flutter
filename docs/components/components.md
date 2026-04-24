# Components Index

Components are the building blocks of `flx_nocode_flutter` applications. They are used within `layout_form` to define UI elements and their behavior.

Every component must have an `id` and a `type`.

## Common Properties

Many components share these layout and behavioral properties:

| Key | Type | Description |
| --- | --- | --- |
| `id` | String | Unique identifier for the component. |
| `type` | String | The component type (e.g., `text`, `text_field`, `button`). |
| `visibilityCondition` | String | A logic expression to determine if the component should be shown. |
| `widthMode` | String | `fill` (expand), `hug` (fit content), or `fixed`. |
| `width` | Double | Width in pixels (used if `widthMode` is `fixed`). |
| `flex` | Integer | Flex factor when used inside a `column` or `row`. |
| `events` | Map | Custom event listeners (e.g., `onLoad`). |

---

## Component Categories

Detailed documentation for each category of components:

- [**Input Components**](./input_components.md): Fields for user data entry (`text_field`, `dropdown`, etc.).
- [**Display Components**](./display_components.md): Elements for presenting information (`text`, `field_display`, `table`).
- [**Interaction Components**](./interaction_components.md): Buttons and clickable elements.
- [**Layout Components**](./layout_components.md): Containers for arranging UI elements (`row`, `column`, `container`).
- [**Other Components**](./other_components.md): Selection toggles, dividers, and other UI utilities.
- [**Chart Components**](./charts.md): Data visualization tools.
