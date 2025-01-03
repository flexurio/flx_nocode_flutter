import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date_new.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/debt.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_card_report_per_supplier_invoice_date_new_query_bloc.freezed.dart';

@freezed
class DebtCardReportPerSupplierInvoiceDateNewQueryState with _$DebtCardReportPerSupplierInvoiceDateNewQueryState {
  const factory DebtCardReportPerSupplierInvoiceDateNewQueryState.initial() = _Initial;
  const factory DebtCardReportPerSupplierInvoiceDateNewQueryState.loading(
    PageOptions<DebtCardReportPerSupplierInvoiceDateNew> pageOptions,
  ) = _Loading;
  const factory DebtCardReportPerSupplierInvoiceDateNewQueryState.loaded(
    PageOptions<DebtCardReportPerSupplierInvoiceDateNew> pageOptions,
  ) = _Loaded;
  const factory DebtCardReportPerSupplierInvoiceDateNewQueryState.error(String error) = _Error;
}

@freezed
class DebtCardReportPerSupplierInvoiceDateNewQueryEvent with _$DebtCardReportPerSupplierInvoiceDateNewQueryEvent {
  const factory DebtCardReportPerSupplierInvoiceDateNewQueryEvent.fetch({
    PageOptions<DebtCardReportPerSupplierInvoiceDateNew>? pageOptions,
    DateTime? transactionDateLte,
    DateTime? transactionDateGte,
    Supplier? supplier,
  }) = _Fetch;
}

class DebtCardReportPerSupplierInvoiceDateNewQueryBloc extends Bloc<DebtCardReportPerSupplierInvoiceDateNewQueryEvent, DebtCardReportPerSupplierInvoiceDateNewQueryState> {
  DebtCardReportPerSupplierInvoiceDateNewQueryBloc() : super(const _Initial()) {
    on<DebtCardReportPerSupplierInvoiceDateNewQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, transactionDateLte, transactionDateGte, supplier) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await DebtRepository.instance.fetchInvoiceDueDateNew(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionDateLte: transactionDateLte,
              transactionDateGte: transactionDateGte,
              supplier: supplier,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<DebtCardReportPerSupplierInvoiceDateNew> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
