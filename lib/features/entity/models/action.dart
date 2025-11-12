import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:hive/hive.dart';

/// Represents a dynamic action definition that can be triggered
/// from the UI (e.g. button press). Each action may optionally
/// execute an HTTP request defined by [HttpData].
///
/// Example: approving, rejecting, printing, etc.
class ActionD extends HiveObject {
  /// Unique identifier of the action
  final String id;

  /// The type of the action, e.g.:
  /// - "print"
  /// - "approve"
  /// - "reject"
  final String type;

  /// Display name shown on UI (e.g. button label)
  final String name;

  /// Optional HTTP configuration for network-based actions
  final HttpData? http;

  /// Defines what happens after success, e.g.:
  /// - "refresh" → refresh UI or data
  /// - "navigate_home" → navigate to home screen
  /// - "show_dialog" → show success dialog
  /// - "toast" → show success toast
  final String onSuccess;

  /// Defines what happens on failure, e.g.:
  /// - "show_error_dialog" → show dialog with error message
  /// - "toast" → show toast with error
  /// - "navigate_back" → pop current route
  /// - "none" → do nothing
  final String onFailure;

  final bool isMultiple;

  ActionD({
    required this.isMultiple,
    required this.onSuccess,
    required this.onFailure,
    required this.id,
    this.http,
    required this.type,
    required this.name,
  });

  /// Creates a copy of this [ActionD] object with optional modifications.
  ActionD copyWith({
    String? id,
    String? type,
    String? name,
    HttpData? http,
    String? onSuccess,
    String? onFailure,
    bool? isMultiple,
  }) {
    return ActionD(
      isMultiple: isMultiple ?? this.isMultiple,
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      http: http ?? this.http,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
    );
  }

  /// Factory constructor for parsing from a JSON map.
  factory ActionD.fromJson(Map<String, dynamic> json) {
    return ActionD(
      isMultiple: json['is_multiple'] ?? false,
      id: json['id'],
      type: json['type'],
      name: json['name'],
      http: json['http'] != null ? HttpData.fromJson(json['http']) : null,
      onSuccess: json['on_success'] ?? 'toast',
      onFailure: json['on_failure'] ?? 'toast',
    );
  }

  /// Optional: serialize back to JSON (useful for persistence/exports).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'on_success': onSuccess,
      'on_failure': onFailure,
      if (http != null) 'http': http!.toJson(),
    };
  }
}

/// Represents HTTP request configuration data used by [ActionD].
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
  Map<String, dynamic> bodyReplaceStringWithValues(Map<String, dynamic> data) {
    return body.map((key, value) {
      if (value is String) {
        return MapEntry(key, value.replaceStringWithValues(data));
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

extension ActionDListExtension on List<ActionD> {
  List<ActionD> get multipleRow =>
      where((element) => element.isMultiple).toList();
  List<ActionD> get singleRow =>
      where((element) => !element.isMultiple).toList();
}
