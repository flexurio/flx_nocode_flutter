import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_value.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/accounts_receivable_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_payment_value_query_bloc.freezed.dart';

@freezed
class AccountsReceivablePaymentValueQueryState
    with _$AccountsReceivablePaymentValueQueryState {
  const factory AccountsReceivablePaymentValueQueryState.initial() = _Initial;
  const factory AccountsReceivablePaymentValueQueryState.loading(
    PageOptions<AccountsReceivablePaymentValue> pageOptions,
  ) = _Loading;
  const factory AccountsReceivablePaymentValueQueryState.loaded(
    PageOptions<AccountsReceivablePaymentValue> pageOptions,
  ) = _Loaded;
  const factory AccountsReceivablePaymentValueQueryState.error(String error) =
      _Error;
}

@freezed
class AccountsReceivablePaymentValueQueryEvent
    with _$AccountsReceivablePaymentValueQueryEvent {
  const factory AccountsReceivablePaymentValueQueryEvent.fetch({
    PageOptions<AccountsReceivablePaymentValue>? pageOptions,
    Customer? customer,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AccountsReceivablePaymentValueQueryBloc extends Bloc<
    AccountsReceivablePaymentValueQueryEvent,
    AccountsReceivablePaymentValueQueryState> {
  AccountsReceivablePaymentValueQueryBloc() : super(const _Initial()) {
    on<AccountsReceivablePaymentValueQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, customer, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountsReceivablePaymentRepository.instance.fetchValue(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              customer: customer,
              startDate: startDate,
              endDate: endDate,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<AccountsReceivablePaymentValue> _pageOptions = PageOptions.empty(
    sortBy: 'C.id, name, city_name, P.date',
  );
}
