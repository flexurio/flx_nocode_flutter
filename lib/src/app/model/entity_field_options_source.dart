import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

class OptionsSource {
  final String? optionsSource;
  OptionsSource({required this.optionsSource});

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
  ///   values('PRIORITAS':'PRIORITAS','CITO':'CITO','REGULER':'REGULER')
  ///
  /// The string contains comma-separated key-value pairs in the form:
  ///   'KEY':'VALUE'
  ///
  /// Regex breakdown:
  ///   - `'([^']+)'` : captures the key inside single quotes
  ///   - `\s*:\s*`   : matches the colon `:` between key and value, allowing optional spaces
  ///   - `'([^']+)'` : captures the value inside single quotes
  ///
  /// Returns a Map<dynamic, dynamic>:
  ///   { 'PRIORITAS': 'PRIORITAS', 'CITO': 'CITO', 'REGULER': 'REGULER' }
  Map<dynamic, dynamic> extractValues() {
    final regex = RegExp(r"'([^']+)'\s*:\s*'([^']+)'");
    final matches = regex.allMatches(optionsSource!);

    return {for (final match in matches) match.group(1): match.group(2)};
  }

  Future<Map<dynamic, dynamic>> extractBackend() async {
    final backend = backendSource;
    final entity = (await EntityCustom.getEntity(backend.entity));
    final options = <dynamic, dynamic>{};
    if (entity != null) {
      final data = await EntityCustomRepository.instance.fetch(
        accessToken: UserRepositoryApp.instance.token!,
        pageOptions: PageOptions.empty(),
        method: entity.backend.readAll!.method,
        path: entity.backend.readAll!.urlWithValues,
        filterMap: {},
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
  }

  /// Extracts dynamic dropdown configuration from a backend pattern string.
  ///
  /// Example input:
  ///   backend.bank_type({id}:{name})
  ///
  /// Pattern breakdown:
  ///   - Starts with `backend.` followed by an entity name (`bank_type` in this case)
  ///   - Then a pair of fields inside parentheses in `{key}:{value}` format
  ///
  /// Regex explanation:
  ///   - `backend\.(\w+)`
  ///       Matches the literal 'backend.' followed by a word (entity name),
  ///       captured in group(1) → 'bank_type'
  ///
  ///   - `\(\s*\{(\w+)\}\s*:\s*\{(\w+)\}\s*\)`
  ///       Matches the parenthesis:
  ///         - `{(\w+)}` → captures the key field inside curly braces → 'id'
  ///         - `:`       → literal colon between key and value
  ///         - `{(\w+)}` → captures the value field inside curly braces → 'name'
  ///
  BackendSource get backendSource {
    if (optionsSource == null) {
      throw Exception('Source is null');
    }

    final pattern =
        r'(?<type>\w+)\.(?<entity>\w+)\(\{(?<key>\w+)\}:{(?<value>\w+)}\)';

    final regExp = RegExp(pattern);
    final match = regExp.firstMatch(optionsSource!);

    String entity = '';
    String key = '';
    String value = '';

    if (match != null) {
      entity = match.namedGroup('entity')!;
      key = match.namedGroup('key')!;
      value = match.namedGroup('value')!;
    }

    return BackendSource(entity: entity, key: key, value: value);
  }
}

class BackendSource {
  final String entity;
  final String key;
  final String value;
  BackendSource({required this.entity, required this.key, required this.value});
}
