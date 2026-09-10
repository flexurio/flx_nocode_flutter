# `text_field`

A standard text input field with optional special character & symbol picker support (`is_symbol` / `isSymbol`).

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | String | `Label` | Display label. |
| `initialValue` | String | - | Default value (supports interpolations). |
| `hintText` | String | - | Placeholder text. |
| `maxLength` | Integer | `50` | Max characters. |
| `maxLines` | Integer | `1` | Max visible lines. |
| `required` | Boolean | `false` | Validation requirement. |
| `enabled` | Boolean | `true` | Editability. |
| `regex` | String | - | Regex validation. |
| `regexErrorMessage` | String | - | Error text shown when regex validation fails. |
| `helperText` | String | - | Helper text below the field. |
| `obscure` | Boolean | `false` | Hides entered text, useful for password fields. |
| `isSymbol` / `is_symbol` | Boolean | `false` | Enables special character & symbol picker modal (`Ω` icon button). |
| `is_currency` / `isCurrency` / `separator` | Boolean | `false` | Enables money / thousand separator formatting on input. Automatically right-aligned and unformatted upon form data extraction. |

Example with Symbol Picker enabled (`is_symbol: true`):

```json
{
  "id": "email",
  "type": "text_field",
  "label": "Email",
  "hintText": "name@example.com",
  "required": true,
  "regex": "^[^@]+@[^@]+\\.[^@]+$",
  "regexErrorMessage": "Email is not valid",
  "is_symbol": true,
  "widthMode": "fill"
}
```

Example with Money Separator enabled (`is_currency: true`):

```json
{
  "id": "submission_total",
  "type": "text_field",
  "label": "Submission Total",
  "is_currency": true,
  "required": true
}
```

---

## Usage Inside Table Cells (`TColumn.component`)

When placed inside a `ComponentTable` column:
- Automatically renders in compact mode (`FTextFieldSmall`).
- Evaluates `initialValue` against the row data context (`row`, `data`) when the cell value is empty (e.g. `{{ row.realization_value }}`).
- Automatically updates the row data map (`row[columnBody]`) when initialized, ensuring the default is included during form submissions and PUT operations.
- Edits immediately trigger `onRowChanged`, updating the reactive table state.
- Supports `is_currency: true` / `isCurrency: true` for money/currency formatting:
  - Automatically formats initial values (e.g., float `6000000.0` or integer `3000000` -> `6,000,000`).
  - Formats live input with thousand separators as the user types.
  - Aligns text to the right (`TextAlign.end`) and provides numeric keyboard (`TextInputType.number`).

Example in table column:

```json
{
  "header": "Confirmation Realization Value",
  "body": "confirmation_realization_value",
  "width": 160,
  "component": {
    "id": "confirmation_realization_value_field",
    "type": "text_field",
    "label": "Confirmation Realization Value",
    "is_currency": true,
    "initialValue": "{{ row.confirmation_realization_value || row.realization_value || '' }}"
  }
}
```

