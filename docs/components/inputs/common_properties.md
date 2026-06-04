# Common Input Properties

Most input components support these common properties.

| Key | Type | Description |
| --- | --- | --- |
| `id` | String | Unique identifier. |
| `label` | String | User-facing label. |
| `required` | Boolean | Whether validation requires a value. |
| `enabled` | Boolean | Whether the input can be edited. |
| `dependsOn` | Array<String> | IDs that can trigger reload/recalculation where supported. |
| `visibilityCondition` | String | Logic expression to show/hide. |
| `widthMode` | String | `fill`, `hug`, or `fixed`. |
| `width` | Double | Fixed width when needed. |
| `flex` | Integer | Flex factor in rows/columns. |
