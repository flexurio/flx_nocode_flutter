import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_payment_query_bloc.freezed.dart';

@freezed
class TransactionPaymentQueryState with _$TransactionPaymentQueryState {
  const factory TransactionPaymentQueryState.initial() = _Initial;
  const factory TransactionPaymentQueryState.loading(
    PageOptions<TransactionPayment> pageOptions,
  ) = _Loading;
  const factory TransactionPaymentQueryState.loaded(
    PageOptions<TransactionPayment> pageOptions,
  ) = _Loaded;
  const factory TransactionPaymentQueryState.error(String error) = _Error;
}

@freezed
class TransactionPaymentQueryEvent with _$TransactionPaymentQueryEvent {
  const factory TransactionPaymentQueryEvent.fetch({
    PageOptions<TransactionPayment>? pageOptions,
    TransactionJournalType? type,
    String? supplierId,
    String? customerId,
    double? paymentRemainingGreaterThanEqualTo,
    double? paymentRemainingLessThanEqualTo,
    double? paymentRemainingEqualTo,
    double? paymentRemainingNotEqualTo,
    DateTime? dateGreaterThanEqualTo,
    DateTime? dateLessThanEqualTo,
    DateTime? paymentDateGreaterThanEqualTo,
    DateTime? paymentDateLessThanEqualTo,
  }) = _Fetch;
}

class TransactionPaymentQueryBloc
    extends Bloc<TransactionPaymentQueryEvent, TransactionPaymentQueryState> {
  TransactionPaymentQueryBloc() : super(const _Initial()) {
    on<TransactionPaymentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          type,
          supplierId,
          customerId,
          paymentRemainingGreaterThanEqualTo,
          paymentRemainingLessThanEqualTo,
          paymentRemainingEqualTo,
          paymentRemainingNotEqualTo,
          dateGraterThanEqualTo,
          dateLessThanEqualTo,
          paymentDateGraterThanEqualTo,
          paymentDateLessThanEqualTo,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await FinanceRepository.instance.transactionPaymentFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              type: type,
              supplierId: supplierId,
              customerId: customerId,
              paymentRemainingGreaterThanEqualTo:
                  paymentRemainingGreaterThanEqualTo,
              paymentRemainingLessThanEqualTo: paymentRemainingLessThanEqualTo,
              paymentRemainingEqualTo: paymentRemainingEqualTo,
              paymentRemainingNotEqualTo: paymentRemainingNotEqualTo,
              dateGraterThanEqualTo: dateGraterThanEqualTo,
              dateLessThanEqualTo: dateLessThanEqualTo,
              paymentDateGreaterThanEqualTo: paymentDateGraterThanEqualTo,
              paymentDateLessThanEqualTo: paymentDateLessThanEqualTo,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<TransactionPayment> _pageOptions = PageOptions.empty(
    sortBy: 'transaction_no',
  );
}
