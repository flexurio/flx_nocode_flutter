import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flx_nocode_flutter/src/app/model/export.dart';
import 'package:flx_nocode_flutter/src/app/model/layout_list_tile.dart';
import 'package:flx_nocode_flutter/src/app/model/view.dart' as view;
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntityCustom extends HiveObject {
  final String id;
  final String label;
  final String description;
  final List<EntityField> fields;
  final List<view.DView> views;
  final List<Export> exports;
  final Backend backend;
  final Map<String, dynamic> layout;
  final LayoutListTile? layoutListTile;
  var _position = CanvasPosition.zero();

  EntityCustom({
    required this.id,
    required this.label,
    required this.description,
    required this.fields,
    required this.views,
    required this.backend,
    required this.layout,
    required this.layoutListTile,
    required this.exports,
    CanvasPosition? position,
  }) : _position = position ?? CanvasPosition.zero();

  Map<String, dynamic> dummy() {
    final data = <String, dynamic>{};
    for (var field in fields) {
      data[field.reference] = field.dummyValue();
    }
    return data;
  }

  static Future<EntityCustom?> getEntity(String id) async {
    try {
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

  CanvasPosition get position => _position;

  void setPosition(double x, double y) {
    _position = CanvasPosition(x: x, y: y);
  }

  factory EntityCustom.fromJson(Map<String, dynamic> json) {
    return EntityCustom(
      id: json['id'],
      label: json['label'],
      description: json['description'],
      fields: (json['fields'] as List<dynamic>)
          .map((e) => EntityField.fromJson(e))
          .toList(),
      views: json.containsKey('views')
          ? (json['views'] as List<dynamic>)
              .map((e) => view.DView.fromJson(e))
              .toList()
          : [],
      layout: json.containsKey('layout') ? json['layout'] : {},
      backend: Backend.fromJson(json['backend']),
      exports: json.containsKey('exports')
          ? (json['exports'] as List<dynamic>)
              .map((e) => Export.fromJson(e))
              .toList()
          : [],
      layoutListTile: json.containsKey('layout_list_tile')
          ? LayoutListTile.fromJson(json['layout_list_tile'])
          : null,
    );
  }

  EntityCustom copyWith({
    String? label,
    String? description,
    List<EntityField>? fields,
    CanvasPosition? position,
    String? id,
  }) {
    return EntityCustom(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      fields: fields ?? this.fields,
      position: position ?? _position,
      // --
      views: [],
      backend: Backend(others: []),
      layout: {},
      layoutListTile: null,
      exports: [],
    );
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
  bool get allowDelete => backend.deleteX != null;

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
}

extension EntitiesExtenstion on List<EntityCustom> {
  EntityCustom? findById(String id) {
    for (var entity in this) {
      if (entity.id == id) return entity;
    }
    return null;
  }

  int findIndexField(String entityId, String reference) {
    final entity = findById(entityId);
    if (entity != null) {
      return entity.fields.findIndex(reference);
    }
    return -1;
  }
}

class CanvasPosition extends HiveObject {
  final double x;
  final double y;

  CanvasPosition({required this.x, required this.y});

  Offset toOffset() => Offset(x, y);

  factory CanvasPosition.zero() => CanvasPosition(x: 0, y: 0);

  Map<String, dynamic> toJson() => {'x': x, 'y': y};
}
