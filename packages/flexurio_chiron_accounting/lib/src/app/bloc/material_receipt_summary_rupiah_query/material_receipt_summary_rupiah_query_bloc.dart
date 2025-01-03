import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_receipt_summary_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_receipt_summary_rupiah.dart';
// import 'package:flexurio_chiron_accounting/src/app/model/material_stock_in_rupiah.dart';
// import 'package:flexurio_chiron_accounting/src/app/resource/material_stock_in_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receipt_summary_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialReceiptSummaryRupiahQueryState with _$MaterialReceiptSummaryRupiahQueryState {
  const factory MaterialReceiptSummaryRupiahQueryState.initial() = _Initial;
  const factory MaterialReceiptSummaryRupiahQueryState.loading(
    PageOptions<MaterialReceiptSummaryRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialReceiptSummaryRupiahQueryState.loaded(
    PageOptions<MaterialReceiptSummaryRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialReceiptSummaryRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialReceiptSummaryRupiahQueryEvent with _$MaterialReceiptSummaryRupiahQueryEvent {
  const factory MaterialReceiptSummaryRupiahQueryEvent.fetch({
    PageOptions<MaterialReceiptSummaryRupiah>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialReceiptSummaryRupiahQueryBloc extends Bloc<MaterialReceiptSummaryRupiahQueryEvent, MaterialReceiptSummaryRupiahQueryState> {
  MaterialReceiptSummaryRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialReceiptSummaryRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialReceiptSummaryRupiahRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              materialGroup: materialGroup,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialReceiptSummaryRupiah> _pageOptions = PageOptions.empty(sortBy: 'transaction_name');
}
