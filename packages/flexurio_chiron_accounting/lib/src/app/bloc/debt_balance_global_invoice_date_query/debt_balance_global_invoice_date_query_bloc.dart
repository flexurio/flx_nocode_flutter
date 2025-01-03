import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_global_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/business_debt.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_balance_global_invoice_date_query_bloc.freezed.dart';

@freezed
class DebtBalanceGlobalInvoiceDateQueryState with _$DebtBalanceGlobalInvoiceDateQueryState {
  const factory DebtBalanceGlobalInvoiceDateQueryState.initial() = _Initial;
  const factory DebtBalanceGlobalInvoiceDateQueryState.loading(
    PageOptions<DebtBalanceGlobalInvoiceDate> pageOptions,
  ) = _Loading;
  const factory DebtBalanceGlobalInvoiceDateQueryState.loaded(
    PageOptions<DebtBalanceGlobalInvoiceDate> pageOptions,
  ) = _Loaded;
  const factory DebtBalanceGlobalInvoiceDateQueryState.error(String error) = _Error;
}

@freezed
class DebtBalanceGlobalInvoiceDateQueryEvent with _$DebtBalanceGlobalInvoiceDateQueryEvent {
  const factory DebtBalanceGlobalInvoiceDateQueryEvent.fetch({
    PageOptions<DebtBalanceGlobalInvoiceDate>? pageOptions,
    Supplier? supplier,
    DateTime? transactionDate,
    DateTime? dueDate,
  }) = _Fetch;
}

class DebtBalanceGlobalInvoiceDateQueryBloc extends Bloc<DebtBalanceGlobalInvoiceDateQueryEvent, DebtBalanceGlobalInvoiceDateQueryState> {
  DebtBalanceGlobalInvoiceDateQueryBloc() : super(const _Initial()) {
    on<DebtBalanceGlobalInvoiceDateQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, transactionDate, dueDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await BusinessDebtReportRepository.instance.fetchGlobal(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              supplier: supplier,
              transactionDate: transactionDate,
              dueDate: dueDate,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<DebtBalanceGlobalInvoiceDate> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
