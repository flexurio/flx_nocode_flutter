# Popups & Dialogs Documentation

`flx_nocode_flutter` provides first-class modal popups and dialogs for forms, detail previews, contextual data tables/KPI cards, action confirmations, electronic signatures, PDF previews, and utility pickers.

---

## 1. Popup & Dialog Matrix

| Type | Trigger / Entry Point | Underlying Widget | Best Used For |
| --- | --- | --- | --- |
| **Single-Form Popup** | `Action` (`show_dialog` or `open_page` + `popup: true`) / `LayoutForm` (`popup: true`) | `CreatePage` → `CardForm(popup: true)` | Quick create/edit modals, approval remarks, filter forms |
| **View-Only Detail Popup** | `LayoutForm` (`popup: true`, `submit_button: false`) | `CardForm(popup: true)` | Read-only record inspection without leaving the table |
| **Multi-Step Wizard Popup** | `LayoutForm` (`popup: true`, `multi_forms: [...]`) | `CardForm(popup: true)` + `MultiFormWidget` | Guided multi-step input inside a modal |
| **Data Table / Cards Popup** | `Action` (`type: "show_dialog"`, `view_type: "table" \| "cards" \| "grid"`) | `showDialog` + embedded entity view | Drill-down child tables or KPI summary cards |
| **Confirmation Dialog** | `Action` (`type: "show_confirmation_dialog"`) | `CardConfirmation.action` | Delete confirmations, status transitions, sensitive actions |
| **Electronic Signature Dialog** | `"signature": { ... }` on `Action` or `submit_workflow` | `ElectronicSignatureDialog` | CPOB/GMP password re-auth + signature meaning |
| **Draggable JSON Table** | `Action` (`type: "list_json_view_as_table"`) / `showJsonAsTableDialog` | `DraggableDialogContainer` + `JsonTableViewer` | Inspecting nested JSON arrays/objects in a searchable table |
| **Print Filter Dialog** | `PrintFilterDialog.show(...)` (via `print` flow) | `PrintFilterDialog` (`CardForm(popup: true)`) | Collecting dynamic filter inputs before PDF generation |
| **PDF Preview Dialog** | `Action` (`type: "display_pdf"`) / `PdfPreviewDialog.show(...)` | `PdfPreviewDialog` | Full-screen modal PDF preview with zoom, print, download |
| **Symbol Picker Dialog** | `showSymbolPickerDialog(...)` | `SymbolPickerDialog` | Inserting Greek, math, scientific, and unit symbols |

---

## 2. Popup Forms (`LayoutForm` + `Action`)

Any [`LayoutForm`](./layout_form.md) can render inside a modal popup instead of pushing a new page.

### A. `LayoutForm` Properties for Popups

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `popup` | Boolean | `false` | Renders the form inside `CardForm(popup: true)` with a header close button (`X`). Also supports aliases `is_popup: true` and `type: "popup"`. |
| `width` | Number \| String | `"auto"` | Optional popup width: semantic preset (`"sm"`, `"md"`, `"lg"`, `"xl"`, `"xxl"`, `"full"`), percentage (`"80%"`), pixel number (`680`), or `"auto"` (inferred from content). |
| `submit_button` | Boolean | `true` | Shows or hides the bottom Cancel / Submit footer bar. Set to `false` for read-only detail popups. |
| `label` | String | Required | Header title shown at the top of the popup card. |
| `title` | String | Optional | Explicit title override. |
| `components` | Array\<Object\> | Optional* | Form components for single-step popups. (*Required if `multi_forms` is omitted.) |
| `multi_forms` | Array\<Object\> | Optional | Array of step `LayoutForm` definitions for a wizard popup. |
| `submit_workflow` | Object | Optional | Submission pipeline; see [Submit Workflow](./submit_workflow.md). |

### B. `Action` Properties for Opening Form Popups

| Key | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | String | Required | Use `"show_dialog"` (always opens as popup) or `"open_page"` with `"popup": true`. |
| `layout_form_id` | String | Required | ID of the target form in `entity.layout_form`. |
| `popup` | Boolean | `false` | Forces `"open_page"` to open as a modal popup. Alias: `is_popup: true`. |
| `width` | Number \| String | `"auto"` | Overrides `LayoutForm.width` (`"sm"`, `"md"`, `"lg"`, `"xl"`, `"xxl"`, `"full"`, `"80%"`, or pixel number). |
| `show_submit_button` | Boolean | Optional | Overrides `LayoutForm.submit_button` from the triggering action. |
| `signature` | Object / Boolean | Optional | Prompts `ElectronicSignatureDialog` before executing submission. |
| `on_success` | Array / Object | Optional | Post-submit actions (e.g., `refresh`, `toast`). |

### C. Responsive & Content-Aware Sizing (`PopupSizeResolver`)

Priority order: **`Action.width`** → **`LayoutForm.width`** → **Smart Auto Inference** (always clamped to viewport bounds; on mobile `< 600px`, popups automatically expand to full available width with `16px` margin).

| Detected Content / Preset | Resolved Desktop Width |
| --- | --- |
| `field_array` (table) or `table` with `>= 6` columns / `"xxl"` | `1120px` |
| `field_array` or `table` with `4–5` columns / `"xl"` | `960px` |
| `field_array` / `table` `<= 3` columns, `multi_forms` wizard, or 3+ child `row` / `"lg"` | `760px` |
| 2-child `row` or `> 4` form fields / `"md"` | `560px` |
| Simple 1-column form (`<= 4` fields) / `"sm"` | `440px` |
| `"full"` | `92%` of viewport width |

### D. Runtime Behavior

- **Backdrop & Navigation**: Opened with `useRootNavigator: true` and `barrierDismissible: false`, so the modal backdrop covers both the top navbar and sidebar and prevents accidental dismissal by clicking outside.
- **Sticky Header & Footer**: `CardForm(popup: true)` constrains height to `88%` of the viewport with a sticky title/close header, sticky Cancel/Submit footer, and scrollable middle body.
- **Validation & Auto-Close**: Clicking Submit validates all visible form fields (`FormState.validate()`). On successful `submit_workflow` execution, the popup automatically closes (`autoBackWhenSuccess`) and triggers `onSuccess`.

### E. Complete Examples

#### Example 1: Single-Form Popup (Create / Quick Action)

```json
{
  "actions": [
    {
      "id": "open_quick_capa",
      "name": "Tambah CAPA",
      "type": "show_dialog",
      "layout_form_id": "create_capa_popup",
      "width": 560,
      "on_success": [
        { "type": "refresh" },
        { "type": "toast", "name": "CAPA berhasil dibuat" }
      ]
    }
  ],
  "layout_form": [
    {
      "id": "create_capa_popup",
      "label": "Buat Permintaan CAPA",
      "popup": true,
      "components": [
        { "id": "capa_number", "type": "text_field", "label": "Nomor CAPA", "required": true },
        { "id": "department", "type": "text_field", "label": "Departemen Terkait", "required": true },
        { "id": "due_date", "type": "date_picker", "label": "Target Penyelesaian", "required": true },
        { "id": "description", "type": "text_field", "label": "Deskripsi Temuan", "maxLines": 3 }
      ],
      "submit_workflow": {
        "type": "workflow",
        "submitLabel": "Simpan",
        "actions": [
          {
            "type": "http",
            "http": {
              "method": "POST",
              "url": "{{backend_host}}/plant_capas",
              "body": {
                "capa_number": "{{form.capa_number}}",
                "department": "{{form.department}}",
                "due_date": "{{form.due_date}}",
                "description": "{{form.description}}"
              }
            }
          }
        ]
      }
    }
  ]
}
```

#### Example 2: View-Only Detail Popup (`submit_button: false`)

```json
{
  "id": "view_outbox_detail",
  "label": "Lihat Detail Outbox",
  "popup": true,
  "submit_button": false,
  "components": [
    { "id": "phone", "type": "field_display", "label": "Phone Number", "value": "{{data.phone}}" },
    { "id": "status", "type": "field_display", "label": "Status", "value": "{{data.status}}" },
    { "id": "message", "type": "field_display", "label": "Message", "value": "{{data.message}}" }
  ]
}
```

#### Example 3: Multi-Step Wizard Popup (`multi_forms`)

```json
{
  "id": "capa_evaluation_wizard",
  "label": "Evaluasi & Persetujuan Dokumen Peristiwa Mutu CPOB",
  "popup": true,
  "multi_forms": [
    {
      "id": "step_1",
      "label": "Informasi Umum",
      "components": [
        { "id": "doc_no", "type": "text_field", "label": "Nomor Dokumen", "required": true },
        { "id": "site_name", "type": "text_field", "label": "Lokasi / Site Pabrik", "required": true }
      ]
    },
    {
      "id": "step_2",
      "label": "Investigasi & Akar Masalah",
      "components": [
        { "id": "root_cause", "type": "text_field", "label": "Akar Masalah Utama", "required": true },
        { "id": "impact_summary", "type": "text_field", "label": "Ringkasan Dampak Produk" }
      ]
    }
  ],
  "submit_workflow": {
    "type": "workflow",
    "submitLabel": "Kirim Evaluasi",
    "actions": [
      {
        "type": "http",
        "http": {
          "method": "POST",
          "url": "{{backend_host}}/plant_capas/{{data.id}}/evaluate",
          "body": {
            "doc_no": "{{form.doc_no}}",
            "site_name": "{{form.site_name}}",
            "root_cause": "{{form.root_cause}}",
            "impact_summary": "{{form.impact_summary}}"
          }
        }
      }
    ]
  }
}
```

> Tip: For multi-step popups with long step titles or wide tables (`field_array`), set `"width": 720` (or higher) on the triggering [`Action`](../actions/actions.md).

---

## 3. Data Table & KPI Cards Popup (`show_dialog` + `view_type`)

Instead of opening a `layout_form`, `"type": "show_dialog"` can open an embedded entity view (data table or KPI cards) inside a modal dialog.

| Key | Type | Description |
| --- | --- | --- |
| `view_type` | String | `"table"` (embedded `EntityDataTable`), `"cards"`, or `"grid"` (KPI summary cards). Alias: `type_view`. |
| `target_entity` | String | Target entity JSON ID to load. Aliases: `entity_id`, `target_entity_id`. |
| `title` | String | Custom modal header title (falls back to action `name`). |
| `badges` | Array\<String \| Object\> | Contextual top badges (e.g., `["tahun", "bulan"]`). |
| `filters` | Array\<Object\> | Initial filters passed to the target entity, e.g. `[{ "reference": "header_id", "value": "{{row.id}}" }]`. |
| `params` | Object | Additional query parameter map, e.g. `{ "tahun.eq": "{{row.tahun}}" }`. |

```json
{
  "id": "view_monthly_details",
  "name": "Lihat Detail Bulanan",
  "type": "show_dialog",
  "view_type": "table",
  "target_entity": "sales_target_monthly_trend_details",
  "title": "Detail Target Penjualan",
  "badges": ["tahun", "bulan"],
  "filters": [
    { "reference": "tahun", "value": "{{row.tahun}}" },
    { "reference": "bulan", "value": "{{row.bulan}}" }
  ]
}
```

The embedded dialog automatically passes `[...parentData, data]` down to the target entity so nested `views` and `initialFilters` resolve seamlessly.

---

## 4. Confirmation Dialog (`show_confirmation_dialog`)

Use `"type": "show_confirmation_dialog"` on an [`Action`](../actions/actions.md) when user confirmation is required before calling an API (such as delete, cancel, or approval).

| Key | Type | Required | Description |
| --- | --- | --- | --- |
| `type` | String | Yes | Must be `"show_confirmation_dialog"`. |
| `name` | String | Yes | Button label / action title. |
| `confirm_title` | String | No | Dialog title override. |
| `confirm_message` | String | No | Custom confirmation message body (supports interpolation such as `{{row.doc_no}}`). |
| `http` | Object | Yes | Request executed when the user confirms; see [HTTP Data](../actions/http_data.md). |
| `signature` | Object | No | Optional e-signature verification after confirmation. |
| `rule` | Object | No | Visibility/authorization rule; see [Access Control](../core/access_control.md). |
| `on_success` | Array / Object | No | Actions run after `http` succeeds (typically `refresh` + `toast`). |

### Example: Delete Confirmation Action

```json
{
  "id": "delete_capa",
  "name": "Hapus",
  "type": "show_confirmation_dialog",
  "confirm_title": "Hapus Dokumen CAPA",
  "confirm_message": "Apakah Anda yakin ingin menghapus dokumen {{row.capa_number}}? Tindakan ini tidak dapat dibatalkan.",
  "permissions": ["capas:delete"],
  "http": {
    "method": "DELETE",
    "url": "{{backend_host}}/plant_capas/{{row.id}}"
  },
  "on_success": [
    { "type": "refresh" },
    { "type": "toast", "name": "Dokumen berhasil dihapus" }
  ]
}
```

During execution, `CardConfirmation.action` automatically displays a loading indicator (`isProgress: true`) and closes the dialog once the request completes.

---

## 5. Electronic Signature Dialog (`signature`)

Attach a `"signature"` configuration to an `Action` (`http`, `workflow`, `show_confirmation_dialog`, `open_page`, `show_dialog`) or to `submit_workflow` to open `ElectronicSignatureDialog` before the request is sent.

```json
{
  "id": "approve_capa",
  "name": "Setujui CAPA",
  "type": "http",
  "signature": {
    "title": "Persetujuan Elektronik CPOB",
    "meanings": ["Disetujui", "Ditinjau", "Ditolak"],
    "default_meaning": "Disetujui",
    "verify_url": "{{backend_host}}/auth/verify-password"
  },
  "http": {
    "method": "POST",
    "url": "{{backend_host}}/plant_capas/{{row.id}}/approve",
    "body": {
      "meaning": "{{signature.meaning}}",
      "signed_at": "{{signature.signed_at}}"
    }
  }
}
```

When verified, the engine injects the `X-Signature-Token` header and populates `{{signature.token}}`, `{{signature.meaning}}`, `{{signature.signer_name}}`, `{{signature.signer_nip}}`, and `{{signature.signed_at}}`. See [Electronic Signature Documentation](../actions/electronic_signature.md) for the complete specification.

---

## 6. Utility & Print Dialogs

| Dialog | Trigger / API | Capabilities & Notes |
| --- | --- | --- |
| **Draggable JSON Table** | `"type": "list_json_view_as_table"` with `"reference": "<field>"` or `showJsonAsTableDialog(context, jsonData)` | Renders `JsonTableViewer` inside `DraggableDialogContainer` (`800×600`). Supports header dragging, live search across keys/values, and synchronized horizontal + vertical scrollbars. |
| **Print Filter Dialog** | `PrintFilterDialog.show(context, printName: ..., fields: ...)` | Wraps dynamic `Component` filter fields inside `CardForm(popup: true)` with `Cancel` and `Print` actions, returning `Map<String, String>?` on validation. |
| **PDF Preview Dialog** | `"type": "display_pdf"` or `PdfPreviewDialog.show(context, pdfBytes, title, canPrint: ..., canDownload: ...)` | Opens a `90% × 90%` modal viewer with zoom controls (`0.5x–3.0x`), print, and download buttons. |
| **Symbol Picker Dialog** | `showSymbolPickerDialog(context: context, controller: ...)` | Modal picker (`480px` wide) with search, recently used bar, and tabs for **Greek & Math**, **Units & Scientific**, and **Special Characters**, inserting directly at the cursor position. |

---

## 7. Best Practices & Common Pitfalls

- **Size popups appropriately**: Default width is `400`. Use `width: 520–600` for standard forms and `width: 700–840` for `multi_forms` or forms containing [`field_array`](../components/field_array.md) tables.
- **Hide footer buttons on read-only popups**: Set `"submit_button": false` on view/detail popups so users only see the `X` close control (or custom footer `buttons`).
- **Hide redundant filters in contextual table popups**: On target entities opened via `show_dialog` (`view_type: "table"`), set `"hide_filters": true` if filters are already locked by parent context `filters` and `badges`.
- **Avoid nested full-page navigation inside modals**: Do not embed heavy scrollable pages without bounded constraints; `CardForm(popup: true)` already handles popup framing and scrolling.
- **Test across viewports**: Verify both desktop (`macOS`/`Windows`) and narrow tablet/mobile widths so popup widths and action bars do not overflow.

---

## 8. Visual Testing in Widgetbook

All popup and dialog variants have dedicated interactive & inline previews under the **`Popups`** category in Widgetbook:

- **`Popups/Forms` (`CardForm`)**:
  - `Single-Form Popup (From JSON)` (with width, title, and close-button knobs + validation)
  - `Scrollable Long Form Popup`
  - `Multi-Step Form Popup (Long Step Titles)`
  - `Popup Width Variants (Auto + Presets + Custom)`
  - `Inline Popup Card (With Close Button X)`
- **`Popups/Dialogs`**:
  - `CardConfirmation` (`Interactive Action Confirmation`, `Destructive Delete Preview (Inline)`)
  - `ElectronicSignatureDialog` (`Default Approval`, `From JSON Config`, `Inline Dialog Preview`)
  - `JsonTableViewer` (`Draggable JSON Table Popup`, `Inline JSON Table Viewer`)
  - `PrintFilterDialog` (`Interactive Print Filter Popup`, `Inline Print Filter Preview`)
  - `PdfPreviewDialog` (`Interactive PDF Preview Popup`)
  - `SymbolPickerDialog` (`Interactive Symbol Picker`, `Inline Dialog Preview`)

Run Widgetbook with `ViewportAddon` enabled to verify popup responsiveness across screen sizes:

```bash
flutter run -t lib/widgetbook.dart -d macos
```

See [Widgetbook & Testing Guide](../guides/widgetbook_and_testing.md) for category conventions and codegen steps.
