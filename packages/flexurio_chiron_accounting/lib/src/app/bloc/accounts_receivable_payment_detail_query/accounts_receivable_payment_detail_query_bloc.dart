import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/accounts_receivable_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_payment_detail_query_bloc.freezed.dart';

@freezed
class AccountsReceivablePaymentDetailQueryState
    with _$AccountsReceivablePaymentDetailQueryState {
  const factory AccountsReceivablePaymentDetailQueryState.initial() = _Initial;
  const factory AccountsReceivablePaymentDetailQueryState.loading(
    PageOptions<AccountsReceivablePaymentDetail> pageOptions,
  ) = _Loading;
  const factory AccountsReceivablePaymentDetailQueryState.loaded(
    PageOptions<AccountsReceivablePaymentDetail> pageOptions,
  ) = _Loaded;
  const factory AccountsReceivablePaymentDetailQueryState.error(String error) =
      _Error;
}

@freezed
class AccountsReceivablePaymentDetailQueryEvent
    with _$AccountsReceivablePaymentDetailQueryEvent {
  const factory AccountsReceivablePaymentDetailQueryEvent.fetch({
    PageOptions<AccountsReceivablePaymentDetail>? pageOptions,
    Customer? customer,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class AccountsReceivablePaymentDetailQueryBloc extends Bloc<
    AccountsReceivablePaymentDetailQueryEvent,
    AccountsReceivablePaymentDetailQueryState> {
  AccountsReceivablePaymentDetailQueryBloc() : super(const _Initial()) {
    on<AccountsReceivablePaymentDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, customer, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountsReceivablePaymentRepository.instance.fetchDetail(
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
  PageOptions<AccountsReceivablePaymentDetail> _pageOptions = PageOptions.empty(
    sortBy: 'kode,  name,  city_name, tgltrans',
  );
}
