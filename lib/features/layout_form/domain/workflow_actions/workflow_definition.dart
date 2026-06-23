import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';


/// ============================================================================
/// WORKFLOW DEFINITION
/// ============================================================================
class WorkflowDefinition {
  final bool lockUiWhileSubmitting;
  final List<WorkflowAction> actions;
  final List<WorkflowAction> onSuccess;
  final List<WorkflowAction> onError;

  const WorkflowDefinition({
    required this.lockUiWhileSubmitting,
    required this.actions,
    required this.onSuccess,
    required this.onError,
  });

  factory WorkflowDefinition.fromJson(Map<String, dynamic> json) {
    try {
      final lockUi = (json['lock_ui_while_submitting'] == true) ||
          (json['lockUIWhileSubmitting'] == true);

      final actionsJson = _coerceList(
        json['actions'],
        field: 'actions',
        allowNull: false,
      );
      final onSuccessJson = _coerceList(
        json['on_success'] ?? json['onSuccess'],
        field: 'on_success',
      );
      final onErrorJson = _coerceList(
        json['on_error'] ?? json['onError'],
        field: 'on_error',
      );

      return WorkflowDefinition(
        lockUiWhileSubmitting: lockUi,
        actions: _mapActions(actionsJson, 'actions'),
        onSuccess: _mapActions(onSuccessJson, 'on_success'),
        onError: _mapActions(onErrorJson, 'on_error'),
      );
    } catch (e, st) {
      if (e is WorkflowException) rethrow;
      throw WorkflowConfigurationException(
        'Invalid workflow definition: $e',
        cause: e,
        stackTrace: st,
      );
    }
  }

  static List<dynamic> _coerceList(
    dynamic value, {
    required String field,
    bool allowNull = true,
  }) {
    if (value == null) {
      if (allowNull) return const [];
      throw WorkflowConfigurationException('"$field" is required.');
    }
    if (value is! List) {
      throw WorkflowConfigurationException('"$field" must be an array.');
    }
    return value;
  }

  static List<WorkflowAction> _mapActions(List<dynamic> raw, String label) {
    return raw.asMap().entries.map((entry) {
      final value = entry.value;
      if (value is! Map) {
        throw WorkflowConfigurationException(
          'Each $label item must be an object (index ${entry.key}).',
        );
      }
      return ActionFactory.fromJson(Map<String, dynamic>.from(value));
    }).toList();
  }
}

/// ============================================================================
/// ACTION FACTORY (JSON -> ACTION OBJECT)
/// ============================================================================
class ActionFactory {
  static WorkflowAction fromJson(Map<String, dynamic> json) {
    final type = (json['type'] ?? '').toString().trim();
    if (type.isEmpty) {
      throw const WorkflowConfigurationException('Action type is required.');
    }

    try {
      switch (type) {
        case 'validate':
          return ValidateAction.fromJson(json);

        case 'stop_workflow':
          return StopWorkflowAction.fromJson(json);

        case 'set_var':
          return SetVarAction.fromJson(json);

        case 'append_var':
          return AppendVarAction.fromJson(json);

        case 'toast':
          return ToastAction.fromJson(json);

        case 'close_modal':
          return CloseModalAction.fromJson(json);

        case 'refresh':
          return RefreshAction.fromJson(json);

        case 'http':
          return HttpAction.fromJson(json);

        case 'condition':
          return ConditionAction.fromJson(json);

        case 'loop':
          return LoopAction.fromJson(json);

        case 'try_catch':
          return TryCatchAction.fromJson(json);

        case 'export':
          return ExportAction.fromJson(json);

        default:
          throw WorkflowConfigurationException(
            'Unsupported action type "$type".',
          );
      }
    } catch (e, st) {
      if (e is WorkflowException) rethrow;
      throw WorkflowConfigurationException(
        'Invalid "$type" action: $e',
        cause: e,
        stackTrace: st,
      );
    }
  }

  static List<WorkflowAction> coerceActions(
    dynamic raw,
    String label, {
    bool allowNull = false,
  }) {
    if (raw == null) {
      if (allowNull) return const <WorkflowAction>[];
      throw WorkflowConfigurationException('"$label" is required.');
    }
    if (raw is! List) {
      throw WorkflowConfigurationException('"$label" must be an array.');
    }
    return raw.map<WorkflowAction>((e) {
      if (e is! Map) {
        throw WorkflowConfigurationException(
          'Each $label item must be an object.',
        );
      }
      return fromJson(Map<String, dynamic>.from(e));
    }).toList();
  }
}



/// ============================================================================
/// WORKFLOW EXECUTOR
/// ============================================================================
class WorkflowExecutor {
  final WorkflowDefinition definition;
  final UiBridge ui;

  const WorkflowExecutor(
    this.definition, {
    this.ui = const _DefaultNoopUiBridge(),
  });

  Future<WorkflowRunResult> run(WorkflowContext ctx) async {
    ui.log('🚀 Starting Workflow Run');
    try {
      ui.log('Executing main actions...');
      await _runActions(definition.actions, ctx);

      if (!ctx.stopped) {
        if (definition.onSuccess.isNotEmpty) {
          ui.log('Executing onSuccess actions...');
          await _runActions(definition.onSuccess, ctx);
        }
        ui.log('✅ Workflow completed successfully');
        return WorkflowRunResult.success(ctx.lastData);
      }

      ui.log('⏸ Workflow stopped');
      return WorkflowRunResult.stopped();
    } on WorkflowException catch (e) {
      ui.log('❌ Workflow failed: ${e.message}');
      await _runOnError(ctx);
      return WorkflowRunResult.failure(e);
    } catch (e, st) {
      ui.log('❌ Unexpected error: $e');
      final err = WorkflowExecutionException(
        'Unexpected workflow error: $e',
        cause: e,
        stackTrace: st,
      );
      await _runOnError(ctx);
      return WorkflowRunResult.failure(err);
    } finally {
      ui.log('🏁 Workflow finished');
    }
  }

  Future<void> _runActions(
    List<WorkflowAction> actions,
    WorkflowContext ctx,
  ) async {
    for (var i = 0; i < actions.length; i++) {
      final action = actions[i];
      if (ctx.stopped) return;
      ui.log('Executing step ${i + 1}: ${action.runtimeType}');
      await action.execute(ctx, ui);
    }
  }

  Future<void> _runOnError(WorkflowContext ctx) async {
    try {
      await _runActions(definition.onError, ctx);
    } catch (_) {
      // Swallow errors from onError to avoid masking the root cause.
    }
  }
}

class _DefaultNoopUiBridge implements UiBridge {
  const _DefaultNoopUiBridge();
  @override
  Future<void> toast(String variant, String message) async {}
  @override
  Future<void> closeModal() async {}
  @override
  Future<void> refresh(String target) async {}
  @override
  void log(String message) {}
}
