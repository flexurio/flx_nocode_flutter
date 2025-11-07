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
  final String onSuccess;

  ActionD({
    required this.onSuccess,
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
  }) {
    return ActionD(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      http: http ?? this.http,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }

  /// Factory constructor for parsing from a JSON map.
  ///
  /// Example input:
  /// ```json
  /// {
  ///   "id": "approve_po",
  ///   "type": "approve",
  ///   "name": "Approve Purchase Order",
  ///   "on_success": "refresh",
  ///   "http": {
  ///     "method": "POST",
  ///     "url": "https://api.example.com/po/approve",
  ///     "headers": {"Authorization": "Bearer token"},
  ///     "body": {"id": "${id}", "status": "approved"}
  ///   }
  /// }
  /// ```
  factory ActionD.fromJson(Map<String, dynamic> json) {
    return ActionD(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      http: json['http'] != null ? HttpData.fromJson(json['http']) : null,
      onSuccess: json['on_success'],
    );
  }
}

/// Represents HTTP request configuration data used by [ActionD].
///
/// This class holds the HTTP method, target URL, headers,
/// and request body. It can be stored in Hive for offline
/// or dynamic configuration in a no-code environment.
class HttpData extends HiveObject {
  /// HTTP method, e.g. "GET", "POST", "PUT", "DELETE"
  final String method;

  /// Target endpoint URL for the request
  final String url;

  /// HTTP headers, typically containing authentication or content type
  ///
  /// Example:
  /// ```json
  /// {
  ///   "Authorization": "Bearer token",
  ///   "Content-Type": "application/json"
  /// }
  /// ```
  final Map<String, String> headers;

  /// JSON request body, can contain template variables such as `${id}`
  ///
  /// Example:
  /// ```json
  /// {
  ///   "id": "${id}",
  ///   "status": "approved"
  /// }
  /// ```
  final Map<String, dynamic> body;

  HttpData({
    required this.method,
    required this.url,
    required this.headers,
    required this.body,
  });

  /// Creates a modified clone of this [HttpData].
  HttpData copyWith({
    String? method,
    String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    return HttpData(
      method: method ?? this.method,
      url: url ?? this.url,
      headers: headers ?? this.headers,
      body: body ?? this.body,
    );
  }

  /// Factory constructor to parse an [HttpData] object from JSON.
  ///
  /// Safely converts header values to `Map<String, String>` and
  /// body to `Map<String, dynamic>`.
  factory HttpData.fromJson(Map<String, dynamic> json) {
    return HttpData(
      method: json['method'],
      url: json['url'],
      headers: Map<String, String>.from(json['headers']),
      body: json['body'] ?? {},
    );
  }

  /// Converts this object into a JSON-compatible map.
  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'url': url,
      'headers': headers,
      'body': body,
    };
  }
}

/// Extension methods for [HttpData].
///
/// Adds runtime variable replacement for the request body,
/// allowing template-style placeholders like `${id}` or `${user_name}`
/// to be replaced with actual values at runtime.
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
      Map<String, dynamic> data) {
    return headers.map((key, value) {
      return MapEntry(key, value.replaceStringWithValues(data));
    });
  }
}
