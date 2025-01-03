import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/resource/schedule_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'schedule_query_bloc.freezed.dart';

@freezed
class ScheduleQueryState with _$ScheduleQueryState {
  const factory ScheduleQueryState.initial() = _Initial;
  const factory ScheduleQueryState.loading(
    PageOptions<Schedule> pageOptions,
  ) = _Loading;
  const factory ScheduleQueryState.loaded(
    PageOptions<Schedule> pageOptions,
  ) = _Loaded;
  const factory ScheduleQueryState.error(String error) = _Error;
}

@freezed
class ScheduleQueryEvent with _$ScheduleQueryEvent {
  const factory ScheduleQueryEvent.initialize() = _Initialize;
  const factory ScheduleQueryEvent.fetch({
    PageOptions<Schedule>? pageOptions,
  }) = _Fetch;
}

class ScheduleQueryBloc extends Bloc<ScheduleQueryEvent, ScheduleQueryState> {
  ScheduleQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ScheduleQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const ScheduleQueryEvent.fetch());
          } else {
            _pageOptions = await ScheduleRepository.instance.scheduleFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
              isExternal: isExternal,
            );
            emit(_Loaded(_pageOptions));
          }
        },
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await ScheduleRepository.instance.scheduleFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              isExternal: isExternal,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final bool isExternal;
  PageOptions<Schedule> _pageOptions = PageOptions.empty(
    ascending: true,
  );
}
