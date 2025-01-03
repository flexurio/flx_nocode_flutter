import 'package:appointment/src/app/resource/presence_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_hour_shift_bloc.freezed.dart';

@freezed
class WorkHourShiftState with _$WorkHourShiftState {
  const factory WorkHourShiftState.initial() = _Initial;
  const factory WorkHourShiftState.loading() = _Loading;
  const factory WorkHourShiftState.success() = _Success;
  const factory WorkHourShiftState.error(String error) = _Error;
}

@freezed
class WorkHourShiftEvent with _$WorkHourShiftEvent {
  const factory WorkHourShiftEvent.create(
    String name,
    DateTime periodStart,
    DateTime periodEnd,
  ) = _Create;
  const factory WorkHourShiftEvent.update(
    int id,
    String name,
    DateTime periodStart,
    DateTime periodEnd,
  ) = _Update;
  const factory WorkHourShiftEvent.delete(int id) = _Delete;
}

class WorkHourShiftBloc extends Bloc<WorkHourShiftEvent, WorkHourShiftState> {
  WorkHourShiftBloc() : super(const _Initial()) {
    on<WorkHourShiftEvent>((event, emit) async {
      await event.when(
        create: (name, periodStart, periodEnd) async {
          emit(const _Loading());
          try {
            await PresenceRepository.instance.shiftCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              periodStart: periodStart,
              periodEnd: periodEnd,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (id, name, periodStart, periodEnd) async {
          emit(const _Loading());
          try {
            await PresenceRepository.instance.shiftUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
              periodStart: periodStart,
              periodEnd: periodEnd,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await PresenceRepository.instance.shiftDelete(
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
