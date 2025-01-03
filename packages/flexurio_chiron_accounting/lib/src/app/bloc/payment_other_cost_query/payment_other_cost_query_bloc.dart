import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_other_cost.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_other_cost_query_bloc.freezed.dart';

@freezed
class PaymentOtherCostQueryEvent with _$PaymentOtherCostQueryEvent {
  const factory PaymentOtherCostQueryEvent.fetch({
    PageOptions<PaymentOtherCost>? pageOptions,
    Payment? payment,
  }) = _Fetch;
  const factory PaymentOtherCostQueryEvent.setData({
    required List<PaymentOtherCost> otherCosts,
  }) = _SetData;
}

@freezed
class PaymentOtherCostQueryState with _$PaymentOtherCostQueryState {
  const factory PaymentOtherCostQueryState.error(String error) = _Error;
  const factory PaymentOtherCostQueryState.initial() = _Initial;
  const factory PaymentOtherCostQueryState.loaded(
    PageOptions<PaymentOtherCost> pageOptions,
  ) = _Success;
  const factory PaymentOtherCostQueryState.loading(
    PageOptions<PaymentOtherCost> pageOptions,
  ) = _Loading;
}

class PaymentOtherCostQueryBloc
    extends Bloc<PaymentOtherCostQueryEvent, PaymentOtherCostQueryState> {
  PaymentOtherCostQueryBloc() : super(const _Initial()) {
    on<PaymentOtherCostQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, payment) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await FinanceRepository.instance.paymentOtherCostFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              payment: payment,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        setData: (otherCosts) async {
          return emit(_Success(_pageOptions.copyWith(data: otherCosts)));
        },
      );
    });
  }
  PageOptions<PaymentOtherCost> _pageOptions = PageOptions.empty();
}
