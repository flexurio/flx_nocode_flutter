import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/print_filter_dialog.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

List<Component> _buildSampleFilterFields() {
  const raw = '''
  {
    "id": "print_filter_sample",
    "label": "Filter Cetak",
    "components": [
      {
        "id": "period_start",
        "type": "date_picker",
        "label": "Tanggal Mulai",
        "required": true
      },
      {
        "id": "period_end",
        "type": "date_picker",
        "label": "Tanggal Selesai",
        "required": true
      },
      {
        "id": "department",
        "type": "text_field",
        "label": "Departemen"
      }
    ]
  }
  ''';
  return LayoutForm.fromMap(json.decode(raw) as Map<String, dynamic>)
      .components;
}

@UseCase(
  name: 'Interactive Print Filter Popup',
  type: PrintFilterDialog,
  path: '[Popups]/Dialogs',
)
Widget interactivePrintFilterDialogUseCase(BuildContext context) {
  final printName = context.knobs.string(
    label: 'Print Title',
    initialValue: 'Filter Laporan CAPA Bulanan',
  );

  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.filter_alt_outlined),
      label: const Text('Buka Print Filter Popup'),
      onPressed: () async {
        final result = await PrintFilterDialog.show(
          context,
          printName: printName,
          fields: _buildSampleFilterFields(),
          initialData: const {'department': 'Quality Assurance'},
        );
        if (result != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Filter dipilih: $result')),
          );
        }
      },
    ),
  );
}

@UseCase(
  name: 'Inline Print Filter Preview',
  type: PrintFilterDialog,
  path: '[Popups]/Dialogs',
)
Widget inlinePrintFilterDialogUseCase(BuildContext context) {
  return Center(
    child: PrintFilterDialog(
      printName: 'Filter Laporan CAPA Bulanan',
      fields: _buildSampleFilterFields(),
      initialData: const {'department': 'Quality Assurance'},
    ),
  );
}
