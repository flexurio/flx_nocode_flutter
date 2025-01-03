import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process.dart';
import 'package:flexurio_chiron_production/src/app/model/schedule.dart';
import 'package:flexurio_chiron_production/src/app/model/work_hour_shift.dart';
import 'package:flexurio_chiron_production/src/app/resource/schedule_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_bloc.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.loading() = _Loading;
  const factory ScheduleState.success() = _Success;
  const factory ScheduleState.error(String error) = _Error;
}

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.create({
    required DateTime startTime,
    required ProductionOrder productionOrder,
    required List<ProductionStageProcess> stageProcess,
    required Product product,
  }) = _Create;
  const factory ScheduleEvent.createActual({
    required int id,
    required WorkHourShift workHourShift,
    required int quantityMan,
    required DateTime actualStartTime,
    required DateTime actualEndTime,
    required int yieldSchedule,
    required String notes,
  }) = _CreateActual;
  const factory ScheduleEvent.edit({
    required DateTime startTime,
    required ProductionOrder productionOrder,
    required List<ProductionStageProcess> stageProcess,
    required Product product,
    required Schedule schedule,
  }) = _Edit;
  const factory ScheduleEvent.close({required Schedule schedule}) = _Close;
  const factory ScheduleEvent.delete({required Schedule schedule}) = _Delete;
}

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ScheduleEvent>(
      (event, emit) async {
        await event.when(
          create: (
            startTime,
            productionOrder,
            stageProcess,
            product,
          ) async {
            emit(const _Loading());
            try {
              await ScheduleRepository.instance.scheduleCreate(
                accessToken: UserRepositoryApp.instance.token!,
                startTime: startTime,
                productionOrder: productionOrder,
                stageProcess: stageProcess,
                product: product,
                isExternal: isExternal,
              );
              emit(
                const _Success(),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          createActual: (
            id,
            workHourShift,
            qtyMan,
            actualStartTime,
            actualEndTime,
            yieldSchedule,
            notes,
          ) async {
            emit(const _Loading());
            try {
              await ScheduleRepository.instance.scheduleCreateActual(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
                workHourShift: workHourShift,
                qtyMan: qtyMan.toString(),
                actualStartTime: actualStartTime,
                actualEndTime: actualEndTime,
                yieldSchedule: yieldSchedule.toString(),
                notes: notes,
                isExternal: isExternal,
              );
              emit(
                const _Success(),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          edit: (
            startTime,
            productionOrder,
            stageProcess,
            product,
            schedule,
          ) async {
            emit(const _Loading());
            try {
              await ScheduleRepository.instance.scheduleEdit(
                accessToken: UserRepositoryApp.instance.token!,
                startTime: startTime,
                productionOrder: productionOrder,
                stageProcess: stageProcess,
                product: product,
                schedule: schedule,
                isExternal: isExternal,
              );
              emit(
                const _Success(),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          close: (schedule) async {
            emit(const _Loading());
            try {
              await ScheduleRepository.instance.scheduleClose(
                accessToken: UserRepositoryApp.instance.token!,
                schedule: schedule,
                isExternal: isExternal,
              );
              emit(const _Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (schedule) async {
            emit(const _Loading());
            try {
              await ScheduleRepository.instance.scheduleDelete(
                accessToken: UserRepositoryApp.instance.token!,
                schedule: schedule,
                isExternal: isExternal,
              );
              emit(const _Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  final bool isExternal;
}
