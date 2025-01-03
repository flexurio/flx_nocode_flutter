import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_receipt_detail_summary_purchase_order.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_receipt_summary_rupiah.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
// import 'package:flexurio_chiron_accounting/src/app/model/material_stock_in_rupiah.dart';
// import 'package:flexurio_chiron_accounting/src/app/resource/material_stock_in_rupiah.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receipt_detail_summary_purchase_order_query_bloc.freezed.dart';

@freezed
class MaterialReceiptDetailSummaryPurchaseOrderQueryState with _$MaterialReceiptDetailSummaryPurchaseOrderQueryState {
  const factory MaterialReceiptDetailSummaryPurchaseOrderQueryState.initial() = _Initial;
  const factory MaterialReceiptDetailSummaryPurchaseOrderQueryState.loading(
    PageOptions<MaterialReceiptDetailSummaryPurchaseOrder> pageOptions,
  ) = _Loading;
  const factory MaterialReceiptDetailSummaryPurchaseOrderQueryState.loaded(
    PageOptions<MaterialReceiptDetailSummaryPurchaseOrder> pageOptions,
  ) = _Loaded;
  const factory MaterialReceiptDetailSummaryPurchaseOrderQueryState.error(String error) = _Error;
}

@freezed
class MaterialReceiptDetailSummaryPurchaseOrderQueryEvent with _$MaterialReceiptDetailSummaryPurchaseOrderQueryEvent {
  const factory MaterialReceiptDetailSummaryPurchaseOrderQueryEvent.fetch({
    PageOptions<MaterialReceiptDetailSummaryPurchaseOrder>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
  }) = _Fetch;
}

class MaterialReceiptDetailSummaryPurchaseOrderQueryBloc extends Bloc<MaterialReceiptDetailSummaryPurchaseOrderQueryEvent, MaterialReceiptDetailSummaryPurchaseOrderQueryState> {
  MaterialReceiptDetailSummaryPurchaseOrderQueryBloc() : super(const _Initial()) {
    on<MaterialReceiptDetailSummaryPurchaseOrderQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup, material) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialReceiptSummaryRupiahRepository.instance.fetchDetail(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              materialGroup: materialGroup,
              material: material,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialReceiptDetailSummaryPurchaseOrder> _pageOptions = PageOptions.empty(sortBy: 'transaction_name');
}
