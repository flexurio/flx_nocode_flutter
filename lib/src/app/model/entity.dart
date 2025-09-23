import 'dart:convert';

import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
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
  final List<Export> exports; //
  final Backend backend; //
  final List<LayoutForm> layoutForm;
  final LayoutListTile? layoutListTile;
  Map<String, int> layoutTable;

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

  factory EntityCustom.fromJson(Map<String, dynamic> json) {
    T requireKey<T>(String key) {
      if (!json.containsKey(key) || json[key] == null) {
        throw FormatException("Missing key: '$key' (expected $T).");
      }
      final v = json[key];
      if (v is! T) {
        throw FormatException(
          "Invalid type for '$key': expected $T, got ${v.runtimeType}. Value: $v",
        );
      }
      return v;
    }

    List<T> parseListRequired<T>(
      String key,
      T Function(dynamic raw, int index) mapItem,
    ) {
      final raw = requireKey<List<dynamic>>(key);
      final out = <T>[];
      for (var i = 0; i < raw.length; i++) {
        try {
          out.add(mapItem(raw[i], i));
        } catch (e) {
          throw FormatException("Error on '$key'[$i]: $e");
        }
      }
      return out;
    }

    List<T> parseListOptional<T>(
      String key,
      T Function(dynamic raw, int index) mapItem,
    ) {
      if (!json.containsKey(key) || json[key] == null) return <T>[];
      final raw = json[key];
      if (raw is! List) {
        throw FormatException(
          "Invalid type for '$key': expected List, got ${raw.runtimeType}.",
        );
      }
      final out = <T>[];
      for (var i = 0; i < raw.length; i++) {
        try {
          out.add(mapItem(raw[i], i));
        } catch (e) {
          throw FormatException("Error on '$key'[$i]: $e");
        }
      }
      return out;
    }

    Map<String, int> parseLayoutTable(String key) {
      if (!json.containsKey(key) || json[key] == null) return <String, int>{};
      final raw = json[key];
      if (raw is! Map) {
        throw FormatException(
          "Invalid type for '$key': expected Map, got ${raw.runtimeType}.",
        );
      }
      final result = <String, int>{};
      for (final entry in raw.entries) {
        final k = entry.key;
        final v = entry.value;
        if (k is! String) {
          throw FormatException(
              "Invalid key type in '$key': expected String, got ${k.runtimeType} (key=$k)");
        }
        if (v is int) {
          result[k] = v;
        } else if (v is num) {
          result[k] = v.toInt();
        } else {
          throw FormatException(
              "Invalid value type for '$key[$k]': expected int/num, got ${v.runtimeType}. Value: $v");
        }
      }
      return result;
    }

    String parseId() {
      final v = json['id'];
      if (v == null) {
        throw FormatException("Missing key: 'id'.");
      }
      if (v is! String) {
        throw FormatException(
            "Invalid type for 'id': expected String, got ${v.runtimeType}. Value: $v");
      }
      return v;
    }

    final id = parseId();
    try {
      final label = requireKey<String>('label');
      final description = requireKey<String>('description');

      final fields = parseListRequired<EntityField>(
        'fields',
        (raw, i) {
          if (raw is! Map<String, dynamic>) {
            throw FormatException(
                "expected Map for 'fields'[$i], got ${raw.runtimeType}");
          }
          return EntityField.fromJson(raw);
        },
      );

      final views = parseListOptional<view.DView>(
        'views',
        (raw, i) {
          if (raw is! Map<String, dynamic>) {
            throw FormatException(
                "expected Map for 'views'[$i], got ${raw.runtimeType}");
          }
          return view.DView.fromJson(raw);
        },
      );

      List<LayoutForm> layoutForm;
      try {
        layoutForm = parseListOptional<LayoutForm>(
          'layout_form',
          (raw, i) {
            if (raw is! Map<String, dynamic>) {
              throw FormatException(
                  "expected Map for 'layout_form'[$i], got ${raw.runtimeType}");
            }
            return LayoutForm.fromMap(raw);
          },
        );
      } catch (_) {
        layoutForm = <LayoutForm>[];
      }

      final backendRaw = requireKey<Map<String, dynamic>>('backend');
      final backend = Backend.fromJson(backendRaw);

      final exports = parseListOptional<Export>(
        'exports',
        (raw, i) {
          if (raw is! Map<String, dynamic>) {
            throw FormatException(
                "expected Map for 'exports'[$i], got ${raw.runtimeType}");
          }
          return Export.fromJson(raw);
        },
      );

      LayoutListTile? layoutListTile;
      if (json.containsKey('layout_list_tile') &&
          json['layout_list_tile'] != null) {
        final ltRaw = json['layout_list_tile'];
        if (ltRaw is! Map<String, dynamic>) {
          throw FormatException(
              "Invalid type for 'layout_list_tile': expected Map, got ${ltRaw.runtimeType}.");
        }
        layoutListTile = LayoutListTile.fromJson(ltRaw);
      }

      final layoutTable = parseLayoutTable('layout_table');

      return EntityCustom(
        id: id,
        label: label,
        description: description,
        fields: fields,
        views: views,
        exports: exports,
        backend: backend,
        layoutForm: layoutForm,
        layoutListTile: layoutListTile,
        layoutTable: layoutTable,
      );
    } catch (e) {
      print("[EntityCustom] Entity: $id fromJson error: $e");
      rethrow;
    }
  }

  EntityCustom.empty()
      : id = '',
        label = '',
        description = '',
        fields = [],
        views = [],
        backend = Backend(others: []),
        layoutForm = [],
        layoutListTile = null,
        layoutTable = {},
        exports = [];

  EntityCustom copyWith({
    String? id,
    String? label,
    String? description,
    List<EntityField>? fields,
    List<view.DView>? views,
    Backend? backend,
    List<LayoutForm>? layoutForm,
    LayoutListTile? layoutListTile,
    Map<String, int>? layoutTable,
    List<Export>? exports,
  }) {
    return EntityCustom(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      fields: fields ?? this.fields,
      backend: backend ?? this.backend,
      views: views ?? this.views,
      layoutForm: layoutForm ?? this.layoutForm,
      layoutListTile: layoutListTile ?? this.layoutListTile,
      layoutTable: layoutTable ?? this.layoutTable,
      exports: exports ?? this.exports,
    );
  }

  Map<String, dynamic> dummy() {
    final data = <String, dynamic>{};
    for (var field in fields) {
      data[field.reference] = field.dummyValue();
    }
    return data;
  }

  static Future<EntityCustom?> getEntity(String id) async {
    try {
      print('[EntityCustom] getEntity $id');
      final path = 'asset/configuration/entity/$id.json';
      final data = await rootBundle.loadString(path);
      return EntityCustom.fromJson(json.decode(data));
    } on Exception {
      rethrow;
    } catch (e) {
      print('[EntityCustom] error $e');
      return null;
    }
  }

  EntityField? getField(String reference) {
    final field = fields.where((e) => e.reference == reference);
    if (field.isEmpty) return null;
    return field.first;
  }

  void layoutTableReorder(oldIndex, newIndex) {
    layoutTable = reorderMap(layoutTable, oldIndex, newIndex);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'description': description,
      'fields': fields.map((e) => e.toJson()).toList(),
      'views': views.map((e) => e.toJson()).toList(),
      'exports': exports.map((e) => e.toJson()).toList(),
      'backend': backend.toJson(),
      'layout_form': layoutForm.map((e) => e.toMap()).toList(),
      'layout_list_tile': layoutListTile?.toJson(),
      'layout_table': layoutTable,
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

  List<Widget> buttonViewsLarge(
      BuildContext context, Map<String, dynamic> data) {
    return views.map((e) => e.buttonLarge(context, data)).toList();
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

Map<K, V> reorderMap<K, V>(
  Map<K, V> map,
  int oldIndex,
  int newIndex,
) {
  final entries = map.entries.toList();
  final entry = entries.removeAt(oldIndex);
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  entries.insert(newIndex, entry);
  return Map<K, V>.fromEntries(entries);
}

Never _missing(String key) => throw FormatException('Missing key: "$key"');

Never _invalid(String key, String expected, Object? got) =>
    throw FormatException(
        'Invalid "$key": expected $expected, got ${got.runtimeType} -> $got');

T _require<T>(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key)) _missing(key);
  final v = json[key];
  if (v is! T) _invalid(key, T.toString(), v);
  return v;
}

T? _optional<T>(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key)) return null;
  final v = json[key];
  if (v == null) return null;
  if (v is! T) _invalid(key, T.toString(), v);
  return v;
}

List<R> _listOf<R>(
  Map<String, dynamic> json,
  String key,
  R Function(Object raw, int index) parse, {
  bool optional = false,
}) {
  final raw = optional ? _optional<List>(json, key) : _require<List>(json, key);
  if (raw == null) return <R>[];
  final out = <R>[];
  for (var i = 0; i < raw.length; i++) {
    final item = raw[i];
    try {
      out.add(parse(item, i));
    } catch (e) {
      throw FormatException('Error at "$key"[$i]: $e');
    }
  }
  return out;
}
