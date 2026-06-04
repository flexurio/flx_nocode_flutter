# `file_picker`

A component for selecting a local file and storing a file reference in the form value.

Use this component when a form needs an attachment/upload input. The selected value can be referenced in `submit_workflow` with `{{form.<component_id>}}`.

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | String | Required | Unique component ID. This becomes the form key, for example `form.document_file`. |
| `type` | String | Required | Must be `file_picker`. |
| `label` | String | `Upload File` | Display label. |
| `initialValue` | String | - | Existing file value/path/URL. |
| `required` | Boolean | `false` | Requirement. |
| `enabled` | Boolean | `true` | Editability. |
| `allowedExtensions` | Array<String> | - | Allowed file extensions without dots, for example `["pdf", "doc"]`. When omitted, any file type can be selected. |
| `widthMode` | String | - | Optional sizing mode, for example `fill`. |
| `width` | Number | - | Optional fixed width. |
| `flex` | Number | - | Optional flex value when used inside a row/column layout. |
| `visibilityCondition` | String | - | Optional expression that controls component visibility. |
| `events` | Object | `{}` | Optional component events. |

## Behavior

- The picker opens a local file selection dialog.
- If `allowedExtensions` is provided, the picker only accepts files matching those extensions.
- After a file is selected, the form value contains an internal file reference.
- The UI displays only the file name, not the full path.
- Clearing the selected file empties the form value.
- If `required` is `true` and no file has been selected, the component shows a required-file validation message.
- When the value is sent through an HTTP action with `use_form_data: true`, the selected file is converted to a multipart file upload.

## Basic Example

```json
{
  "id": "document_file",
  "type": "file_picker",
  "label": "Document File",
  "required": true,
  "enabled": true,
  "initialValue": "",
  "allowedExtensions": ["pdf"],
  "widthMode": "fill"
}
```

## Upload with `submit_workflow`

When sending the selected file to an API, reference the file picker value from `form` and enable `use_form_data` on the HTTP action.

```json
{
  "submit_workflow": {
    "type": "workflow",
    "lock_ui_while_submitting": true,
    "show_submit_button": true,
    "submit_label": "Upload",
    "actions": [
      {
        "type": "http",
        "name": "upload_document",
        "http": {
          "method": "POST",
          "url": "{{backend_host}}/documents",
          "headers": {
            "Authorization": "Bearer {{auth_token}}"
          },
          "body": {
            "description": "{{form.document_description || \"\"}}",
            "document": "{{form.document_file || \"\"}}"
          },
          "use_form_data": true
        }
      }
    ]
  }
}
```

## Notes

- `allowedExtensions` values should not include a leading dot. Use `"pdf"`, not `".pdf"`.
- The selected file is available through the component ID. If the ID is `document_file`, use `{{form.document_file}}`.
- For upload requests, the backend endpoint must support multipart/form-data because `use_form_data` sends the selected file as binary multipart data.
- Without `use_form_data: true`, the form value is not converted to a multipart file.
