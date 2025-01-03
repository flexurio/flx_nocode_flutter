import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_discount_query_bloc.freezed.dart';

@freezed
class SalesDiscountQueryState with _$SalesDiscountQueryState {
  const factory SalesDiscountQueryState.initial() = _Initial;
  const factory SalesDiscountQueryState.loading() = _Loading;
  const factory SalesDiscountQueryState.loaded(
    List<SalesDiscount> salesDiscount,
  ) = _Loaded;
  const factory SalesDiscountQueryState.error(String error) = _Error;
}

@freezed
class SalesDiscountQueryEvent with _$SalesDiscountQueryEvent {
  const factory SalesDiscountQueryEvent.fetch({
    required Customer? customer,
    required String? period,
  }) = _Fetch;
}

class SalesDiscountQueryBloc
    extends Bloc<SalesDiscountQueryEvent, SalesDiscountQueryState> {
  SalesDiscountQueryBloc() : super(const _Initial()) {
    on<SalesDiscountQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          customer,
          period,
        ) async {
          emit(const _Loading());
          try {
            final salesDiscount =
                await PurchasingRepository.instance.salesDiscountFetch(
              accessToken: UserRepositoryApp.instance.token!,
              customer: customer,
              period: period,
            );
            emit(_Loaded(salesDiscount));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
