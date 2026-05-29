# Interaction Components

Components that trigger user-defined actions.

---

### `button` & `icon_button`
Triggers an action when clicked.

#### `button`

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | String | `Button` | Label (for `button`). |
| `variant` | String | `primary` | `primary`, `secondary`, `outline`, `ghost`, `destructive`. |
| `size` | String | `medium` | `small`, `medium`, `large`. |
| `color` | String | `#2196F3` | Hex color or semantic color name. |
| `onClick` / `on_click` | Object | - | Action to execute. See [Action Documentation](../logic/actions.md). |
| `widthMode` | String | `hug` | `fill`, `hug`, or `fixed`. |
| `width` | Double | - | Fixed width. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "save_button",
  "type": "button",
  "text": "Save",
  "variant": "primary",
  "size": "medium",
  "on_click": {
    "type": "submit"
  }
}
```

#### `icon_button`

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `icon` | String | `add` | Icon name. |
| `iconSize` / `icon_size` | Double | - | Icon size override. |
| `tooltip` | String | - | Tooltip text. |
| `variant` | String | `filled` | `filled`, `outlined`, `ghost`, or `soft`. |
| `size` | String | `medium` | `small`, `medium`, `large`. |
| `color` | String | `#2196F3` | Hex color or semantic color name. |
| `onClick` / `on_click` | Object | - | Action to execute. |

Example:

```json
{
  "id": "edit_button",
  "type": "icon_button",
  "icon": "Edit",
  "tooltip": "Edit",
  "variant": "ghost",
  "onClick": {
    "type": "navigate",
    "target": "edit_page"
  }
}
```
