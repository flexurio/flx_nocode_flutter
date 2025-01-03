import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/aging_schedule_ap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aging_schedule_ap_detail_query_bloc.freezed.dart';

@freezed
class AgingScheduleAPDetailQueryState with _$AgingScheduleAPDetailQueryState {
  const factory AgingScheduleAPDetailQueryState.initial() = _Initial;
  const factory AgingScheduleAPDetailQueryState.loading(
    PageOptions<AgingScheduleAPDetail> pageOptions,
  ) = _Loading;
  const factory AgingScheduleAPDetailQueryState.loaded(
    PageOptions<AgingScheduleAPDetail> pageOptions,
  ) = _Loaded;
  const factory AgingScheduleAPDetailQueryState.error(String error) = _Error;
}

@freezed
class AgingScheduleAPDetailQueryEvent with _$AgingScheduleAPDetailQueryEvent {
  const factory AgingScheduleAPDetailQueryEvent.fetch({
    PageOptions<AgingScheduleAPDetail>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AgingScheduleAPDetailQueryBloc extends Bloc<AgingScheduleAPDetailQueryEvent, AgingScheduleAPDetailQueryState> {
  AgingScheduleAPDetailQueryBloc() : super(const _Initial()) {
    on<AgingScheduleAPDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await AgingScheduleAPRepository.instance.detailFetch(
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
  PageOptions<AgingScheduleAPDetail> _pageOptions = PageOptions.empty(sortBy: '');
}
