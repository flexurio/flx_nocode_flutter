import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/accounts_payable_payment.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_payable_payment_detail_query_bloc.freezed.dart';

@freezed
class AccountsPayablePaymentDetailQueryState
    with _$AccountsPayablePaymentDetailQueryState {
  const factory AccountsPayablePaymentDetailQueryState.initial() = _Initial;
  const factory AccountsPayablePaymentDetailQueryState.loading(
    PageOptions<AccountsPayablePaymentDetail> pageOptions,
  ) = _Loading;
  const factory AccountsPayablePaymentDetailQueryState.loaded(
    PageOptions<AccountsPayablePaymentDetail> pageOptions,
  ) = _Loaded;
  const factory AccountsPayablePaymentDetailQueryState.error(String error) =
      _Error;
}

@freezed
class AccountsPayablePaymentDetailQueryEvent
    with _$AccountsPayablePaymentDetailQueryEvent {
  const factory AccountsPayablePaymentDetailQueryEvent.fetch({
    PageOptions<AccountsPayablePaymentDetail>? pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AccountsPayablePaymentDetailQueryBloc extends Bloc<
    AccountsPayablePaymentDetailQueryEvent,
    AccountsPayablePaymentDetailQueryState> {
  AccountsPayablePaymentDetailQueryBloc() : super(const _Initial()) {
    on<AccountsPayablePaymentDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, supplier, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountsPayablePaymentRepository.instance.fetchDetail(
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
  PageOptions<AccountsPayablePaymentDetail> _pageOptions = PageOptions.empty(
    sortBy: 'transaction_date',
  );
}
