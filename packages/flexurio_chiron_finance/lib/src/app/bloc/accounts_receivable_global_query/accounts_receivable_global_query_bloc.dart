import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_global.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_global_query_bloc.freezed.dart';

@freezed
class AccountsReceivableGlobalQueryEvent
    with _$AccountsReceivableGlobalQueryEvent {
  const factory AccountsReceivableGlobalQueryEvent.fetch({
    required TransactionType? transactionType,
    required Customer? customer,
    required DateTime? dueDate,
    required DateTime? transactionDate,
    PageOptions<AccountsReceivableGlobal>? pageOptions,
  }) = _Fetch;
}

@freezed
class AccountsReceivableGlobalQueryState
    with _$AccountsReceivableGlobalQueryState {
  const factory AccountsReceivableGlobalQueryState.error(String error) = _Error;
  const factory AccountsReceivableGlobalQueryState.initial() = _Initial;
  const factory AccountsReceivableGlobalQueryState.loading(
    PageOptions<AccountsReceivableGlobal> pageOptions,
  ) = _Loading;
  const factory AccountsReceivableGlobalQueryState.loaded(
    PageOptions<AccountsReceivableGlobal> pageOptions,
  ) = _Success;
}

class AccountsReceivableGlobalQueryBloc extends Bloc<
    AccountsReceivableGlobalQueryEvent, AccountsReceivableGlobalQueryState> {
  AccountsReceivableGlobalQueryBloc() : super(const _Initial()) {
    on<AccountsReceivableGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (transactionType, customer, dueDate, transactionDate,
            pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await FinanceRepository.instance.accountsReceivableGlobalFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionType: transactionType,
              customer: customer,
              dueDate: dueDate,
              transactionDate: transactionDate,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<AccountsReceivableGlobal> _pageOptions = PageOptions.empty();
}
