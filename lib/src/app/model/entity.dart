import 'dart:convert';

import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flx_nocode_flutter/src/app/model/export.dart';
import 'package:flx_nocode_flutter/src/app/model/layout_list_tile.dart';
import 'package:flx_nocode_flutter/src/app/model/view.dart' as view;
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntityCustom {
  final String id;
  final String label;
  final String description;
  final List<EntityField> fields;
  final List<view.View> views;
  final List<Export> exports;
  final Backend backend;
  final Map<String, dynamic> layoutForm;
  final LayoutListTile? layoutListTile;
  final Map<String, double>? layoutTable;

  EntityCustom({
    required this.id,
    required this.label,
    required this.description,
    required this.fields,
    required this.views,
    required this.backend,
    required this.layoutForm,
    required this.layoutListTile,
    required this.layoutTable,
    required this.exports,
  });

  static Future<EntityCustom?> getEntity(String id) async {
    try {
      print('[EntityCustom] getEntity $id');
      final path = 'asset/configuration/entity/$id.json';
      final data = await rootBundle.loadString(path);
      return EntityCustom.fromJson(json.decode(data));
    } catch (e) {
      return null;
    }
  }

  EntityField? getField(String reference) {
    final field = fields.where((e) => e.reference == reference);
    if (field.isEmpty) return null;
    return field.first;
  }

  factory EntityCustom.fromJson(Map<String, dynamic> json) {
    try {
      return EntityCustom(
        id: json['id'],
        label: json['label'],
        description: json['description'],
        fields: (json['fields'] as List<dynamic>)
            .map((e) => EntityField.fromJson(e))
            .toList(),
        views: json.containsKey('views')
            ? (json['views'] as List<dynamic>)
                .map((e) => view.View.fromJson(e))
                .toList()
            : [],
        layoutForm: json.containsKey('layout_form') ? json['layout_form'] : {},
        backend: Backend.fromJson(json['backend']),
        exports: json.containsKey('exports')
            ? (json['exports'] as List<dynamic>)
                .map((e) => Export.fromJson(e))
                .toList()
            : [],
        layoutListTile: json.containsKey('layout_list_tile')
            ? LayoutListTile.fromJson(json['layout_list_tile'])
            : null,
        layoutTable: json.containsKey('layout_table')
            ? (json['layout_table'] as Map<String, dynamic>)
                .map((key, value) => MapEntry(key, value.toDouble()))
            : null,
      );
    } catch (e) {
      print('[EntityCustom] fromJson: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'fields': fields.map((e) => e.toJson()).toList(),
      'backend': backend.toJson(),
      'description': description,
    };
  }

  core.Entity get coreEntity => core.Entity(
        titleX: label,
        iconPath: 'bill',
        subtitleX: description,
      );

  bool get allowCreate => backend.create != null;
  bool get allowUpdate => backend.update != null;
  bool get allowDelete => backend.delete != null;

  List<ActionButtonItem> buttonViews(
    BuildContext context,
    Map<String, dynamic> data,
    EntityCustom entity,
    bool embedded,
  ) {
    return views
        .map(
          (e) => e.button(
            context,
            data,
            entity,
            embedded,
          ),
        )
        .toList();
  }

  List<Widget> buttonViewsLarge(
      BuildContext context, Map<String, dynamic> data) {
    return views.map((e) => e.buttonLarge(context, data)).toList();
  }
}
