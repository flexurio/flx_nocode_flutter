# Input Components

Input components capture user data inside [`LayoutForm`](../../forms/layout_form.md) and store their values under the component's `id`.

## Common Input Properties

Most input components support these shared properties:

| Key | Type | Description |
| --- | --- | --- |
| `id` | String | Unique identifier (also used as the form value key). |
| `label` | String | User-facing label. |
| `required` | Boolean | Whether form validation requires a value. |
| `enabled` | Boolean | Whether the input can be edited. |
| `dependsOn` | Array\<String\> | Field IDs that trigger option reload or recalculation when changed. |
| `visibilityCondition` | String | Logic expression controlling visibility. |
| `widthMode` | String | `fill`, `hug`, or `fixed`. |
| `width` | Double | Fixed width in logical pixels (paired with `widthMode: "fixed"`). |
| `flex` | Integer | Flex factor inside `row` or `column`. |

## Text & Number

- [`text_field`](./text_field.md) — Standard text input, multiline, and password fields.
- [`number_field`](./number_field.md) — Numeric input.

## Date & Time

- [`date_picker`](./date_picker.md) — Date selection/input with optional restrictions.
- [`time_field`](./time_field.md) — Time selection/input.

## File

- [`file_picker`](./file_picker.md) — Local file selection and upload workflow integration.

## Selectors

- [`dropdown`](./dropdown.md) — Single-value dropdown with static or API-backed options.
- [`dropdown_multi_value`](./dropdown_multi_value.md) — Multi-value dropdown with static or API-backed options.
- [`radio`](./radio.md) — Single-choice radio group.

## Boolean

- [`checkbox`](./checkbox.md) — Boolean checkbox.
- [`switch`](./switch.md) — Boolean switch.
