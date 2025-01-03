import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/payment.dart';

part 'payment_detail_receivable_query_bloc.freezed.dart';

@freezed
class PaymentDetailReceivableQueryEvent with _$PaymentDetailReceivableQueryEvent {
  const factory PaymentDetailReceivableQueryEvent.fetch({
    required Payment payment,
  }) = _Fetch;
}

@freezed
class PaymentDetailReceivableQueryState with _$PaymentDetailReceivableQueryState {
  const factory PaymentDetailReceivableQueryState.error(String error) = _Error;
  const factory PaymentDetailReceivableQueryState.initial() = _Initial;
  const factory PaymentDetailReceivableQueryState.loaded(
    List<PaymentDetailReceivable> paymentDetailsReceivable,
    Payment payment,
  ) = _Loaded;
  const factory PaymentDetailReceivableQueryState.loading() = _Loading;
}

class PaymentDetailReceivableQueryBloc
    extends Bloc<PaymentDetailReceivableQueryEvent, PaymentDetailReceivableQueryState> {
  PaymentDetailReceivableQueryBloc() : super(const _Initial()) {
    on<PaymentDetailReceivableQueryEvent>((event, emit) async {
      await event.when(
        fetch: (payment) async {
          emit(_Loading());
          try {
            final paymentDetailReceivable = await PaymentRepository.instance.paymentDetailReceivableFetch(
              accessToken: UserRepositoryApp.instance.token!,
              payment: payment,
            );

            final paymentX = await PaymentRepository.instance.paymentFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              paymentId: payment.id,
            );

            emit(_Loaded(paymentDetailReceivable, paymentX));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
