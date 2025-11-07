import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_template.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_button.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:hive_ce/hive.dart';

class Export extends HiveObject {
  final String uuid;
  final String name;
  final String backend;
  final String type; // pdf, xlsx, etc.
  final String? typeMode; // single | all
  final List<String> fields;
  final ExportTemplate? template;
  static List<String> allowedTypes = ['pdf', 'xlsx'];

  Export({
    required this.uuid,
    required this.name,
    required this.backend,
    required this.type,
    this.typeMode,
    this.fields = const [],
    this.template,
  });

  factory Export.fromJson(Map<String, dynamic> json) {
    final type = json['type'] ?? 'pdf';
    if (!allowedTypes.contains(type)) {
      throw Exception('Invalid export type: $type');
    }

    return Export(
      uuid: json['uuid'] ?? '',
      name: json['name'] ?? '',
      backend: json['backend'] ?? '',
      type: type,
      typeMode: json['type_mode'],
      fields: (json['fields'] != null) ? List<String>.from(json['fields']) : [],
      template: json['template'] != null
          ? ExportTemplate.fromJson(json['template'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'backend': backend,
        'type': type,
        'fields': fields,
        if (typeMode != null) 'type_mode': typeMode,
        if (template != null) 'template': template!.toJson(),
      };

  bool get isPdf => type == 'pdf';
  bool get isXlsx => type == 'xlsx';
  bool get isSingle => typeMode == 'single';
  bool get isAll => typeMode == 'all';

  Widget buildButton({required List<Filter> filters}) {
    return ButtonExport.prepare(export: this, filters: filters);
  }
}

extension ExportList on List<Export> {
  List<Widget> buildSingleButtons(Map<String, dynamic> data) {
    // final buttons = <Widget>[];
    // for (final e in this) {
    //   if (!e.isSingle || e.template == null) continue;
    //   final button = LightButton(
    //     action: DataAction.exportPdf,
    //     title: e.name,
    //     onPressed: () async {
    //       await exportToPdf(
    //         e,
    //         data: data,
    //         headerProvider: () async => {
    //           'Authorization': 'Bearer ${UserRepositoryApp.instance.token}',
    //         },
    //       );
    //     },
    //     permission: null,
    //   );
    //   buttons.add(button);
    // }
    // return buttons;

    return [];
  }
}
