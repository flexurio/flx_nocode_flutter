import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_address_query_bloc.freezed.dart';

@freezed
class CustomerAddressQueryState with _$CustomerAddressQueryState {
  const factory CustomerAddressQueryState.initial() = _Initial;
  const factory CustomerAddressQueryState.loading(
    PageOptions<Customer> pageOptions,
  ) = _Loading;
  const factory CustomerAddressQueryState.loaded(
    PageOptions<Customer> pageOptions,
  ) = _Success;
  const factory CustomerAddressQueryState.error(String error) = _Error;
}

@freezed
class CustomerAddressQueryEvent with _$CustomerAddressQueryEvent {
  const factory CustomerAddressQueryEvent.fetchByParent({
    PageOptions<Customer>? pageOptions,
    Customer? customer,
  }) = _FetchByParent;
}

class CustomerAddressQueryBloc
    extends Bloc<CustomerAddressQueryEvent, CustomerAddressQueryState> {
  CustomerAddressQueryBloc() : super(const _Initial()) {
    on<CustomerAddressQueryEvent>((event, emit) async {
      await event.when(
        fetchByParent: (pageOptions, customer) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await FinanceRepository.instance.customerFetchByParent(
              accessToken: UserRepositoryApp.instance.token!,
              customer: customer,
              pageOptions: _pageOptions,
            );
            emit(
              _Success(_pageOptions),
            );
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
  PageOptions<Customer> _pageOptions = PageOptions.empty();
}
