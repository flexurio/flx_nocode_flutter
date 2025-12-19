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
  EntityBloc(configuration.EntityCustom entity) : super(const _Initial()) {
    on<EntityEvent>((event, emit) async {
      await event.when(
        execute: (data, method, url, filters) async {
          emit(const _Loading());
          try {
            final response = await EntityCustomRepository.instance.modify(
              accessToken: UserRepositoryApp.instance.token,
              path: url,
              method: method,
              headers: entity.backend.create?.headers,
              data: Map.from(data)
                ..addAll(entity.backend.create!.body(filters: filters)),
            );
            emit(_Success(response));
          } catch (error) {
            print('[EntityBloc] Execute - error $error');
            emit(_Error(errorMessage(error)));
          }
        },
        otherEvent: (data, event) async {
          emit(const _Loading());
          try {
            final response = await EntityCustomRepository.instance.modify(
              accessToken: UserRepositoryApp.instance.token,
              path: urlWithValuesReplace(event.url, data),
              method: event.method,
              headers: event.headers,
            );
            emit(_Success(response));
          } catch (error) {
            print('[EntityBloc] Create - error $error');
            emit(_Error(errorMessage(error)));
          }
        },
        create: (data, filters) async {
          emit(const _Loading());
          try {
            if (!data.containsKey('id')) {
              emit(_Error(
                  'ID is required to perform the create operation but was not provided in the data map.'));
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
            emit(_Success(response));
          } on FormatException catch (error) {
            emit(_Error(error.message));
          } catch (error) {
            print('[EntityBloc] Create - error $error');
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (data, filters) async {
          emit(const _Loading());
          print('[EntityBloc] Edit - data $data');
          try {
            if (!data.containsKey('id')) {
              emit(_Error(
                  'ID is required to perform the edit operation but was not provided in the data map.'));
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
            emit(_Success(response));
          } catch (error) {
            print('[EntityBloc] Edit - error $error');
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
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
            emit(const _Success(null));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        submitWorkflow: (data, workflowJson) async {
          emit(const _Loading());
          print(
              '================================================================');
          print('[EntityBloc] SubmitWorkflow STARTED');
          print('[EntityBloc] Data: $data');
          print('[EntityBloc] Workflow: $workflowJson');
          try {
            // Parse workflow
            final definition = WorkflowDefinition.fromJson(workflowJson);

            // Construct context
            // We need an HttpExecutor wrapper around EntityCustomRepository
            final executor = _BlocHttpExecutor();

            final ctx = WorkflowContext(
              form: data,
              auth: AuthContext(
                permissions: UserRepositoryApp.instance.permissions,
              ),
              httpExecutor: executor,
            );

            final runner = WorkflowExecutor(definition); // No UI bridge for now
            print('[EntityBloc] Running workflow...');
            final result = await runner.run(ctx);
            print('[EntityBloc] Workflow execution completed.');
            print('[EntityBloc] Result Success: ${result.isSuccess}');
            if (!result.isSuccess) {
              print('[EntityBloc] Result Error: ${result.error}');
            }

            if (result.isSuccess) {
              // If success, we assume the last action or some specialized variable holds the result?
              // Or just return null/success map.
              // Typically create/update returns the object.
              // We can try to find if there is a 'result' variable or http response.
              emit(const _Success({})); // Success with empty map for now
            } else {
              print(
                  '[EntityBloc] Workflow failed with error: ${result.error?.message}');
              emit(_Error(result.error?.message ?? 'Workflow failed'));
            }
          } catch (error, st) {
            print('[EntityBloc] SubmitWorkflow - FATAL ERROR $error $st');
            emit(_Error(error.toString()));
          } finally {
            print('[EntityBloc] SubmitWorkflow ENDED');
            print(
                '================================================================');
          }
        },
      );
    });
  }
}

class _BlocHttpExecutor implements HttpExecutor {
  _BlocHttpExecutor();

  @override
  Future<HttpResult> execute(HttpData request) async {
    print('[BlocHttpExecutor] Executing HTTP Request:');
    print('  Method: ${request.method}');
    print('  URL: ${request.url}');
    print('  Body: ${request.body}');
    try {
      final response = await EntityCustomRepository.instance.modify(
        accessToken: UserRepositoryApp.instance.token,
        path: request.url,
        method: request.method,
        headers: request.headers,
        data: request.body,
      );
      // We assume response is dynamic data (the body).
      // We need to wrap it in HttpResult
      return HttpResult(
        status: 200, // We assume 200 if no exception
        data: response,
      );
    } catch (e) {
      if (e is DioException) {
        print('[BlocHttpExecutor] HTTP Error: ${e.message}');
        if (e.response != null) {
          print('[BlocHttpExecutor] Status Code: ${e.response?.statusCode}');
          print('[BlocHttpExecutor] Response Data: ${e.response?.data}');
        }
      } else {
        print('[BlocHttpExecutor] Generic Error: $e');
      }
      throw Exception('HTTP Error: $e');
    }
  }
}
