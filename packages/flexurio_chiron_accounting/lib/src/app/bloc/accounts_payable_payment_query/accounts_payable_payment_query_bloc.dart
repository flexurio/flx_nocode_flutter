import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/accounts_payable_payment.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_payable_payment_query_bloc.freezed.dart';

@freezed
class AccountsPayablePaymentQueryState
    with _$AccountsPayablePaymentQueryState {
  const factory AccountsPayablePaymentQueryState.initial() = _Initial;
  const factory AccountsPayablePaymentQueryState.loading(
    PageOptions<AccountsPayablePayment> pageOptions,
  ) = _Loading;
  const factory AccountsPayablePaymentQueryState.loaded(
    PageOptions<AccountsPayablePayment> pageOptions,
  ) = _Loaded;
  const factory AccountsPayablePaymentQueryState.error(String error) =
      _Error;
}

@freezed
class AccountsPayablePaymentQueryEvent
    with _$AccountsPayablePaymentQueryEvent {
  const factory AccountsPayablePaymentQueryEvent.fetch({
    PageOptions<AccountsPayablePayment>? pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AccountsPayablePaymentQueryBloc extends Bloc<
    AccountsPayablePaymentQueryEvent,
    AccountsPayablePaymentQueryState> {
  AccountsPayablePaymentQueryBloc() : super(const _Initial()) {
    on<AccountsPayablePaymentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountsPayablePaymentRepository.instance.fetchDaily(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              supplier: supplier,
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
  PageOptions<AccountsPayablePayment> _pageOptions = PageOptions.empty();
}
