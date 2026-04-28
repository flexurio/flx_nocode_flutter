import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

class LayoutPrint {
  final String id;
  final String name;
  final String layoutType;
  final String unit;
  final dynamic pageSize;
  final String orientation;
  final List<dynamic> header;
  final List<dynamic> footer;
  final Map<String, dynamic> margins;
  final Map<String, dynamic> dataSources;
  final Map<String, dynamic> styles;
  final List<dynamic> pages;
  final Map<String, dynamic> bands;

  LayoutPrint({
    required this.id,
    required this.name,
    required this.layoutType,
    this.unit = 'pt',
    this.pageSize = 'A4',
    this.orientation = 'portrait',
    this.header = const [],
    this.footer = const [],
    this.margins = const {},
    this.dataSources = const {},
    this.styles = const {},
    this.pages = const [],
    this.bands = const {},
  });

  factory LayoutPrint.fromMap(Map<String, dynamic> map) {
    return LayoutPrint(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      layoutType: map['layout_type'] ?? 'canvas',
      unit: map['unit'] ?? 'pt',
      pageSize: map['page_size'] ?? 'A4',
      orientation: map['orientation'] ?? 'portrait',
      header: map['header'] ?? [],
      footer: map['footer'] ?? [],
      margins: map['margins'] ?? {},
      dataSources: map['data_sources'] ?? {},
      styles: map['styles'] ?? {},
      pages: map['pages'] ?? [],
      bands: map['bands'] ?? {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'layout_type': layoutType,
      'unit': unit,
      'page_size': pageSize,
      'orientation': orientation,
      'header': header,
      'footer': footer,
      'margins': margins,
      'data_sources': dataSources,
      'styles': styles,
      'pages': pages,
      'bands': bands,
    };
  }
}

extension LayoutPrintListExtension on List<LayoutPrint> {
  LayoutPrint? findById(String id) {
    try {
      return firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }
}
