# Variables Documentation

This document describes the variables and helper functions available for use within the application, particularly in string interpolation (`{{ ... }}`), visibility conditions, and action workflows.

## Global Variables

These variables are always available throughout the application context.

| Key | Description | Example Usage |
| :--- | :--- | :--- |
| `auth_token` | The authentication token used for HTTP requests. | `Bearer {{ auth_token }}` |
| `user_id` | The unique identifier of the currently logged-in user. | `User: {{ user_id }}` |
| `backend_host` | The base URL of the backend server. | `{{ backend_host }}/api/resource` |

## Contextual Variables

These variables are available depending on the specific UI component or action being executed.

| Key | Description |
| :--- | :--- |
| `form` | Represents the data of the current form being rendered. |
| `record` | Represents the data of the current record (e.g., in a table row). |
| `data` | Alias for `record`, representing the current context's data. |
| `current` | Alias for `record` or the current data context. |
| `vars` | Local variables defined within a specific scope or action. |
| `http` | Data returned from an HTTP request (used in post-request actions). |

## Custom Global Variables

In addition to the built-in variables, you can define your own **Global Variables** in the **Frontend Configuration > Variables** tab. Any key defined there becomes available as a variable globally.

---

## Helper Functions

When using variables inside `{{ ... }}` blocks, you have access to several JavaScript helper functions to format or calculate values.

### Date Helpers

| Function | Description | Example |
| :--- | :--- | :--- |
| `now(format)` | Returns the current date/time in the specified format. | `{{ now('yyyy-MM-dd') }}` |
| `formatDate(date, format)` | Formats a given Date object or string. | `{{ formatDate(form.created_at, 'MMM dd, yyyy') }}` |

**Supported Format Tokens:**
- `yyyy`: 4-digit year (e.g., 2024)
- `MMMM`: Full month name (e.g., January)
- `MMM`: Short month name (e.g., Jan)
- `MM`: 2-digit month (01-12)
- `dd`: 2-digit day (01-31)
- `HH`: 2-digit hour (00-23)
- `mm`: 2-digit minute (00-59)
- `ss`: 2-digit second (00-59)

### Math & Type Helpers

| Function | Description | Example |
| :--- | :--- | :--- |
| `toNumber(value)` | Converts a value to a number. Returns `0` if invalid. | `{{ toNumber(form.price) * 1.1 }}` |
| `abs(value)` | Returns the absolute value of a number. | `{{ abs(vars.delta) }}` |

### Collection Helpers

| Function | Description | Example |
| :--- | :--- | :--- |
| `length(value)` | Returns the length of a string, array, or object. | `{{ length(form.items) }}` |
| `contains(container, value)` | Checks if a string or array contains a value. | `{{ contains(form.tags, 'featured') }}` |
| `sum(list, formula)` | Calculates the sum of a list. Optional formula supports `key1 * key2`. | `{{ sum(form.items, 'quantity * price') }}` |

---

## Usage Example

### In a Text Component
Displaying a greeting with the user ID:
`Hello, User {{ user_id }}!`

### In an Action URL
Constructing a dynamic API endpoint:
`{{ backend_host }}/api/orders/{{ record.id }}/cancel`

### In a Visibility Condition
Showing a button only if a field has a value:
`{{ length(form.name) > 0 }}`
