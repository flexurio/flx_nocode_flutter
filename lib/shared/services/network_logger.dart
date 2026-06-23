import 'package:flutter/foundation.dart';

class NetworkLogEntry {
  final String id;
  final String method;
  final String url;
  final Map<String, dynamic> requestHeaders;
  final Object? requestBody;
  final DateTime timestamp;
  
  int? responseStatus;
  Map<String, dynamic>? responseHeaders;
  Object? responseBody;
  String? error;
  Duration? duration;

  NetworkLogEntry({
    required this.id,
    required this.method,
    required this.url,
    required this.requestHeaders,
    this.requestBody,
    required this.timestamp,
    this.responseStatus,
    this.responseHeaders,
    this.responseBody,
    this.error,
    this.duration,
  });
}

class NetworkLogger {
  NetworkLogger._();
  static final NetworkLogger instance = NetworkLogger._();

  final ValueNotifier<List<NetworkLogEntry>> logsNotifier = ValueNotifier<List<NetworkLogEntry>>([]);

  void logRequest(NetworkLogEntry entry) {
    // Keep max 200 logs to avoid memory bloat
    final current = List<NetworkLogEntry>.from(logsNotifier.value);
    if (current.length >= 200) {
      current.removeAt(0);
    }
    current.add(entry);
    logsNotifier.value = current;
  }

  void updateResponse(String id, {
    required int? responseStatus,
    required Map<String, dynamic>? responseHeaders,
    required Object? responseBody,
    required String? error,
    required Duration duration,
  }) {
    final current = List<NetworkLogEntry>.from(logsNotifier.value);
    final index = current.indexWhere((entry) => entry.id == id);
    if (index != -1) {
      final entry = current[index];
      entry.responseStatus = responseStatus;
      entry.responseHeaders = responseHeaders;
      entry.responseBody = responseBody;
      entry.error = error;
      entry.duration = duration;
      logsNotifier.value = current;
    }
  }

  void clear() {
    logsNotifier.value = [];
  }
}
