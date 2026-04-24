# Interaction Components

Components that trigger user-defined actions.

---

### `button` & `icon_button`
Triggers an action when clicked.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | String | `Button` | Label (for `button`). |
| `icon` | String | `add` | Icon name (for `icon_button`). |
| `variant` | String | `primary` | `primary`, `secondary`, `outline`, `ghost`, `destructive`. |
| `size` | String | `medium` | `small`, `medium`, `large`. |
| `onClick` | Object | - | Action to execute. See [Action Documentation](../logic/actions.md). |
