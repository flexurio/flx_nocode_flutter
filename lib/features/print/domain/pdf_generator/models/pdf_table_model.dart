import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../utils/pdf_unit_utils.dart';
import 'pdf_component_model.dart';

class PdfTableColumnModel {
  final PdfComponentModel content;
  final double? flex;
  final String? align;
  final List<PdfComponentModel>? templates;
  final PdfComponentModel? template;

  PdfTableColumnModel({
    required this.content,
    this.flex,
    this.align,
    this.templates,
    this.template,
  });

  factory PdfTableColumnModel.fromJson(Map<String, dynamic> json) {
    final contentJson = json['content'] ?? json['value'];
    
    final templatesList = json['templates'] as List<dynamic>?;
    final templateMap = json['template'];

    return PdfTableColumnModel(
      content: PdfComponentModel.fromJson(contentJson),
      flex: json['flex'] is num
          ? (json['flex'] as num).toDouble()
          : (json['flex'] is String ? double.tryParse(json['flex']) : null),
      align: json['align']?.toString(),
      templates: templatesList?.map((t) => PdfComponentModel.fromJson(t)).toList(),
      template: templateMap != null ? PdfComponentModel.fromJson(templateMap) : null,
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
      data: json['data'] is List ? json['data'] as List : [],
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
