import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement_new.dart';
import 'package:flexurio_chiron_finance/src/app/resource/payment_settlement.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_settlement_new_query_bloc.freezed.dart';

@freezed
class PaymentSettlementNewQueryEvent with _$PaymentSettlementNewQueryEvent {
  const factory PaymentSettlementNewQueryEvent.fetch({
    PageOptions<PaymentSettlementNew>? pageOptions,
    String? taxInvoiceNumber,
  }) = _Fetch;
}

@freezed
class PaymentSettlementNewQueryState with _$PaymentSettlementNewQueryState {
  const factory PaymentSettlementNewQueryState.error(String error) = _Error;
  const factory PaymentSettlementNewQueryState.initial() = _Initial;
  const factory PaymentSettlementNewQueryState.loaded(
    PageOptions<PaymentSettlementNew> pageOptions,
  ) = _Success;
  const factory PaymentSettlementNewQueryState.loading(
    PageOptions<PaymentSettlementNew> pageOptions,
  ) = _Loading;
}

class PaymentSettlementNewQueryBloc extends Bloc<PaymentSettlementNewQueryEvent,
    PaymentSettlementNewQueryState> {
  PaymentSettlementNewQueryBloc() : super(const _Initial()) {
    on<PaymentSettlementNewQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, taxInvoiceNumber) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PaymentSettlementRepository.instance
                .fetchPaymentSettlementNew(
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
  PageOptions<PaymentSettlementNew> _pageOptions = PageOptions.empty();
}
