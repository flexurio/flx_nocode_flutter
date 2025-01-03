import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_unserved_query_bloc.freezed.dart';

@freezed
class PendingRequestsUnservedQueryState
    with _$PendingRequestsUnservedQueryState {
  const factory PendingRequestsUnservedQueryState.initial() = _Initial;
  const factory PendingRequestsUnservedQueryState.loading(
    PageOptions<PendingRequestsUnserved> pageOptions,
  ) = _Loading;
  const factory PendingRequestsUnservedQueryState.loaded(
    PageOptions<PendingRequestsUnserved> pageOptions,
  ) = _Loaded;
  const factory PendingRequestsUnservedQueryState.error(String error) = _Error;
}

@freezed
class PendingRequestsUnservedQueryEvent
    with _$PendingRequestsUnservedQueryEvent {
  const factory PendingRequestsUnservedQueryEvent.fetch({
    PageOptions<PendingRequestsUnserved>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) = _Fetch;
}

class PendingRequestsUnservedQueryBloc extends Bloc<
    PendingRequestsUnservedQueryEvent, PendingRequestsUnservedQueryState> {
  PendingRequestsUnservedQueryBloc() : super(const _Initial()) {
    on<PendingRequestsUnservedQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, department) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await PendingRequestsRepository.instance.fetchUnserved(
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
  PageOptions<PendingRequestsUnserved> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
