import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_detail.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_detail_query_bloc.freezed.dart';

@freezed
class AccountsReceivableDetailQueryEvent
    with _$AccountsReceivableDetailQueryEvent {
  const factory AccountsReceivableDetailQueryEvent.fetch({
    required TransactionType? transactionType,
    required Customer? customer,
    required DateTime? dueDate,
    required DateTime? transactionDate,
    PageOptions<AccountsReceivableDetail>? pageOptions,
  }) = _Fetch;
}

@freezed
class AccountsReceivableDetailQueryState
    with _$AccountsReceivableDetailQueryState {
  const factory AccountsReceivableDetailQueryState.error(String error) = _Error;
  const factory AccountsReceivableDetailQueryState.initial() = _Initial;
  const factory AccountsReceivableDetailQueryState.loading(
    PageOptions<AccountsReceivableDetail> pageOptions,
  ) = _Loading;
  const factory AccountsReceivableDetailQueryState.loaded(
    PageOptions<AccountsReceivableDetail> pageOptions,
  ) = _Success;
}

class AccountsReceivableDetailQueryBloc extends Bloc<
    AccountsReceivableDetailQueryEvent, AccountsReceivableDetailQueryState> {
  AccountsReceivableDetailQueryBloc() : super(const _Initial()) {
    on<AccountsReceivableDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (transactionType, customer, dueDate, transactionDate,
            pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await FinanceRepository.instance.accountsReceivableDetailFetch(
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
  PageOptions<AccountsReceivableDetail> _pageOptions = PageOptions.empty();
}
