import '../utils/pdf_unit_utils.dart';

/// Parsed configuration for the generic `type: "grid"` component.
class PdfGridModel {
  final List<dynamic> data;
  final int columns;
  final double rowGapPt;
  final double columnGapPt;
  final bool keepTogether;
  final String? emptyText;
  final Map<String, dynamic>? itemTemplate;

  const PdfGridModel({
    this.data = const [],
    this.columns = 3,
    this.rowGapPt = 4.0,
    this.columnGapPt = 4.0,
    this.keepTogether = false,
    this.emptyText,
    this.itemTemplate,
  });

  factory PdfGridModel.fromJson(
    Map<String, dynamic> json,
    String defaultUnit,
  ) {
    final rawCols = json['columns'];
    int columns = 3;
    if (rawCols is int && rawCols > 0) {
      columns = rawCols;
    } else if (rawCols is num && rawCols > 0) {
      columns = rawCols.toInt();
    } else if (rawCols is String) {
      final parsed = int.tryParse(rawCols);
      if (parsed != null && parsed > 0) columns = parsed;
    }

    final baseGap = json['gap'] != null
        ? PdfUnitUtils.convertToPt(json['gap'], defaultUnit)
        : PdfUnitUtils.convertToPt(4, defaultUnit);
    final rowGapPt = json['row_gap'] != null
        ? PdfUnitUtils.convertToPt(json['row_gap'], defaultUnit)
        : baseGap;
    final columnGapPt = json['column_gap'] != null
        ? PdfUnitUtils.convertToPt(json['column_gap'], defaultUnit)
        : baseGap;

    final rawTemplate = json['item_template'];
    final itemTemplate =
        rawTemplate is Map ? Map<String, dynamic>.from(rawTemplate) : null;

    return PdfGridModel(
      data: json['data'] is List ? List<dynamic>.from(json['data'] as List) : const [],
      columns: columns,
      rowGapPt: rowGapPt,
      columnGapPt: columnGapPt,
      keepTogether: json['keep_together'] == true,
      emptyText: json['empty_text']?.toString(),
      itemTemplate: itemTemplate,
    );
  }
}
