import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:hive/hive.dart';

enum ActionType {
  print('print', 'Print'),
  create('create', 'Create'),
  openPage('open_page', 'Open Page'),
  listJsonViewAsTable('list_json_view_as_table', 'List View as Table'),
  http('http', 'HTTP Request'),
  none('none', 'None'),
  showDialog('show_dialog', 'Show Dialog'),
  toast('toast', 'Toast Notification'),
  refresh('refresh', 'Refresh Data'),
  navigateHome('navigate_home', 'Navigate Home'),
  showErrorDialog('show_error_dialog', 'Show Error Dialog'),
  navigateBack('navigate_back', 'Navigate Back');

  final String id;
  final String label;

  const ActionType(this.id, this.label);

  static ActionType fromId(String? id) {
    return ActionType.values.firstWhere(
      (e) => e.id == id,
      orElse: () => ActionType.none,
    );
  }
}

/// Represents a dynamic action definition that can be triggered
/// from the UI (e.g. button press). Each action may optionally
/// execute an HTTP request defined by [HttpData].
///
/// Example: approving, rejecting, printing, etc.
class ActionD extends HiveObject {
  /// Unique identifier of the action
  final String id;

  /// The type of the action
  final ActionType type;

  /// Display name shown on UI (e.g. button label)
  final String name;

  /// Optional HTTP configuration for network-based actions
  final HttpData? http;

  /// Defines what happens after success
  final ActionType onSuccess;

  /// Defines what happens on failure
  final ActionType onFailure;

  // for type listJsonViewAsTable
  final String? reference;

  // for type openPage
  final String? layoutFormId;

  final String? icon;

  final int? iconCode;

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
    this.layoutFormId,
    this.icon,
    this.iconCode,
    this.rule,
    required this.type,
    required this.name,
  });

  /// Creates a copy of this [ActionD] object with optional modifications.
  ActionD copyWith({
    String? id,
    ActionType? type,
    String? name,
    HttpData? http,
    ActionType? onSuccess,
    ActionType? onFailure,
    bool? isMultiple,
    String? reference,
    String? layoutFormId,
    String? icon,
    int? iconCode,
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
      layoutFormId: layoutFormId ?? this.layoutFormId,
      icon: icon ?? this.icon,
      iconCode: iconCode ?? this.iconCode,
      rule: rule ?? this.rule,
    );
  }

  /// Factory constructor for parsing from a JSON map.
  factory ActionD.fromJson(Map<String, dynamic> json) {
    return ActionD(
      isMultiple: json['is_multiple'] ?? false,
      id: json['id'] ?? '',
      type: ActionType.fromId(json['type']),
      name: json['name'] ?? '',
      http: json['http'] != null ? HttpData.fromJson(json['http']) : null,
      onSuccess: ActionType.fromId(json['on_success'] ?? 'toast'),
      onFailure: ActionType.fromId(json['on_failure'] ?? 'toast'),
      reference: json['reference'],
      layoutFormId: json['layout_form_id'],
      icon: json['icon'],
      iconCode: json['icon_code'],
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
      'type': type.id,
      'name': name,
      'on_success': onSuccess.id,
      'on_failure': onFailure.id,
      'is_multiple': isMultiple,
      'reference': reference,
      'layout_form_id': layoutFormId,
      'icon': icon,
      'icon_code': iconCode,
      if (rule != null) 'rule': rule!.toMap(),
      if (http != null) 'http': http!.toJson(),
    };
  }

  DataAction get action {
    switch (type) {
      case ActionType.print:
        return DataAction.print;
      case ActionType.listJsonViewAsTable:
        return DataAction.view;
      case ActionType.create:
        return DataAction.create;
      case ActionType.openPage:
        return DataAction.add;
      default:
        return DataAction.none;
    }
  }
}

extension ActionDListExtension on List<ActionD> {
  List<ActionD> get multipleRow =>
      where((element) => element.isMultiple).toList();

  List<ActionD> get singleRow =>
      where((element) => !element.isMultiple).toList();
}
