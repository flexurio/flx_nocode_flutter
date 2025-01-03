import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_convert_bloc.freezed.dart';

@freezed
class UnitConvertState with _$UnitConvertState {
  const factory UnitConvertState.initial() = _Initial;
  const factory UnitConvertState.loading() = _Loading;
  const factory UnitConvertState.success() = _Success;
  const factory UnitConvertState.error(String error) = _Error;
}

@freezed
class UnitConvertEvent with _$UnitConvertEvent {
  const factory UnitConvertEvent.create({
    required String convertFormula,
    required MaterialUnit unit,
    required MaterialUnit convertedUnit,
  }) = _Create;
  const factory UnitConvertEvent.edit({
    required int id,
    required String convertFormula,
    required MaterialUnit unit,
    required MaterialUnit convertedUnit,
  }) = _Edit;
  const factory UnitConvertEvent.delete({
    required int id,
  }) = _Delete;
}

class UnitConvertBloc extends Bloc<UnitConvertEvent, UnitConvertState> {
  UnitConvertBloc() : super(const _Initial()) {
    on<UnitConvertEvent>((event, emit) async {
      await event.when(
        create: (convertFormula, unit, convertedUnit) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.unitConvertCreate(
              accessToken: UserRepositoryApp.instance.token!,
              convertFormula: convertFormula,
              unit: unit,
              convertedUnit: convertedUnit,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (id, convertFormula, unit, convertedUnit) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.unitConvertEdit(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              convertFormula: convertFormula,
              unit: unit,
              convertedUnit: convertedUnit,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.unitConvertDelete(
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
