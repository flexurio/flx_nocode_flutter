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
| `width` / `height` | Double | - | Fixed dimensions for the chart. Renderer may apply its own fallback size. |
| `visibilityCondition` | String | - | Logic expression that controls rendering. |
| `events` | Map | `{}` | Custom event listeners. |

`http` uses the shared HTTP configuration shape:

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `method` | String | `GET` | HTTP method. |
| `url` | String | - | Endpoint URL. Supports interpolation. |
| `headers` | Object | `{}` | Request headers. Supports interpolation. |
| `body` | Object | `{}` | Request body or query map depending on request executor. |
| `use_form_data` | Boolean | `false` | Send body as multipart/form-data. |
| `mock_enabled` | Boolean | `false` | Use `mock_data` instead of making a request. |
| `mock_data` | Any | - | Mock response payload. |
| `error_message_path` | String | - | Optional path used to extract API error messages. |

## Supported Chart Types

### `donut_chart`
Displays data as a donut (circular with a hole).

### `pie_chart`
Displays data as a traditional pie chart.

### `bar_chart`
Displays data as a vertical bar chart (column chart).

### `chart`
A generic chart component that dynamically switches chart visualization types based on configuration.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `chartType` | String | `bar` | The type of chart to display: `bar`, `pie`, `donut`, or `horizontalBar`. |

## Data Shape

Chart data should resolve to a list of objects. `label_key` is used for labels and `value_key` is parsed as the numeric value.

Example response:

```json
[
  { "month": "Jan", "amount": 1200000 },
  { "month": "Feb", "amount": 1800000 }
]
```

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
