import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';

class PdfDataUtils {
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
              }
            } else if (resData is List) {
              contextData['data'] = resData;
            }
          } else {
            print('HTTP Data Error: ${httpData.url} - ${result.message}');
          }
        } catch (e) {
          print('HTTP Data Fetch Exception: ${json['http_data']['url']} - $e');
        }
      }

      // Recursively search in values
      for (final value in json.values) {
        await fetchAllHttpData(value, contextData, executor: executor);
      }
    } else if (json is List) {
      for (final value in json) {
        await fetchAllHttpData(value, contextData, executor: executor);
      }
    }
  }

  static void extractImageUrls(dynamic json, Set<String> urls) {
    if (json is Map) {
      if (json['type'] == 'image' && json['url'] != null) {
        urls.add(json['url'].toString());
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
}
