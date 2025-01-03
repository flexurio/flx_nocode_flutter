import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/debt.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_card_report_per_supplier_invoice_date_query_bloc.freezed.dart';

@freezed
class DebtCardReportPerSupplierInvoiceDateQueryState with _$DebtCardReportPerSupplierInvoiceDateQueryState {
  const factory DebtCardReportPerSupplierInvoiceDateQueryState.initial() = _Initial;
  const factory DebtCardReportPerSupplierInvoiceDateQueryState.loading(
    PageOptions<DebtCardReportPerSupplierInvoiceDate> pageOptions,
  ) = _Loading;
  const factory DebtCardReportPerSupplierInvoiceDateQueryState.loaded(
    PageOptions<DebtCardReportPerSupplierInvoiceDate> pageOptions,
  ) = _Loaded;
  const factory DebtCardReportPerSupplierInvoiceDateQueryState.error(String error) = _Error;
}

@freezed
class DebtCardReportPerSupplierInvoiceDateQueryEvent with _$DebtCardReportPerSupplierInvoiceDateQueryEvent {
  const factory DebtCardReportPerSupplierInvoiceDateQueryEvent.fetch({
    PageOptions<DebtCardReportPerSupplierInvoiceDate>? pageOptions,
    DateTime? transactionDateLte,
    DateTime? transactionDateGte,
    DateTime? dueDateLte,
    DateTime? dueDateGte,
    Supplier? supplier,
  }) = _Fetch;
}

class DebtCardReportPerSupplierInvoiceDateQueryBloc extends Bloc<DebtCardReportPerSupplierInvoiceDateQueryEvent, DebtCardReportPerSupplierInvoiceDateQueryState> {
  DebtCardReportPerSupplierInvoiceDateQueryBloc() : super(const _Initial()) {
    on<DebtCardReportPerSupplierInvoiceDateQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, transactionDateLte, transactionDateGte, dueDateLte, dueDateGte, supplier) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await DebtRepository.instance.fetchInvoiceDueDate(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionDateLte: transactionDateLte,
              transactionDateGte: transactionDateGte,
              dueDateLte: dueDateLte,
              dueDateGte: dueDateGte,
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
  PageOptions<DebtCardReportPerSupplierInvoiceDate> _pageOptions = PageOptions.empty(
    sortBy: 'transaction_date',
  );
}
