import 'package:hive/hive.dart';

class ActionD extends HiveObject {
  final String id;

  // type: print, approve, reject
  final String type;

  final String name;
  final HttpData? http;
  final String onSuccess;
  ActionD({
    required this.onSuccess,
    required this.id,
    this.http,
    required this.type,
    required this.name,
  });

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

class HttpData extends HiveObject {
  final String method;
  final String url;
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  HttpData({
    required this.method,
    required this.url,
    required this.headers,
    required this.body,
  });

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

  factory HttpData.fromJson(Map<String, dynamic> json) {
    return HttpData(
      method: json['method'],
      url: json['url'],
      headers: Map<String, String>.from(json['headers']),
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'url': url,
      'headers': headers,
      'body': body,
    };
  }
}
