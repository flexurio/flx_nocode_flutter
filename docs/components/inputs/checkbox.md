# `checkbox`

Boolean checkbox component with automatic integer/boolean conversion for form payloads.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Checkbox` | Display label rendered next to the leading checkbox square. |
| `value` | Boolean | `false` | Default checked boolean value (`true` or `false`). |
| `initialValue` | String | `""` | Optional initial value expression (e.g. `"{{data.user_active}}"`) for Edit forms. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability state. |
| `widthMode` | String | `hug` | Sizing mode (`hug`, `fill`, `fixed`). |
| `flex` | Number | `null` | Flex weight when placed inside a `row`. |

---

## Behavior & Payload Conversion

1. **Leading Checkbox UI**: The checkbox box is rendered on the **left side** (*leading*), with the text label on the right. Tapping anywhere on the label text or checkbox box toggles the checked state.
2. **Form Payload Value**:
   - Checked (`true`) -> Submits `'1'` (or `1`) in the HTTP request payload (POST/PUT).
   - Unchecked (`false`) -> Submits `'0'` (or `0`) in the HTTP request payload (POST/PUT).
3. **Initial Value Resolution**:
   - Parses values `'1'`, `'true'`, `1`, `true` as checked (`true`).
   - Supports `initialValue: "{{data.field}}"` for populating initial row data in Edit forms.

---

## Example Usage

### 1. Create Form Component
```json
{
    "id": "user_active",
    "type": "checkbox",
    "label": "Customer Active",
    "value": true,
    "required": true
}
```

### 2. Update Form Component
```json
{
    "id": "user_active",
    "type": "checkbox",
    "label": "Customer Active",
    "required": true,
    "initialValue": "{{data.user_active}}"
}
```

### 3. Inside a Row Component (Side-by-side)
```json
{
    "id": "customer_active_row",
    "type": "row",
    "horizontal_gap": 16,
    "children": [
        {
            "id": "customer_id",
            "type": "dropdown",
            "label": "ID Customer",
            "required": true,
            "widthMode": "fill",
            "flex": 2
        },
        {
            "id": "user_active",
            "type": "checkbox",
            "label": "Customer Active",
            "value": true,
            "widthMode": "fill",
            "flex": 1
        }
    ]
}
```
