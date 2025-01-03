import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_recap_global_query_bloc.freezed.dart';

@freezed
class PendingRequestsRecapGlobalQueryState with _$PendingRequestsRecapGlobalQueryState {
  const factory PendingRequestsRecapGlobalQueryState.initial() = _Initial;
  const factory PendingRequestsRecapGlobalQueryState.loading(
    PageOptions<PendingRequestsRecapGlobal> pageOptions,
  ) = _Loading;
  const factory PendingRequestsRecapGlobalQueryState.loaded(
    PageOptions<PendingRequestsRecapGlobal> pageOptions,
  ) = _Loaded;
  const factory PendingRequestsRecapGlobalQueryState.error(String error) = _Error;
}

@freezed
class PendingRequestsRecapGlobalQueryEvent with _$PendingRequestsRecapGlobalQueryEvent {
  const factory PendingRequestsRecapGlobalQueryEvent.fetch({
    PageOptions<PendingRequestsRecapGlobal>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class PendingRequestsRecapGlobalQueryBloc extends Bloc<PendingRequestsRecapGlobalQueryEvent, PendingRequestsRecapGlobalQueryState> {
  PendingRequestsRecapGlobalQueryBloc() : super(const _Initial()) {
    on<PendingRequestsRecapGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            
            _pageOptions = await PendingRequestsRepository.instance.fetchRecapGlobal(
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
  PageOptions<PendingRequestsRecapGlobal> _pageOptions = PageOptions.empty(
    sortBy: 'product_id',
  );
}
