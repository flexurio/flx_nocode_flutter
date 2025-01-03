import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment_global.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/accounts_payable_payment.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_payable_payment_global_query_bloc.freezed.dart';

@freezed
class AccountsPayablePaymentGlobalQueryState with _$AccountsPayablePaymentGlobalQueryState {
  const factory AccountsPayablePaymentGlobalQueryState.initial() = _Initial;
  const factory AccountsPayablePaymentGlobalQueryState.loading(
    PageOptions<AccountsPayablePaymentGlobal> pageOptions,
  ) = _Loading;
  const factory AccountsPayablePaymentGlobalQueryState.loaded(
    PageOptions<AccountsPayablePaymentGlobal> pageOptions,
  ) = _Loaded;
  const factory AccountsPayablePaymentGlobalQueryState.error(String error) = _Error;
}

@freezed
class AccountsPayablePaymentGlobalQueryEvent with _$AccountsPayablePaymentGlobalQueryEvent {
  const factory AccountsPayablePaymentGlobalQueryEvent.fetch({
    PageOptions<AccountsPayablePaymentGlobal>? pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AccountsPayablePaymentGlobalQueryBloc extends Bloc<AccountsPayablePaymentGlobalQueryEvent, AccountsPayablePaymentGlobalQueryState> {
  AccountsPayablePaymentGlobalQueryBloc() : super(const _Initial()) {
    on<AccountsPayablePaymentGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await AccountsPayablePaymentRepository.instance.fetchGlobal(
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
  PageOptions<AccountsPayablePaymentGlobal> _pageOptions = PageOptions.empty(
    sortBy: 'supplier_id',
  );
}
