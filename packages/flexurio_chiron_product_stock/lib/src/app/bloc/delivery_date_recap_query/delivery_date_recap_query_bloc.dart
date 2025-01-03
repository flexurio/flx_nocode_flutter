import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/ppic_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/delivery_date_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_date_recap_query_bloc.freezed.dart';

@freezed
class DeliveryDateRecapQueryState with _$DeliveryDateRecapQueryState {
  const factory DeliveryDateRecapQueryState.initial() = _Initial;
  const factory DeliveryDateRecapQueryState.loading() = _Loading;
  const factory DeliveryDateRecapQueryState.loaded(
    List<DeliveryDateRecap> recapDeliveryDate,
  ) = _Success;
  const factory DeliveryDateRecapQueryState.error(String error) = _Error;
}

@freezed
class DeliveryDateRecapQueryEvent with _$DeliveryDateRecapQueryEvent {
  const factory DeliveryDateRecapQueryEvent.fetch({
    DateTime? deliveryOrderDateGte,
    DateTime? deliveryOrderDateLte,
    Customer? customer,
  }) = _Fetch;
}

class DeliveryDateRecapQueryBloc
    extends Bloc<DeliveryDateRecapQueryEvent, DeliveryDateRecapQueryState> {
  DeliveryDateRecapQueryBloc() : super(const _Initial()) {
    on<DeliveryDateRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch: (deliveryOrderDateGte, deliveryOrderDateLte, customer) async {
          emit(const _Loading());
          try {
            final deliveryDateRecap =
                await PpicRepository.instance.deliveryDateRecapFetch(
              accessToken: UserRepositoryApp.instance.token!,
              deliveryOrderDateGte: deliveryOrderDateGte,
              deliveryOrderDateLte: deliveryOrderDateLte,
              customer: customer,
            );
            emit(_Success(deliveryDateRecap));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
