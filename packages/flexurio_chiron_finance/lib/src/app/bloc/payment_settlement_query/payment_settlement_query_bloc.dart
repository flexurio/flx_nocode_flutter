import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement.dart';
import 'package:flexurio_chiron_finance/src/app/resource/payment_settlement.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_settlement_query_bloc.freezed.dart';

@freezed
class PaymentSettlementQueryEvent with _$PaymentSettlementQueryEvent {
  const factory PaymentSettlementQueryEvent.fetch({
    PageOptions<PaymentSettlement>? pageOptions,
    String? taxInvoiceNumber,
  }) = _Fetch;
}

@freezed
class PaymentSettlementQueryState with _$PaymentSettlementQueryState {
  const factory PaymentSettlementQueryState.error(String error) = _Error;
  const factory PaymentSettlementQueryState.initial() = _Initial;
  const factory PaymentSettlementQueryState.loaded(
    PageOptions<PaymentSettlement> pageOptions,
  ) = _Success;
  const factory PaymentSettlementQueryState.loading(
    PageOptions<PaymentSettlement> pageOptions,
  ) = _Loading;
}

class PaymentSettlementQueryBloc
    extends Bloc<PaymentSettlementQueryEvent, PaymentSettlementQueryState> {
  PaymentSettlementQueryBloc() : super(const _Initial()) {
    on<PaymentSettlementQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, taxInvoiceNumber) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PaymentSettlementRepository.instance
                .fetchPaymentSettlement(
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
  PageOptions<PaymentSettlement> _pageOptions = PageOptions.empty();
}
