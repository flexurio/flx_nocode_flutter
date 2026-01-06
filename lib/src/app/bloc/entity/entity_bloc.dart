import 'package:dio/dio.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart'
    as configuration;

import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flutter/foundation.dart';

part 'entity_bloc.freezed.dart';

@freezed
class EntityState with _$EntityState {
  const factory EntityState.initial() = _Initial;

  const factory EntityState.loading() = _Loading;

  const factory EntityState.success(Map<String, dynamic>? data) = _Success;

  const factory EntityState.error(String error) = _Error;
}

@freezed
class EntityEvent with _$EntityEvent {
  const factory EntityEvent.execute({
    required Map<String, dynamic> data,
    required String method,
    required String url,
    required Map<String, dynamic> filters,
  }) = _Execute;
  const factory EntityEvent.create({
    required Map<String, dynamic> data,
    required Map<String, dynamic> filters,
  }) = _Create;
  const factory EntityEvent.edit({
    required Map<String, dynamic> data,
    required Map<String, dynamic> filters,
  }) = _Edit;
  const factory EntityEvent.delete({required String id}) = _Delete;
  const factory EntityEvent.otherEvent({
    required Map<String, dynamic> data,
    required BackendOther event,
  }) = _OtherEvent;
  const factory EntityEvent.submitWorkflow({
    required Map<String, dynamic> data,
    required Map<String, dynamic> workflow,
  }) = _SubmitWorkflow;
}

class EntityBloc extends Bloc<EntityEvent, EntityState> {
  static const bool enableLog = true;

  EntityBloc(configuration.EntityCustom entity) : super(const _Initial()) {
    on<EntityEvent>((event, emit) async {
      await event.when(
        execute: (data, method, url, filters) async {
          emit(const _Loading());
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
            emit(_Success(response));
          } catch (error) {
            _logError('EXECUTE', error);
            emit(_Error(errorMessage(error)));
          }
        },
        otherEvent: (data, event) async {
          emit(const _Loading());
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
            emit(_Success(response));
          } catch (error) {
            _logError('OTHER EVENT', error);
            emit(_Error(errorMessage(error)));
          }
        },
        create: (data, filters) async {
          emit(const _Loading());
          _logSection('CREATE', '🚀 Starting create operation');
          _logKV('Entity', entity.id);

          try {
            if (!data.containsKey('id')) {
              const msg =
                  'ID is required to perform the create operation but was not provided in the data map.';
              _logError('CREATE', msg);
              emit(_Error(msg));
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
            emit(_Success(response));
          } on FormatException catch (error) {
            _logError('CREATE', error.message);
            emit(_Error(error.message));
          } catch (error) {
            _logError('CREATE', error);
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (data, filters) async {
          emit(const _Loading());
          _logSection('EDIT', '🚀 Starting edit operation');
          _logKV('Entity', entity.id);
          _logKV('ID', data['id']);

          try {
            if (!data.containsKey('id')) {
              const msg =
                  'ID is required to perform the edit operation but was not provided in the data map.';
              _logError('EDIT', msg);
              emit(_Error(msg));
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
            emit(_Success(response));
          } catch (error) {
            _logError('EDIT', error);
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
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
            emit(const _Success(null));
          } catch (error) {
            _logError('DELETE', error);
            emit(_Error(errorMessage(error)));
          }
        },
        submitWorkflow: (data, workflowJson) async {
          emit(const _Loading());
          _logSection('WORKFLOW', '🚀 Starting Workflow Submission');
          _logKV('Data', data);

          try {
            final definition = WorkflowDefinition.fromJson(workflowJson);
            final executor = _BlocHttpExecutor();

            final ctx = WorkflowContext(
              form: data,
              auth: AuthContext(
                permissions: UserRepositoryApp.instance.permissions,
              ),
              httpExecutor: executor,
            );

            if (enableLog) {
              debugPrint('  [WORKFLOW] Context initialized:');
              debugPrint('    > Form Keys: ${ctx.form.keys}');
              debugPrint(
                  '    > Permissions: ${ctx.auth.permissions.length} items');
            }

            final result = await WorkflowExecutor(definition).run(ctx);

            if (result.isSuccess) {
              _logSuccess('WORKFLOW', 'Execution completed successfully');
              emit(const _Success({}));
            } else {
              _logError('WORKFLOW', result.error?.message ?? 'Workflow failed');
              emit(_Error(result.error?.message ?? 'Workflow failed'));
            }
          } catch (error, st) {
            _logError('WORKFLOW', 'FATAL EXCEPTION: $error\n$st');
            emit(_Error(error.toString()));
          } finally {
            if (enableLog) {
              debugPrint(
                  '  [WORKFLOW] 🏁 Loop finished for workflow submission');
            }
          }
        },
      );
    });
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

class _BlocHttpExecutor implements HttpExecutor {
  _BlocHttpExecutor();

  @override
  Future<HttpResult> execute(HttpData request) async {
    if (EntityBloc.enableLog) {
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

      if (EntityBloc.enableLog) {
        debugPrint('    [HTTP] ✅ Response received');
      }

      return HttpResult(
        status: 200,
        data: response,
      );
    } catch (e) {
      if (EntityBloc.enableLog) {
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
