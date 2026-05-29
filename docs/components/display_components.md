# Display Components

These components are used to present information to the user in a read-only format.

---

### `text`
Renders static or dynamic text without a label.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | String | `Text` | The text content. |
| `fontSize` | Double | - | Optional text size. |
| `fontWeight` | String | - | Optional weight, for example `bold` depending on renderer support. |
| `color` | String | - | Text color, usually a hex value. |
| `textAlign` | String | - | Text alignment. |
| `widthMode` | String | - | `fill`, `hug`, or `fixed`. |
| `width` | Double | - | Fixed width. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "title",
  "type": "text",
  "value": "Order #{{data.order_no}}",
  "fontSize": 20,
  "fontWeight": "bold",
  "color": "#111827"
}
```

---

### `field_display`
Renders a read-only labeled value.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | - | Label displayed above the value. |
| `value` | String | - | Text value to display. |
| `widthMode` | String | `hug` | `fill`, `hug`, or `fixed`. |
| `flex` | Integer | - | Flex factor. |

Example:

```json
{
  "id": "customer_name_display",
  "type": "field_display",
  "label": "Customer",
  "value": "{{data.customer.name}}",
  "widthMode": "fill"
}
```

---

### `table`
Displays data in a grid.

**See the dedicated [ComponentTable Documentation](./component_table.md) for full details.**

---

### `list_view`
Renders a repeated component for every item returned from an API, local reference, or inline data.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `http` | Object | Empty GET config | HTTP config used to fetch list data. |
| `reference_id` | String | - | Optional local data source reference. |
| `initial_value` / `initialValue` / `data` | Any | - | Inline starting data. |
| `item` | Component | - | Component template rendered for each row/item. |
| `gap` | Double | `12.0` | Spacing between rendered items. |
| `emptyText` | String | `No data` | Text shown when there is no data. |
| `dependsOn` | Array<String> | `[]` | Component IDs that trigger reload. |
| `widthMode` / `heightMode` | String | - | `fill`, `hug`, or `fixed`. |
| `width` / `height` | Double | - | Fixed dimensions. |

Example:

```json
{
  "id": "recent_items",
  "type": "list_view",
  "http": {
    "method": "GET",
    "url": "/api/items?customer_id.eq={{form.customer_id}}",
    "headers": {},
    "body": {},
    "use_form_data": false
  },
  "dependsOn": ["customer_id"],
  "emptyText": "No items",
  "item": {
    "id": "item_name",
    "type": "field_display",
    "label": "Item",
    "value": "{{item.name}}"
  }
}
```

---

### `image`
Displays an image from a URL.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | String | `https://via.placeholder.com/150` | Image source. |
| `fit` | String | `cover` | Sizing strategy. |
| `width` / `height` | Double | - | Fixed dimensions. |
| `widthMode` / `heightMode` | String | - | `fill`, `hug`, or `fixed`. |
| `flex` | Integer | - | Flex factor in parent layout. |

Example:

```json
{
  "id": "avatar",
  "type": "image",
  "url": "{{data.avatar_url}}",
  "width": 96,
  "height": 96,
  "fit": "cover"
}
```
