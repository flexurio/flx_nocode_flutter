import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

/// A helper that parses and fetches dropdown options from either:
/// 1) a static `values(...)` string, or
/// 2) a dynamic `backend.<entity>({key}:{value})[?query]` definition.
///
/// This class supports **query parameter placeholders** that are resolved from
/// `parentData`, e.g.:
///
/// ```text
/// backend.marketings({code}:{name})?marketing_position_id.eq=SPV&subordinate_nip.eq={page[0].subordinate_nip}
/// ```
///
/// The placeholder `{page[0].subordinate_nip}` will be replaced with the value
/// from `parentData[0]['subordinate_nip']` at runtime. Nested fields are also
/// supported (e.g. `{page[1].user.profile.nip}`).
///
/// # Supported Formats
///
/// ## 1) Static values
/// ```text
/// values('KEY1':'VALUE1','KEY2':'VALUE2')
/// ```
///
/// ## 2) Backend entity
/// ```text
/// backend.<entity>({<keyField>}:{<valueField>})
/// backend.<entity>({<keyField>}:{<valueField>})?<k1>=<v1>&<k2>=<v2>
/// ```
///
/// ### Examples
/// ```text
/// backend.bank_type({id}:{name})
/// backend.bank_type({id}:{name})?active=true&nip=123
/// backend.marketings({code}:{name})?marketing_position_id.eq=SPV&subordinate_nip.eq={page[0].subordinate_nip}
/// backend.staff({id}:{full_name})?org_id.eq={page[0].org.id}&status.eq=ACTIVE
/// ```
///
/// # Resolution Order
/// - If `optionsSource` starts with `values(` → parse static pairs.
/// - If it starts with `backend.` → parse backend definition, resolve query
///   placeholders from `parentData`, then fetch via `EntityCustomRepository`.
///
/// # Safety & Fallbacks
/// - Invalid patterns throw an `ArgumentError`.
/// - Missing entity configuration logs and returns `{}`.
/// - Missing placeholder data resolves to an empty string.
///
/// # Usage
/// ```dart
/// final source = OptionsSource(
///   optionsSource:
///     'backend.marketings({code}:{name})?marketing_position_id.eq=SPV'
///     '&subordinate_nip.eq={page[0].subordinate_nip}',
/// );
///
/// final opts = await source.options(
///   parentData: [ {'subordinate_nip': '1234567890'} ],
/// );
/// // Result keys/values are derived from backend items' {code}:{name}
/// // Filter becomes:
/// // { 'marketing_position_id.eq': 'SPV', 'subordinate_nip.eq': '1234567890' }
/// ```
class OptionsSource {
  final String? optionsSource;
  OptionsSource({required this.optionsSource});

  /// Returns options as a `Map<dynamic, dynamic>` from either:
  /// - `values(...)` → static key-value pairs
  /// - `backend.entity({key}:{value})[?query]` → dynamic entity
  ///
  /// See the class-level documentation for format details.
  Future<Map<dynamic, dynamic>> options({
    required List<Map<String, dynamic>> parentData,
  }) async {
    if (optionsSource == null || optionsSource!.isEmpty) {
      // ignore: avoid_print
      print('[OptionsSource] optionsSource is empty');
      return {};
    }

    if (optionsSource!.startsWith('values(')) {
      // ignore: avoid_print
      print('[OptionsSource] optionsSource is values()');
      return extractValues();
    }

    if (optionsSource!.startsWith('backend.')) {
      // ignore: avoid_print
      print('[OptionsSource] optionsSource is backend.');
      return extractBackend(parentData: parentData);
    }

    return {};
  }

  /// Parse static key-value pairs from a `values(...)` string.
  ///
  /// Input:
  /// ```text
  /// values('PRIORITY':'PRIORITY','EXPRESS':'EXPRESS','REGULAR':'REGULAR')
  /// ```
  ///
  /// Output:
  /// ```dart
  /// { 'PRIORITY': 'PRIORITY', 'EXPRESS': 'EXPRESS', 'REGULAR': 'REGULAR' }
  /// ```
  ///
  /// Regex breakdown:
  /// - `'([^']+)'` : capture content in single quotes
  /// - `\s*:\s*`   : a colon `:` with optional whitespace
  Map<dynamic, dynamic> extractValues() {
    final regex = RegExp(r"'([^']+)'\s*:\s*'([^']+)'");
    final matches = regex.allMatches(optionsSource!);
    return {for (final m in matches) m.group(1): m.group(2)};
  }

  /// Resolve a backend definition, fetch data via `EntityCustomRepository`,
  /// and return `{keyField: valueField}` pairs.
  ///
  /// Steps:
  /// 1) Parse the backend pattern into [BackendSource].
  /// 2) Resolve query placeholder values from `parentData`.
  /// 3) Call `EntityCustomRepository.instance.fetch(...)`.
  /// 4) Build `{item[key]: item[value]}` from the response.
  ///
  /// Placeholders:
  /// - `{page[i].field}` supports nested fields like `{page[0].user.profile.nip}`.
  ///
  /// Fallbacks:
  /// - If entity config is missing, returns `{}` with a warning log.
  /// - If a placeholder cannot be resolved, it becomes an empty string.
  Future<Map<dynamic, dynamic>> extractBackend({
    required List<Map<String, dynamic>> parentData,
  }) async {
    try {
      final backend = backendSource(parentData: parentData);
      final entity = await EntityCustom.getEntity(backend.entity);
      final options = <dynamic, dynamic>{};

      if (entity == null) {
        // ignore: avoid_print
        print('[OptionsSource] Entity ${backend.entity} not found!');
        throw ArgumentError('Entity ${backend.entity} not found!');
      }

      // Resolve placeholders in query params using parentData
      final resolvedQueryParams =
          _resolveQueryParams(backend.queryParams, parentData);

      final data = await EntityCustomRepository.instance.fetch(
        accessToken: UserRepositoryApp.instance.token ?? '',
        pageOptions: PageOptions.emptyNoLimit(),
        method: entity.backend.readAll!.method,
        path: entity.backend.readAll!.urlWithValues,
        filterMap: resolvedQueryParams,
        cachedDurationSeconds: entity.backend.readAll!.cacheDurationSeconds,
      );

      final result = data.data;
      for (final item in result) {
        final key = item[backend.key];
        final value = item[backend.value];
        options[key] = value;
      }

      return options;
    } catch (e) {
      // ignore: avoid_print
      print('[OptionsSource] Error: $e');
      return {};
    }
  }

  /// Parse a backend pattern into a [BackendSource].
  ///
  /// # Pattern
  /// ```text
  /// (?<type>\w+)\.(?<entity>\w+)$begin:math:text$\\{\\s*(?<key>\\w+)\\s*\\}:\\{\\s*(?<value>\\w+)\\s*\\}$end:math:text$(?:\?(?<query>.*))?
  /// ```
  ///
  /// # Captures
  /// - `type`   : e.g. `backend`
  /// - `entity` : the entity name (e.g. `bank_type`, `marketings`)
  /// - `key`    : the field used as the map key
  /// - `value`  : the field used as the map value
  /// - `query`  : optional query string after `?`, split by `&`, key-value via `=`
  ///
  /// # Examples
  /// ```text
  /// backend.bank_type({id}:{name})
  /// backend.bank_type({id}:{name})?active=true&nip=123
  /// backend.marketings({code}:{name})?marketing_position_id.eq=SPV&subordinate_nip.eq={page[0].subordinate_nip}
  /// ```
  BackendSource backendSource({
    required List<Map<String, dynamic>> parentData,
  }) {
    if (optionsSource == null) {
      throw ArgumentError('optionsSource is null');
    }

    final pattern =
        r'(?<type>\w+)\.(?<entity>\w+)\(\{\s*(?<key>\w+)\s*\}:\{\s*(?<value>\w+)\s*\}\)(?:\?(?<query>.*))?';

    final regExp = RegExp(pattern);
    final match = regExp.firstMatch(optionsSource!);

    if (match == null) {
      throw ArgumentError(
        'Invalid backend optionsSource format: $optionsSource',
      );
    }

    final entity = match.namedGroup('entity')!;
    final key = match.namedGroup('key')!;
    final value = match.namedGroup('value')!;
    final queryString = match.namedGroup('query');

    final queryParams = <String, String>{};

    if (queryString != null && queryString.isNotEmpty) {
      for (final part in queryString.split('&')) {
        final idx = part.indexOf('=');
        if (idx > 0 && idx < part.length - 1) {
          final k = part.substring(0, idx);
          final v = part.substring(idx + 1);
          queryParams[k] = v;
        } else if (idx > 0) {
          queryParams[part.substring(0, idx)] = '';
        }
      }
    }

    print(
      '[OptionsSource] backendSource entity: $entity, key: $key, value: $value, queryParams(raw): $queryParams',
    );

    return BackendSource(
      entity: entity,
      key: key,
      value: value,
      queryParams: queryParams,
    );
  }

  /// Resolve placeholders in all query params using values from [parentData].
  ///
  /// Supported placeholder format:
  /// - `{page[index].fieldPath}`
  ///
  /// Examples:
  /// - `{page[0].subordinate_nip}`
  /// - `{page[1].user.profile.nip}`
  ///
  /// Behavior:
  /// - If index is out of range or the field path cannot be found, the value
  ///   becomes an empty string.
  Map<String, String> _resolveQueryParams(
    Map<String, String> raw,
    List<Map<String, dynamic>> parentData,
  ) {
    final resolved = <String, String>{};
    raw.forEach((k, v) => resolved[k] = _resolvePlaceholders(v, parentData));
    // ignore: avoid_print
    print('[OptionsSource] resolved queryParams: $resolved');
    return resolved;
  }

  /// Resolve placeholders in a single string value.
  ///
  /// Pattern: `{page[<index>].<fieldPath>}`
  /// - `<index>` is a 0-based integer.
  /// - `<fieldPath>` can be nested using dots (e.g., `user.profile.nip`).
  ///
  /// Example:
  /// - Input : `"subordinate_nip.eq={page[0].subordinate_nip}"`
  /// - Result: `"subordinate_nip.eq=1234567890"` (if parentData[0]['subordinate_nip'] == 1234567890)
  String _resolvePlaceholders(
    String input,
    List<Map<String, dynamic>> parentData,
  ) {
    final reg = RegExp(r'\{page\[(\d+)\]\.([^\}]+)\}');
    return input.replaceAllMapped(reg, (m) {
      final idx = int.tryParse(m.group(1) ?? '');
      final field = m.group(2);
      if (idx == null || field == null) return '';

      if (idx < 0 || idx >= parentData.length) return '';

      final pageMap = parentData[idx];
      final value = _readField(pageMap, field);
      return value?.toString() ?? '';
    });
  }

  /// Traverse nested map properties using a dot-separated path.
  ///
  /// Example:
  /// - map: `{ 'user': { 'profile': { 'nip': '987' } } }`
  /// - fieldPath: `"user.profile.nip"` → returns `'987'`
  dynamic _readField(Map<String, dynamic> map, String fieldPath) {
    final parts = fieldPath.split('.');
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
}

/// Parsed backend configuration used by [OptionsSource.extractBackend].
class BackendSource {
  /// The backend entity name, e.g. "bank_type", "marketings"
  final String entity;

  /// The field used as the key in the returned options map.
  final String key;

  /// The field used as the value in the returned options map.
  final String value;

  /// Optional query parameters parsed from the definition string.
  ///
  /// Notes:
  /// - Values may contain placeholders like `{page[0].subordinate_nip}` and
  ///   will be resolved against `parentData` in `extractBackend()`.
  /// - Empty values (e.g., `key=`) are supported and passed as empty strings.
  final Map<String, String> queryParams;

  BackendSource({
    required this.entity,
    required this.key,
    required this.value,
    this.queryParams = const {},
  });
}
