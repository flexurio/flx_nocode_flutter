import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class SetVarAction implements WorkflowAction {
  final String key;
  final dynamic value;
  const SetVarAction({required this.key, required this.value});

  factory SetVarAction.fromJson(Map<String, dynamic> json) {
    final key = (json['key'] ?? '').toString();
    if (key.isEmpty) {
      throw const WorkflowConfigurationException(
          '"set_var" action requires "key".');
    }
    return SetVarAction(key: key, value: json['value']);
  }

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final val = Template.resolve(value, ctx);
    print('[SetVarAction] Setting var "$key" = $val');
    ctx.vars[key] = val;
  }
}

class AppendVarAction implements WorkflowAction {
  final String key;
  final dynamic value;
  const AppendVarAction({required this.key, required this.value});

  factory AppendVarAction.fromJson(Map<String, dynamic> json) {
    final key = (json['key'] ?? '').toString();
    if (key.isEmpty) {
      throw const WorkflowConfigurationException(
          '"append_var" action requires "key".');
    }
    return AppendVarAction(key: key, value: json['value']);
  }

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final list = (ctx.vars[key] as List?) ?? <dynamic>[];
    final item = Template.resolve(value, ctx);
    print('[AppendVarAction] Appending to var "$key": $item');
    list.add(item);
    ctx.vars[key] = list;
  }
}
