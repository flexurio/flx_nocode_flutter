import 'package:dio/dio.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:hive/hive.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart'; // untuk JsonList

/// Represents HTTP request configuration data used by actions.
///
/// This model is typically stored in Hive and used by dynamic actions
/// to perform HTTP requests without hardcoding endpoints in the app.
///
/// ### Supported features
/// - Custom HTTP method (GET, POST, PUT, PATCH, DELETE, etc.)
/// - Configurable URL, headers, and body
/// - Ability to send body as JSON or `multipart/form-data` via [useFormData]
/// - String templating inside [body] and [headers]
///
/// ### Example JSON
/// ```json
/// {
///   "method": "POST",
///   "url": "https://api.example.com/customers",
///   "headers": {
///     "Authorization": "Bearer ${token}",
///     "Content-Type": "application/json"
///   },
///   "body": {
///     "name": "${customer_name}",
///     "email": "${customer_email}"
///   },
///   "use_form_data": false
/// }
/// ```
///
/// [HttpDataExtension.execute] will convert this configuration into
/// an actual HTTP request using Dio.
class HttpData extends HiveObject {
  /// HTTP method, e.g. `"GET"`, `"POST"`, `"PUT"`, `"DELETE"`.
  ///
  /// Will be converted to uppercase before executing the request.
  final String method;

  /// Target endpoint URL for the request.
  ///
  /// Can contain template placeholders (e.g. `https://api.com/users/${id}`),
  /// which should be resolved before calling [execute].
  final String url;

  /// HTTP headers to be sent with the request.
  ///
  /// Values may contain template placeholders such as `${token}`.
  final Map<String, String> headers;

  /// JSON request body, can contain template variables such as `${id}`.
  ///
  /// - For `GET` / non-body methods, this will be converted to query parameters.
  /// - For `POST`, `PUT`, `PATCH`, this will be sent as body
  ///   (either JSON or `FormData`, depending on [useFormData]).
  final Map<String, dynamic> body;

  /// Whether to send [body] as Dio [FormData] (`multipart/form-data`).
  ///
  /// This is useful when uploading files or when backend expects
  /// form-encoded / multipart payload instead of raw JSON.
  final bool useFormData;

  /// Creates a new immutable [HttpData] instance.
  HttpData({
    required this.method,
    required this.url,
    required this.headers,
    required this.body,
    this.useFormData = false,
  });

  /// Creates a modified copy of this [HttpData].
  ///
  /// Only the parameters that are not `null` will override
  /// the existing values.
  ///
  /// ```dart
  /// final updated = httpData.copyWith(
  ///   url: 'https://api.example.com/users/$id',
  /// );
  /// ```
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

  /// Creates an [HttpData] instance from a JSON-compatible map.
  ///
  /// Expected JSON structure:
  /// ```json
  /// {
  ///   "method": "GET",
  ///   "url": "https://api.example.com",
  ///   "headers": { "Authorization": "Bearer ${token}" },
  ///   "body": { "id": "${id}" },
  ///   "use_form_data": false
  /// }
  /// ```
  factory HttpData.fromJson(Map<String, dynamic> json) {
    return HttpData(
      method: json['method'],
      url: json['url'],
      headers: Map<String, String>.from(json['headers'] ?? const {}),
      body: Map<String, dynamic>.from(json['body'] ?? const {}),
      useFormData: json['use_form_data'] ?? false,
    );
  }

  factory HttpData.empty() => HttpData(
        method: 'GET',
        url: '',
        headers: {},
        body: {},
        useFormData: false,
      );

  /// Converts this [HttpData] instance into a JSON-compatible map.
  ///
  /// Example output:
  /// ```json
  /// {
  ///   "method": "POST",
  ///   "url": "https://api.example.com/customers",
  ///   "headers": {
  ///     "Authorization": "Bearer ${token}"
  ///   },
  ///   "body": {
  ///     "name": "${customer_name}"
  ///   },
  ///   "use_form_data": false
  /// }
  /// ```
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
  /// Build HttpRequestConfig dari HttpData.
  HttpRequestConfig toRequestConfig(JsonMap data) {
    return HttpRequestConfig(
      method: method.toUpperCase(),
      url: url.interpolateJavascript({
        "current": data,
      }),
      headers: headersReplaceStringWithValues(data),
      body: bodyReplaceStringWithValues(data),
      asFormData: useFormData,
    );
  }

  /// Eksekusi tanpa parameter.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// final result = await httpData.execute();
  /// ```
  Future<HttpRequestResult> execute(JsonMap data) async {
    final executor = HttpRequestExecutor();
    final config = toRequestConfig(data);
    return executor.execute(config);
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
