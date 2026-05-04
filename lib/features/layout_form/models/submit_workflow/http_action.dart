import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'workflow_action.dart';

/// Performs an HTTP request.
class HttpAction extends WorkflowAction {
  final String name;
  final HttpData http;
  final WorkflowRetryPolicy? retry;
  final String? saveResultTo;

  HttpAction({
    required this.name,
    required this.http,
    this.retry,
    this.saveResultTo,
  }) : super('http');

  factory HttpAction.fromMap(Map<String, dynamic> map) {
    return HttpAction(
      name: map['name'] ?? '',
      http: HttpData.fromJson(Map<String, dynamic>.from(map['http'])),
      retry: map['retry'] != null
          ? WorkflowRetryPolicy.fromMap(Map<String, dynamic>.from(map['retry']))
          : null,
      saveResultTo: map['save_result_to'] ?? map['saveResultTo'],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'http',
        'name': name,
        'http': http.toJson(),
        if (retry != null) 'retry': retry!.toMap(),
        if (saveResultTo != null) 'save_result_to': saveResultTo,
      };
}

/// Configures retry logic for HTTP actions.
class WorkflowRetryPolicy {
  final int max;
  final int delayMs;

  WorkflowRetryPolicy({required this.max, required this.delayMs});

  factory WorkflowRetryPolicy.fromMap(Map<String, dynamic> map) =>
      WorkflowRetryPolicy(
        max: map['max'] ?? 0,
        delayMs: map['delay_ms'] ?? map['delayMs'] ?? 0,
      );

  Map<String, dynamic> toMap() => {'max': max, 'delay_ms': delayMs};
}
