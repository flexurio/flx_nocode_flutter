import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

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
          return ValidateAction(scope: (json['scope'] ?? 'all').toString());

        case 'stop_workflow':
          return const StopWorkflowAction();

        case 'set_var':
          final key = (json['key'] ?? '').toString();
          if (key.isEmpty) {
            throw const WorkflowConfigurationException(
              '"set_var" action requires "key".',
            );
          }
          return SetVarAction(key: key, value: json['value']);

        case 'append_var':
          final key = (json['key'] ?? '').toString();
          if (key.isEmpty) {
            throw const WorkflowConfigurationException(
              '"append_var" action requires "key".',
            );
          }
          return AppendVarAction(key: key, value: json['value']);

        case 'toast':
          return ToastAction(
            variant: (json['variant'] ?? 'info').toString(),
            message: json['message'] ?? '',
          );

        case 'close_modal':
          return const CloseModalAction();

        case 'refresh':
          return RefreshAction(target: (json['target'] ?? '').toString());

        case 'http':
          final name = (json['name'] ?? '').toString();
          final httpJson = json['http'];
          if (httpJson is! Map) {
            throw const WorkflowConfigurationException(
              '"http" action must include an "http" object.',
            );
          }
          final retryJson = json['retry'] as Map?;
          return HttpAction(
            name: name.isEmpty
                ? 'http_${DateTime.now().microsecondsSinceEpoch}'
                : name,
            http: HttpData.fromJson(Map<String, dynamic>.from(httpJson)),
            retry: retryJson == null
                ? null
                : RetryPolicy.fromJson(
                    Map<String, dynamic>.from(retryJson),
                  ),
            saveResultTo:
                (json['save_result_to'] ?? json['saveResultTo'])?.toString(),
          );

        case 'condition':
          final condition = (json['if'] ?? '').toString();
          if (condition.isEmpty) {
            throw const WorkflowConfigurationException(
              '"condition" action requires "if" expression.',
            );
          }

          final thenActions = _coerceActions(
            json['then_actions'] ?? json['then'],
            'then_actions',
          );
          final elseActions = _coerceActions(
            json['else_actions'] ?? json['else'],
            'else_actions',
            allowNull: true,
          );
          return ConditionAction(
            ifExpr: condition,
            thenActions: thenActions,
            elseActions: elseActions,
          );

        case 'loop':
          final itemVar =
              (json['item_var'] ?? json['itemVar'] ?? 'item').toString().trim();
          if (itemVar.isEmpty) {
            throw const WorkflowConfigurationException(
              '"loop" action requires "item_var".',
            );
          }

          final actions = _coerceActions(
            json['actions'],
            'actions',
            allowNull: false,
          );
          return LoopAction(
            items: json['items'],
            itemVar: itemVar,
            indexVar: (json['index_var'] ?? json['indexVar'])?.toString(),
            actions: actions,
          );

        case 'try_catch':
          final tryActions = _coerceActions(
            json['try_actions'] ?? json['try'],
            'try_actions',
          );
          final catchActions = _coerceActions(
            json['catch_actions'] ?? json['catch'],
            'catch_actions',
          );
          return TryCatchAction(
            tryActions: tryActions,
            catchActions: catchActions,
          );

        case 'export':
          final format = (json['format'] ?? 'xlsx').toString().trim();
          final columnsRaw = (json['columns'] as List?) ?? const [];
          final columns = columnsRaw
              .whereType<Map<String, dynamic>>()
              .map((e) => TColumn.fromJson(e))
              .toList();

          return ExportAction(
            format: format,
            columns: columns,
            dataSource: (json['data_source'] ?? json['dataSource'])?.toString(),
            saveResultTo:
                (json['save_result_to'] ?? json['saveResultTo'])?.toString(),
          );

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

  static List<WorkflowAction> _coerceActions(
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

class _NoopAction implements WorkflowAction {
  const _NoopAction();
  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {}
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
    print('[WorkflowExecutor] Run STARTED');
    try {
      print('[WorkflowExecutor] Executing main actions...');
      await _runActions(definition.actions, ctx);

      print(
          '[WorkflowExecutor] Main actions completed. Stopped: ${ctx.stopped}');
      if (!ctx.stopped) {
        print('[WorkflowExecutor] Executing onSuccess actions...');
        await _runActions(definition.onSuccess, ctx);
        print('[WorkflowExecutor] Run SUCCESS');
        return WorkflowRunResult.success(ctx.lastData);
      }

      print('[WorkflowExecutor] Run STOPPED');
      return WorkflowRunResult.stopped();
    } on WorkflowException catch (e) {
      print('[WorkflowExecutor] Run FAILED (WorkflowException): $e');
      await _runOnError(ctx);
      return WorkflowRunResult.failure(e);
    } catch (e, st) {
      print('[WorkflowExecutor] Run FAILED (Unexpected): $e\\n$st');
      final err = WorkflowExecutionException(
        'Unexpected workflow error: $e',
        cause: e,
        stackTrace: st,
      );
      await _runOnError(ctx);
      return WorkflowRunResult.failure(err);
    } finally {
      print('[WorkflowExecutor] Run ENDED');
    }
  }

  Future<void> _runActions(
    List<WorkflowAction> actions,
    WorkflowContext ctx,
  ) async {
    for (var i = 0; i < actions.length; i++) {
      final action = actions[i];
      if (ctx.stopped) {
        print('[WorkflowExecutor] Action loop stopped at index $i');
        return;
      }
      print(
          '[WorkflowExecutor] Executing Action #${i + 1} (${action.runtimeType})');
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
}
