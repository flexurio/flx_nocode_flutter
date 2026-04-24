# Chart Components

Charts allow visualizing data from dynamic or local sources. They all share common configuration properties.

## Common Chart Properties

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `title` | String | - | Optional title shown above the chart. |
| `http` | Object | - | `HttpData` config for fetching chart data. |
| `reference_id` | String | - | Optional reference ID for local data source. |
| `label_key` | String | `label` | The key in the data source used for item labels. |
| `value_key` | String | `value` | The key in the data source used for item values. |
| `width` / `height` | Double | `300` | Fixed dimensions for the chart. |

## Supported Chart Types

### `donut_chart`
Displays data as a donut (circular with a hole).

### `pie_chart`
Displays data as a traditional pie chart.

### `bar_chart`
Displays data as a vertical bar chart (column chart).

## Example

```json
{
  "id": "sales_overview",
  "type": "bar_chart",
  "title": "Monthly Sales",
  "http": {
    "url": "/api/sales/summary",
    "method": "GET"
  },
  "label_key": "month",
  "value_key": "amount",
  "height": 400
}
```
