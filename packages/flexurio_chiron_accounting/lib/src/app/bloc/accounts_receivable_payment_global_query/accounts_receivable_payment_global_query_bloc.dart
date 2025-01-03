import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_global.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/accounts_receivable_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_payment_global_query_bloc.freezed.dart';

@freezed
class AccountsReceivablePaymentGlobalQueryState
    with _$AccountsReceivablePaymentGlobalQueryState {
  const factory AccountsReceivablePaymentGlobalQueryState.initial() = _Initial;
  const factory AccountsReceivablePaymentGlobalQueryState.loading(
    PageOptions<AccountsReceivablePaymentGlobal> pageOptions,
  ) = _Loading;
  const factory AccountsReceivablePaymentGlobalQueryState.loaded(
    PageOptions<AccountsReceivablePaymentGlobal> pageOptions,
  ) = _Loaded;
  const factory AccountsReceivablePaymentGlobalQueryState.error(String error) =
      _Error;
}

@freezed
class AccountsReceivablePaymentGlobalQueryEvent
    with _$AccountsReceivablePaymentGlobalQueryEvent {
  const factory AccountsReceivablePaymentGlobalQueryEvent.fetch({
    PageOptions<AccountsReceivablePaymentGlobal>? pageOptions,
    Customer? customer,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AccountsReceivablePaymentGlobalQueryBloc extends Bloc<
    AccountsReceivablePaymentGlobalQueryEvent,
    AccountsReceivablePaymentGlobalQueryState> {
  AccountsReceivablePaymentGlobalQueryBloc() : super(const _Initial()) {
    on<AccountsReceivablePaymentGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, customer, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountsReceivablePaymentRepository.instance.fetchGlobal(
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
  PageOptions<AccountsReceivablePaymentGlobal> _pageOptions = PageOptions.empty(
    sortBy: 'kode,  name,  city_name',
  );
}
