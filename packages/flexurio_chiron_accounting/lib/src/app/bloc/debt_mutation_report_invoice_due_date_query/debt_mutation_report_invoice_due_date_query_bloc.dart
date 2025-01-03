import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_mutation_report_invoice_due_date.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/debt.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_mutation_report_invoice_due_date_query_bloc.freezed.dart';

@freezed
class DebtMutationReportInvoiceDueDateQueryState with _$DebtMutationReportInvoiceDueDateQueryState {
  const factory DebtMutationReportInvoiceDueDateQueryState.initial() = _Initial;
  const factory DebtMutationReportInvoiceDueDateQueryState.loading(
    PageOptions<DebtMutationReportInvoiceDueDate> pageOptions,
  ) = _Loading;
  const factory DebtMutationReportInvoiceDueDateQueryState.loaded(
    PageOptions<DebtMutationReportInvoiceDueDate> pageOptions,
  ) = _Loaded;
  const factory DebtMutationReportInvoiceDueDateQueryState.error(String error) = _Error;
}

@freezed
class DebtMutationReportInvoiceDueDateQueryEvent with _$DebtMutationReportInvoiceDueDateQueryEvent {
  const factory DebtMutationReportInvoiceDueDateQueryEvent.fetch({
    PageOptions<DebtMutationReportInvoiceDueDate>? pageOptions,
    DateTime? transactionDateLte,
    DateTime? transactionDateGte,
    DateTime? dueDateLte,
    DateTime? dueDateGte,
  }) = _Fetch;
}

class DebtMutationReportInvoiceDueDateQueryBloc extends Bloc<DebtMutationReportInvoiceDueDateQueryEvent, DebtMutationReportInvoiceDueDateQueryState> {
  DebtMutationReportInvoiceDueDateQueryBloc() : super(const _Initial()) {
    on<DebtMutationReportInvoiceDueDateQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, transactionDateLte, transactionDateGte, dueDateLte, dueDateGte) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await DebtRepository.instance.fetchMutationInvoiceDueDate(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionDateLte: transactionDateLte,
              transactionDateGte: transactionDateGte,
              dueDateLte: dueDateLte,
              dueDateGte: dueDateGte,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<DebtMutationReportInvoiceDueDate> _pageOptions = PageOptions.empty(
    sortBy: 'supplier_id',
  );
}
