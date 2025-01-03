import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_mutation.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_mutation_query_bloc.freezed.dart';

@freezed
class AccountsReceivableMutationQueryEvent
    with _$AccountsReceivableMutationQueryEvent {
  const factory AccountsReceivableMutationQueryEvent.fetch({
    required TransactionType? transactionType,
    required Customer? customer,
    required DateTime? dueDate,
    required DateTime? date,
    PageOptions<AccountsReceivableMutation>? pageOptions,
  }) = _Fetch;
}

@freezed
class AccountsReceivableMutationQueryState
    with _$AccountsReceivableMutationQueryState {
  const factory AccountsReceivableMutationQueryState.error(String error) =
      _Error;
  const factory AccountsReceivableMutationQueryState.initial() = _Initial;
  const factory AccountsReceivableMutationQueryState.loading(
    PageOptions<AccountsReceivableMutation> pageOptions,
  ) = _Loading;
  const factory AccountsReceivableMutationQueryState.loaded(
    PageOptions<AccountsReceivableMutation> pageOptions,
  ) = _Success;
}

class AccountsReceivableMutationQueryBloc extends Bloc<
    AccountsReceivableMutationQueryEvent,
    AccountsReceivableMutationQueryState> {
  AccountsReceivableMutationQueryBloc() : super(const _Initial()) {
    on<AccountsReceivableMutationQueryEvent>((event, emit) async {
      await event.when(
        fetch: (transactionType, customer, dueDate, date, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await FinanceRepository.instance
                .accountsReceivableMutationFetch(
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
  PageOptions<AccountsReceivableMutation> _pageOptions = PageOptions.empty();
}
