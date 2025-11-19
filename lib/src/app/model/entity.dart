import 'dart:convert';

import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_list_extensions.dart';
import 'package:flx_nocode_flutter/features/field/presentation/utils/entity_field_dummy_value.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/view.dart' as view;
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Represents a dynamically configured entity.
///
/// An `EntityCustom` object defines the structure, behavior, and layout
/// of a data model, typically loaded from a JSON configuration file. It includes
/// everything from data fields and backend endpoints to UI layouts for forms and lists.
class EntityCustom extends HiveObject {
  /// The unique identifier for the entity.
  final String id;

  /// The human-readable name of the entity, used for display purposes.
  final String label;

  /// A brief description of the entity's purpose.
  final String description;

  /// A list of [EntityField] objects that define the data schema of the entity.
  final List<EntityField> fields;

  /// A list of custom [view.DView] configurations for displaying entity data.
  final List<view.DView> views;

  /// A list of [Export] configurations for exporting entity data.
  final List<Export> exports;

  /// The [Backend] configuration, defining API endpoints for CRUD operations.
  final Backend backend;

  /// The layout definition for creating and editing forms.
  final List<LayoutForm> layoutForm;

  /// The layout definition for displaying a single entity instance in a list.
  final LayoutListTile? layoutListTile;

  /// A list of custom [ActionD] definitions that can be performed on the entity.
  final List<ActionD> actions;

  /// A map defining the layout of columns in a data table view.
  /// The key is the field reference, and the value is typically a flex factor.
  Map<String, int> layoutTable;

  /// Creates a new instance of [EntityCustom].
  EntityCustom({
    required this.actions,
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

  /// Creates an [EntityCustom] instance from a JSON map.
  ///
  /// This factory parses a [Map<String, dynamic>] (typically from a JSON file)
  /// and constructs an [EntityCustom] object, validating required keys and
  /// handling nested object parsing.
  factory EntityCustom.fromJson(Map<String, dynamic> json) {
    print("==================================== Parse Entity");
    print('[EntityCustom] - ID: ${json['id']}');

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
            print('[EntityCustom] layout_form - parsing data');
            final result = LayoutForm.fromMap(raw);
            print('[EntityCustom] layout_form - parsed data');
            return result;
          },
        );
      } catch (e, st) {
        print('[EntityCustom] 🔴 layout_form - error :$e,\n$st');
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

      final actions = parseListOptional<ActionD>(
        'actions',
        (raw, i) {
          if (raw is! Map<String, dynamic>) {
            throw FormatException(
                "expected Map for 'actions'[$i], got ${raw.runtimeType}");
          }
          return ActionD.fromJson(raw);
        },
      );

      return EntityCustom(
        id: id,
        actions: actions,
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

  /// Creates an empty, uninitialized [EntityCustom] instance.
  EntityCustom.empty()
      : id = '',
        label = '',
        description = '',
        fields = [],
        views = [],
        backend = Backend(others: []),
        layoutForm = [],
        layoutListTile = null,
        actions = [],
        layoutTable = {},
        exports = [];

  /// Creates a copy of this [EntityCustom] instance with the given fields replaced.
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
    List<ActionD>? actions,
  }) {
    return EntityCustom(
      id: id ?? this.id,
      actions: actions ?? this.actions,
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

  /// Generates a map of dummy data based on the entity's fields.
  ///
  /// This is useful for testing or populating forms with placeholder values.
  Map<String, dynamic> dummy() {
    final data = <String, dynamic>{};
    for (var field in fields) {
      data[field.reference] = field.dummyValue();
    }
    return data;
  }

  /// Loads and parses an entity definition from a JSON asset file.
  ///
  /// The [id] corresponds to the filename (e.g., 'my_entity.json').
  /// Returns `null` if the asset cannot be found or parsed.
  static Future<EntityCustom?> getEntity(String id) async {
    try {
      print('[EntityCustom] getEntity "$id"');
      final path = 'asset/configuration/entity/$id.json';
      final data = await rootBundle.loadString(path);
      return EntityCustom.fromJson(json.decode(data));
    } on Exception {
      rethrow;
    } catch (e, stackTrace) {
      print('[EntityCustom] error :$e,\n$stackTrace');
      return null;
    }
  }

  /// Retrieves a specific [EntityField] by its [reference] name.
  ///
  /// Returns `null` if no field with the given reference is found.
  EntityField? getField(String reference) {
    final field = fields.where((e) => e.reference == reference);
    if (field.isEmpty) return null;
    return field.first;
  }

  /// Reorders the [layoutTable] map based on old and new indices.
  void layoutTableReorder(oldIndex, newIndex) {
    layoutTable = reorderMap(layoutTable, oldIndex, newIndex);
  }

  /// Serializes this [EntityCustom] instance to a JSON map.
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

  /// Converts this [EntityCustom] to a generic [core.Entity] for core UI components.
  core.Entity get coreEntity => core.Entity(
        titleX: label,
        iconPath: 'bill',
        subtitleX: description,
      );

  /// Whether the entity configuration allows creating new instances.
  bool get allowCreate => backend.create != null;

  /// Whether the entity configuration allows updating existing instances.
  bool get allowUpdate => backend.update != null;

  /// Whether the entity configuration allows deleting existing instances.
  bool get allowDelete => backend.deleteX != null;

  /// Whether the entity is a protected system entity that cannot be modified.
  bool get isProtected => ['flx_roles', 'flx_users'].contains(id);

  /// Builds a list of [ActionButtonItem] widgets for the entity's custom views.
  List<ActionButtonItem> buttonViews(
    BuildContext context,
    Map<String, dynamic> data,
    EntityCustom entity,
    bool embedded,
    List<Map<String, dynamic>> parentData,
  ) {
    return views
        .map(
          (e) => e.button(
            context,
            data,
            parentData,
            entity,
            embedded,
          ),
        )
        .toList();
  }

  /// Builds a list of large [Widget] buttons for the entity's custom views.
  List<Widget> buttonViewsLarge(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    return views.map((e) => e.buttonLarge(context, data, parentData)).toList();
  }
}

/// An extension on a list of [EntityCustom] objects to provide helper methods.
extension EntitiesExtenstion on List<EntityCustom> {
  /// Finds an [EntityCustom] in the list by its [id].
  ///
  /// Returns `null` if no matching entity is found.
  EntityCustom? findById(String id) {
    for (var entity in this) {
      if (entity.id == id) return entity;
    }
    return null;
  }

  /// Finds the index of a field within a specific entity in the list.
  ///
  /// Returns -1 if the entity or field is not found.
  int findIndexField(String entityId, String reference) {
    final entity = findById(entityId);
    if (entity != null) {
      return entity.fields.findIndex(reference);
    }
    return -1;
  }
}

/// A utility function to reorder a map's entries.
///
/// Creates a new map with the entry at [oldIndex] moved to [newIndex].
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
