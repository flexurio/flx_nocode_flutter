# `text_field`

A standard text input field.

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

Example:

```json
{
  "id": "email",
  "type": "text_field",
  "label": "Email",
  "hintText": "name@example.com",
  "required": true,
  "regex": "^[^@]+@[^@]+\\.[^@]+$",
  "regexErrorMessage": "Email is not valid",
  "widthMode": "fill"
}
```
