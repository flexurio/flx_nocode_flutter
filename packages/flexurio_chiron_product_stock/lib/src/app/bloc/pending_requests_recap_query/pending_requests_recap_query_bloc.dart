import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/pending_requests_recap.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/pending_requests_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_recap_query_bloc.freezed.dart';

@freezed
class PendingRequestsRecapQueryState with _$PendingRequestsRecapQueryState {
  const factory PendingRequestsRecapQueryState.initial() = _Initial;
  const factory PendingRequestsRecapQueryState.loading(
    PageOptions<PendingRequestsRecap> pageOptions,
  ) = _Loading;
  const factory PendingRequestsRecapQueryState.loaded(
    PageOptions<PendingRequestsRecap> pageOptions,
  ) = _Loaded;
  const factory PendingRequestsRecapQueryState.error(String error) = _Error;
}

@freezed
class PendingRequestsRecapQueryEvent with _$PendingRequestsRecapQueryEvent {
  const factory PendingRequestsRecapQueryEvent.fetch({
    PageOptions<PendingRequestsRecap>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) = _Fetch;
}

class PendingRequestsRecapQueryBloc extends Bloc<PendingRequestsRecapQueryEvent,
    PendingRequestsRecapQueryState> {
  PendingRequestsRecapQueryBloc() : super(const _Initial()) {
    on<PendingRequestsRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, department) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PendingRequestsRecapRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              department: department,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PendingRequestsRecap> _pageOptions = PageOptions.empty(
    sortBy: 'product_name',
  );
}
