import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/payment.dart';

part 'payment_detail_query_bloc.freezed.dart';

@freezed
class PaymentDetailQueryEvent with _$PaymentDetailQueryEvent {
  const factory PaymentDetailQueryEvent.fetch({
    PageOptions<PaymentDetail>? pageOptions,
    required Payment payment,
  }) = _Fetch;
}

@freezed
class PaymentDetailQueryState with _$PaymentDetailQueryState {
  const factory PaymentDetailQueryState.error(String error) = _Error;
  const factory PaymentDetailQueryState.initial() = _Initial;
  const factory PaymentDetailQueryState.loaded(
    PageOptions<PaymentDetail> pageOptions,
    Payment payment,
  ) = _Success;
  const factory PaymentDetailQueryState.loading(
    PageOptions<PaymentDetail> pageOptions,
    Payment payment,
  ) = _Loading;
}

class PaymentDetailQueryBloc
    extends Bloc<PaymentDetailQueryEvent, PaymentDetailQueryState> {
  PaymentDetailQueryBloc() : super(const _Initial()) {
    on<PaymentDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, payment) async {
          emit(_Loading(_pageOptions, payment));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PaymentRepository.instance.paymentDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              payment: payment,
            );

            final paymentX = await PaymentRepository.instance.paymentFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              paymentId: payment.id,
            );

            emit(_Success(_pageOptions, paymentX));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PaymentDetail> _pageOptions = PageOptions.empty();
}
