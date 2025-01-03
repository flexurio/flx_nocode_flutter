import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_discount_query_bloc.freezed.dart';

@freezed
class CustomerDiscountQueryEvent with _$CustomerDiscountQueryEvent {
  const factory CustomerDiscountQueryEvent.fetch({
    PageOptions<CustomerDiscount>? pageOptions,
    Customer? customer,
  }) = _Fetch;
}

@freezed
class CustomerDiscountQueryState with _$CustomerDiscountQueryState {
  const factory CustomerDiscountQueryState.error(String error) = _Error;
  const factory CustomerDiscountQueryState.initial() = _Initial;
  const factory CustomerDiscountQueryState.loaded(
    PageOptions<CustomerDiscount> pageOptions,
  ) = _Success;
  const factory CustomerDiscountQueryState.loading(
    PageOptions<CustomerDiscount> pageOptions,
  ) = _Loading;
}

class CustomerDiscountQueryBloc
    extends Bloc<CustomerDiscountQueryEvent, CustomerDiscountQueryState> {
  CustomerDiscountQueryBloc() : super(const _Initial()) {
    on<CustomerDiscountQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, customer) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await FinanceRepository.instance.customerDiscountFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              customer: customer,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<CustomerDiscount> _pageOptions = PageOptions.empty();
}
