import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

/// Centralized domain helper for resolving raw field codes into human-readable
/// display labels, resolving chip/badge colors against raw codes, and enriching
/// export/print payloads consistently across the package.
///
/// Resolution priority for labels:
/// 1. Explicit [valueLabels] (or its backward-compatible `chip_labels` alias)
/// 2. Static `values('KEY':'Label',...)` entries in [optionsSource]
/// 3. Raw value fallback (graceful degradation when backend adds new codes)
class FieldValueLabelResolver {
  const FieldValueLabelResolver._();

  static final RegExp _staticValuesRegex = RegExp(r"'([^']+)'\s*:\s*'([^']+)'");

  /// Safely converts a dynamic JSON map into `Map<String, String>`.
  static Map<String, String>? parseStringMap(dynamic raw) {
    if (raw is! Map) return null;
    final result = <String, String>{};
    for (final entry in raw.entries) {
      if (entry.key == null || entry.value == null) continue;
      result[entry.key.toString()] = entry.value.toString();
    }
    return result.isEmpty ? null : result;
  }

  /// Parses static `values('KEY':'Label',...)` pairs from [optionsSource].
  /// Returns an empty map for `null`, empty, or `backend.*` sources.
  static Map<String, String> extractStaticOptions(String? optionsSource) {
    if (optionsSource == null || !optionsSource.trimLeft().startsWith('values(')) {
      return const {};
    }
    final matches = _staticValuesRegex.allMatches(optionsSource);
    if (matches.isEmpty) return const {};
    return {
      for (final m in matches)
        if (m.group(1) != null && m.group(2) != null) m.group(1)!: m.group(2)!,
    };
  }

  /// Combines static [optionsSource] pairs (base) with explicit [valueLabels]
  /// (override) into a single effective code -> display label map.
  static Map<String, String> effectiveLabels({
    Map<String, String>? valueLabels,
    String? optionsSource,
  }) {
    final staticMap = extractStaticOptions(optionsSource);
    if (staticMap.isEmpty && (valueLabels == null || valueLabels.isEmpty)) {
      return const {};
    }
    return {
      ...staticMap,
      if (valueLabels != null) ...valueLabels,
    };
  }

  /// Resolves [rawValue] into its human-readable display label.
  ///
  /// Matching order:
  /// 1. Exact key match in [valueLabels]
  /// 2. Case-insensitive key match in [valueLabels]
  /// 3. Exact key match in static [optionsSource]
  /// 4. Case-insensitive key match in static [optionsSource]
  /// 5. Fallback to `rawValue.toString()`
  static String resolveLabel(
    dynamic rawValue, {
    Map<String, String>? valueLabels,
    String? optionsSource,
  }) {
    if (rawValue == null) return '';
    final raw = rawValue.toString();
    if (raw.isEmpty) return raw;

    final fromExplicit = _lookupLabel(raw, valueLabels);
    if (fromExplicit != null) return fromExplicit;

    final staticMap = extractStaticOptions(optionsSource);
    final fromStatic = _lookupLabel(raw, staticMap);
    if (fromStatic != null) return fromStatic;

    return raw;
  }

  static String? _lookupLabel(String raw, Map<String, String>? map) {
    if (map == null || map.isEmpty) return null;
    if (map.containsKey(raw)) return map[raw];

    final upperRaw = raw.toUpperCase();
    for (final entry in map.entries) {
      if (entry.key.toUpperCase() == upperRaw) {
        return entry.value;
      }
    }
    return null;
  }

  /// Resolves chip color from [rawValue] (the raw system code, NOT the
  /// translated display label).
  ///
  /// Priority:
  /// 1. Exact case-insensitive match in [customColors]
  /// 2. Substring match in [customColors] (backward compatibility)
  /// 3. Built-in semantic fallback keywords
  static Color resolveChipColor(
    String rawValue,
    Map<String, String>? customColors,
  ) {
    final upperVal = rawValue.toUpperCase();

    if (customColors != null && customColors.isNotEmpty) {
      // 1. Exact match first to prevent substring collisions (e.g. APPROVAL vs EVALUATION_APPROVAL)
      for (final entry in customColors.entries) {
        if (upperVal == entry.key.toUpperCase()) {
          final color = parseHexColor(entry.value);
          if (color != null) return color;
        }
      }
      // 2. Substring fallback for legacy configs
      for (final entry in customColors.entries) {
        if (upperVal.contains(entry.key.toUpperCase())) {
          final color = parseHexColor(entry.value);
          if (color != null) return color;
        }
      }
    }

    if (upperVal.contains('REJECT') || upperVal.contains('FAIL')) {
      return const Color(0XFFE53935); // Red
    }
    if (upperVal.contains('APPROVE') ||
        upperVal.contains('SUCCESS') ||
        upperVal.contains('DONE') ||
        upperVal.contains('OK')) {
      return const Color(0XFF43A047); // Green
    }
    if (upperVal.contains('INPUT') ||
        upperVal.contains('DRAFT') ||
        upperVal.contains('PENDING')) {
      return const Color(0XFF1E88E5); // Blue
    }
    if (upperVal.contains('CANCEL') || upperVal.contains('CLOSE')) {
      return const Color(0XFF757575); // Grey
    }
    if (upperVal.contains('PROGRESS') ||
        upperVal.contains('PROCESS') ||
        upperVal.contains('ACTIVE')) {
      return const Color(0XFFF57C00); // Orange
    }

    return const Color(0XFF607D8B); // Fallback Grey-Blue
  }

  /// Parses `#RRGGBB`, `RRGGBB`, `#AARRGGBB`, or `AARRGGBB` hex strings.
  static Color? parseHexColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    try {
      String cleanHex = hex.replaceAll('#', '').trim();
      if (cleanHex.length == 6) {
        cleanHex = 'FF$cleanHex';
      }
      return Color(int.parse(cleanHex, radix: 16));
    } catch (_) {
      return null;
    }
  }

  /// Builds a lookup map of `reference -> EntityField` for fields that define
  /// value labels (via `value_labels` / `chip_labels` or static `options_source`).
  static Map<String, EntityField> indexFieldsWithLabels(
    List<EntityField>? entityFields,
  ) {
    if (entityFields == null || entityFields.isEmpty) return const {};
    final map = <String, EntityField>{};
    for (final field in entityFields) {
      if (field.reference.isNotEmpty && field.hasValueLabels) {
        map[field.reference] = field;
      }
    }
    return map;
  }

  /// Returns a formatted copy of [rows] where fields with value labels are
  /// replaced with their resolved display labels (used for PDF/XLSX export).
  static List<Map<String, dynamic>> formatRowsForExport(
    List<Map<String, dynamic>> rows,
    List<String> fields,
    List<EntityField>? entityFields,
  ) {
    final labelFields = indexFieldsWithLabels(entityFields);
    if (labelFields.isEmpty) return rows;

    return rows.map((row) {
      final formatted = Map<String, dynamic>.from(row);
      for (final fieldName in fields) {
        final field = labelFields[fieldName];
        if (field != null && formatted[fieldName] != null) {
          formatted[fieldName] = field.resolveDisplayLabel(formatted[fieldName]);
        }
      }
      return formatted;
    }).toList();
  }

  /// Non-destructively enriches [data] for `layout_print` by adding
  /// `<reference>_label` sibling keys for every field with value labels,
  /// without mutating raw `<reference>` keys (so conditions/queries stay intact).
  ///
  /// Recurses into nested maps and lists of maps (e.g., `data`, `items`, `current`).
  static Map<String, dynamic> enrichPrintContext(
    Map<String, dynamic> data,
    List<EntityField>? entityFields,
  ) {
    final labelFields = indexFieldsWithLabels(entityFields);
    if (labelFields.isEmpty) return data;
    return _enrichMapRecursive(data, labelFields);
  }

  /// Enriches embedded `data` lists inside a `layout_print` JSON tree
  /// (such as table `data` populated by `PdfDataUtils.fetchAllHttpData`).
  static void enrichPrintJsonData(
    dynamic jsonNode,
    List<EntityField>? entityFields,
  ) {
    final labelFields = indexFieldsWithLabels(entityFields);
    if (labelFields.isEmpty) return;
    _enrichJsonDataRecursive(jsonNode, labelFields);
  }

  static void _enrichJsonDataRecursive(
    dynamic node,
    Map<String, EntityField> labelFields,
  ) {
    if (node is Map) {
      if (node['data'] is List) {
        node['data'] = (node['data'] as List).map((item) {
          if (item is Map) {
            return _enrichMapRecursive(
              Map<String, dynamic>.from(item),
              labelFields,
            );
          }
          return item;
        }).toList();
      }
      for (final entry in node.entries) {
        if (entry.key == 'data') continue;
        _enrichJsonDataRecursive(entry.value, labelFields);
      }
    } else if (node is List) {
      for (final item in node) {
        _enrichJsonDataRecursive(item, labelFields);
      }
    }
  }

  static Map<String, dynamic> _enrichMapRecursive(
    Map<String, dynamic> source,
    Map<String, EntityField> labelFields,
  ) {
    final result = <String, dynamic>{};

    for (final entry in source.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is Map) {
        result[key] = _enrichMapRecursive(
          Map<String, dynamic>.from(value),
          labelFields,
        );
      } else if (value is List) {
        result[key] = value.map((item) {
          if (item is Map) {
            return _enrichMapRecursive(
              Map<String, dynamic>.from(item),
              labelFields,
            );
          }
          return item;
        }).toList();
      } else {
        result[key] = value;
      }
    }

    for (final entry in labelFields.entries) {
      final ref = entry.key;
      final labelKey = '${ref}_label';
      if (result.containsKey(ref) &&
          result[ref] != null &&
          !result.containsKey(labelKey)) {
        result[labelKey] = entry.value.resolveDisplayLabel(result[ref]);
      }
    }

    return result;
  }

  /// Extracts a simple field reference from a template expression such as
  /// `${current.status}`, `{{current.status}}`, or `{{status}}`.
  /// Returns `null` for complex expressions or literals.
  static String? extractSimpleFieldReference(String template) {
    final trimmed = template.trim();
    final match = RegExp(
      r'^(?:\$\{|\{\{)\s*(?:current\.)?([a-zA-Z_][a-zA-Z0-9_]*)\s*(?:\}|\}\})$',
    ).firstMatch(trimmed);
    return match?.group(1);
  }
}
