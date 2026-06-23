import 'package:dio/dio.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart'
    as configuration;

import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData;

part 'entity_controller.freezed.dart';

@freezed
abstract class EntityState with _$EntityState {
  const factory EntityState.initial() = Initial;
  const factory EntityState.loading() = Loading;
  const factory EntityState.success(Map<String, dynamic>? data) = Success;
  const factory EntityState.error(String error) = Error;
}

class EntityController extends GetxController {
  static const bool enableLog = true;

  final configuration.EntityCustom entity;
  final _state = const EntityState.initial().obs;
  EntityState get state => _state.value;

  EntityController(this.entity);

  void reset() {
    _state.value = const EntityState.initial();
  }

  void execute({
    required Map<String, dynamic> data,
    required String method,
    required String url,
    required Map<String, dynamic> filters,
  }) async {
    _state.value = const EntityState.loading();
    _logSection('EXECUTE', '🚀 Starting manual execution');
    _logKV('URL', url);
    _logKV('Method', method);
    _logKV('Payload', data);

    try {
      final response = await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: url,
        method: method,
        headers: entity.backend.create?.headers,
        data: Map.from(data)
          ..addAll(entity.backend.create?.body(filters: filters) ?? {}),
        mockEnabled: entity.backend.create?.mockEnabled ?? false,
        mockData: entity.backend.create?.mockData,
      );
      _logSuccess('EXECUTE', response.data);
      _state.value = EntityState.success(response.data);
    } catch (error) {
      _logError('EXECUTE', error);
      _state.value = EntityState.error(errorMessage(error));
    }
  }

  void otherEvent({
    required Map<String, dynamic> data,
    required BackendOther event,
  }) async {
    _state.value = const EntityState.loading();
    final resolvedUrl = urlWithValuesReplace(event.url, data);
    _logSection('OTHER EVENT', '🚀 Starting other event: ${event.title}');
    _logKV('URL', resolvedUrl);
    _logKV('Method', event.method);

    try {
      final response = await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: resolvedUrl,
        method: event.method,
        headers: event.headers,
        mockEnabled: event.mockEnabled,
        mockData: event.mockData,
      );
      _logSuccess('OTHER EVENT', response.data);
      _state.value = EntityState.success(response.data);
    } catch (error) {
      _logError('OTHER EVENT', error);
      _state.value = EntityState.error(errorMessage(error));
    }
  }

  void create({
    required Map<String, dynamic> data,
    required Map<String, dynamic> filters,
  }) async {
    _state.value = const EntityState.loading();
    _logSection('CREATE', '🚀 Starting create operation');
    _logKV('Entity', entity.id);

    try {
      if (!data.containsKey('id')) {
        const msg =
            'ID is required to perform the create operation but was not provided in the data map.';
        _logError('CREATE', msg);
        _state.value = const EntityState.error(msg);
        return;
      }

      final response = await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: entity.backend.create!.url,
        method: entity.backend.create!.method,
        headers: entity.backend.create!.headers,
        data: Map.from(data)
          ..addAll(entity.backend.create!.body(filters: filters)),
        mockEnabled: entity.backend.create!.mockEnabled,
        mockData: entity.backend.create!.mockData,
      );
      _logSuccess('CREATE', response.data);
      _state.value = EntityState.success(response.data);
    } on FormatException catch (error) {
      _logError('CREATE', error.message);
      _state.value = EntityState.error(error.message);
    } catch (error) {
      _logError('CREATE', error);
      _state.value = EntityState.error(errorMessage(error));
    }
  }

  void edit({
    required Map<String, dynamic> data,
    required Map<String, dynamic> filters,
  }) async {
    _state.value = const EntityState.loading();
    _logSection('EDIT', '🚀 Starting edit operation');
    _logKV('Entity', entity.id);
    _logKV('ID', data['id']);

    try {
      if (!data.containsKey('id')) {
        const msg =
            'ID is required to perform the edit operation but was not provided in the data map.';
        _logError('EDIT', msg);
        _state.value = const EntityState.error(msg);
        return;
      }

      final response = await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: entity.backend.update!.url.replaceFirst(
          '{id}',
          Uri.encodeComponent(data['id']),
        ),
        method: entity.backend.update!.method,
        headers: entity.backend.update!.headers,
        data: Map.from(data)
          ..addAll(entity.backend.update!.body(filters: filters)),
        mockEnabled: entity.backend.update!.mockEnabled,
        mockData: entity.backend.update!.mockData,
      );
      _logSuccess('EDIT', response.data);
      _state.value = EntityState.success(response.data);
    } catch (error) {
      _logError('EDIT', error);
      _state.value = EntityState.error(errorMessage(error));
    }
  }

  void delete(String id) async {
    _state.value = const EntityState.loading();
    _logSection('DELETE', '🚀 Starting delete operation');
    _logKV('Entity', entity.id);
    _logKV('ID', id);

    try {
      await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: entity.backend.deleteX!.url.replaceFirst(
          '{id}',
          Uri.encodeComponent(id),
        ),
        method: entity.backend.deleteX!.method,
        headers: entity.backend.deleteX!.headers,
        mockEnabled: entity.backend.deleteX!.mockEnabled,
        mockData: entity.backend.deleteX!.mockData,
      );
      _logSuccess('DELETE', 'Deleted successfully');
      _state.value = const EntityState.success(null);
    } catch (error) {
      _logError('DELETE', error);
      _state.value = EntityState.error(errorMessage(error));
    }
  }

  void submitWorkflow({
    required Map<String, dynamic> form,
    required Map<String, dynamic> data,
    required Map<String, dynamic> workflow,
  }) async {
    _state.value = const EntityState.loading();
    _logSection('WORKFLOW', '🚀 Starting Workflow Submission');
    _logKV('Form (User Input)', form);
    _logKV('Data (Record)', data);

    try {
      final definition = WorkflowDefinition.fromJson(workflow);
      final executor = GetxHttpExecutor();

      final ctx = WorkflowContext(
        form: form,
        data: data,
        auth: AuthContext(
          permissions: UserRepositoryApp.instance.permissions,
        ),
        httpExecutor: executor,
        validator: (scope, _) async {},
      );

      if (enableLog) {
        debugPrint('  [WORKFLOW] Context initialized:');
        debugPrint('    > Form Keys: ${ctx.form.keys}');
        debugPrint('    > Permissions: ${ctx.auth.permissions.length} items');
      }

      final result = await WorkflowExecutor(definition).run(ctx);

      if (result.isSuccess) {
        _logSuccess('WORKFLOW', 'Execution completed successfully');
        _state.value = EntityState.success(
          result.data is Map<String, dynamic>
              ? Map<String, dynamic>.from(result.data as Map)
              : {},
        );
      } else if (result.status == WorkflowRunStatus.stopped) {
        _logSection('WORKFLOW', '⏸ Execution stopped');
        final lastError = ctx.vars['last_error']?.toString();
        if (lastError != null && lastError.isNotEmpty) {
          _state.value = EntityState.error(lastError);
        } else {
          _state.value = const EntityState.initial();
        }
      } else {
        final msg = result.error?.message ?? 'Workflow failed';
        _logError('WORKFLOW', msg);
        _state.value = EntityState.error(msg);
      }
    } catch (error, st) {
      _logError('WORKFLOW', 'FATAL EXCEPTION: $error\n$st');
      _state.value = EntityState.error(error.toString());
    } finally {
      if (enableLog) {
        debugPrint('  [WORKFLOW] 🏁 Loop finished for workflow submission');
      }
    }
  }

  void _logSection(String tag, String title) {
    if (!enableLog) return;
    debugPrint('\n' + '=' * 50);
    debugPrint('[$tag] $title');
    debugPrint('-' * 50);
  }

  void _logKV(String key, dynamic value) {
    if (!enableLog) return;
    debugPrint('  > $key: $value');
  }

  void _logSuccess(String tag, dynamic response) {
    if (!enableLog) return;
    debugPrint('  [SUCCESS] $tag finalized');
    debugPrint('  [RESULT] $response');
    debugPrint('=' * 50 + '\n');
  }

  void _logError(String tag, dynamic error) {
    if (!enableLog) return;
    debugPrint('  ❌ [ERROR] $tag failed');
    debugPrint('  [REASON] $error');
    debugPrint('=' * 50 + '\n');
  }
}

class GetxHttpExecutor implements HttpExecutor {
  GetxHttpExecutor();

  @override
  Future<HttpResult> execute(HttpData request) async {
    if (EntityController.enableLog) {
      debugPrint('    [HTTP] Step execution: ${request.method} ${request.url}');
    }

    try {
      final response = await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: request.url,
        method: request.method,
        headers: request.headers,
        data: request.body,
        useFormData: request.useFormData,
        mockEnabled: request.mockEnabled,
        mockData: request.mockData,
      );

      if (EntityController.enableLog) {
        debugPrint('    [HTTP] ✅ Response received: $response');
      }

      return HttpResult(
        status: response.statusCode ?? 200,
        data: response.data,
      );
    } catch (e) {
      String message = e.toString();

      if (e is DioException && e.response != null) {
        final responseData = e.response?.data;
        if (responseData is Map) {
          // 1. Try custom path if provided
          final path = request.errorMessagePath;
          if (path != null && path.isNotEmpty) {
            final parts = path.split('.');
            dynamic current = responseData;
            for (final part in parts) {
              if (current is Map && current.containsKey(part)) {
                current = current[part];
              } else {
                current = null;
                break;
              }
            }
            if (current != null && current.toString().isNotEmpty) {
              message = current.toString();
            }
          }

          // 2. Try common fields if custom path didn't work or wasn't provided
          if (message == e.toString()) {
            final Object? msg = responseData['message'] ??
                responseData['error'] ??
                responseData['detail'];
            if (msg != null && msg.toString().isNotEmpty) {
              message = msg.toString();
            }
          }
        }
      }

      // Recursive cleaning of technical prefixes
      String clean = message;
      bool changed = true;
      while (changed) {
        final original = clean;
        clean = clean
            .replaceFirst(RegExp(r'^[a-zA-Z]+Exception:\s*'), '')
            .replaceFirst(RegExp(r'^Exception:\s*'), '')
            .replaceFirst(RegExp(r'^ApiException:\s*'), '')
            .replaceFirst(RegExp(r'^[0-9]+::\s*'), '')
            .trim();
        changed = (original != clean);
      }

      if (EntityController.enableLog) {
        debugPrint('    [HTTP] ❌ Cleaned Message: $clean');
      }
      // Re-throw as a clean message without technical prefixes
      throw Exception(clean);
    }
  }
}
