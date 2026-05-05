import 'workflow_action.dart';

/// Sets a variable in the workflow context.
class SetVarAction extends WorkflowAction {
  final String key;
  final dynamic value;

  SetVarAction({required this.key, required this.value}) : super('set_var');

  factory SetVarAction.fromMap(Map<String, dynamic> map) =>
      SetVarAction(key: map['key'], value: map['value']);

  @override
  Map<String, dynamic> toMap() =>
      {'type': 'set_var', 'key': key, 'value': value};
}

/// Appends a value to a list variable.
class AppendVarAction extends WorkflowAction {
  final String key;
  final dynamic value;

  AppendVarAction({required this.key, required this.value})
      : super('append_var');

  factory AppendVarAction.fromMap(Map<String, dynamic> map) =>
      AppendVarAction(key: map['key'], value: map['value']);

  @override
  Map<String, dynamic> toMap() =>
      {'type': 'append_var', 'key': key, 'value': value};
}
