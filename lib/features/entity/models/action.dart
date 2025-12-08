import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
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

  // for type listJsonViewAsTable
  final String? reference;

  /// Optional conditional rule to decide when the action is available.
  final Rule? rule;

  final bool isMultiple;

  ActionD({
    required this.isMultiple,
    required this.onSuccess,
    required this.onFailure,
    required this.id,
    this.http,
    this.reference,
    this.rule,
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
    String? reference,
    Rule? rule,
  }) {
    return ActionD(
      isMultiple: isMultiple ?? this.isMultiple,
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      http: http ?? this.http,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
      reference: reference ?? this.reference,
      rule: rule ?? this.rule,
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
      reference: json['reference'],
      rule: json['rule'] == null
          ? null
          : Rule.fromMap(
              Map<String, dynamic>.from(json['rule'] as Map),
            ),
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
      'is_multiple': isMultiple,
      'reference': reference,
      if (rule != null) 'rule': rule!.toMap(),
      if (http != null) 'http': http!.toJson(),
    };
  }
}

extension ActionDListExtension on List<ActionD> {
  List<ActionD> get multipleRow =>
      where((element) => element.isMultiple).toList();

  List<ActionD> get singleRow =>
      where((element) => !element.isMultiple).toList();
}

class ActionType {
  static const String print = 'print';
  static const String listJsonViewAsTable = 'list_json_view_as_table';
}
