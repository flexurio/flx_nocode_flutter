import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/resource/schedule_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'schedule_detail_query_bloc.freezed.dart';

@freezed
class ScheduleDetailQueryState with _$ScheduleDetailQueryState {
  const factory ScheduleDetailQueryState.initial() = _Initial;
  const factory ScheduleDetailQueryState.loading() = _Loading;
  const factory ScheduleDetailQueryState.loaded(
    List<ScheduleDetail> scheduleDetail,
  ) = _Success;
  const factory ScheduleDetailQueryState.error(String error) = _Error;
}

@freezed
class ScheduleDetailQueryEvent with _$ScheduleDetailQueryEvent {
  const factory ScheduleDetailQueryEvent.fetch(int id) = _Fetch;
}

class ScheduleDetailQueryBloc
    extends Bloc<ScheduleDetailQueryEvent, ScheduleDetailQueryState> {
  ScheduleDetailQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ScheduleDetailQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (id) async {
            emit(const _Loading());
            try {
              final scheduleDetail =
                  await ScheduleRepository.instance.scheduleDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
                isExternal: isExternal,
              );
              emit(
                _Success(scheduleDetail),
              );
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
