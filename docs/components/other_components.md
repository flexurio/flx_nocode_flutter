# Other Components

Miscellaneous components for visual utilities and cross-category references.

Input-like components such as `checkbox`, `switch`, `radio`, and `date_picker` are documented in [Input Components](./input_components.md). Dynamic branching is documented in [Conditional Component](./component_conditional.md).

---

### `divider`
Renders a visual separator.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `thickness` | Double | `1.0` | Line thickness. |
| `indent` | Double | `0.0` | Leading indentation. |
| `endIndent` | Double | `0.0` | Trailing indentation. |
| `widthMode` | String | - | `fill`, `hug`, or `fixed`. |
| `width` | Double | - | Fixed width. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "section_divider",
  "type": "divider",
  "thickness": 1,
  "indent": 0,
  "endIndent": 0,
  "widthMode": "fill"
}
```
