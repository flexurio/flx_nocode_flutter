import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../utils/pdf_unit_utils.dart';

class PdfTableColumnModel {
  final dynamic content;
  final double? flex;
  final String? align;
  final List<dynamic>? templates;
  final Map<String, dynamic>? template;

  PdfTableColumnModel({
    this.content,
    this.flex,
    this.align,
    this.templates,
    this.template,
  });

  factory PdfTableColumnModel.fromJson(Map<String, dynamic> json) {
    return PdfTableColumnModel(
      content: json['content'] ?? json['value'], // Fallback for transition
      flex: json['flex'] is num
          ? (json['flex'] as num).toDouble()
          : (json['flex'] is String ? double.tryParse(json['flex']) : null),
      align: json['align']?.toString(),
      templates: json['templates'] as List<dynamic>?,
      template: json['template'] as Map<String, dynamic>?,
    );
  }
}

class PdfTableModel {
  final List<dynamic> header;
  final List<dynamic> body;
  final List<dynamic> footer;
  final List<dynamic> data;
  final pw.EdgeInsetsGeometry? cellPadding;
  final PdfColor? headerBgColor;
  final PdfColor? headerTextColor;

  PdfTableModel({
    this.header = const [],
    this.body = const [],
    this.footer = const [],
    this.data = const [],
    this.cellPadding,
    this.headerBgColor,
    this.headerTextColor,
  });

  factory PdfTableModel.fromJson(Map<String, dynamic> json, String defaultUnit) {
    dynamic parseSection(dynamic section) {
      if (section is! List) return [];
      
      // Check if it's a list of rows (List<List>)
      if (section.isNotEmpty && section.first is List) {
        return section.map((row) {
          if (row is! List) return <PdfTableColumnModel>[];
          return row.map((item) => PdfTableColumnModel.fromJson(Map<String, dynamic>.from(item))).toList();
        }).toList();
      }
      
      // It's a single row/template
      return section.map((item) => PdfTableColumnModel.fromJson(Map<String, dynamic>.from(item))).toList();
    }

    return PdfTableModel(
      header: parseSection(json['header']),
      body: parseSection(json['body']),
      footer: parseSection(json['footer']),
      data: json['data'] as List<dynamic>? ?? [],
      cellPadding: PdfUnitUtils.parseEdgeInsets(json['cell_padding'], defaultUnit),
      headerBgColor: json['header_background_color'] != null
          ? PdfColor.fromHex(json['header_background_color'].toString())
          : null,
      headerTextColor: json['header_text_color'] != null
          ? PdfColor.fromHex(json['header_text_color'].toString())
          : null,
    );
  }
}
