// lib/features/entity/screen/widgets/action/json_table_viewer.dart

import 'package:flutter/material.dart';

/// Menampilkan dialog berisi tabel data dari JSON (draggable popup)
Future<void> showJsonAsTableDialog(
  BuildContext context,
  dynamic jsonData,
) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // biar nggak ketutup pas lagi drag
    builder: (ctx) {
      return DraggableDialogContainer(
        title: "JSON Data Viewer",
        child: JsonTableViewer(jsonData: jsonData),
      );
    },
  );
}

/// Container dialog yang bisa digeser (drag) di layar
class DraggableDialogContainer extends StatefulWidget {
  final Widget child;
  final String title;

  const DraggableDialogContainer({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  State<DraggableDialogContainer> createState() =>
      _DraggableDialogContainerState();
}

class _DraggableDialogContainerState extends State<DraggableDialogContainer> {
  Offset position = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gelap transparan
        Positioned.fill(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),
        ),

        // Window yang bisa di-drag
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Material(
            elevation: 16,
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 800,
              height: 600,
              child: Column(
                children: [
                  // Handle Drag (Header Only)
                  GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        position += details.delta;
                      });
                    },
                    child: Container(
                      color: Colors.grey.shade100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.table_chart_outlined, size: 22),
                          const SizedBox(width: 12),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1),
                  // Content (Not draggable, so scrollbar works)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Viewer untuk menampilkan JSON dalam bentuk tabel
class JsonTableViewer extends StatefulWidget {
  final dynamic jsonData;

  const JsonTableViewer({
    super.key,
    required this.jsonData,
  });

  @override
  State<JsonTableViewer> createState() => _JsonTableViewerState();
}

class _JsonTableViewerState extends State<JsonTableViewer> {
  late List<Map<String, dynamic>> rows;
  String searchQuery = '';
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  @override
  void initState() {
    super.initState();
    rows = _normalizeJson(widget.jsonData);
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _normalizeJson(dynamic jsonData) {
    if (jsonData is List) {
      return jsonData
          .whereType<Map>()
          .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
          .toList();
    } else if (jsonData is Map) {
      return [
        jsonData.map((k, v) => MapEntry(k.toString(), v)),
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return const Center(
        child: Text('Data kosong / format JSON tidak dikenali'),
      );
    }

    // Ambil semua key sebagai kolom unik
    final columns = rows.expand((map) => map.keys).toSet().toList();

    // Filter row berdasarkan search
    final filteredRows = rows.where((row) {
      if (searchQuery.isEmpty) return true;
      final query = searchQuery.toLowerCase();
      return row.entries.any(
        (e) =>
            '${e.key}'.toLowerCase().contains(query) ||
            '${e.value}'.toLowerCase().contains(query),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "Cari di data...",
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            setState(() => searchQuery = value);
          },
        ),

        const SizedBox(height: 12),

        // Table section
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Scrollbar(
              controller: _verticalController,
              thumbVisibility: true,
              child: Scrollbar(
                controller: _horizontalController,
                thumbVisibility: true,
                notificationPredicate: (notif) => notif.depth == 1,
                child: SingleChildScrollView(
                  controller: _verticalController,
                  child: SingleChildScrollView(
                    controller: _horizontalController,
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowHeight: 44,
                      dataRowMinHeight: 40,
                      dataRowMaxHeight: 60,
                      headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      border: TableBorder(
                        horizontalInside:
                            BorderSide(color: Colors.grey.shade300),
                      ),
                      columns: [
                        for (final col in columns) DataColumn(label: Text(col)),
                      ],
                      rows: [
                        for (int i = 0; i < filteredRows.length; i++)
                          DataRow(
                            color:
                                MaterialStateProperty.resolveWith<Color?>((_) {
                              // alternating row color
                              return i.isEven ? Colors.grey.shade50 : null;
                            }),
                            cells: [
                              for (final col in columns)
                                DataCell(
                                  Text('${filteredRows[i][col] ?? ''}'),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Footer info
        Row(
          children: [
            Text(
              'Total: ${filteredRows.length} baris',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
