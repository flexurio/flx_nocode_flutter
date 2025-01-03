import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/purchase_summary.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_summary_detail_query_bloc.freezed.dart';

@freezed
class PurchaseSummaryDetailQueryState with _$PurchaseSummaryDetailQueryState {
  const factory PurchaseSummaryDetailQueryState.initial() = _Initial;
  const factory PurchaseSummaryDetailQueryState.loading(
    PageOptions<PurchaseSummaryDetail> pageOptions,
  ) = _Loading;
  const factory PurchaseSummaryDetailQueryState.loaded(
    PageOptions<PurchaseSummaryDetail> pageOptions,
  ) = _Loaded;
  const factory PurchaseSummaryDetailQueryState.error(String error) = _Error;
}

@freezed
class PurchaseSummaryDetailQueryEvent with _$PurchaseSummaryDetailQueryEvent {
  const factory PurchaseSummaryDetailQueryEvent.fetch({
    PageOptions<PurchaseSummaryDetail>? pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class PurchaseSummaryDetailQueryBloc extends Bloc<PurchaseSummaryDetailQueryEvent, PurchaseSummaryDetailQueryState> {
  PurchaseSummaryDetailQueryBloc() : super(const _Initial()) {
    on<PurchaseSummaryDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PurchaseSummaryRepository.instance.fetchDetail(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              supplier: supplier,
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
  PageOptions<PurchaseSummaryDetail> _pageOptions = PageOptions.empty(sortBy: 'transaction_date');
}
