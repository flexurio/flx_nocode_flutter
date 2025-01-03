import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_global.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/purchase_summary.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_summary_global_query_bloc.freezed.dart';

@freezed
class PurchaseSummaryGlobalQueryState with _$PurchaseSummaryGlobalQueryState {
  const factory PurchaseSummaryGlobalQueryState.initial() = _Initial;
  const factory PurchaseSummaryGlobalQueryState.loading(
    PageOptions<PurchaseSummaryGlobal> pageOptions,
  ) = _Loading;
  const factory PurchaseSummaryGlobalQueryState.loaded(
    PageOptions<PurchaseSummaryGlobal> pageOptions,
  ) = _Loaded;
  const factory PurchaseSummaryGlobalQueryState.error(String error) = _Error;
}

@freezed
class PurchaseSummaryGlobalQueryEvent with _$PurchaseSummaryGlobalQueryEvent {
  const factory PurchaseSummaryGlobalQueryEvent.fetch({
    PageOptions<PurchaseSummaryGlobal>? pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class PurchaseSummaryGlobalQueryBloc extends Bloc<PurchaseSummaryGlobalQueryEvent, PurchaseSummaryGlobalQueryState> {
  PurchaseSummaryGlobalQueryBloc() : super(const _Initial()) {
    on<PurchaseSummaryGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PurchaseSummaryRepository.instance.fetchGlobal(
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
  PageOptions<PurchaseSummaryGlobal> _pageOptions = PageOptions.empty();
}
