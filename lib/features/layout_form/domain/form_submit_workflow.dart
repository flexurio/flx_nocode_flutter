import 'dart:async';
import 'dart:convert';

import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
export 'workflow_actions/workflow_definition.dart';
export 'workflow_actions/condition_action.dart';
export 'workflow_actions/export_action.dart';
export 'workflow_actions/http_action.dart';
export 'workflow_actions/loop_action.dart';
export 'workflow_actions/stop_workflow_action.dart';
export 'workflow_actions/try_catch_action.dart';
export 'workflow_actions/ui_actions.dart';
export 'workflow_actions/validate_action.dart';
export 'workflow_actions/var_actions.dart';
import '../../../src/app/model/configuration.dart';

typedef WorkflowValidator = Future<void> Function(
    String scope, Map<String, dynamic> form);

enum WorkflowRunStatus { success, stopped, failed }

class WorkflowRunResult {
  final WorkflowRunStatus status;
  final WorkflowException? error;
  final dynamic data;

  const WorkflowRunResult._(this.status, [this.error, this.data]);

  factory WorkflowRunResult.success([dynamic data]) =>
      WorkflowRunResult._(WorkflowRunStatus.success, null, data);

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
  final List<String> permissions;

  const AuthContext({required this.permissions});
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
  final Map<String, dynamic> data;
  final Map<String, dynamic> vars;
  final Map<String, HttpResult> http;

  final AuthContext auth;
  final HttpExecutor httpExecutor;
  final WorkflowValidator? validator;

  bool stopped = false;
  dynamic lastData;

  WorkflowContext({
    required this.form,
    this.record = const {},
    this.data = const {},
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
  void log(String message);
}

class NoopUiBridge implements UiBridge {
  @override
  Future<void> toast(String variant, String message) async {}

  @override
  Future<void> closeModal() async {}

  @override
  Future<void> refresh(String target) async {}

  @override
  void log(String message) {}
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
  static final RegExp _singleReg =
      RegExp(r'^\s*\{\{\s*((?:(?!\}\}).)*)\s*\}\}\s*$', dotAll: true);

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
    try {
      final interpolated = template.interpolateJavascriptStrict(scope);
      if (_looksUnresolved(interpolated)) {
        throw WorkflowInterpolationException(
          'Unable to resolve expressions inside "$template".',
        );
      }
      return interpolated;
    } catch (e) {
      if (e is WorkflowInterpolationException) rethrow;

      throw WorkflowInterpolationException(
        'Unable to resolve expressions inside "$template": $e',
        cause: e,
      );
    }
  }

  static bool _looksUnresolved(String value) {
    return value.contains('{{') && value.contains('}}');
  }
}

class _WorkflowScopeBuilder {
  static Map<String, dynamic> build(WorkflowContext ctx) {
    final scope = <String, dynamic>{
      'form': _sanitize(ctx.form),
      'record': _sanitize(ctx.record),
      'data': _sanitize(ctx.data),
      'vars': _sanitize(ctx.vars),
      'auth': <String, dynamic>{
        'token': _safeGetToken(),
        'permissions': ctx.auth.permissions,
      },
      'http': ctx.http.map(
        (k, v) => MapEntry(k, <String, dynamic>{
          'status': v.status,
          'data': _sanitize(v.data),
          'headers': _sanitize(v.headers),
        }),
      ),
      'user_id': _safeGetUserId(),
    };

    // Add globals from Configuration
    try {
      scope['backend_host'] = Configuration.instance.backendHost;
      scope['app_name'] = Configuration.instance.appName;
      for (final v in Configuration.instance.variables) {
        scope[v.key] = v.value;
      }
    } catch (_) {
      // Configuration not initialized yet
    }

    // Spread data into root for convenience (e.g. {{ id }} instead of {{ data.id }})
    if (ctx.data.isNotEmpty) {
      for (final entry in ctx.data.entries) {
        if (!scope.containsKey(entry.key)) {
          scope[entry.key] = _sanitize(entry.value);
        }
      }
    }

    return scope;
  }

  static String _safeGetToken() {
    try {
      return UserRepositoryApp.instance.token ?? '';
    } catch (_) {
      return '';
    }
  }

  static String _safeGetUserId() {
    try {
      return UserRepositoryApp.instance.userApp?.id?.toString() ?? '';
    } catch (_) {
      return '';
    }
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
  static final RegExp _wrappedReg =
      RegExp(r'^\s*\{\{\s*((?:(?!\}\}).)*)\s*\}\}\s*$', dotAll: true);
  static final RegExp _inlineExprReg =
      RegExp(r'\{\{\s*((?:(?!\}\}).)*)\s*\}\}', dotAll: true);

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
    try {
      final interpolated = template.interpolateJavascriptStrict(scope);

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
        return cleaned;
      }
    } catch (e) {
      if (e is WorkflowException) rethrow;
      throw WorkflowInterpolationException(
        'Unable to resolve expression "$expr": $e',
      );
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
