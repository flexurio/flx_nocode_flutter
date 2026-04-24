# Display Components

These components are used to present information to the user in a read-only format.

---

### `text`
Renders static or dynamic text without a label.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | String | `Text` | The text content. |

---

### `field_display`
Renders a read-only labeled value.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | - | Label displayed above the value. |
| `value` | String | - | Text value to display. |
| `widthMode` | String | `hug` | `fill`, `hug`, or `fixed`. |
| `flex` | Integer | - | Flex factor. |

---

### `table`
Displays data in a grid.

**See the dedicated [ComponentTable Documentation](./component_table.md) for full details.**

---

### `image`
Displays an image from a URL.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | String | - | Image source. |
| `fit` | String | `cover` | Sizing strategy. |
