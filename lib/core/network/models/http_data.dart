import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action.dart'; // untuk JsonList

/// Represents HTTP request configuration data used by actions.
///
/// Now supports sending body as FormData via [useFormData].
class HttpData extends HiveObject {
  /// HTTP method, e.g. "GET", "POST", "PUT", "DELETE"
  final String method;

  /// Target endpoint URL for the request
  final String url;

  /// HTTP headers
  final Map<String, String> headers;

  /// JSON request body, can contain template variables such as `${id}`
  final Map<String, dynamic> body;

  /// Whether to send body as FormData (multipart/form-data)
  final bool useFormData;

  HttpData({
    required this.method,
    required this.url,
    required this.headers,
    required this.body,
    this.useFormData = false,
  });

  /// Creates a modified clone of this [HttpData].
  HttpData copyWith({
    String? method,
    String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool? useFormData,
  }) {
    return HttpData(
      method: method ?? this.method,
      url: url ?? this.url,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      useFormData: useFormData ?? this.useFormData,
    );
  }

  factory HttpData.fromJson(Map<String, dynamic> json) {
    return HttpData(
      method: json['method'],
      url: json['url'],
      headers: Map<String, String>.from(json['headers'] ?? const {}),
      body: Map<String, dynamic>.from(json['body'] ?? const {}),
      useFormData: json['use_form_data'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'url': url,
      'headers': headers,
      'body': body,
      'use_form_data': useFormData,
    };
  }
}

extension HttpDataExtension on HttpData {
  Future<Response> execute() async {
    final dio = Dio();

    final methodUpper = method.toUpperCase();

    // Menyamakan behaviour dengan ActionExtension:
    // body hanya dikirim untuk POST, PUT, PATCH
    const methodsWithBody = {'POST', 'PUT', 'PATCH'};
    final bool hasBody = methodsWithBody.contains(methodUpper);

    Object? dataBody;
    Map<String, dynamic>? queryParameters;

    if (body.isNotEmpty) {
      if (hasBody) {
        // Kirim sebagai body
        dataBody = useFormData ? FormData.fromMap(body) : body;
      } else {
        // Kalau method tidak pakai body (GET, DELETE, dll) jadikan query param
        queryParameters = body;
      }
    }

    final response = await dio.request(
      url,
      data: dataBody,
      queryParameters: queryParameters,
      options: Options(
        method: methodUpper,
        headers: headers,
      ),
    );

    return response;
  }

  Map<String, dynamic> bodyReplaceStringWithValues(
    Map<String, dynamic> data,
  ) {
    return body.map((key, value) {
      if (value is String) {
        return MapEntry(key, value.replaceStringWithValues(data));
      }
      return MapEntry(key, value);
    });
  }

  Map<String, dynamic> bodyReplaceStringWithValuesMultiple(JsonList data) {
    return body.map((key, value) {
      if (value is String) {
        return MapEntry(key, value.replaceStringWithValuesMultiple(data));
      }
      return MapEntry(key, value);
    });
  }

  Map<String, String> headersReplaceStringWithValues(
    Map<String, dynamic> data,
  ) {
    return headers.map((key, value) {
      return MapEntry(key, value.replaceStringWithValues(data));
    });
  }
}
