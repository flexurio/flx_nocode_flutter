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
        child: SizedBox(
          width: 700,
          height: 500,
          child: JsonTableViewer(jsonData: jsonData),
        ),
      );
    },
  );
}

/// Container dialog yang bisa digeser (drag) di layar
class DraggableDialogContainer extends StatefulWidget {
  final Widget child;

  const DraggableDialogContainer({
    super.key,
    required this.child,
  });

  @override
  State<DraggableDialogContainer> createState() =>
      _DraggableDialogContainerState();
}

class _DraggableDialogContainerState extends State<DraggableDialogContainer> {
  Offset position = const Offset(50, 50);

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
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position += details.delta;
              });
            },
            child: Material(
              elevation: 16,
              borderRadius: BorderRadius.circular(16),
              color: Colors.white, // popup putih, bukan pink
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 700,
                height: 500,
                child: widget.child,
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

  @override
  void initState() {
    super.initState();
    rows = _normalizeJson(widget.jsonData);
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
        // Header
        Row(
          children: [
            const Icon(Icons.table_chart_outlined, size: 22),
            const SizedBox(width: 8),
            const Text(
              "JSON Data Viewer",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Tutup',
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const SizedBox(height: 8),

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    headingRowHeight: 44,
                    dataRowMinHeight: 40,
                    dataRowMaxHeight: 60,
                    headingTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    border: TableBorder(
                      horizontalInside: BorderSide(color: Colors.grey.shade300),
                    ),
                    columns: [
                      for (final col in columns) DataColumn(label: Text(col)),
                    ],
                    rows: [
                      for (int i = 0; i < filteredRows.length; i++)
                        DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>((_) {
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

        const SizedBox(height: 8),

        // Footer info + tombol Close kedua (optional)
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
