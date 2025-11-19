
# String Interpolation with JavaScript

This document explains how to use JavaScript-based string interpolation to embed dynamic values within a string.

## Overview

The string interpolation feature allows you to embed JavaScript expressions directly into a string using `{{ ... }}` syntax. These expressions are evaluated at runtime, and their results are injected back into the string.

This is useful for creating dynamic templates, generating content based on variables, or performing simple calculations.

## Syntax

To embed a JavaScript expression, wrap it in double curly braces:

```
"Hello, my name is {{ name.first + ' ' + name.last }}."
```

The code inside `{{ ... }}` is standard JavaScript.

## Variable Injection

You can use variables from your application's context within the JavaScript expressions. All variables provided in the context map are available as `const` JavaScript variables.

**Example:**

If you have a context map like this:

```json
{
  "user": {
    "name": "John Doe",
    "email": "john.doe@example.com"
  },
  "orderCount": 42
}
```

You can use `user` and `orderCount` in your string:

- `Welcome, {{ user.name }}!` will become `Welcome, John Doe!`.
- `You have {{ orderCount }} orders.` will become `You have 42 orders.`.
- `Contact: {{ user.email }}` will become `Contact: john.doe@example.com`.

## Built-in Helper Functions

A `now()` helper function is available to get the current date and time, with optional formatting.

### `now()`

- **`{{ now() }}`**: Returns the current date and time as a full string (e.g., `Fri Nov 14 2025 10:30:00 GMT+...`).

### `now(format)`

You can pass a format string to `now()` to customize the output.

- **`{{ now("YYYY-MM-DD") }}`**: `2025-11-14`
- **`{{ now("DD MMM YYYY") }}`**: `14 Nov 2025`
- **`{{ now("DD MMMM YYYY HH:mm") }}`**: `14 November 2025 10:30`

**Supported Format Specifiers:**

- `YYYY`: Full year (e.g., 2025)
- `MMMM`: Full month name (e.g., January)
- `MMM`: Short month name (e.g., Jan)
- `MM`: Month number, zero-padded (e.g., 03)
- `DD`: Day of the month, zero-padded (e.g., 09)
- `HH`: Hour (24-hour), zero-padded (e.g., 05)
- `mm`: Minute, zero-padded (e.g., 01)
- `ss`: Second, zero-padded (e.g., 09)

## Error Handling

If a JavaScript expression inside `{{ ... }}` has an error, or if it evaluates to `undefined` or `null`, the original placeholder will be kept in the string.

**Example:**

If `user.profile` does not exist, the string `Your profile is at {{ user.profile.url }}` will remain unchanged, making it easier to spot and debug the issue.
