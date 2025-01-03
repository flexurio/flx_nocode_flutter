import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement_return.dart';
import 'package:flexurio_chiron_finance/src/app/resource/payment_settlement.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_settlement_return_query_bloc.freezed.dart';

@freezed
class PaymentSettlementReturnQueryEvent
    with _$PaymentSettlementReturnQueryEvent {
  const factory PaymentSettlementReturnQueryEvent.fetch({
    PageOptions<PaymentSettlementReturn>? pageOptions,
    String? taxInvoiceNumber,
  }) = _Fetch;
}

@freezed
class PaymentSettlementReturnQueryState
    with _$PaymentSettlementReturnQueryState {
  const factory PaymentSettlementReturnQueryState.error(String error) = _Error;
  const factory PaymentSettlementReturnQueryState.initial() = _Initial;
  const factory PaymentSettlementReturnQueryState.loaded(
    PageOptions<PaymentSettlementReturn> pageOptions,
  ) = _Success;
  const factory PaymentSettlementReturnQueryState.loading(
    PageOptions<PaymentSettlementReturn> pageOptions,
  ) = _Loading;
}

class PaymentSettlementReturnQueryBloc extends Bloc<
    PaymentSettlementReturnQueryEvent, PaymentSettlementReturnQueryState> {
  PaymentSettlementReturnQueryBloc() : super(const _Initial()) {
    on<PaymentSettlementReturnQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, taxInvoiceNumber) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PaymentSettlementRepository.instance
                .fetchPaymentSettlementReturn(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PaymentSettlementReturn> _pageOptions = PageOptions.empty();
}
