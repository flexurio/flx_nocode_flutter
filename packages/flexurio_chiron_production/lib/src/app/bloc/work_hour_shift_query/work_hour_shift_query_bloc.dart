import 'package:appointment/src/app/resource/presence_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_hour_shift_query_bloc.freezed.dart';

@freezed
class WorkHourShiftQueryState with _$WorkHourShiftQueryState {
  const factory WorkHourShiftQueryState.initial() = _Initial;
  const factory WorkHourShiftQueryState.loading() = _Loading;
  const factory WorkHourShiftQueryState.loaded(
    List<WorkHourShift> shift,
  ) = _Success;
  const factory WorkHourShiftQueryState.error(String error) = _Error;
}

@freezed
class WorkHourShiftQueryEvent with _$WorkHourShiftQueryEvent {
  const factory WorkHourShiftQueryEvent.get() = _Get;
}

class WorkHourShiftQueryBloc
    extends Bloc<WorkHourShiftQueryEvent, WorkHourShiftQueryState> {
  WorkHourShiftQueryBloc() : super(const _Initial()) {
    on<WorkHourShiftQueryEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const _Loading());
          try {
            final shift = await PresenceRepository.instance.shiftFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(shift));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
