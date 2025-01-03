import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_detail_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/business_debt.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_balance_detail_invoice_date_query_bloc.freezed.dart';

@freezed
class DebtBalanceDetailInvoiceDateQueryState with _$DebtBalanceDetailInvoiceDateQueryState {
  const factory DebtBalanceDetailInvoiceDateQueryState.initial() = _Initial;
  const factory DebtBalanceDetailInvoiceDateQueryState.loading(
    PageOptions<DebtBalanceDetailInvoiceDate> pageOptions,
  ) = _Loading;
  const factory DebtBalanceDetailInvoiceDateQueryState.loaded(
    PageOptions<DebtBalanceDetailInvoiceDate> pageOptions,
  ) = _Loaded;
  const factory DebtBalanceDetailInvoiceDateQueryState.error(String error) = _Error;
}

@freezed
class DebtBalanceDetailInvoiceDateQueryEvent with _$DebtBalanceDetailInvoiceDateQueryEvent {
  const factory DebtBalanceDetailInvoiceDateQueryEvent.fetch({
    PageOptions<DebtBalanceDetailInvoiceDate>? pageOptions,
    Supplier? supplier,
    DateTime? transactionDate,
    DateTime? dueDate,
  }) = _Fetch;
}

class DebtBalanceDetailInvoiceDateQueryBloc extends Bloc<DebtBalanceDetailInvoiceDateQueryEvent, DebtBalanceDetailInvoiceDateQueryState> {
  DebtBalanceDetailInvoiceDateQueryBloc() : super(const _Initial()) {
    on<DebtBalanceDetailInvoiceDateQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, transactionDate, dueDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await BusinessDebtReportRepository.instance.fetchDetail(
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
  PageOptions<DebtBalanceDetailInvoiceDate> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
