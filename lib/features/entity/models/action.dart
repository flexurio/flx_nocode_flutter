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
  navigateBack('navigate_back', 'Navigate Back'),
  showConfirmationDialog(
      'show_confirmation_dialog', 'Show Confirmation Dialog'),
  showSuccessDialogWithData(
      'show_success_dialog_with_data', 'Show Success Dialog with Data');

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
  final String onSuccess;

  /// Defines what happens on failure
  final String onFailure;

  // for type listJsonViewAsTable
  final String? reference;

  // for type openPage
  final String? layoutFormId;

  final String? icon;

  final int? iconCode;

  /// Optional conditional rule to decide when the action is available.
  final Rule? rule;

  final bool isMultiple;
  final double? width;
  final String? confirmTitle;
  final String? confirmMessage;
  final String? iconColor;
  final String? permission;

  // for success dialog with data
  final String? successTitle;
  final String? successMessage;
  final String? copyLabel;
  final String? copyValue;

  /// The variable name to store the result of the action (e.g. HTTP response body).
  final String? targetVariable;

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
    this.width,
    this.confirmTitle,
    this.confirmMessage,
    this.iconColor,
    this.permission,
    this.successTitle,
    this.successMessage,
    this.copyLabel,
    this.copyValue,
    this.targetVariable,
  }) {
    if (type == ActionType.openPage || type == ActionType.showDialog) {
      assert(layoutFormId != null && layoutFormId!.isNotEmpty,
          'Action "$id" of type "${type.id}" requires a non-empty layoutFormId.');
    }
  }

  /// Creates a copy of this [ActionD] object with optional modifications.
  ActionD copyWith({
    String? id,
    ActionType? type,
    String? name,
    HttpData? http,
    String? onSuccess,
    String? onFailure,
    bool? isMultiple,
    String? reference,
    String? layoutFormId,
    String? icon,
    int? iconCode,
    Rule? rule,
    double? width,
    String? confirmTitle,
    String? confirmMessage,
    String? iconColor,
    String? permission,
    String? successTitle,
    String? successMessage,
    String? copyLabel,
    String? copyValue,
    String? targetVariable,
  }) {
    return ActionD(
      width: width ?? this.width,
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
      confirmTitle: confirmTitle ?? this.confirmTitle,
      confirmMessage: confirmMessage ?? this.confirmMessage,
      iconColor: iconColor ?? this.iconColor,
      permission: permission ?? this.permission,
      successTitle: successTitle ?? this.successTitle,
      successMessage: successMessage ?? this.successMessage,
      copyLabel: copyLabel ?? this.copyLabel,
      copyValue: copyValue ?? this.copyValue,
      targetVariable: targetVariable ?? this.targetVariable,
    );
  }

  /// Factory constructor for parsing from a JSON map.
  factory ActionD.fromJson(Map<String, dynamic> json) {
    final type = ActionType.fromId(json['type']);
    final layoutFormId = json['layout_form_id'];

    if (type == ActionType.openPage || type == ActionType.showDialog) {
      if (layoutFormId == null || layoutFormId.toString().isEmpty) {
        throw FormatException(
            'Action "${json['id'] ?? 'unknown'}" (type: "${type.id}") requires "layout_form_id"');
      }
    }

    return ActionD(
      isMultiple: json['is_multiple'] ?? false,
      id: json['id'] ?? '',
      type: type,
      name: json['name'] ?? '',
      http: json['http'] != null ? HttpData.fromJson(json['http']) : null,
      onSuccess: json['on_success'] ?? 'toast',
      onFailure: json['on_failure'] ?? 'toast',
      reference: json['reference'],
      layoutFormId: layoutFormId,
      icon: json['icon'],
      iconCode: json['icon_code'],
      rule: json['rule'] == null
          ? null
          : Rule.fromMap(
              Map<String, dynamic>.from(json['rule'] as Map),
            ),
      width: json['width']?.toDouble(),
      confirmTitle: json['confirm_title'],
      confirmMessage: json['confirm_message'],
      iconColor: json['icon_color'],
      permission: json['permission'],
      successTitle: json['success_title'],
      successMessage: json['success_message'],
      copyLabel: json['copy_label'],
      copyValue: json['copy_value'],
      targetVariable: json['target_variable'],
    );
  }

  /// Optional: serialize back to JSON (useful for persistence/exports).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.id,
      'name': name,
      'on_success': onSuccess,
      'on_failure': onFailure,
      'is_multiple': isMultiple,
      'reference': reference,
      'layout_form_id': layoutFormId,
      'icon': icon,
      'icon_code': iconCode,
      if (rule != null) 'rule': rule!.toMap(),
      if (http != null) 'http': http!.toJson(),
      'width': width,
      'confirm_title': confirmTitle,
      'confirm_message': confirmMessage,
      'icon_color': iconColor,
      'permission': permission,
      'success_title': successTitle,
      'success_message': successMessage,
      'copy_label': copyLabel,
      'copy_value': copyValue,
      'target_variable': targetVariable,
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
      case ActionType.showConfirmationDialog:
        return DataAction.confirm;
      default:
        return DataAction.none;
    }
  }

  String getPermission(String entityId) {
    if (permission != null && permission!.isNotEmpty) return permission!;
    return '${entityId}_$id';
  }
}

extension ActionDListExtension on List<ActionD> {
  List<ActionD> get multipleRow =>
      where((element) => element.isMultiple).toList();

  List<ActionD> get singleRow =>
      where((element) => !element.isMultiple).toList();
}
