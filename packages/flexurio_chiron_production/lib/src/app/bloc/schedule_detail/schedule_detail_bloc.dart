import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/resource/schedule_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_detail_bloc.freezed.dart';

@freezed
class ScheduleDetailBlocState with _$ScheduleDetailBlocState {
  const factory ScheduleDetailBlocState.initial() = _Initial;
  const factory ScheduleDetailBlocState.loading() = _Loading;
  const factory ScheduleDetailBlocState.success() = _Success;
  const factory ScheduleDetailBlocState.error(String error) = _Error;
}

@freezed
class ScheduleDetailBlocEvent with _$ScheduleDetailBlocEvent {
  const factory ScheduleDetailBlocEvent.create({
    required int id,
    required ScheduleDetailStatus status,
    required DateTime startTime,
    required int picId,
    required String remarks,
    WorkHourShift? workHourShift,
    String? qtyPerson,
    String? yields,
  }) = _Create;
  const factory ScheduleDetailBlocEvent.edit({
    required int id,
    required ScheduleDetailStatus status,
    required DateTime startTime,
    required int picId,
    required String remarks,
    WorkHourShift? workHourShift,
    String? qtyPerson,
    String? yields,
  }) = _Edit;
  const factory ScheduleDetailBlocEvent.validate(
    ScheduleDetail id,
  ) = _Validate;
  const factory ScheduleDetailBlocEvent.delete({required int id}) = _Delete;
}

class ScheduleDetailBloc
    extends Bloc<ScheduleDetailBlocEvent, ScheduleDetailBlocState> {
  ScheduleDetailBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ScheduleDetailBlocEvent>((event, emit) async {
      await event.when(
        create: (id, status, startTime, picId, remarks, workHourShift,
            qtyPerson, yields,) async {
          emit(const _Loading());
          try {
            await ScheduleRepository.instance.scheduleDetailCreate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              status: status,
              startTime: startTime,
              picId: picId,
              remarks: remarks,
              isExternal: isExternal,
            );
            if (status != ScheduleDetailStatus.pending) {
              await ScheduleRepository.instance.scheduleCreateActual(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
                workHourShift: workHourShift,
                qtyMan: qtyPerson ?? '0',
                actualStartTime: startTime,
                actualEndTime: startTime,
                yieldSchedule: yields ?? '0',
                notes: remarks,
                status: status,
                isExternal: isExternal,
              );
            }
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (id, status, startTime, picId, remarks, workHourShift, qtyPerson,
            yields,) async {
          emit(const _Loading());
          try {
            await ScheduleRepository.instance.scheduleDetailEdit(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              status: status,
              startTime: startTime,
              picId: picId,
              remarks: remarks,
              isExternal: isExternal,
            );
            if (status == ScheduleDetailStatus.start ||
                status == ScheduleDetailStatus.finish) {
              await ScheduleRepository.instance.scheduleCreateActual(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
                workHourShift: workHourShift,
                qtyMan: qtyPerson ?? '0',
                actualStartTime: startTime,
                actualEndTime: startTime,
                yieldSchedule: yields ?? '0',
                notes: remarks,
                status: status,
                isExternal: isExternal,
              );
            }
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        validate: (scheduleDetail) async {
          emit(const _Loading());
          try {
            await ScheduleRepository.instance.scheduleDetailValidate(
              scheduleDetail: scheduleDetail,
              accessToken: UserRepositoryApp.instance.token!,
              isExternal: isExternal,
            );
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ScheduleRepository.instance.scheduleDetailDelete(
              id: id,
              accessToken: UserRepositoryApp.instance.token!,
              isExternal: isExternal,
            );
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final bool isExternal;
}
