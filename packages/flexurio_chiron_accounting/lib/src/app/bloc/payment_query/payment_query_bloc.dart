import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_query_bloc.freezed.dart';

@freezed
class PaymentQueryEvent with _$PaymentQueryEvent {
  const factory PaymentQueryEvent.fetch({
    PageOptions<Payment>? pageOptions,
  }) = _Fetch;
}

@freezed
class PaymentQueryState with _$PaymentQueryState {
  const factory PaymentQueryState.error(String error) = _Error;
  const factory PaymentQueryState.initial() = _Initial;
  const factory PaymentQueryState.loaded(PageOptions<Payment> pageOptions) =
      _Success;
  const factory PaymentQueryState.loading(PageOptions<Payment> pageOptions) =
      _Loading;
}

class PaymentQueryBloc extends Bloc<PaymentQueryEvent, PaymentQueryState> {
  PaymentQueryBloc() : super(const _Initial()) {
    on<PaymentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PaymentRepository.instance.paymentFetch(
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
  PageOptions<Payment> _pageOptions = PageOptions.empty();
}
