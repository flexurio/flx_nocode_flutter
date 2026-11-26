import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/popup_size_resolver.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'layout_form.dart';

@UseCase(
  name: 'Single-Form Popup (From JSON)',
  type: CardForm,
  path: '[Popups]/Forms',
)
Widget singleFormPopupUseCase(BuildContext context) {
  final width = context.knobs.double.slider(
    label: 'Popup Width',
    initialValue: 540,
    min: 360,
    max: 900,
  );
  final title = context.knobs.string(
    label: 'Popup Title',
    initialValue: 'Buat Permintaan CAPA',
  );
  final showCloseButton = context.knobs.boolean(
    label: 'Show Close Button (X)',
    initialValue: true,
  );

  const jsonRaw = '''
  {
    "id": "single_form_popup",
    "label": "Buat Permintaan CAPA",
    "popup": true,
    "components": [
      {
        "id": "capa_number",
        "type": "text_field",
        "label": "Nomor CAPA",
        "required": true
      },
      {
        "id": "department",
        "type": "text_field",
        "label": "Departemen Terkait",
        "required": true
      },
      {
        "id": "due_date",
        "type": "date_picker",
        "label": "Target Penyelesaian",
        "required": true
      },
      {
        "id": "description",
        "type": "text_field",
        "label": "Deskripsi Temuan"
      }
    ]
  }
  ''';

  final form = LayoutForm.fromMap(
    json.decode(jsonRaw) as Map<String, dynamic>,
  );

  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.open_in_new),
      label: const Text('Buka Single-Form Popup'),
      onPressed: () {
        final formKey = GlobalKey<FormState>();
        showDialog<void>(
          context: context,
          builder: (dialogContext) {
            return Form(
              key: formKey,
              child: CardForm(
                popup: true,
                width: width,
                title: title,
                icon: Icons.edit_note,
                onClose: showCloseButton
                    ? () => Navigator.of(dialogContext).pop()
                    : null,
                actions: [
                  Button.action(
                    permission: null,
                    isSecondary: true,
                    isInProgress: false,
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    action: DataAction.cancel,
                  ),
                  const SizedBox(width: 8),
                  Button.action(
                    permission: null,
                    isInProgress: false,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Navigator.of(dialogContext).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Form popup berhasil divalidasi!'),
                          ),
                        );
                      }
                    },
                    action: DataAction.add,
                  ),
                ],
                child: form.toWidget({}),
              ),
            );
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Scrollable Long Form Popup',
  type: CardForm,
  path: '[Popups]/Forms',
)
Widget scrollableLongFormPopupUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "long_form_popup",
    "label": "Formulir Inspeksi Lengkap",
    "popup": true,
    "components": [
      { "id": "batch_no", "type": "text_field", "label": "Nomor Batch", "required": true },
      { "id": "product_name", "type": "text_field", "label": "Nama Produk", "required": true },
      { "id": "line_code", "type": "text_field", "label": "Kode Lini Produksi" },
      { "id": "mfg_date", "type": "date_picker", "label": "Tanggal Produksi" },
      { "id": "exp_date", "type": "date_picker", "label": "Tanggal Kedaluwarsa" },
      { "id": "inspector", "type": "text_field", "label": "Nama Inspektor QC" },
      { "id": "sample_size", "type": "text_field", "label": "Jumlah Sampel" },
      { "id": "temperature", "type": "text_field", "label": "Suhu Ruangan (°C)" },
      { "id": "humidity", "type": "text_field", "label": "Kelembaban Relatif (%RH)" },
      { "id": "notes", "type": "text_field", "label": "Catatan Tambahan" }
    ]
  }
  ''';

  final form = LayoutForm.fromMap(
    json.decode(jsonRaw) as Map<String, dynamic>,
  );

  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.view_agenda_outlined),
      label: const Text('Buka Long Form Popup (Scrollable)'),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (dialogContext) {
            return CardForm(
              popup: true,
              width: 560,
              title: form.label,
              icon: Icons.fact_check_outlined,
              onClose: () => Navigator.of(dialogContext).pop(),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Batal'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Simpan'),
                ),
              ],
              child: form.toWidget({}),
            );
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Multi-Step Form Popup (Long Step Titles)',
  type: CardForm,
  path: '[Popups]/Forms',
)
Widget multiFormPopupLongTitlesUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "multi_form_popup_long_titles",
    "label": "Evaluasi & Persetujuan Dokumen Peristiwa Mutu CPOB",
    "multi_forms": [
      {
        "id": "step_1",
        "label": "Langkah 1: Informasi Umum Perusahaan, Identitas Pemohon & Klasifikasi Dokumen",
        "components": [
          { "id": "doc_no", "type": "text_field", "label": "Nomor Dokumen", "required": true },
          { "id": "site_name", "type": "text_field", "label": "Lokasi / Site Pabrik", "required": true }
        ]
      },
      {
        "id": "step_2",
        "label": "Langkah 2: Rincian Investigasi Akar Masalah (Root Cause Analysis) & Dampak Kualitas",
        "components": [
          { "id": "root_cause", "type": "text_field", "label": "Akar Masalah Utama", "required": true },
          { "id": "impact_summary", "type": "text_field", "label": "Ringkasan Dampak Produk" }
        ]
      },
      {
        "id": "step_3",
        "label": "Langkah 3: Rencana Tindakan Perbaikan dan Pencegahan (CAPA) Jangka Panjang",
        "components": [
          { "id": "corrective_action", "type": "text_field", "label": "Tindakan Perbaikan" },
          { "id": "due_date", "type": "date_picker", "label": "Target Tanggal Selesai" }
        ]
      },
      {
        "id": "step_4",
        "label": "Langkah 4: Verifikasi Efektivitas, Tinjauan QA Manager & Persetujuan Akhir",
        "components": [
          { "id": "qa_notes", "type": "text_field", "label": "Catatan Tinjauan QA Manager" }
        ]
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final form = LayoutForm.fromMap(map);

  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.open_in_new),
      label: const Text('Buka Multi-Form Popup'),
      onPressed: () {
        var pageIndex = 0;
        showDialog<void>(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (context, setState) {
                final isLast = pageIndex >= form.multiForms.length - 1;
                return CardForm(
                  popup: true,
                  width: 720,
                  title: form.label,
                  icon: Icons.assignment_outlined,
                  onClose: () => Navigator.of(dialogContext).pop(),
                  actions: [
                    TextButton(
                      onPressed: pageIndex > 0
                          ? () => setState(() => pageIndex--)
                          : null,
                      child: const Text('Back'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: isLast
                          ? () => Navigator.of(dialogContext).pop()
                          : () => setState(() => pageIndex++),
                      child: Text(isLast ? 'Selesai' : 'Next'),
                    ),
                  ],
                  child: SizedBox(
                    width: 680,
                    child: form.toWidget({'page': pageIndex}),
                  ),
                );
              },
            );
          },
        );
      },
    ),
  );
}

@UseCase(
  name: 'Inline Popup Card (With Close Button X)',
  type: CardForm,
  path: '[Popups]/Forms',
)
Widget inlinePopupCardUseCase(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: CardForm(
        popup: true,
        width: 500,
        title: 'Lihat Detail Outbox',
        icon: Icons.tune,
        onClose: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Close button X pressed!')),
          );
        },
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Close'),
          ),
        ],
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Phone Number: 6283105084189'),
            SizedBox(height: 12),
            Text('Status: sent'),
            SizedBox(height: 12),
            Text('Type: activate_installation'),
            SizedBox(height: 12),
            Text('Message: Kode OTP anda 1395'),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Popup Width Variants (Auto + Presets + Custom)',
  type: CardForm,
  path: '[Popups]/Forms',
)
Widget popupWidthVariantsUseCase(BuildContext context) {
  final customWidth = context.knobs.double.slider(
    label: 'Custom Width (px)',
    initialValue: 560,
    min: 320,
    max: 1120,
  );
  final showInlineComparison = context.knobs.boolean(
    label: 'Show Inline Preview',
    initialValue: false,
  );

  final simpleForm = LayoutForm.fromMap(
    json.decode('''
    {
      "id": "simple_auto",
      "label": "Simple Form (Auto -> sm 440px)",
      "popup": true,
      "components": [
        { "id": "doc_no", "type": "text_field", "label": "Nomor Dokumen", "required": true },
        { "id": "notes", "type": "text_field", "label": "Catatan", "maxLines": 2 }
      ]
    }
    ''') as Map<String, dynamic>,
  );

  final rowForm = LayoutForm.fromMap(
    json.decode('''
    {
      "id": "row_auto",
      "label": "2-Column Row Form (Auto -> md 560px)",
      "popup": true,
      "components": [
        {
          "id": "row_fields",
          "type": "row",
          "children": [
            { "id": "doc_no", "type": "text_field", "label": "Nomor Dokumen", "flex": 1, "required": true },
            { "id": "site", "type": "text_field", "label": "Site / Pabrik", "flex": 1, "required": true }
          ]
        },
        { "id": "due_date", "type": "date_picker", "label": "Target Tanggal" },
        { "id": "notes", "type": "text_field", "label": "Catatan Evaluasi", "maxLines": 2 }
      ]
    }
    ''') as Map<String, dynamic>,
  );

  final capaTableForm = LayoutForm.fromMap(
    json.decode('''
    {
      "id": "capa_tindakan_auto",
      "label": "CAPA Tindakan (Auto field_array 5 cols -> xl 960px)",
      "popup": true,
      "components": [
        {
          "id": "tindakan",
          "type": "field_array",
          "label": "Bagian IV - Tindakan",
          "row_actions": { "add_label": "Tambah baris", "allow_delete": true },
          "columns": [
            { "header": "Nomor tindakan", "body": "no", "component": { "type": "text_field", "required": true } },
            { "header": "Jenis tindakan", "body": "type", "component": { "type": "dropdown", "options": ["Corrective", "Preventive"] } },
            { "header": "PIC", "body": "pic", "component": { "type": "text_field" } },
            { "header": "Target Tanggal", "body": "due_date", "component": { "type": "date_picker" } },
            { "header": "Status", "body": "status", "component": { "type": "text_field" } }
          ]
        }
      ]
    }
    ''') as Map<String, dynamic>,
  );

  final viewportWidth = MediaQuery.of(context).size.width;

  void openPopup({
    required LayoutForm form,
    required String title,
    Object? widthSpec,
  }) {
    final resolved = PopupSizeResolver.resolve(
      layoutForm: form,
      viewportWidth: viewportWidth,
      actionWidth: widthSpec,
    );
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return CardForm(
          popup: true,
          width: resolved,
          title: '$title (${resolved.round()}px)',
          icon: Icons.aspect_ratio_outlined,
          onClose: () => Navigator.of(dialogContext).pop(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Batal'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Simpan'),
            ),
          ],
          child: form.toWidget({}),
        );
      },
    );
  }

  final semanticPresets = [
    (label: 'sm', spec: 'sm'),
    (label: 'md', spec: 'md'),
    (label: 'lg', spec: 'lg'),
    (label: 'xl', spec: 'xl'),
    (label: 'xxl', spec: 'xxl'),
    (label: 'full', spec: 'full'),
  ];

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Auto Content-Aware (width: null)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Auto: Simple Form (sm)'),
                onPressed: () => openPopup(
                  form: simpleForm,
                  title: 'Auto Simple Form',
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Auto: 2-Col Row (md)'),
                onPressed: () => openPopup(
                  form: rowForm,
                  title: 'Auto 2-Col Row',
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.table_chart_outlined),
                label: const Text('Auto: CAPA field_array (xl)'),
                onPressed: () => openPopup(
                  form: capaTableForm,
                  title: 'Auto CAPA Tindakan',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Semantic Presets & Custom Width',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              for (final preset in semanticPresets)
                OutlinedButton(
                  onPressed: () => openPopup(
                    form: rowForm,
                    title: 'Preset "${preset.label}"',
                    widthSpec: preset.spec,
                  ),
                  child: Text('width: "${preset.label}"'),
                ),
              OutlinedButton.icon(
                icon: const Icon(Icons.tune),
                label: Text('Custom (${customWidth.round()}px)'),
                onPressed: () => openPopup(
                  form: rowForm,
                  title: 'Custom Width',
                  widthSpec: customWidth,
                ),
              ),
            ],
          ),
          if (showInlineComparison) ...[
            const SizedBox(height: 24),
            CardForm(
              popup: true,
              width: customWidth,
              title: 'Inline Preview (${customWidth.round()}px)',
              icon: Icons.aspect_ratio_outlined,
              onClose: () {},
              actions: [
                TextButton(onPressed: () {}, child: const Text('Batal')),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: () {}, child: const Text('Simpan')),
              ],
              child: rowForm.toWidget({}),
            ),
          ],
        ],
      ),
    ),
  );
}
