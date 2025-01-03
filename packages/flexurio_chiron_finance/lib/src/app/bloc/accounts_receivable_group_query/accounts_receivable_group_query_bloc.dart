import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_group.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_group_query_bloc.freezed.dart';

@freezed
class AccountsReceivableGroupQueryEvent
    with _$AccountsReceivableGroupQueryEvent {
  const factory AccountsReceivableGroupQueryEvent.fetch({
    required TransactionType? transactionType,
    required Customer? customer,
    required DateTime? dueDate,
    required DateTime? date,
    PageOptions<AccountsReceivableGroup>? pageOptions,
  }) = _Fetch;
}

@freezed
class AccountsReceivableGroupQueryState
    with _$AccountsReceivableGroupQueryState {
  const factory AccountsReceivableGroupQueryState.error(String error) = _Error;
  const factory AccountsReceivableGroupQueryState.initial() = _Initial;
  const factory AccountsReceivableGroupQueryState.loading(
    PageOptions<AccountsReceivableGroup> pageOptions,
  ) = _Loading;
  const factory AccountsReceivableGroupQueryState.loaded(
    PageOptions<AccountsReceivableGroup> pageOptions,
  ) = _Success;
}

class AccountsReceivableGroupQueryBloc extends Bloc<
    AccountsReceivableGroupQueryEvent, AccountsReceivableGroupQueryState> {
  AccountsReceivableGroupQueryBloc() : super(const _Initial()) {
    on<AccountsReceivableGroupQueryEvent>((event, emit) async {
      await event.when(
        fetch: (transactionType, customer, dueDate, date, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await FinanceRepository.instance.accountsReceivableGroupFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionType: transactionType,
              customer: customer,
              dueDate: dueDate,
              date: date,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<AccountsReceivableGroup> _pageOptions = PageOptions.empty();
}
