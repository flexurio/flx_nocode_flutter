# Entity JSON Configuration Schema Guide

This document defines the schema, structure, and design rules for dynamic entity JSON configurations in the `flx_nocode_flutter` package. All entity files must be saved under `asset/configuration/entity/<entity_id>.json`.

---

## 1. Top-Level Entity Schema

An entity configuration is represented by the `EntityCustom` class. Below is the list of top-level properties:

| Key | Type | Required | Description |
|---|---|---|---|
| `id` | String | Yes | Unique identifier for the entity (must match the filename). |
| `label` | String | Yes | Human-readable singular name for the entity displayed in UI. |
| `description` | String | Yes | Description of what the entity represents. |
| `fields` | Array | Yes | List of fields defining the data schema (see [Fields Section](#2-entity-fields)). |
| `layout_table` | Map | Yes | Maps field references to table column flex weights. |
| `backend` | Object | Yes | Backend endpoints for CRUD operations (see [Backend Section](#3-backend-crud)). |
| `layout_form` | Array | Yes | Form configurations for creating/editing (see [Layout Form Section](#4-layout-form)). |
| `layout_print` | Array | No | PDF printout layout configurations. |
| `layout_list_tile` | Object | No | Custom list tile layout for displaying a single entity row. |
| `actions` | Array | No | Row/list level actions (see [Actions Section](#5-actions)). |
| `actions_home` | Array | No | Actions displayed on the home page/dashboard. |
| `action_primary` | Object | No | The primary FAB action (e.g., creating a new item). |
| `filters` | Array | No | List of field references or filter configs to display as filters. |
| `bypass_all_permissions`| Boolean | No | Bypasses all system permission checks (defaults to `true`). |

---

## 2. Entity Fields

Each field defines data validation, rendering type, and UI behavior.

```json
{
  "label": "Bank Name",
  "reference": "name",
  "type": "text",
  "column_width": 150.0,
  "auto_generated": false,
  "required": true,
  "pattern": "^[a-zA-Z0-9 ]{3,}$",
  "pattern_error": "Name must be alphanumeric and at least 3 characters",
  "min_length": 3,
  "max_length": 255,
  "allow_create": true,
  "allow_update": true,
  "is_copyable": true
}
```

### Supported Types
- `text` - Standard alphanumeric string.
- `number` or `number(<decimal_places>)` - Numeric fields.
- `bool` - Boolean values (true/false).
- `date` or `datetime(<format_string>)` - Date and times. Common format is `yyyy-MM-dd HH:mm:ss`.
- `select` - Dropdown single-choice field (must specify `options` or `options_source`).
- `permission` - Permission checkbox or select.

### Selection Options
For lookup or dropdown fields, specify `options`:
```json
{
  "label": "Bank Type",
  "reference": "bank_type_id",
  "type": "select",
  "options": {
    "source": "backend.bank_type",
    "label_field": "name",
    "value_field": "id"
  }
}
```

---

## 3. Backend CRUD

Configures the API endpoints for operations:
- `read_all` (GET): Get all items
- `read` (GET): Get single item by `{id}`
- `create` (POST): Create item
- `update` (PUT/PATCH): Update item
- `delete` (DELETE): Delete item

Placeholders like `{backend_host}` and `{id}` are resolved at runtime.

```json
"backend": {
  "read_all": {
    "method": "GET",
    "url": "{{backend_host}}/banks",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  },
  "read": {
    "method": "GET",
    "url": "{{backend_host}}/banks/{{id}}",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  },
  "create": {
    "method": "POST",
    "url": "{{backend_host}}/banks",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  },
  "update": {
    "method": "PUT",
    "url": "{{backend_host}}/banks/{{id}}",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  },
  "delete": {
    "method": "DELETE",
    "url": "{{backend_host}}/banks/{{id}}",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  }
}
```

> **Template Variable Reference**
>
> All `url`, `headers`, and `body` values support `{{ }}` double-brace interpolation via the JavaScript engine.
>
> | Variable | Description |
> |---|---|
> | `{{backend_host}}` | Base URL of the backend, set in app config |
> | `{{auth_token}}` | JWT token of the logged-in user |
> | `{{id}}` | The `id` field of the current row |
> | `{{field_name}}` | Any field value from the current row |
> | `{{form.field_name}}` | Field value from the current form |
> | `{{user_id}}` | ID of the logged-in user |
> | `{{user_name}}` | Name of the logged-in user |

---

## 4. Layout Form

Form pages are defined in `layout_form`. Each form contains dynamic components.

### Form Schema
- `id` (String, required): Form identifier.
- `label` (String, required): Header label.
- `visible_if` (Object, optional): Conditional rule to show/hide the form.
- `components` (Array, required): Nested widgets (see [Component Types](#component-types)).
- `buttons` (Array, optional): Custom actions/buttons.
- `multi_forms` (Array, optional): Nested sub-forms.
- `submit_workflow` (Object, optional): Custom submission behaviors.
- `on_init` (Array/Object, optional): Workflow/actions on initialization.

### Component Types
Components are dynamically instantiated from their `type` field.
- `column` / `row`: Layout containers with `children` (array of components).
- `container`: Wraps a single component with `child` and styling options.
- `text_field`: Single or multi-line text input.
- `number_field`: Numeric input.
- `date_picker` / `time_field`: Date and time inputs.
- `checkbox` / `switch` / `radio`: Multi-choice boolean or selection inputs.
- `dropdown` / `dropdown_multi_value`: Lookup select widgets.
- `table` / `list_view`: Read-only or interactive tables/lists.
- `text` / `field_display`: Typography or variable binding displays (e.g. `"value": "{{current.name}}"`).
- `image` / `divider`: Static layout assets.
- `file_picker`: File uploads.
- `donut_chart` / `pie_chart` / `bar_chart`: Visual dashboards.

---

## 5. Actions

Two common patterns for row actions:

**Edit** — opens a form page:
```json
{
  "id": "edit",
  "type": "open_page",
  "name": "Edit",
  "layout_form_id": "edit_item",
  "icon": "Edit",
  "icon_color": "#2196F3",
  "on_success": "refresh"
}
```

**Delete** — confirmation dialog + HTTP DELETE:
```json
{
  "id": "delete",
  "type": "show_confirmation_dialog",
  "name": "Delete",
  "icon": "Delete",
  "icon_color": "#F44336",
  "confirm_title": "Delete Item",
  "confirm_message": "Are you sure you want to delete this item?",
  "http": {
    "method": "DELETE",
    "url": "{{backend_host}}/items/{{id}}",
    "headers": { "Authorization": "Bearer {{auth_token}}" }
  },
  "on_success": "refresh"
}
```

> **⚠️ `on_success` / `on_failure` Format Rule (ActionD Level)**
>
> At the **ActionD level** (`actions`, `actions_home`, `action_primary`), `on_success` and `on_failure` must be a **plain string** or an **array of strings**.
>
> | Context | Format |
> |---|---|
> | `ActionD` (row/home/primary actions) | `"refresh"` or `["refresh", "toast"]` |
> | `SubmitWorkflow.on_success` | `[{ "type": "close_modal" }, { "type": "refresh" }]` |

> **⚠️ `workflow` is NOT a valid `type`.** Using `"type": "workflow"` results in an `"Unhandled ActionType"` error. Use `show_confirmation_dialog` with an `http` field for delete actions.

### Action Types
- `open_page` / `show_dialog`: Displays a layout form using `layout_form_id`.
- `show_confirmation_dialog`: Shows a confirm dialog, then executes `http` on confirm. Use for **delete actions**.
- `http`: Performs an API request directly (no dialog).
- `print`: Renders printable PDF using a `layout_print_id`.
- `export`: Exports to csv/excel/pdf.
- `list_json_view_as_table`: Visualizes raw JSON lists.
- `refresh`: Refreshes current dataset.
- `navigate_back`: Goes back in screen stack.
- `display_pdf`: Shows a PDF preview dialog.
- `download`: Downloads a file.
- `set_variable` / `append_variable` / `remove_variable`: Manages local state.
- `clear_form`: Clears all form inputs.

---

## 6. Example Configuration

Here is a full structure representing a typical dynamic entity `banks.json`:

```json
{
  "id": "banks",
  "label": "Bank",
  "description": "Financial institution details.",
  "fields": [
    {
      "label": "ID",
      "reference": "id",
      "type": "number",
      "auto_generated": true
    },
    {
      "label": "Name",
      "reference": "name",
      "type": "text",
      "required": true,
      "min_length": 3,
      "allow_create": true,
      "allow_update": true
    }
  ],
  "layout_table": {
    "id": 4,
    "name": 12
  },
  "backend": {
    "read_all": {
      "method": "GET",
      "url": "{backend_host}/banks"
    },
    "read": {
      "method": "GET",
      "url": "{backend_host}/banks/{id}"
    },
    "create": {
      "method": "POST",
      "url": "{backend_host}/banks"
    },
    "update": {
      "method": "PUT",
      "url": "{backend_host}/banks/{id}"
    },
    "delete": {
      "method": "DELETE",
      "url": "{backend_host}/banks/{id}"
    }
  },
  "layout_form": [
    {
      "id": "bank_form",
      "label": "Bank Information",
      "components": [
        {
          "id": "name",
          "type": "text_field",
          "label": "Bank Name",
          "required": true
        }
      ]
    }
  ]
}
```
