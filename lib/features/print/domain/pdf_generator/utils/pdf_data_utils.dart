import 'package:flutter/foundation.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';

class PdfDataUtils {
  /// Fetches all named entries declared under root `data_sources` and stores
  /// each result under `contextData['sources'][<name>]`.
  ///
  /// Supports optional `data_path` (dot-separated extraction, e.g. `"data"` or
  /// `"result.items"`) and `on_error` (`"empty"` default, or `"fail"`).
  static Future<void> fetchDataSources(
    Map<String, dynamic> json,
    Map<String, dynamic> contextData, {
    HttpRequestExecutor? executor,
  }) async {
    final rawSources = json['data_sources'];
    if (rawSources is! Map || rawSources.isEmpty) return;

    final existingSources = contextData['sources'];
    final sourcesMap = existingSources is Map
        ? Map<String, dynamic>.from(existingSources)
        : <String, dynamic>{};

    final entries = rawSources.entries.toList();
    await Future.wait(entries.map((entry) async {
      final key = entry.key.toString();
      final config = entry.value;
      if (config is! Map) return;

      final configMap = Map<String, dynamic>.from(config);
      final rawHttpData = configMap['http_data'] ??
          (configMap.containsKey('url') ? configMap : null);
      if (rawHttpData is! Map) return;

      final dataPath = configMap['data_path']?.toString();
      final onError = configMap['on_error']?.toString().toLowerCase() ?? 'empty';

      try {
        final httpData =
            HttpData.fromJson(Map<String, dynamic>.from(rawHttpData));
        final result = await httpData.execute(contextData, executor: executor);
        if (result.isSuccess) {
          final extracted = _extractDataPath(result.data, dataPath);
          sourcesMap[key] = extracted ?? [];
        } else {
          debugPrint(
              'PDF data_sources[$key] Error: ${httpData.url} - ${result.message}');
          if (onError == 'fail') {
            throw Exception(
                'Failed to fetch data_source "$key": ${result.message}');
          }
          sourcesMap[key] = [];
        }
      } catch (e) {
        debugPrint('PDF data_sources[$key] Exception: $e');
        if (onError == 'fail') rethrow;
        sourcesMap[key] = [];
      }
    }));

    contextData['sources'] = sourcesMap;
  }

  static dynamic _extractDataPath(dynamic resData, String? dataPath) {
    if (resData == null) return null;
    if (dataPath != null && dataPath.trim().isNotEmpty) {
      dynamic current = resData;
      for (final part in dataPath.trim().split('.')) {
        if (current is Map && current.containsKey(part)) {
          current = current[part];
        } else {
          return null;
        }
      }
      return current;
    }

    // Default behavior: if response is `{ data: [...] }`, unwrap the list.
    if (resData is Map && resData['data'] is List) {
      return resData['data'];
    }
    return resData;
  }

  static Future<void> fetchAllHttpData(
    dynamic json,
    Map<String, dynamic> contextData, {
    HttpRequestExecutor? executor,
  }) async {
    if (json is Map) {
      if (json['http_data'] != null) {
        try {
          final httpData = HttpData.fromJson(json['http_data']);
          final result =
              await httpData.execute(contextData, executor: executor);
          if (result.isSuccess) {
            final resData = result.data;
            int count = 0;
            if (resData is List) count = resData.length;
            if (resData is Map &&
                resData.containsKey('data') &&
                resData['data'] is List) {
              count = (resData['data'] as List).length;
            }
            print('HTTP Data Success: ${httpData.url} (Items: $count)');

            if (resData is Map) {
              contextData.addAll(Map<String, dynamic>.from(resData));
              // If the map has a 'data' field which is a list, also make it available as 'data'
              if (resData['data'] is List) {
                contextData['data'] = resData['data'];
                // Also inject into the component itself so it can be used for dynamic rows
                json['data'] = resData['data'];
              }
            } else if (resData is List) {
              contextData['data'] = resData;
              // Also inject into the component itself so it can be used for dynamic rows
              json['data'] = resData;
            }
          } else {
            print('HTTP Data Error: ${httpData.url} - ${result.message}');
          }
        } catch (e) {
          print('HTTP Data Fetch Exception: ${json['http_data']['url']} - $e');
        }
      }

      // Recursively search in values (skip `data_sources` which is handled
      // by `fetchDataSources` into the `sources.<key>` namespace).
      for (final entry in json.entries) {
        if (entry.key == 'data_sources') continue;
        await fetchAllHttpData(entry.value, contextData, executor: executor);
      }
    } else if (json is List) {
      for (final value in json) {
        await fetchAllHttpData(value, contextData, executor: executor);
      }
    }
  }

  static void extractImageUrls(dynamic json, Set<String> urls) {
    if (json is Map) {
      final type = json['type']?.toString();
      if (type == 'image' && json['url'] != null) {
        final url = json['url'].toString();
        if (url.isNotEmpty && !url.contains('{{')) {
          urls.add(url);
        }
      }

      // Root watermark optional image_url
      if (json['image_url'] != null && json['image_url'] is String) {
        final url = (json['image_url'] as String).trim();
        if (url.isNotEmpty && !url.contains('{{')) {
          urls.add(url);
        }
      }

      // Signature block dynamic image URLs from resolved data list
      if (type == 'signature_block' && json['data'] is List) {
        final fields = json['fields'] is Map
            ? Map<String, dynamic>.from(json['fields'] as Map)
            : const <String, dynamic>{};
        final imageField =
            fields['image']?.toString() ?? 'signature_image_url';
        for (final item in json['data'] as List) {
          if (item is Map) {
            final url = item[imageField]?.toString();
            if (url != null && url.isNotEmpty && !url.contains('{{')) {
              urls.add(url);
            }
          }
        }
      }

      // Grid dynamic image URLs inside item_template
      if (type == 'grid' &&
          json['data'] is List &&
          json['item_template'] is Map) {
        final template = json['item_template'];
        for (final item in json['data'] as List) {
          if (item is Map) {
            _extractTemplateImageUrls(
                template, Map<String, dynamic>.from(item), urls);
          }
        }
      }

      for (final value in json.values) {
        extractImageUrls(value, urls);
      }
    } else if (json is List) {
      for (final value in json) {
        extractImageUrls(value, urls);
      }
    }
  }

  static void _extractTemplateImageUrls(
    dynamic template,
    Map<String, dynamic> item,
    Set<String> urls,
  ) {
    if (template is Map) {
      if (template['type'] == 'image' && template['url'] is String) {
        final rawUrl = template['url'] as String;
        final resolved = rawUrl.replaceAllMapped(RegExp(r'\{\{(.*?)\}\}'), (m) {
          final key = m.group(1)?.trim() ?? '';
          final stripped = key.startsWith('item.')
              ? key.substring(5)
              : (key.startsWith('data.') ? key.substring(5) : key);
          return item[stripped]?.toString() ?? m.group(0)!;
        });
        if (resolved.isNotEmpty && !resolved.contains('{{')) {
          urls.add(resolved);
        }
      }
      for (final value in template.values) {
        _extractTemplateImageUrls(value, item, urls);
      }
    } else if (template is List) {
      for (final value in template) {
        _extractTemplateImageUrls(value, item, urls);
      }
    }
  }
}
