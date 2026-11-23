import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/pdf_grid_model.dart';
import '../utils/pdf_interpolation_utils.dart';

/// Signature for building a single raw PDF component with context.
typedef PdfRawChildBuilder = pw.Widget Function(
  Map<String, dynamic> comp,
  String defaultUnit,
  Map<String, pw.ImageProvider> imageCache, {
  Map<String, dynamic>? contextData,
});

/// Generic multi-column repeating grid component (`type: "grid"`).
///
/// Also exposes [layoutCardRows] as a shared grid/pagination engine reused by
/// preset components such as `signature_block`.
class PdfGridComponent {
  /// Returns a list of widgets suitable for spreading into `pw.MultiPage.build`.
  ///
  /// When `keep_together` is `false`, each grid row is returned as an atomic
  /// `pw.Row` so `MultiPage` can break cleanly between rows without splitting
  /// an individual card. When `keep_together` is `true`, all rows are wrapped
  /// in a single `pw.Column` so the block stays together on one page.
  static List<pw.Widget> buildWidgets(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache,
    PdfRawChildBuilder buildRawChild, {
    Map<String, dynamic> rootContext = const {},
  }) {
    final model = PdfGridModel.fromJson(comp, defaultUnit);

    if (model.data.isEmpty) {
      return buildEmptyState(model.emptyText);
    }

    if (model.itemTemplate == null) {
      return const [];
    }

    final cards = <pw.Widget>[];
    for (var i = 0; i < model.data.length; i++) {
      final rawItem = model.data[i];
      final itemContext = <String, dynamic>{
        ...rootContext,
        'item': rawItem,
        'index': i,
        'no': i + 1,
      };
      if (rawItem is Map) {
        // Also expose flat item keys only if not clobbering root `data`/`sources`.
        for (final entry in rawItem.entries) {
          final k = entry.key.toString();
          if (k != 'data' && k != 'sources' && k != 'item') {
            itemContext.putIfAbsent(k, () => entry.value);
          }
        }
      }

      final interpolated = PdfInterpolationUtils.interpolateJson(
        model.itemTemplate!,
        itemContext,
      );
      if (interpolated is Map) {
        cards.add(
          buildRawChild(
            Map<String, dynamic>.from(interpolated),
            defaultUnit,
            imageCache,
            contextData: itemContext,
          ),
        );
      }
    }

    return layoutCardRows(
      cards,
      columns: model.columns,
      rowGapPt: model.rowGapPt,
      columnGapPt: model.columnGapPt,
      keepTogether: model.keepTogether,
    );
  }

  /// Single-widget wrapper for nested or Canvas usage.
  static pw.Widget build(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache,
    PdfRawChildBuilder buildRawChild, {
    Map<String, dynamic> rootContext = const {},
  }) {
    final widgets = buildWidgets(
      comp,
      defaultUnit,
      imageCache,
      buildRawChild,
      rootContext: rootContext,
    );
    if (widgets.isEmpty) return pw.SizedBox();
    if (widgets.length == 1) return widgets.first;
    return pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: widgets,
    );
  }

  /// Shared grid row builder reused by both `grid` and `signature_block`.
  static List<pw.Widget> layoutCardRows(
    List<pw.Widget> cards, {
    required int columns,
    required double rowGapPt,
    required double columnGapPt,
    required bool keepTogether,
  }) {
    if (cards.isEmpty) return const [];
    final safeColumns = columns < 1 ? 1 : columns;
    final rows = <pw.Widget>[];

    for (var start = 0; start < cards.length; start += safeColumns) {
      final rowChildren = <pw.Widget>[];
      final columnWidths = <int, pw.TableColumnWidth>{};
      int tableColIndex = 0;

      for (var col = 0; col < safeColumns; col++) {
        if (col > 0 && columnGapPt > 0) {
          columnWidths[tableColIndex] = pw.FixedColumnWidth(columnGapPt);
          rowChildren.add(pw.SizedBox(width: columnGapPt));
          tableColIndex++;
        }
        columnWidths[tableColIndex] = const pw.FlexColumnWidth(1);
        final idx = start + col;
        if (idx < cards.length) {
          rowChildren.add(cards[idx]);
        } else {
          // Preserve equal column widths on incomplete final row.
          rowChildren.add(pw.SizedBox());
        }
        tableColIndex++;
      }

      final isLastRow = start + safeColumns >= cards.length;
      final rowWidget = pw.Padding(
        padding: pw.EdgeInsets.only(bottom: isLastRow ? 0 : rowGapPt),
        child: pw.Table(
          columnWidths: columnWidths,
          defaultVerticalAlignment: pw.TableCellVerticalAlignment.full,
          children: [
            pw.TableRow(children: rowChildren),
          ],
        ),
      );
      rows.add(rowWidget);
    }

    if (keepTogether) {
      return [
        pw.Column(
          mainAxisSize: pw.MainAxisSize.min,
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: rows,
        ),
      ];
    }

    return rows;
  }

  static List<pw.Widget> buildEmptyState(String? emptyText) {
    if (emptyText == null || emptyText.trim().isEmpty) return const [];
    return [
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.grey300, width: 0.5),
        ),
        child: pw.Text(
          emptyText,
          style: pw.TextStyle(
            fontSize: 9,
            fontStyle: pw.FontStyle.italic,
            color: PdfColors.grey700,
          ),
        ),
      ),
    ];
  }
}
