import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_customer.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_customer_query_bloc.freezed.dart';

@freezed
class AccountsReceivableCustomerQueryEvent
    with _$AccountsReceivableCustomerQueryEvent {
  const factory AccountsReceivableCustomerQueryEvent.fetch({
    required TransactionType? transactionType,
    required Customer? customer,
    required DateTime? transactionDateGte,
    required DateTime? transactionDateLte,
    PageOptions<AccountsReceivableCustomer>? pageOptions,
  }) = _Fetch;
}

@freezed
class AccountsReceivableCustomerQueryState
    with _$AccountsReceivableCustomerQueryState {
  const factory AccountsReceivableCustomerQueryState.error(String error) =
      _Error;
  const factory AccountsReceivableCustomerQueryState.initial() = _Initial;
  const factory AccountsReceivableCustomerQueryState.loading(
    PageOptions<AccountsReceivableCustomer> pageOptions,
  ) = _Loading;
  const factory AccountsReceivableCustomerQueryState.loaded(
    PageOptions<AccountsReceivableCustomer> pageOptions,
  ) = _Success;
}

class AccountsReceivableCustomerQueryBloc extends Bloc<
    AccountsReceivableCustomerQueryEvent,
    AccountsReceivableCustomerQueryState> {
  AccountsReceivableCustomerQueryBloc() : super(const _Initial()) {
    on<AccountsReceivableCustomerQueryEvent>((event, emit) async {
      await event.when(
        fetch: (transactionType, customer, transactionDateGte,
            transactionDateLte, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await FinanceRepository.instance
                .accountsReceivableCustomerFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionType: transactionType,
              customer: customer,
              transactionDateGte: transactionDateGte,
              transactionDateLte: transactionDateLte,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<AccountsReceivableCustomer> _pageOptions = PageOptions.empty();
}
