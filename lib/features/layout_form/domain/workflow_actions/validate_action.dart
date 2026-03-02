import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class ValidateAction implements WorkflowAction {
  final String scope; // "all" | "current_step"
  const ValidateAction({required this.scope});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final validator = ctx.validator;
    if (validator == null) {
      throw WorkflowValidationException(
        'Validation required for scope "$scope" but no validator provided.',
      );
    }

    try {
      print('[ValidateAction] Validating scope "$scope"');
      await validator(scope, ctx.form);
      print('[ValidateAction] Validation passed');
    } catch (e, st) {
      if (e is WorkflowException) rethrow;
      throw WorkflowValidationException(
        'Validation failed for scope "$scope": $e',
        cause: e,
        stackTrace: st,
      );
    }
  }
}
