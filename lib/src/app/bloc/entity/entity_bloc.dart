import 'package:flx_nocode_flutter/src/app/model/backend_other.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart' as configuration;

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
  const factory EntityEvent.create({
    required Map<String, dynamic> data,
  }) = _Create;
  const factory EntityEvent.edit({
    required Map<String, dynamic> data,
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
        otherEvent: (data, event) async {
          emit(const _Loading());
          try {
            final response = await EntityCustomRepository.instance.modify(
              accessToken: '',
              path: event.urlWithValues(data),
              method: event.method,
            );
            emit(_Success(response));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        create: (data) async {
          emit(const _Loading());
          try {
            final response = await EntityCustomRepository.instance.modify(
              accessToken: '',
              path: entity.backend.create!.url,
              method: entity.backend.create!.method,
              data: data,
            );
            emit(_Success(response));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (data) async {
          emit(const _Loading());
          try {
            final response = await EntityCustomRepository.instance.modify(
              accessToken: '',
              path: entity.backend.update!.url.replaceFirst('{id}', data['id']),
              method: entity.backend.update!.method,
              data: data,
            );
            emit(_Success(response));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await EntityCustomRepository.instance.modify(
              accessToken: '',
              path: entity.backend.delete!.url.replaceFirst('{id}', id),
              method: entity.backend.delete!.method,
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
