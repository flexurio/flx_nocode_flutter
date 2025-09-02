import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

class OptionsSource {
  final String? optionsSource;
  OptionsSource({required this.optionsSource});

  /// Returns options as a `Map<dynamic, dynamic>` from either:
  /// - `values(...)` → static key-value pairs
  /// - `backend.entity({key}:{value})[?query]` → dynamic backend entity
  ///
  /// Example:
  /// ```dart
  /// values('PRIORITAS':'PRIORITAS','CITO':'CITO','REGULER':'REGULER')
  /// backend.bank_type({id}:{name})
  /// backend.bank_type({id}:{name})?active=true&nip=123
  /// ```
  Future<Map<dynamic, dynamic>> options() async {
    if (optionsSource == null || optionsSource!.isEmpty) {
      print('[OptionsSource] optionsSource is empty');
      return {};
    }

    if (optionsSource!.startsWith('values(')) {
      print('[OptionsSource] optionsSource is values()');
      final values = extractValues();
      return values;
    }

    if (optionsSource!.startsWith('backend.')) {
      print('[OptionsSource] optionsSource is backend.');
      final backend = await extractBackend();
      return backend;
    }

    return {};
  }

  /// Extracts key-value pairs from a formatted `values(...)` string.
  ///
  /// Example input:
  /// ```
  /// values('PRIORITAS':'PRIORITAS','CITO':'CITO','REGULER':'REGULER')
  /// ```
  ///
  /// Regex breakdown:
  /// - `'([^']+)'` : captures the key inside single quotes
  /// - `\s*:\s*`   : matches the colon `:` between key and value, allowing optional spaces
  /// - `'([^']+)'` : captures the value inside single quotes
  ///
  /// Returns:
  /// ```
  /// { 'PRIORITAS': 'PRIORITAS', 'CITO': 'CITO', 'REGULER': 'REGULER' }
  /// ```
  Map<dynamic, dynamic> extractValues() {
    final regex = RegExp(r"'([^']+)'\s*:\s*'([^']+)'");
    final matches = regex.allMatches(optionsSource!);

    return {for (final match in matches) match.group(1): match.group(2)};
  }

  /// Fetches options from a backend source definition.
  ///
  /// Uses the `BackendSource` parsed from [optionsSource].
  /// It will call `EntityCustomRepository.fetch` with entity backend configuration
  /// and return a map of `{key: value}` pairs.
  ///
  /// Example:
  /// ```
  /// backend.bank_type({id}:{name})
  /// backend.bank_type({id}:{name})?active=true&nip=123
  /// ```
  Future<Map<dynamic, dynamic>> extractBackend() async {
    try {
      final backend = backendSource;
      final entity = (await EntityCustom.getEntity(backend.entity));
      final options = <dynamic, dynamic>{};
      if (entity != null) {
        final data = await EntityCustomRepository.instance.fetch(
          accessToken: UserRepositoryApp.instance.token ?? '',
          pageOptions: PageOptions.emptyNoLimit(),
          method: entity.backend.readAll!.method,
          path: entity.backend.readAll!.urlWithValues,
          filterMap: backend.queryParams,
          cachedDurationSeconds: entity.backend.readAll!.cacheDurationSeconds,
        );

        final result = data.data;
        for (final item in result) {
          final key = item[backend.key];
          final value = item[backend.value];
          options[key] = value;
        }
      } else {
        print('[OptionsSource] Entity ${backend.entity} not found!');
        throw ArgumentError('Entity ${backend.entity} not found!');
      }

      return options;
    } catch (e) {
      print('[OptionsSource] Error: $e');
      return {};
    }
  }

  /// Extracts dynamic dropdown configuration from a backend pattern string.
  ///
  /// ### Example inputs:
  /// ```
  /// backend.bank_type({id}:{name})
  /// backend.bank_type({id}:{name})?active=true&nip=123
  /// ```
  ///
  /// ### Pattern breakdown:
  /// - Starts with `backend.` followed by an entity name (`bank_type` in this case)
  /// - Then a pair of fields inside parentheses in `{key}:{value}` format
  /// - Optionally, may include query parameters after `?` in standard URL query format
  ///
  /// ### Regex explanation:
  /// - `backend\.(\w+)`
  ///   Matches the literal 'backend.' followed by a word (entity name)
  /// - `\(\{\s*(\w+)\s*\}:\{\s*(\w+)\s*\}\)`
  ///   Captures the key and value fields inside curly braces
  /// - `(?:\?(.*))?`
  ///   Optionally captures the query string after a `?`
  ///
  /// ### Return:
  /// Returns a [BackendSource] object containing:
  /// - entity
  /// - key
  /// - value
  /// - queryParams (parsed into a `Map<String, String>`)
  ///
  /// Example result for:
  /// ```
  /// backend.bank_type({id}:{name})?active=true&nip=123
  /// ```
  /// ```
  /// BackendSource(
  ///   entity: "bank_type",
  ///   key: "id",
  ///   value: "name",
  ///   queryParams: {"active": "true", "nip": "123"}
  /// )
  /// ```
  BackendSource get backendSource {
    if (optionsSource == null) {
      throw ArgumentError('optionsSource is null');
    }

    final pattern =
        r'(?<type>\w+)\.(?<entity>\w+)\(\{\s*(?<key>\w+)\s*\}:\{\s*(?<value>\w+)\s*\}\)(?:\?(?<query>.*))?';

    final regExp = RegExp(pattern);
    final match = regExp.firstMatch(optionsSource!);

    if (match == null) {
      throw ArgumentError(
          'Invalid backend optionsSource format: $optionsSource');
    }

    final entity = match.namedGroup('entity')!;
    final key = match.namedGroup('key')!;
    final value = match.namedGroup('value')!;
    final queryString = match.namedGroup('query');

    final queryParams = <String, String>{};

    if (queryString != null && queryString.isNotEmpty) {
      for (final part in queryString.split('&')) {
        final kv = part.split('=');
        if (kv.length == 2) {
          queryParams[kv[0]] = kv[1];
        }
      }
    }

    return BackendSource(
      entity: entity,
      key: key,
      value: value,
      queryParams: queryParams,
    );
  }
}

class BackendSource {
  /// The backend entity name, e.g. "bank_type"
  final String entity;

  /// The field used as key in the options map
  final String key;

  /// The field used as value in the options map
  final String value;

  /// Optional query parameters parsed from the optionsSource string
  /// Example: `?active=true&nip=123` → {"active": "true", "nip": "123"}
  final Map<String, String> queryParams;

  BackendSource({
    required this.entity,
    required this.key,
    required this.value,
    this.queryParams = const {},
  });
}
