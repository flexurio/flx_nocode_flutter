import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/json_table_viewer.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const List<Map<String, dynamic>> _sampleJsonRows = [
  {
    'id': 1,
    'doc_no': 'CAPA-2026-001',
    'site': 'Plant Cikarang',
    'status': 'EVALUATION_APPROVAL',
    'owner': 'Apt. Budi Santoso',
    'due_date': '2026-12-15',
  },
  {
    'id': 2,
    'doc_no': 'CAPA-2026-002',
    'site': 'Plant Pulogadung',
    'status': 'IN_PROGRESS',
    'owner': 'Siti Rahmawati',
    'due_date': '2026-12-20',
  },
  {
    'id': 3,
    'doc_no': 'CAPA-2026-003',
    'site': 'Plant Cikarang',
    'status': 'CLOSED',
    'owner': 'Andi Wijaya',
    'due_date': '2026-11-30',
  },
  {
    'id': 4,
    'doc_no': 'CAPA-2026-004',
    'site': 'Plant Surabaya',
    'status': 'DRAFT',
    'owner': 'Dewi Lestari',
    'due_date': '2027-01-10',
  },
];

@UseCase(
  name: 'Draggable JSON Table Popup',
  type: JsonTableViewer,
  path: '[Popups]/Dialogs',
)
Widget draggableJsonTablePopupUseCase(BuildContext context) {
  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.table_chart_outlined),
      label: const Text('Buka Draggable JSON Table Popup'),
      onPressed: () {
        showJsonAsTableDialog(context, _sampleJsonRows);
      },
    ),
  );
}

@UseCase(
  name: 'Inline JSON Table Viewer',
  type: JsonTableViewer,
  path: '[Popups]/Dialogs',
)
Widget inlineJsonTableViewerUseCase(BuildContext context) {
  return Center(
    child: Container(
      width: 760,
      height: 460,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const JsonTableViewer(jsonData: _sampleJsonRows),
    ),
  );
}
