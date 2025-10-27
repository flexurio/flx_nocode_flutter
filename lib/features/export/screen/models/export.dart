import 'package:flx_nocode_flutter/features/export/screen/widgets/export_button.dart';
import 'package:hive_ce/hive.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flutter/material.dart';

class Export extends HiveObject {
  final String name;
  final String backend;
  final String type;
  final List<String> fields;

  Export({
    required this.name,
    required this.backend,
    required this.type,
    required this.fields,
  });

  static List<String> allowedTypes = ['pdf', 'xlsx'];

  factory Export.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (!allowedTypes.contains(type))
      throw Exception('Invalid export type: $type');
    return Export(
      name: json['name'],
      backend: json['backend'],
      type: type,
      fields: json['fields'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'backend': backend,
        'type': type,
        'fields': fields,
      };

  bool get isPdf => type == 'pdf';
  bool get isXlsx => type == 'xlsx';

  Widget buildButton({
    required List<Filter> filters,
  }) {
    return ButtonExport.prepare(export: this, filters: filters);
  }
}
