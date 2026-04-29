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
          final result = await httpData.execute(contextData, executor: executor);
          if (result.isSuccess) {
            final resData = result.data;
            if (resData is Map) {
              contextData.addAll(Map<String, dynamic>.from(resData));
            } else if (resData is List) {
              contextData['data'] = resData;
            }
          }
        } catch (e) {
          // Ignore fetch errors
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
