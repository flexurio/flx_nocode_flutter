import 'backend_other.dart';

class Backend {
  final BackendEndpoint? readAll;
  final BackendEndpoint? read;
  final BackendEndpoint? create;
  final BackendEndpoint? update;
  final BackendEndpoint? delete;
  final List<BackendOther> others;

  Backend({
    this.readAll,
    this.read,
    this.create,
    this.update,
    this.delete,
    required this.others,
  });

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
        delete: json['delete'] != null
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
      'delete': delete?.toJson(),
    };
  }
}

class BackendEndpoint {
  final String method;
  final String url;
  final Map<String, dynamic>? data;

  BackendEndpoint({
    required this.method,
    required this.url,
    required this.data,
  });

  String get urlWithValues {
    return urlWithValuesReplace(url, data ?? {});
  }

  factory BackendEndpoint.fromJson(Map<String, dynamic> json) {
    try {
      return BackendEndpoint(
        method: json['method'],
        url: json['url'],
        data: json['data'],
      );
    } catch (e) {
      print('[BackendEndpoint] fromJson: $e');
      rethrow;
    }
  }

  Map<String, dynamic> body({
    required Map<String, dynamic> filters,
  }) {
    return mapAddPageData(
      data: data ?? {},
      filters: filters,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'url': url,
      'data': data,
    };
  }
}
