import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_template.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_button.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:hive_ce/hive.dart';

/// Models the configuration for a data export operation.
///
/// This class holds all necessary information for an export, such as the
/// format, data source, fields, and layout template.
class Export extends HiveObject {
  /// A unique identifier for the export configuration.
  final String uuid;

  /// The display name for the export (e.g., "Export User Report").
  final String name;

  /// The API endpoint or backend service URL to fetch data from.
  final String backend;

  /// The file format for the export (e.g., 'pdf', 'xlsx').
  final String type;

  /// Defines the export scope: 'single' for one record, 'all' for a collection.
  final String? typeMode;

  /// A list of field names to be included in the export.
  final List<String> fields;

  /// An optional template that defines the structure and layout of the exported file.
  final ExportTemplate? template;

  /// The paper size for PDF exports (e.g., 'A4', 'Letter'). Defaults to 'A4'.
  final String paperSize;

  /// The page orientation for PDF exports ('portrait' or 'landscape'). Defaults to 'portrait'.
  final String orientation;

  /// Control whether this export should be shown in the UI.
  final bool visibility;

  /// A static list of supported export file types.
  static List<String> allowedTypes = ['pdf', 'xlsx'];

  Export({
    required this.uuid,
    required this.name,
    required this.backend,
    required this.type,
    this.typeMode,
    this.fields = const [],
    this.template,
    this.paperSize = 'A4',
    this.orientation = 'portrait',
    this.visibility = true,
  })  : assert(uuid.isNotEmpty, 'uuid cannot be empty'),
        assert(name.isNotEmpty, 'name cannot be empty'),
        assert(
            allowedTypes.contains(type), 'type must be one of $allowedTypes'),
        assert(typeMode == null || typeMode == 'single' || typeMode == 'all',
            'typeMode must be null, "single", or "all"'),
        assert(paperSize.isNotEmpty, 'paperSize cannot be empty'),
        assert(orientation == 'portrait' || orientation == 'landscape',
            'orientation must be "portrait" or "landscape"');

  /// Creates an [Export] instance from a JSON object.
  ///
  /// Throws an exception if the 'type' is not one of the [allowedTypes].
  factory Export.fromJson(Map<String, dynamic> json) {
    final type = json['type'] ?? 'pdf';
    if (!allowedTypes.contains(type)) {
      throw Exception('Invalid export type: $type');
    }

    return Export(
      uuid: json['uuid'] ?? json['name'] ?? '',
      name: json['name'] ?? '',
      backend: json['backend'] ?? '',
      type: type,
      typeMode: json['type_mode'],
      fields: (json['fields'] != null) ? List<String>.from(json['fields']) : [],
      template: json['template'] != null
          ? ExportTemplate.fromJson(json['template'])
          : null,
      paperSize: json['paper_size'] ?? 'A4',
      orientation: json['orientation'] ?? 'portrait',
      visibility: json['visibility'] ?? true,
    );
  }

  /// Converts the [Export] instance into a JSON object for serialization.
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'backend': backend,
        'type': type,
        'fields': fields,
        'paper_size': paperSize,
        'orientation': orientation,
        'visibility': visibility,
        if (typeMode != null) 'type_mode': typeMode,
        if (template != null) 'template': template!.toJson(),
      };

  /// Returns `true` if the export type is 'pdf'.
  bool get isPdf => type == 'pdf';

  /// Returns `true` if the export type is 'xlsx'.
  bool get isXlsx => type == 'xlsx';

  /// Returns `true` if the `typeMode` is 'single'.
  bool get isSingle => typeMode == 'single';

  /// Returns `true` if the `typeMode` is 'all'.
  bool get isAll => typeMode == 'all';

  /// Constructs a [ButtonExport] widget configured for this export.
  Widget buildButton({required List<Filter> filters}) {
    return ButtonExport.prepare(export: this, filters: filters);
  }
}

/// Provides convenience methods for a list of [Export] objects.
extension ExportList on List<Export> {
  /// Generates a list of [LightButton] widgets for 'single' type exports.
  ///
  /// Filters the list to find exports that are of `typeMode` 'single' and
  /// have a valid template, then creates a button for each to trigger the
  /// PDF export action for the given [data] record.
  List<Widget> buildSingleButtons(Map<String, dynamic> data,
      {bool expanded = false}) {
    final buttons = <Widget>[];
    for (final e in this) {
      if (!e.visibility || !e.isSingle || e.template == null) continue;
      final button = LightButton(
        action: DataAction.exportPdf,
        title: e.name,
        onPressed: () async {
          await exportToPdf(
            e,
            data: data,
            headerProvider: () async => {
              'Authorization': 'Bearer ${UserRepositoryApp.instance.token}',
            },
          );
        },
        permission: null,
        expanded: expanded,
      );
      buttons.add(button);
    }
    return buttons;
  }
}
