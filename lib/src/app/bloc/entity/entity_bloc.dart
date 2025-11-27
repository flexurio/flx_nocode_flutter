import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart'
    as configuration;

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
}

class EntityBloc extends Bloc<EntityEvent, EntityState> {
  EntityBloc(configuration.EntityCustom entity) : super(const _Initial()) {
    on<EntityEvent>((event, emit) async {
      await event.when(
        execute: (data, method, url) async {
          emit(const _Loading());
          try {
            final response = await EntityCustomRepository.instance.modify(
              accessToken: UserRepositoryApp.instance.token,
              path: url,
              method: method,
              data: data,
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
              accessToken: '',
              path: urlWithValuesReplace(event.url, data),
              method: event.method,
            );
            emit(_Success(response));
          } catch (error) {
            print('[EntityBloc] Create - error $error');
            emit(_Error(errorMessage(error)));
          }
        },
        create: (data, filters) async {
          emit(const _Loading());
          print('[EntityBloc] Edit - data $data');
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
              data: Map.from(data)
                ..addAll(entity.backend.create!.body(filters: filters)),
            );
            emit(_Success(response));
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
            );
            emit(const _Success(null));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
