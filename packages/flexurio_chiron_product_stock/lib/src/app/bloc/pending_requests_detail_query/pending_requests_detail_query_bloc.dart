import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_detail_query_bloc.freezed.dart';

@freezed
class PendingRequestsDetailQueryState with _$PendingRequestsDetailQueryState {
  const factory PendingRequestsDetailQueryState.initial() = _Initial;
  const factory PendingRequestsDetailQueryState.loading(
    PageOptions<PendingRequestsDetail> pageOptions,
  ) = _Loading;
  const factory PendingRequestsDetailQueryState.loaded(
    PageOptions<PendingRequestsDetail> pageOptions,
  ) = _Loaded;
  const factory PendingRequestsDetailQueryState.error(String error) = _Error;
}

@freezed
class PendingRequestsDetailQueryEvent with _$PendingRequestsDetailQueryEvent {
  const factory PendingRequestsDetailQueryEvent.fetch({
    PageOptions<PendingRequestsDetail>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
    Customer? customer,
  }) = _Fetch;
}

class PendingRequestsDetailQueryBloc extends Bloc<
    PendingRequestsDetailQueryEvent, PendingRequestsDetailQueryState> {
  PendingRequestsDetailQueryBloc() : super(const _Initial()) {
    on<PendingRequestsDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, department, customer) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PendingRequestsRepository.instance.fetchDetail(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              department: department,
              customer: customer,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PendingRequestsDetail> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
