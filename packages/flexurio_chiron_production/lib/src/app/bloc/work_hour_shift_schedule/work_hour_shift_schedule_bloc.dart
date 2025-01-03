import 'package:appointment/src/app/resource/presence_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_hour_shift_schedule_bloc.freezed.dart';

@freezed
class WorkHourShiftScheduleState with _$WorkHourShiftScheduleState {
  const factory WorkHourShiftScheduleState.initial() = _Initial;
  const factory WorkHourShiftScheduleState.loading() = _Loading;
  const factory WorkHourShiftScheduleState.success(
    Map<String, WorkHour> days,
    bool initial,
  ) = _Success;
  const factory WorkHourShiftScheduleState.error(String error) = _Error;
}

@freezed
class WorkHourShiftScheduleEvent with _$WorkHourShiftScheduleEvent {
  const factory WorkHourShiftScheduleEvent.get() = _Get;
  const factory WorkHourShiftScheduleEvent.update(WorkHour dayHours) = _Update;
  const factory WorkHourShiftScheduleEvent.delete(Day day) = _Delete;
  const factory WorkHourShiftScheduleEvent.submit() = _Submit;
}

class WorkHourShiftScheduleBloc
    extends Bloc<WorkHourShiftScheduleEvent, WorkHourShiftScheduleState> {
  WorkHourShiftScheduleBloc(this.shiftId) : super(const _Initial()) {
    on<WorkHourShiftScheduleEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const _Loading());
          try {
            final schedules = await PresenceRepository.instance.workHourFetch(
              accessToken: UserRepositoryApp.instance.token!,
              shiftId: shiftId,
            );
            _initial = groupByOne<WorkHour>(
              schedules,
              (schedule) => schedule.day.day,
            );
            _schedule = Map.from(_initial);
            emit(_Success(_schedule, true));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (dayHours) {
          _schedule[dayHours.day.day] =
              dayHours.copyWith(id: _schedule[dayHours.day.day]?.id ?? 0);
        },
        delete: (day) {
          _schedule.remove(day.day);
        },
        submit: () async {
          emit(const _Loading());
          try {
            final compare = compareObject<WorkHour>(
              initial: _initial.values.toList(),
              data: _schedule.values.toList(),
              keyMatch: (first, second) {
                return first.day == second.day;
              },
            );

            for (final workHour in compare.added) {
              await PresenceRepository.instance.workHourCreate(
                accessToken: UserRepositoryApp.instance.token!,
                shiftId: shiftId,
                workHour: workHour,
              );
            }

            for (final workHour in compare.changed) {
              await PresenceRepository.instance.workHourEdit(
                accessToken: UserRepositoryApp.instance.token!,
                shiftId: shiftId,
                workHour: workHour,
              );
            }

            for (final workHour in compare.removed) {
              await PresenceRepository.instance.workHourDelete(
                accessToken: UserRepositoryApp.instance.token!,
                workHour: workHour,
              );
            }

            emit(_Success(_schedule, false));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final int shiftId;
  var _initial = <String, WorkHour>{};
  var _schedule = <String, WorkHour>{};
}
