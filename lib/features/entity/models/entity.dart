import 'dart:convert';

import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/pagination_option.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_list_extensions.dart';
import 'package:flx_nocode_flutter/features/field/presentation/utils/entity_field_dummy_value.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/view/models/view.dart' as view;
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/util/resource_loader.dart';

/// Represents a dynamically configured entity.
///
/// An [EntityCustom] object defines the structure, behavior, and layout
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

  /// Options for pagination and default sorting.
  final PaginationOption paginationOption;

  /// The layout definition for displaying a single entity instance in a list.
  final LayoutListTile? layoutListTile;

  /// A list of custom [ActionD] definitions that can be performed on the entity.
  /// This typically includes list-level or row-level actions.
  final List<ActionD> actions;

  /// A list of custom [ActionD] definitions displayed on the home or dashboard view.
  final List<ActionD> actionsHome;

  /// The primary action for this entity, often used in floating action buttons or prominent UI locations.
  final ActionD? actionPrimary;

  /// Whether to bypass all permission checks for this entity.
  /// If true, the system will not check for specific user permissions before executing actions.
  final bool bypassAllPermissions;

  /// A map defining the layout of columns in a data table view.
  /// The key is the field reference, and the value is typically a flex factor or column width.
  Map<String, int> layoutTable;

  /// Creates a new instance of [EntityCustom].
  EntityCustom({
    required this.actions,
    this.actionsHome = const [],
    this.actionPrimary,
    required this.id,
    required this.label,
    required this.description,
    required this.fields,
    required this.views,
    required this.backend,
    required this.paginationOption,
    required this.layoutForm,
    required this.layoutListTile,
    required this.layoutTable,
    required this.exports,
    this.bypassAllPermissions = false,
  });

  /// The base path for entity assets (e.g., 'asset').
  static String assetBasePath = 'asset';

  /// The base directory path for entity files in the file system (e.g., '.').
  static String fileSystemBasePath = '.';

  /// Whether to prefer the file system over assets when loading entity configurations.
  static bool preferFileSystem = false;

  /// Creates an [EntityCustom] instance from a JSON map.
  ///
  /// This factory parses a [Map<String, dynamic>] (typically from a JSON file)
  /// and constructs an [EntityCustom] object, validating required keys and
  /// handling nested object parsing.
  factory EntityCustom.fromJson(Map<String, dynamic> json) {
    final parser = _EntityCustomJsonParser(json);
    final id = parser.parseId();

    try {
      return EntityCustom(
        id: id,
        label: parser.requireKey<String>('label'),
        description: parser.requireKey<String>('description'),
        fields: parser.parseListRequired<EntityField>(
          'fields',
          (raw, _) => EntityField.fromJson(raw),
        ),
        views: parser.parseListOptional<view.DView>(
          'views',
          (raw, _) => view.DView.fromJson(raw),
        ),
        layoutForm: parser.parseListOptional<LayoutForm>(
          'layout_form',
          (raw, _) => LayoutForm.fromMap(raw),
        ),
        backend: Backend.fromJson(
            parser.requireKey<Map<String, dynamic>>('backend')),
        exports: parser.parseListOptional<Export>(
          'exports',
          (raw, _) => Export.fromJson(raw),
        ),
        layoutListTile: parser.parseLayoutListTile(),
        layoutTable: parser.parseLayoutTable('layout_table'),
        actions: parser.parseListOptional<ActionD>(
          'actions',
          (raw, _) => ActionD.fromJson(raw),
        ),
        actionsHome: parser.parseListOptional<ActionD>(
          'actions_home',
          (raw, _) => ActionD.fromJson(raw),
        ),
        actionPrimary: parser.parseActionD('action_primary'),
        paginationOption: parser.parsePaginationOption(),
        bypassAllPermissions: parser.parseBypassAllPermissions(),
      );
    } catch (e) {
      debugPrint("[EntityCustom] Entity: $id fromJson error: $e");
      rethrow;
    }
  }

  /// Creates an empty, uninitialized [EntityCustom] instance.
  ///
  /// Useful as a default value or for UI states where no entity is selected.
  EntityCustom.empty()
      : id = '',
        label = '',
        description = '',
        fields = [],
        views = [],
        backend = Backend(others: []),
        paginationOption = const PaginationOption(),
        layoutForm = [],
        layoutListTile = null,
        actions = [],
        actionsHome = [],
        actionPrimary = null,
        layoutTable = {},
        exports = [],
        bypassAllPermissions = false;

  /// Creates a copy of this [EntityCustom] instance with the given fields replaced.
  ///
  /// [clearActionPrimary] if set to true will force [actionPrimary] to be null.
  /// [clearLayoutListTile] if set to true will force [layoutListTile] to be null.
  EntityCustom copyWith({
    String? id,
    String? label,
    String? description,
    List<EntityField>? fields,
    List<view.DView>? views,
    Backend? backend,
    PaginationOption? paginationOption,
    List<LayoutForm>? layoutForm,
    LayoutListTile? layoutListTile,
    Map<String, int>? layoutTable,
    List<Export>? exports,
    List<ActionD>? actions,
    List<ActionD>? actionsHome,
    ActionD? actionPrimary,
    bool? bypassAllPermissions,
    bool clearActionPrimary = false,
    bool clearLayoutListTile = false,
  }) {
    return EntityCustom(
      id: id ?? this.id,
      actions: actions ?? this.actions,
      actionsHome: actionsHome ?? this.actionsHome,
      actionPrimary:
          clearActionPrimary ? null : (actionPrimary ?? this.actionPrimary),
      label: label ?? this.label,
      description: description ?? this.description,
      fields: fields ?? this.fields,
      backend: backend ?? this.backend,
      paginationOption: paginationOption ?? this.paginationOption,
      views: views ?? this.views,
      layoutForm: layoutForm ?? this.layoutForm,
      layoutListTile:
          clearLayoutListTile ? null : (layoutListTile ?? this.layoutListTile),
      layoutTable: layoutTable ?? this.layoutTable,
      exports: exports ?? this.exports,
      bypassAllPermissions: bypassAllPermissions ?? this.bypassAllPermissions,
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

  /// Retrieves all available permissions for a given entity ID.
  ///
  /// [id] is the entity identifier.
  /// [useFileSystem] if true, attempts to load the entity from the local file system.
  /// [basePath] optionally overrides the default loading path.
  static Future<List<String>> getPermissions(
    String id, {
    bool useFileSystem = false,
    String? basePath,
  }) async {
    final entity = await getEntity(
      id,
      useFileSystem: useFileSystem,
      basePath: basePath,
    );
    return entity?.getAvailablePermissions() ?? [];
  }

  /// Loads and parses an entity definition from a JSON asset file.
  ///
  /// [id] corresponds to the filename (e.g., 'my_entity').
  /// [useFileSystem] if true, attempts to load the entity from the local file system.
  /// [basePath] optionally overrides the default loading path.
  /// Returns `null` if the asset cannot be found or parsed.
  static Future<EntityCustom?> getEntity(
    String id, {
    bool useFileSystem = false,
    String? basePath,
  }) async {
    try {
      print('[EntityCustom] getEntity "$id"');
      final data = await loadFromAssetOrFile(
        relativePath: 'configuration/entity/$id.json',
        assetBasePath: assetBasePath,
        fileSystemBasePath: fileSystemBasePath,
        preferFileSystem: preferFileSystem,
        useFileSystem: useFileSystem,
        overrideBasePath: basePath,
      );
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
  ///
  /// This is used for UI components that allow drag-and-drop reordering of table columns.
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
      'pagination_option': paginationOption.toJson(),
      'layout_form': layoutForm.map((e) => e.toMap()).toList(),
      'layout_list_tile': layoutListTile?.toJson(),
      'layout_table': layoutTable,
      'actions': actions.map((e) => e.toJson()).toList(),
      'actions_home': actionsHome.map((e) => e.toJson()).toList(),
      'action_primary': actionPrimary?.toJson(),
      'bypass_all_permissions': bypassAllPermissions,
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

  /// Retrieves all permission codes defined for the entity's actions.
  List<String> getAvailablePermissions() {
    final List<String> permissions = [];
    for (var action in actions) {
      permissions.add(action.getPermission(id));
    }
    for (var action in actionsHome) {
      permissions.add(action.getPermission(id));
    }
    return permissions.toSet().toList(); // Unique permissions
  }

  /// Builds a list of [ActionButtonItem] widgets for the entity's custom views.
  ///
  /// [context] is the build context.
  /// [data] is the entity instance data.
  /// [entity] is the current entity configuration.
  /// [embedded] indicates if the view is embedded within another component.
  /// [parentData] provides context from parent entities if applicable.
  List<ActionButtonItem> buttonViews(
    BuildContext context,
    Map<String, dynamic> data,
    EntityCustom entity,
    bool embedded,
    List<Map<String, dynamic>> parentData,
  ) {
    return views
        .where((e) => e.rule == null || e.rule!.evaluate(data))
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
/// [map] is the map to reorder.
/// [oldIndex] is the current index of the entry to move.
/// [newIndex] is the target index for the entry.
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
  final data = Map<K, V>.fromEntries(entries);

  print('[EntityCustom] reorderMap, fields: ${data.keys}');
  return data;
}

/// A private helper class to handle robust JSON parsing for [EntityCustom].
///
/// This encapsulates the logic for type validation and nested object creation,
/// ensuring that malformed JSON results in descriptive [FormatException]s.
class _EntityCustomJsonParser {
  final Map<String, dynamic> json;

  _EntityCustomJsonParser(this.json);

  /// Validates that [key] exists and is of type [T].
  ///
  /// Throws a [FormatException] if the key is missing or the type is incorrect.
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

  /// Parses a required list of items using the provided [mapItem] function.
  ///
  /// [key] is the JSON key containing the list.
  /// [mapItem] is a callback to convert each list element to type [T].
  ///
  /// Throws a [FormatException] if the list is missing or if mapping fails.
  List<T> parseListRequired<T>(
    String key,
    T Function(dynamic raw, int index) mapItem,
  ) {
    final raw = requireKey<List<dynamic>>(key);
    return List.generate(raw.length, (i) {
      try {
        return mapItem(raw[i], i);
      } catch (e) {
        throw FormatException("Error on '$key'[$i]: $e");
      }
    });
  }

  /// Parses an optional list of items, returning an empty list if the key is missing.
  ///
  /// [key] is the JSON key containing the list.
  /// [mapItem] is a callback to convert each list element to type [T].
  ///
  /// Throws a [FormatException] if the key exists but is not a list, or if mapping fails.
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
    return List.generate(raw.length, (i) {
      try {
        return mapItem(raw[i], i);
      } catch (e) {
        // Silently handle errors for specific optional lists if needed,
        // but here we throw to be explicit about configuration errors.
        throw FormatException("Error on '$key'[$i]: $e");
      }
    });
  }

  /// Specialized parser for the layout table flex map.
  ///
  /// [key] is the JSON key (usually 'layout_table').
  /// Expects a map of field references to numerical values (flex).
  Map<String, int> parseLayoutTable(String key) {
    if (!json.containsKey(key) || json[key] == null) return <String, int>{};
    final raw = json[key];
    if (raw is! Map) {
      throw FormatException(
        "Invalid type for '$key': expected Map, got ${raw.runtimeType}.",
      );
    }
    return raw.map((k, v) {
      if (k is! String) {
        throw FormatException(
            "Invalid key in '$key': expected String, got ${k.runtimeType}");
      }
      final val = (v is num)
          ? v.toInt()
          : throw FormatException("Invalid value for '$key[$k]': expected num");
      return MapEntry(k, val);
    });
  }

  /// Extracts and validates the entity ID from JSON.
  ///
  /// Throws [FormatException] if 'id' is missing or not a String.
  String parseId() {
    final v = json['id'];
    if (v is! String) {
      throw FormatException(
          "Missing or invalid 'id': expected String, got ${v.runtimeType}");
    }
    return v;
  }

  /// Parses the [LayoutListTile] configuration from JSON if present.
  ///
  /// Returns `null` if the key 'layout_list_tile' is missing.
  /// Throws [FormatException] if the value is not a Map.
  LayoutListTile? parseLayoutListTile() {
    if (!json.containsKey('layout_list_tile') ||
        json['layout_list_tile'] == null) {
      return null;
    }
    final raw = json['layout_list_tile'];
    if (raw is! Map<String, dynamic>) {
      throw FormatException(
          "Invalid type for 'layout_list_tile': expected Map");
    }
    return LayoutListTile.fromJson(raw);
  }

  /// Parses the [PaginationOption] from JSON or returns defaults.
  ///
  /// If 'pagination_option' is missing, returns [PaginationOption] with default values.
  /// Throws [FormatException] if the value is not a Map.
  PaginationOption parsePaginationOption() {
    if (!json.containsKey('pagination_option') ||
        json['pagination_option'] == null) {
      return const PaginationOption();
    }
    final raw = json['pagination_option'];
    if (raw is! Map<String, dynamic>) {
      throw FormatException(
          "Invalid type for 'pagination_option': expected Map");
    }
    return PaginationOption.fromJson(raw);
  }

  /// Parses the 'bypass_all_permissions' flag from JSON.
  ///
  /// Defaults to `true` if the key is missing (for backward compatibility or restrictive-by-default logic context).
  /// Note: [EntityCustom.fromJson] uses this to initialize the model.
  bool parseBypassAllPermissions() {
    if (!json.containsKey('bypass_all_permissions')) return true;
    return json['bypass_all_permissions'] == true;
  }

  /// Parses a single [ActionD] from the JSON if present.
  ///
  /// [key] is the JSON key for the action.
  ActionD? parseActionD(String key) {
    if (!json.containsKey(key) || json[key] == null) return null;
    return ActionD.fromJson(json[key]);
  }
}
