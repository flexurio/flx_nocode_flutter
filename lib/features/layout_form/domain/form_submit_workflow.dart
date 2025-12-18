// DEFAULT JSON STYLE
// ------------------
// ✅ Default keys use snake_case (recommended).
//    (We still accept some legacy camelCase for backward compatibility,
//     but all examples + generated configs should be snake_case.)
//
// INTERPOLATION STYLE
// -------------------
// ✅ JS-style interpolation using {{ ... }}
//
// SUPPORTED FEATURES
// ------------------
// ✔ Multi-step form submit (create / edit)
// ✔ Multiple HTTP requests (sequential)
// ✔ Looping (e.g. order → order_detail)
// ✔ Condition / branching based on runtime data
// ✔ Try / Catch (rollback, compensation)
// ✔ Retry policy per HTTP
// ✔ UI bridge hooks (toast, close modal, refresh)
//
// ============================================================================
//
// ✅ COMPLEX STUDY CASE
//
// Scenario: Sales Order end-to-end (very complex)
// - validate all steps
// - customer check, credit check, rate check
// - create order header
// - loop items: insert details with retry, optional attachment upload
// - recalc total, mismatch policy
// - approval logic
// - audit log
//
// NOTE:
// - {{ form.* }} refers to ctx.form
// - {{ record.* }} refers to ctx.record
// - {{ vars.* }} refers to ctx.vars
// - {{ http.<name>.status }} / {{ http.<name>.data.* }} refers to saved http results
//
// {
//   "type": "workflow",
//   "lock_ui_while_submitting": true,
//   "actions": [
//     { "type": "validate", "scope": "all" },
//
//     { "type": "set_var", "key": "client_total", "value": "{{ sum(form.items, \"qty*price\") }}" },
//     { "type": "set_var", "key": "failed_items", "value": [] },
//
//     {
//       "type": "http",
//       "name": "get_customer",
//       "save_result_to": "http.get_customer",
//       "http": {
//         "method": "GET",
//         "url": "https://api.example.com/customers/{{ form.customer_id }}",
//         "headers": { "authorization": "Bearer {{ auth.token }}" },
//         "body": {},
//         "use_form_data": false
//       }
//     },
//     {
//       "type": "condition",
//       "if": "{{ http.get_customer.data.is_active }} != true",
//       "then_actions": [
//         { "type": "toast", "variant": "error", "message": "Customer tidak aktif" },
//         { "type": "stop_workflow" }
//       ]
//     },
//
//     {
//       "type": "http",
//       "name": "create_order",
//       "save_result_to": "http.create_order",
//       "http": {
//         "method": "POST",
//         "url": "https://api.example.com/orders",
//         "headers": {
//           "content-type": "application/json",
//           "authorization": "Bearer {{ auth.token }}"
//         },
//         "body": {
//           "customer_id": "{{ form.customer_id }}",
//           "order_date": "{{ form.order_date }}",
//           "notes": "{{ form.notes }}"
//         },
//         "use_form_data": false
//       }
//     },
//     {
//       "type": "condition",
//       "if": "{{ http.create_order.status }} < 200 || {{ http.create_order.status }} >= 300",
//       "then_actions": [
//         { "type": "toast", "variant": "error", "message": "Gagal membuat order header" },
//         { "type": "stop_workflow" }
//       ]
//     },
//     { "type": "set_var", "key": "order_id", "value": "{{ http.create_order.data.id }}" },
//
//     {
//       "type": "loop",
//       "items": "{{ form.items }}",
//       "item_var": "item",
//       "index_var": "i",
//       "actions": [
//         {
//           "type": "try_catch",
//           "try_actions": [
//             {
//               "type": "http",
//               "name": "insert_detail",
//               "http": {
//                 "method": "POST",
//                 "url": "https://api.example.com/orders/{{ vars.order_id }}/items",
//                 "headers": {
//                   "content-type": "application/json",
//                   "authorization": "Bearer {{ auth.token }}"
//                 },
//                 "body": {
//                   "product_id": "{{ vars.item.product_id }}",
//                   "qty": "{{ vars.item.qty }}",
//                   "price": "{{ vars.item.price }}"
//                 },
//                 "use_form_data": false
//               },
//               "retry": { "max": 2, "delay_ms": 400 }
//             },
//
//             {
//               "type": "condition",
//               "if": "{{ vars.item.attachment }} != null",
//               "then_actions": [
//                 {
//                   "type": "http",
//                   "name": "upload_attachment",
//                   "http": {
//                     "method": "POST",
//                     "url": "https://api.example.com/orders/{{ vars.order_id }}/items/{{ vars.item.product_id }}/attachment",
//                     "headers": { "authorization": "Bearer {{ auth.token }}" },
//                     "body": { "file": "{{ vars.item.attachment }}" },
//                     "use_form_data": true
//                   }
//                 }
//               ]
//             }
//           ],
//           "catch_actions": [
//             {
//               "type": "append_var",
//               "key": "failed_items",
//               "value": {
//                 "index": "{{ vars.i }}",
//                 "product_id": "{{ vars.item.product_id }}",
//                 "message": "detail failed"
//               }
//             }
//           ]
//         }
//       ]
//     },
//
//     {
//       "type": "http",
//       "name": "audit",
//       "http": {
//         "method": "POST",
//         "url": "https://api.example.com/audit",
//         "headers": {
//           "content-type": "application/json",
//           "authorization": "Bearer {{ auth.token }}"
//         },
//         "body": {
//           "entity": "order",
//           "entity_id": "{{ vars.order_id }}",
//           "failed_items": "{{ vars.failed_items }}"
//         },
//         "use_form_data": false
//       }
//     }
//
//   ],
//   "on_success": [
//     { "type": "toast", "variant": "success", "message": "Order tersimpan" },
//     { "type": "close_modal" },
//     { "type": "refresh", "target": "orders" }
//   ],
//   "on_error": [
//     { "type": "toast", "variant": "error", "message": "Submit gagal" }
//   ]
// }
//
// ============================================================================

import 'dart:async';
import 'dart:convert';

import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

typedef WorkflowValidator = Future<void> Function(
    String scope, Map<String, dynamic> form);

enum WorkflowRunStatus { success, stopped, failed }

class WorkflowRunResult {
  final WorkflowRunStatus status;
  final WorkflowException? error;

  const WorkflowRunResult._(this.status, [this.error]);

  factory WorkflowRunResult.success() =>
      const WorkflowRunResult._(WorkflowRunStatus.success);

  factory WorkflowRunResult.stopped() =>
      const WorkflowRunResult._(WorkflowRunStatus.stopped);

  factory WorkflowRunResult.failure(WorkflowException error) =>
      WorkflowRunResult._(WorkflowRunStatus.failed, error);

  bool get isSuccess => status == WorkflowRunStatus.success;
}

class WorkflowException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const WorkflowException(this.message, {this.cause, this.stackTrace});

  @override
  String toString() => 'WorkflowException: $message';
}

class WorkflowConfigurationException extends WorkflowException {
  const WorkflowConfigurationException(
    String message, {
    Object? cause,
    StackTrace? stackTrace,
  }) : super(message, cause: cause, stackTrace: stackTrace);
}

class WorkflowValidationException extends WorkflowException {
  const WorkflowValidationException(
    String message, {
    Object? cause,
    StackTrace? stackTrace,
  }) : super(message, cause: cause, stackTrace: stackTrace);
}

class WorkflowExecutionException extends WorkflowException {
  const WorkflowExecutionException(
    String message, {
    Object? cause,
    StackTrace? stackTrace,
  }) : super(message, cause: cause, stackTrace: stackTrace);
}

class WorkflowInterpolationException extends WorkflowExecutionException {
  const WorkflowInterpolationException(
    String message, {
    Object? cause,
    StackTrace? stackTrace,
  }) : super(message, cause: cause, stackTrace: stackTrace);
}

/// ============================================================================
/// AUTH CONTEXT
/// ============================================================================
class AuthContext {
  final String token;
  final List<String> permissions;

  const AuthContext({required this.token, required this.permissions});
}

/// ============================================================================
/// HTTP RESULT
/// ============================================================================
class HttpResult {
  final int status;
  final dynamic data;
  final Map<String, dynamic> headers;

  const HttpResult({
    required this.status,
    required this.data,
    this.headers = const {},
  });

  bool get isSuccess => status >= 200 && status < 300;
}

/// ============================================================================
/// HTTP EXECUTOR (PLUG YOUR DIO IMPLEMENTATION HERE)
/// ============================================================================
abstract class HttpExecutor {
  Future<HttpResult> execute(HttpData request);
}

/// ============================================================================
/// WORKFLOW RUNTIME CONTEXT
/// ============================================================================
class WorkflowContext {
  final Map<String, dynamic> form;
  final Map<String, dynamic> record;
  final Map<String, dynamic> vars;
  final Map<String, HttpResult> http;

  final AuthContext auth;
  final HttpExecutor httpExecutor;
  final WorkflowValidator? validator;

  bool stopped = false;

  WorkflowContext({
    required this.form,
    this.record = const {},
    Map<String, dynamic>? vars,
    Map<String, HttpResult>? http,
    required this.auth,
    required this.httpExecutor,
    this.validator,
  })  : vars = vars ?? <String, dynamic>{},
        http = http ?? <String, HttpResult>{};
}

/// ============================================================================
/// UI BRIDGE (OPTIONAL)
/// ============================================================================
abstract class UiBridge {
  Future<void> toast(String variant, String message);
  Future<void> closeModal();
  Future<void> refresh(String target);
}

class NoopUiBridge implements UiBridge {
  @override
  Future<void> toast(String variant, String message) async {}

  @override
  Future<void> closeModal() async {}

  @override
  Future<void> refresh(String target) async {}
}

/// ============================================================================
/// TEMPLATE ENGINE ( {{ }} INTERPOLATION )
/// ============================================================================
/// Resolves strings/maps/lists recursively, using {{ expression }}.
///
/// Example:
/// - "Hello {{ form.name }}"
/// - "{{ http.create_order.data.id }}"
class Template {
  static final RegExp _singleReg = RegExp(r'^\s*\{\{\s*(.*?)\s*\}\}\s*$');

  static dynamic resolve(dynamic input, WorkflowContext ctx) {
    if (input == null) return null;
    if (input is String) return _resolveString(input, ctx);
    if (input is num || input is bool) return input;
    if (input is List) return input.map((e) => resolve(e, ctx)).toList();
    if (input is Map)
      return input.map((k, v) => MapEntry(k.toString(), resolve(v, ctx)));
    return input;
  }

  static dynamic _resolveString(String value, WorkflowContext ctx) {
    if (value.trim().isEmpty) return value;

    final onlyExpr = _singleReg.firstMatch(value.trim());
    if (onlyExpr != null) {
      final expr = onlyExpr.group(1)!;
      return Expr.eval(expr, ctx);
    }

    return _interpolateInline(value, ctx);
  }

  static String _interpolateInline(String template, WorkflowContext ctx) {
    final scope = _WorkflowScopeBuilder.build(ctx);
    final interpolated = template.interpolateJavascript(scope);
    if (_looksUnresolved(interpolated)) {
      throw WorkflowInterpolationException(
        'Unable to resolve expressions inside "$template".',
      );
    }
    return interpolated;
  }

  static bool _looksUnresolved(String value) {
    return value.contains('{{') && value.contains('}}');
  }
}

class _WorkflowScopeBuilder {
  static Map<String, dynamic> build(WorkflowContext ctx) {
    return <String, dynamic>{
      'form': _sanitize(ctx.form),
      'record': _sanitize(ctx.record),
      'vars': _sanitize(ctx.vars),
      'auth': <String, dynamic>{
        'token': ctx.auth.token,
        'permissions': ctx.auth.permissions,
      },
      'http': ctx.http.map(
        (k, v) => MapEntry(k, <String, dynamic>{
          'status': v.status,
          'data': _sanitize(v.data),
          'headers': _sanitize(v.headers),
        }),
      ),
    };
  }

  static dynamic _sanitize(dynamic value) {
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), _sanitize(v)));
    }
    if (value is List) return value.map(_sanitize).toList();
    if (value is HttpResult) {
      return <String, dynamic>{
        'status': value.status,
        'data': _sanitize(value.data),
        'headers': _sanitize(value.headers),
      };
    }
    if (value is num || value is bool || value is String) return value;
    if (value is DateTime) return value.toIso8601String();
    return value?.toString();
  }
}

/// ============================================================================
/// VERY SMALL EXPRESSION EVALUATOR
/// ============================================================================
/// Supports:
/// - Paths: form.x, record.id, vars.order_id, vars.item.qty
/// - HTTP: http.create_order.status, http.create_order.data.id
/// - auth: auth.token, auth.permissions
/// - Comparisons: == != < <= > >=
/// - Logic: && ||
/// - Literals: true false null, numbers, "strings"
/// - Functions:
///     abs(x)
///     length(x)
///     contains(list, value)
///     sum(listPath, "qty*price")   (very small helper)
///
/// NOTE: This is intentionally minimal. For heavy expressions,
///       consider plugging a real parser later.
class Expr {
  static final RegExp _wrappedReg = RegExp(r'^\s*\{\{\s*(.*?)\s*\}\}\s*$');
  static final RegExp _inlineExprReg = RegExp(r'\{\{\s*(.*?)\s*\}\}');

  static dynamic eval(String expr, WorkflowContext ctx) {
    final normalized = _normalize(expr);
    final cleaned = _stripInlinePlaceholders(normalized);
    try {
      return _JsEvaluator.evaluate(cleaned, ctx);
    } on WorkflowException {
      rethrow;
    } catch (e, st) {
      throw WorkflowExecutionException(
        'Failed to evaluate expression "$expr".',
        cause: e,
        stackTrace: st,
      );
    }
  }

  static bool evalCondition(String conditionExpr, WorkflowContext ctx) {
    final result = eval(conditionExpr, ctx);
    return _asBool(result);
  }

  static bool _asBool(dynamic value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    final str = value?.toString().trim().toLowerCase();
    if (str == null || str.isEmpty) return false;
    if (str == 'true') return true;
    if (str == 'false') return false;
    final parsed = num.tryParse(str);
    if (parsed != null) return parsed != 0;
    return true;
  }

  static String _normalize(String expr) {
    final trimmed = expr.trim();
    final match = _wrappedReg.firstMatch(trimmed);
    if (match != null) return match.group(1)!;
    return trimmed;
  }

  static String _stripInlinePlaceholders(String expr) {
    return expr.replaceAllMapped(
      _inlineExprReg,
      (m) => m.group(1)?.trim() ?? '',
    );
  }
}

class _JsEvaluator {
  static dynamic evaluate(String expr, WorkflowContext ctx) {
    final scope = _WorkflowScopeBuilder.build(ctx);
    final wrappedExpr = 'JSON.stringify($expr)';
    final template = '{{ $wrappedExpr }}';
    final interpolated = template.interpolateJavascript(scope);

    if (interpolated == template) return null;
    if (_looksUnresolved(interpolated)) {
      throw WorkflowInterpolationException(
        'Unable to resolve expression "$expr".',
      );
    }

    final cleaned = interpolated.trim();
    if (cleaned.isEmpty || cleaned == 'undefined') return null;

    try {
      return jsonDecode(cleaned);
    } catch (_) {
      final lower = cleaned.toLowerCase();
      if (lower == 'null') return null;
      if (lower == 'true') return true;
      if (lower == 'false') return false;
      final n = num.tryParse(cleaned);
      if (n != null) return n;
      return cleaned;
    }
  }

  static bool _looksUnresolved(String value) {
    return value.contains('{{') && value.contains('}}');
  }
}

/// ============================================================================
/// RETRY POLICY
/// ============================================================================
class RetryPolicy {
  final int max;
  final int delayMs;

  const RetryPolicy({required this.max, required this.delayMs});

  factory RetryPolicy.fromJson(Map<String, dynamic> json) {
    // snake_case: delay_ms, legacy: delayMs
    final delay = json['delay_ms'] ?? json['delayMs'] ?? 0;
    return RetryPolicy(
      max: (json['max'] is int)
          ? (json['max'] as int)
          : int.tryParse('${json['max']}') ?? 0,
      delayMs: (delay is int) ? delay : int.tryParse('$delay') ?? 0,
    );
  }
}

/// ============================================================================
/// ACTION BASE
/// ============================================================================
abstract class WorkflowAction {
  Future<void> execute(WorkflowContext ctx, UiBridge ui);
}

/// ============================================================================
/// CORE ACTIONS
/// ============================================================================

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
      await validator(scope, ctx.form);
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

class StopWorkflowAction implements WorkflowAction {
  const StopWorkflowAction();
  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    ctx.stopped = true;
  }
}

class SetVarAction implements WorkflowAction {
  final String key;
  final dynamic value;
  const SetVarAction({required this.key, required this.value});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    ctx.vars[key] = Template.resolve(value, ctx);
  }
}

class AppendVarAction implements WorkflowAction {
  final String key;
  final dynamic value;
  const AppendVarAction({required this.key, required this.value});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final list = (ctx.vars[key] as List?) ?? <dynamic>[];
    list.add(Template.resolve(value, ctx));
    ctx.vars[key] = list;
  }
}

class ToastAction implements WorkflowAction {
  final String variant;
  final dynamic message;
  const ToastAction({required this.variant, required this.message});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final msg = Template.resolve(message, ctx)?.toString() ?? '';
    await ui.toast(variant, msg);
  }
}

class CloseModalAction implements WorkflowAction {
  const CloseModalAction();
  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    await ui.closeModal();
  }
}

class RefreshAction implements WorkflowAction {
  final String target;
  const RefreshAction({required this.target});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final t = Template.resolve(target, ctx)?.toString() ?? target;
    await ui.refresh(t);
  }
}

class HttpAction implements WorkflowAction {
  final String name;
  final HttpData http;
  final RetryPolicy? retry;

  /// If provided, will save result into ctx.http[name] automatically.
  /// Additionally supports "save_result_to": "http.some_name"
  /// but the canonical storage is ctx.http[name].
  final String? saveResultTo;

  const HttpAction({
    required this.name,
    required this.http,
    this.retry,
    this.saveResultTo,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    int attempt = 0;
    final actionLabel = name.isEmpty ? 'http' : name;
    while (true) {
      try {
        final resolvedHeaders = Template.resolve(http.headers, ctx);
        if (resolvedHeaders is! Map) {
          throw const WorkflowExecutionException(
            'HTTP headers must resolve to an object.',
          );
        }

        final resolvedBody = Template.resolve(http.body, ctx);
        if (resolvedBody is! Map) {
          throw const WorkflowExecutionException(
            'HTTP body must resolve to an object.',
          );
        }

        final resolved = HttpData(
          method:
              Template.resolve(http.method, ctx)?.toString().toUpperCase() ??
                  http.method.toUpperCase(),
          url: Template.resolve(http.url, ctx)?.toString() ?? http.url,
          headers: resolvedHeaders.map<String, String>(
            (k, v) => MapEntry(k.toString(), '$v'),
          ),
          body: resolvedBody.map<String, dynamic>(
            (k, v) => MapEntry(k.toString(), v),
          ),
          useFormData: http.useFormData,
        );

        if (resolved.url.isEmpty) {
          throw WorkflowExecutionException(
            'HTTP "$actionLabel" is missing a valid URL.',
          );
        }

        final result = await ctx.httpExecutor.execute(resolved);

        // Save by name (primary)
        ctx.http[actionLabel] = result;

        // Optional secondary save path: "http.xxx"
        if (saveResultTo != null && saveResultTo!.startsWith('http.')) {
          final alias = saveResultTo!.substring('http.'.length);
          ctx.http[alias] = result;
        }

        // If HTTP is not success, throw to let try/catch handle it.
        if (!result.isSuccess) {
          throw Exception('HTTP $name failed with status ${result.status}');
        }
        return;
      } catch (e) {
        attempt++;
        if (retry == null || attempt > retry!.max) {
          if (e is WorkflowException) rethrow;
          throw WorkflowExecutionException(
            'HTTP "$actionLabel" failed: $e',
            cause: e,
          );
        }
        await Future.delayed(Duration(milliseconds: retry!.delayMs));
      }
    }
  }
}

class ConditionAction implements WorkflowAction {
  final String ifExpr;
  final List<WorkflowAction> thenActions;
  final List<WorkflowAction> elseActions;

  const ConditionAction({
    required this.ifExpr,
    required this.thenActions,
    required this.elseActions,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    try {
      final ok = Expr.evalCondition(ifExpr, ctx);
      final branch = ok ? thenActions : elseActions;

      for (final a in branch) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
    } catch (e, st) {
      if (e is WorkflowException) rethrow;
      throw WorkflowExecutionException(
        'Condition "$ifExpr" failed: $e',
        cause: e,
        stackTrace: st,
      );
    }
  }
}

class LoopAction implements WorkflowAction {
  final dynamic items; // list literal OR string with {{ }} OR already List
  final String itemVar;
  final String? indexVar;
  final List<WorkflowAction> actions;

  const LoopAction({
    required this.items,
    required this.itemVar,
    this.indexVar,
    required this.actions,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final resolved = Template.resolve(items, ctx);
    if (resolved == null) return;
    if (resolved is! List) {
      throw WorkflowExecutionException(
        'Loop items must resolve to a list, got ${resolved.runtimeType}.',
      );
    }

    for (var i = 0; i < resolved.length; i++) {
      if (ctx.stopped) return;
      ctx.vars[itemVar] = resolved[i];
      if (indexVar != null) ctx.vars[indexVar!] = i;

      for (final a in actions) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
    }
  }
}

class TryCatchAction implements WorkflowAction {
  final List<WorkflowAction> tryActions;
  final List<WorkflowAction> catchActions;

  const TryCatchAction({required this.tryActions, required this.catchActions});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    try {
      for (final a in tryActions) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
    } catch (e, st) {
      ctx.vars['last_error'] = e is WorkflowException ? e.message : '$e';
      ctx.vars['last_error_stacktrace'] = st.toString();
      for (final a in catchActions) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
    }
  }
}

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
    try {
      await _runActions(definition.actions, ctx);

      if (!ctx.stopped) {
        await _runActions(definition.onSuccess, ctx);
        return WorkflowRunResult.success();
      }

      return WorkflowRunResult.stopped();
    } on WorkflowException catch (e) {
      await _runOnError(ctx);
      return WorkflowRunResult.failure(e);
    } catch (e, st) {
      final err = WorkflowExecutionException(
        'Unexpected workflow error: $e',
        cause: e,
        stackTrace: st,
      );
      await _runOnError(ctx);
      return WorkflowRunResult.failure(err);
    }
  }

  Future<void> _runActions(
    List<WorkflowAction> actions,
    WorkflowContext ctx,
  ) async {
    for (final action in actions) {
      if (ctx.stopped) return;
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
