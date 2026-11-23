import 'package:flutter/foundation.dart';

/// Declarative specification for resolving foreign-key / relational field values
/// into human-readable display labels (e.g. "KODE - NAMA") across tables,
/// detail sections, filter chips, spreadsheet export, and print documents.
@immutable
class DisplaySourceModel {
  /// Relative API path (e.g. `/plant_capa_categories` or `plant_capa_categories`).
  final String? path;

  /// Target entity name (alias/alternative for [path]).
  final String? entity;

  /// Identifier column on the referenced entity (defaults to `'id'`).
  final String key;

  /// Label format template (e.g. `'{{item.code}} - {{item.name}}'` or `'{{name}}'`).
  final String label;

  /// HTTP query parameter name for batch requests (e.g. `'id.in'` or `'{key}.in'`).
  final String batchParam;

  /// Time-To-Live in seconds for in-memory caching of resolved items (default 300s).
  final int cacheTtlSeconds;

  /// Fallback strategy when resolution fails or key not found (`'raw'`, `'empty'`, `'dash'`).
  final String fallback;

  /// Optional direct/custom URL (e.g. `'{{backend_host}}/plant_capa_categories?id.eq={value}'`).
  final String? url;

  const DisplaySourceModel({
    this.path,
    this.entity,
    this.key = 'id',
    this.label = '{{item.name}}',
    this.batchParam = '{key}.in',
    this.cacheTtlSeconds = 300,
    this.fallback = 'raw',
    this.url,
  });

  /// Effective API path or entity identifier used for requests and cache keys.
  String get effectivePath {
    if (path != null && path!.trim().isNotEmpty) {
      final trimmed = path!.trim();
      return trimmed.startsWith('/') ? trimmed : '/$trimmed';
    }
    if (entity != null && entity!.trim().isNotEmpty) {
      final trimmed = entity!.trim();
      return trimmed.startsWith('/') ? trimmed : '/$trimmed';
    }
    if (url != null && url!.trim().isNotEmpty) {
      final uri = Uri.tryParse(url!.trim());
      if (uri != null && uri.path.isNotEmpty) {
        return uri.path;
      }
      return url!.trim();
    }
    return '';
  }

  /// Effective HTTP query parameter for batching (substitutes `{key}` with [key]).
  String get effectiveBatchParam {
    if (batchParam.contains('{key}')) {
      return batchParam.replaceAll('{key}', key);
    }
    return batchParam;
  }

  /// Parses a [DisplaySourceModel] from a dynamic value (`Map`, `String`, or existing instance).
  ///
  /// Supported formats:
  /// 1. Map:
  ///    `{ "path": "/plant_capa_categories", "key": "id", "label": "{{item.code}} - {{item.name}}" }`
  /// 2. Shorthand string (equivalent to `options_source`):
  ///    `"backend.plant_capa_categories({id}:{code} - {name})"`
  /// 3. Direct URL string:
  ///    `"{{backend_host}}/plant_capa_categories?id.eq={value}"`
  static DisplaySourceModel? fromDynamic(dynamic raw) {
    if (raw == null) return null;
    if (raw is DisplaySourceModel) return raw;

    if (raw is Map) {
      final map = Map<String, dynamic>.from(raw);
      return DisplaySourceModel(
        path: map['path']?.toString(),
        entity: map['entity']?.toString(),
        key: map['key']?.toString() ?? 'id',
        label: map['label']?.toString() ??
            map['optionLabel']?.toString() ??
            '{{item.name}}',
        batchParam: map['batch_param']?.toString() ??
            map['batchParam']?.toString() ??
            '{key}.in',
        cacheTtlSeconds: _parseInt(
              map['cache_ttl_seconds'] ??
                  map['cacheTtlSeconds'] ??
                  map['cache_secs'] ??
                  map['cacheSecs'],
            ) ??
            300,
        fallback: map['fallback']?.toString() ?? 'raw',
        url: map['url']?.toString(),
      );
    }

    if (raw is String) {
      final str = raw.trim();
      if (str.isEmpty) return null;

      // Handle backend.<entity>({key}:{label}) format
      final backendMatch = RegExp(
        r'^backend\.([a-zA-Z0-9_\-\/]+)\s*\(\s*\{?([a-zA-Z0-9_]+)\}?\s*:\s*([^)]+)\s*\)',
      ).firstMatch(str);

      if (backendMatch != null) {
        final entityName = backendMatch.group(1)!;
        final keyField = backendMatch.group(2)!;
        final labelPattern = backendMatch.group(3)!.trim();

        // Convert {foo} into {{item.foo}} if not already interpolated
        final normalizedLabel = labelPattern.replaceAllMapped(
          RegExp(r'\{([a-zA-Z0-9_.]+)\}'),
          (m) => '{{item.${m.group(1)}}}',
        );

        return DisplaySourceModel(
          entity: entityName,
          key: keyField,
          label: normalizedLabel,
        );
      }

      if (str.startsWith('http') || str.contains('{{backend_host}}') || str.contains('{backend_host}')) {
        return DisplaySourceModel(url: str);
      }

      // Treat simple identifier as entity name
      if (!str.contains(' ') && !str.contains('(')) {
        return DisplaySourceModel(entity: str);
      }
    }

    return null;
  }

  static int? _parseInt(dynamic val) {
    if (val == null) return null;
    if (val is int) return val;
    return int.tryParse(val.toString());
  }

  /// Formats a single item returned by the API using this model's [label] template.
  String format(Map<String, dynamic> item) {
    return formatItemLabel(label, item, fallbackKey: key);
  }

  /// Evaluates [template] string against [item] properties.
  /// Supports:
  /// - `{{item.code}} - {{item.name}}`
  /// - `{{code}} - {{name}}`
  /// - `{code} - {name}`
  /// - Nested dot paths (e.g. `{{item.department.name}}`)
  static String formatItemLabel(
    String template,
    Map<String, dynamic> item, {
    String fallbackKey = 'id',
  }) {
    if (item.isEmpty) return '';

    final replaced = template.replaceAllMapped(
      RegExp(r'\{\{?\s*(?:item\.)?([a-zA-Z0-9_.]+)\s*\}?\}'),
      (match) {
        final path = match.group(1)!;
        final val = _resolveDotPath(item, path);
        return val != null ? val.toString() : '';
      },
    ).trim();

    if (replaced.isNotEmpty && replaced != '-') {
      return replaced;
    }

    // Graceful automatic fallbacks if template produced empty string
    if (item['name'] != null && item['name'].toString().trim().isNotEmpty) {
      if (item['code'] != null && item['code'].toString().trim().isNotEmpty) {
        return '${item['code']} - ${item['name']}';
      }
      return item['name'].toString();
    }
    if (item['code'] != null && item['code'].toString().trim().isNotEmpty) {
      return item['code'].toString();
    }
    final keyVal = item[fallbackKey];
    return keyVal != null ? keyVal.toString() : '';
  }

  static dynamic _resolveDotPath(Map<String, dynamic> map, String path) {
    if (map.containsKey(path)) return map[path];
    final parts = path.split('.');
    dynamic current = map;
    for (final p in parts) {
      if (current is Map && current.containsKey(p)) {
        current = current[p];
      } else {
        return null;
      }
    }
    return current;
  }

  Map<String, dynamic> toJson() => {
        if (path != null) 'path': path,
        if (entity != null) 'entity': entity,
        'key': key,
        'label': label,
        'batch_param': batchParam,
        'cache_ttl_seconds': cacheTtlSeconds,
        'fallback': fallback,
        if (url != null) 'url': url,
      };

  DisplaySourceModel copyWith({
    String? path,
    String? entity,
    String? key,
    String? label,
    String? batchParam,
    int? cacheTtlSeconds,
    String? fallback,
    String? url,
  }) {
    return DisplaySourceModel(
      path: path ?? this.path,
      entity: entity ?? this.entity,
      key: key ?? this.key,
      label: label ?? this.label,
      batchParam: batchParam ?? this.batchParam,
      cacheTtlSeconds: cacheTtlSeconds ?? this.cacheTtlSeconds,
      fallback: fallback ?? this.fallback,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DisplaySourceModel &&
        other.path == path &&
        other.entity == entity &&
        other.key == key &&
        other.label == label &&
        other.batchParam == batchParam &&
        other.cacheTtlSeconds == cacheTtlSeconds &&
        other.fallback == fallback &&
        other.url == url;
  }

  @override
  int get hashCode => Object.hash(
        path,
        entity,
        key,
        label,
        batchParam,
        cacheTtlSeconds,
        fallback,
        url,
      );
}
