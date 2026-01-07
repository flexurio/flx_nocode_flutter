import 'package:dio/dio.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart'
    as configuration;

import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData;

part 'entity_controller.freezed.dart';

@freezed
class EntityState with _$EntityState {
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
          ..addAll(entity.backend.create!.body(filters: filters)),
      );
      _logSuccess('EXECUTE', response);
      _state.value = EntityState.success(response);
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
      );
      _logSuccess('OTHER EVENT', response);
      _state.value = EntityState.success(response);
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
      );
      _logSuccess('CREATE', response);
      _state.value = EntityState.success(response);
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
      );
      _logSuccess('EDIT', response);
      _state.value = EntityState.success(response);
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
      final executor = _GetxHttpExecutor();

      final ctx = WorkflowContext(
        form: form,
        data: data,
        auth: AuthContext(
          permissions: UserRepositoryApp.instance.permissions,
        ),
        httpExecutor: executor,
      );

      if (enableLog) {
        debugPrint('  [WORKFLOW] Context initialized:');
        debugPrint('    > Form Keys: ${ctx.form.keys}');
        debugPrint('    > Permissions: ${ctx.auth.permissions.length} items');
      }

      final result = await WorkflowExecutor(definition).run(ctx);

      if (result.isSuccess) {
        _logSuccess('WORKFLOW', 'Execution completed successfully');
        _state.value = const EntityState.success({});
      } else {
        _logError('WORKFLOW', result.error?.message ?? 'Workflow failed');
        _state.value =
            EntityState.error(result.error?.message ?? 'Workflow failed');
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

class _GetxHttpExecutor implements HttpExecutor {
  _GetxHttpExecutor();

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
      );

      if (EntityController.enableLog) {
        debugPrint('    [HTTP] ✅ Response received');
      }

      return HttpResult(
        status: 200,
        data: response,
      );
    } catch (e) {
      if (EntityController.enableLog) {
        debugPrint('    [HTTP] ❌ Error executing request: $e');
        if (e is DioException && e.response != null) {
          debugPrint('    [HTTP] Status: ${e.response?.statusCode}');
          debugPrint('    [HTTP] Data: ${e.response?.data}');
        }
      }
      throw Exception('HTTP Error: $e');
    }
  }
}
