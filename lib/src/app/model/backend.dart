import 'package:hive/hive.dart';

import 'backend_other.dart';

class Backend extends HiveObject {
  final BackendEndpoint? readAll;
  final BackendEndpoint? read;
  final BackendEndpoint? create;
  final BackendEndpoint? update;
  final BackendEndpoint? deleteX;
  final List<BackendOther> others;

  Backend({
    this.readAll,
    this.read,
    this.create,
    this.update,
    this.deleteX,
    required this.others,
  });

  Backend copyWith({
    BackendEndpoint? readAll,
    BackendEndpoint? read,
    BackendEndpoint? create,
    BackendEndpoint? update,
    BackendEndpoint? deleteX,
    List<BackendOther>? others,
  }) {
    return Backend(
      readAll: readAll ?? this.readAll,
      read: read ?? this.read,
      create: create ?? this.create,
      update: update ?? this.update,
      deleteX: deleteX ?? this.deleteX,
      others: others ?? this.others,
    );
  }

  factory Backend.fromJson(Map<String, dynamic> json) {
    try {
      return Backend(
        others: json['others'] != null
            ? BackendOther.fromJsonList(json['others'])
            : [],
        readAll: json['read_all'] != null
            ? BackendEndpoint.fromJson(json['read_all'])
            : null,
        read: json['read'] != null
            ? BackendEndpoint.fromJson(json['read'])
            : null,
        create: json['create'] != null
            ? BackendEndpoint.fromJson(json['create'])
            : null,
        update: json['update'] != null
            ? BackendEndpoint.fromJson(json['update'])
            : null,
        deleteX: json['delete'] != null
            ? BackendEndpoint.fromJson(json['delete'])
            : null,
      );
    } catch (e) {
      print('[Backend] fromJson: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'read_all': readAll?.toJson(),
      'read': read?.toJson(),
      'create': create?.toJson(),
      'update': update?.toJson(),
      'delete': deleteX?.toJson(),
    };
  }
}

class BackendEndpoint extends HiveObject {
  final String method;
  final String url;

  final Map<String, Object>? data;
  final Map<String, String>? headers;

  /// Whether the response of this endpoint should be cached.
  final bool cached;

  /// Cache duration string (e.g. "23s", "34m", "45d").
  /// s=seconds, m=minutes, h=hours, d=days
  final String? cacheDuration;

  BackendEndpoint({
    required this.method,
    required this.url,
    this.data,
    this.headers,
    this.cached = false,
    this.cacheDuration,
  });

  /// Factory constructor to create [BackendEndpoint] from JSON.
  factory BackendEndpoint.fromJson(Map<String, Object?> json) {
    try {
      return BackendEndpoint(
        method: (json['method'] as String?) ?? '',
        url: (json['url'] as String?) ?? '',
        data: (json['data'] as Map?)?.cast<String, Object>(),
        headers: (json['headers'] as Map?)?.cast<String, String>(),
        cached: (json['cached'] as bool?) ?? false,
        cacheDuration: json['cache_duration'] as String?,
      );
    } catch (e) {
      // Hindari print berlebihan di production; ganti dengan logger bila perlu.
      // ignore: avoid_print
      print('[BackendEndpoint] fromJson: $e');
      rethrow;
    }
  }

  /// Converts this [BackendEndpoint] into JSON.
  Map<String, Object?> toJson() {
    return {
      'method': method,
      'url': url,
      'data': data,
      'headers': headers,
      'cached': cached,
      'cacheDuration': cacheDuration,
    };
  }
}

extension BackendEndpointExt on BackendEndpoint {
  /// Returns the URL with dynamic values replaced using `data`.
  String get urlWithValues {
    return urlWithValuesReplace(url, data ?? {});
  }

  /// Returns cache duration in seconds, parsed from [cacheDuration].
  int? get cacheDurationSeconds {
    if (cacheDuration == null || cacheDuration!.isEmpty) return null;

    final match = RegExp(r'^(\d+)([smhd])$').firstMatch(cacheDuration!.trim());
    if (match == null) return null;

    final value = int.tryParse(match.group(1)!);
    if (value == null) return null;

    switch (match.group(2)) {
      case 's':
        return value;
      case 'm':
        return value * 60;
      case 'h':
        return value * 3600;
      case 'd':
        return value * 86400;
      default:
        return null;
    }
  }

  /// Builds the request body by merging static [data] with provided [filters].
  Map<String, dynamic> body({
    required Map<String, dynamic> filters,
  }) {
    return mapAddPageData(
      data: data ?? {},
      filters: filters,
    );
  }
}
