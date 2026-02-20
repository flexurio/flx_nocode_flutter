# Component JSON Documentation

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

## 1. Input Components

### `text_field`
A standard text input field.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Label` | Display label for the field. |
| `initialValue` | String | - | Default value (supports `{{interpolations}}`). |
| `hintText` | String | - | Placeholder text. |
| `maxLength` | Integer | `50` | Maximum character limit. |
| `maxLines` | Integer | `1` | Number of visible lines. |
| `required` | Boolean | `false` | Whether validation should fail if empty. |
| `enabled` | Boolean | `true` | Whether the user can edit the field. |
| `regex` | String | - | Regex pattern for validation. |
| `regexErrorMessage`| String | - | Message shown on regex failure. |

**Example:**
```json
{
  "id": "user_email",
  "type": "text_field",
  "label": "Email Address",
  "hintText": "email@example.com",
  "regex": "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$",
  "regexErrorMessage": "Invalid email format"
}
```

### `number_field`
Input field for numeric values.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Number Field` | Display label. |
| `initialValue` | String | - | Initial numeric value as string. |
| `enabled` | Boolean | `true` | Interaction state. |

### `dropdown`
A selectable list of options.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `label` | String | Yes | Display label. |
| `options` | Array<String> | No | Static list of options. |
| `httpData` | Object | No | Config for dynamic options via API. |
| `optionKey` | String | No | Key for option value from API response. |
| `optionLabel` | String | No | Key for option label from API response. |
| `dependsOn` | Array<String>| No | List of component IDs that trigger a reload on change. |
| `onChangeActions` | Array<Object>| No | Actions to trigger when the value changes. |

---

## 2. Display Components

### `text`
Renders static or dynamic text without a label.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | String | `Text` | The text content. |

### `table`
Displays a set of data in a grid.

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `http` | Object | Yes | `HttpData` config for fetching rows. |
| `columns` | Array<Object> | Yes | List of `TColumn` objects. |
| `width` | Double | No | Total table width. |
| `reference_id` | String | No | Optional reference ID for external data syncing. |

**`TColumn` Fields:** `header` (label), `body` (data path), `width` (pixels).

### `image`
Displays an image from a URL.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | String | Placeholder | The image source. |
| `fit` | String | `cover` | Sizing strategy (`cover`, `contain`, `fill`). |
| `width` / `height` | Double | - | Dimensions in pixels. |

---

## 3. Interaction Components

### `button` & `icon_button`
Triggers an action when clicked.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | String | `Button` | Label (for `button`). |
| `icon` | String | `add` | Icon name (for `icon_button`). |
| `variant` | String | `primary` | `primary`, `secondary`, `outline`, `ghost`, `destructive`. |
| `size` | String | `medium` | `small`, `medium`, `large`. |
| `onClick` | Object | - | The action to execute. See [Action Documentation](./actions.md). |

---

## 4. Layout Components

### `column` & `row`
Containers for arranging children.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `children` | Array<Object> | `[]` | Nested components. |
| `x_align` | String | `left` | Alignment on horizontal axis. |
| `y_align` | String | `top` | Alignment on vertical axis. |
| `gap` | Double | `12.0` | Spacing between items. |

### `container`
General purpose box with styling.

| Key | Type | Description |
| --- | --- | --- |
| `child` | Object | Nested component. |
| `padding` / `margin` | Double | Spacing in pixels. |
| `color` | String | Hex background color. |
| `borderRadius` | Double | Corner rounding radius. |
| `borderColor` | String | Border color. |

---

## 5. Other States

| Component Type | Purpose | Key Properties |
| --- | --- | --- |
| `checkbox` | Boolean toggle | `label`, `value` |
| `switch` | Modern boolean toggle | `label`, `initialValue` |
| `radio` | Single choice list | `label`, `options`, `initialValue` |
| `date_picker` | Date selection | `label`, `initialValue`, `dateFormat`, `minDate`, `maxDate` |
| `divider` | Visual separator | `thickness`, `indent`, `endIndent` |
| `field_display` | Read-only labeled value | `label`, `value` |
