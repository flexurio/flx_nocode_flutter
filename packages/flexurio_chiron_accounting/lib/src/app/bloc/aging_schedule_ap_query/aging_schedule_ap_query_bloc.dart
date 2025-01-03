import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/aging_schedule_ap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aging_schedule_ap_query_bloc.freezed.dart';

@freezed
class AgingScheduleAPQueryState with _$AgingScheduleAPQueryState {
  const factory AgingScheduleAPQueryState.initial() = _Initial;
  const factory AgingScheduleAPQueryState.loading(
    PageOptions<AgingScheduleAP> pageOptions,
  ) = _Loading;
  const factory AgingScheduleAPQueryState.loaded(
    PageOptions<AgingScheduleAP> pageOptions,
  ) = _Loaded;
  const factory AgingScheduleAPQueryState.error(String error) = _Error;
}

@freezed
class AgingScheduleAPQueryEvent with _$AgingScheduleAPQueryEvent {
  const factory AgingScheduleAPQueryEvent.fetch({
    PageOptions<AgingScheduleAP>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AgingScheduleAPQueryBloc extends Bloc<AgingScheduleAPQueryEvent, AgingScheduleAPQueryState> {
  AgingScheduleAPQueryBloc() : super(const _Initial()) {
    on<AgingScheduleAPQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await AgingScheduleAPRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<AgingScheduleAP> _pageOptions = PageOptions.empty(sortBy: '');
}
