# FLX No-Code Flutter Documentation

Welcome to the official documentation for `flx_nocode_flutter`, a JSON-driven Flutter engine for building enterprise CRUD, workflow, and reporting interfaces.

---

## Documentation Map

### 1. Core Configuration & Runtime
- [Configuration JSON](./core/configuration.md) — Root `configuration.json`, themes, menus, hosts, and global settings.
- [Entity JSON](./core/entity.md) — Entity definitions, backend endpoints, table layout, filters, and views.
- [Entity Fields](./core/field.md) — Field types, `value_labels` / `chip_labels`, `chip_colors`, and `display_source`.
- [Access Control & Visibility](./core/access_control.md) — 2-layer RBAC/ABAC (`capabilities` + declarative `Rule`).
- [Variables](./core/variables.md) — Built-in contexts (`data`, `form`, `current`, `parent`, `user`, `vars`, `signature`).
- [String Interpolation](./core/string_interpolation.md) — `{{ ... }}` templates and JavaScript expressions.

### 2. Forms, Popups & Workflows
- [Layout Form](./forms/layout_form.md) — Single forms, multi-step wizards (`multi_forms`), and validation.
- [Popups & Dialogs](./forms/popups.md) — Popup forms (`popup: true`), confirmation dialogs, e-signature, and utility dialogs.
- [Submit Workflow](./forms/submit_workflow.md) — Multi-step HTTP pipelines, file uploads, and post-submit actions.

### 3. Actions & Networking
- [Actions](./actions/actions.md) — `http`, `workflow`, `open_page`, `show_confirmation_dialog`, `navigate`, and more.
- [HTTP Data](./actions/http_data.md) — Request methods, headers, query params, bodies, and response mapping.
- [HTTP-based Action Visibility](./actions/visibility_http.md) — Dynamic action visibility via backend checks.
- [Electronic Signature (E-Signature)](./actions/electronic_signature.md) — Built-in password verification & audit trail (`X-Signature-Token`).

### 4. UI Components
- [Components Index](./components/README.md) — Overview of all supported component types and common properties.
- [Input Components](./components/inputs/README.md) — `text_field`, `number_field`, `date_picker`, `time_field`, `file_picker`, `dropdown`, `dropdown_multi_value`, `checkbox`, `switch`, `radio`.
- [Display Components](./components/display.md) — `text`, `field_display`, `image`, `list_view`, `user_name`.
- [Layout Components](./components/layout.md) — `row`, `column`, `container`.
- [Interaction Components](./components/interaction.md) — `button`, `icon_button`.
- [Data Components](./components/table.md) — [Table](./components/table.md) & [Field Array](./components/field_array.md).
- [Charts](./components/charts.md) — `donut_chart`, `pie_chart`, `bar_chart`, `chart`.
- [Structural & Logic](./components/form.md) — [Nested Form](./components/form.md), [Conditional](./components/conditional.md), and [Other Components](./components/other.md).

### 5. Print & PDF Generation
- [Layout Print](./print/layout_print.md) — Declarative PDF templates, watermarks, parallel `data_sources`, and pagination.
- [Print Component Library](./print/print_components.md) — Tables, grids, text, images, QR codes, and signature blocks.

### 6. Developer & AI Guides
- [Widgetbook & Testing Guide](./guides/widgetbook_and_testing.md) — Running Widgetbook, organizing `@UseCase` categories, codegen, and tests.
- [Entity JSON Schema Guide (AI / Agent)](./agent_skills/generate_json.md) — Condensed reference for generating valid entity JSONs.
