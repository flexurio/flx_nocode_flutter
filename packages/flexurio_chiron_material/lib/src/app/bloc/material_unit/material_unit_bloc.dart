import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'material_unit_bloc.freezed.dart';

@freezed
class MaterialUnitState with _$MaterialUnitState {
  const factory MaterialUnitState.initial() = _Initial;
  const factory MaterialUnitState.loading() = _Loading;
  const factory MaterialUnitState.success() = _Success;
  const factory MaterialUnitState.error(String error) = _Error;
}

@freezed
class MaterialUnitEvent with _$MaterialUnitEvent {
  const factory MaterialUnitEvent.create(String id, String type) = _Create;
  const factory MaterialUnitEvent.delete(String id) = _Delete;
}

class MaterialUnitBloc extends Bloc<MaterialUnitEvent, MaterialUnitState> {
  MaterialUnitBloc() : super(const _Initial()) {
    on<MaterialUnitEvent>((event, emit) async {
      await event.when(
        create: (id, type) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialUnitCreate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              type: type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialUnitDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
