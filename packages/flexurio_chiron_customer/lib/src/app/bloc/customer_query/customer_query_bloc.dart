import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_query_bloc.freezed.dart';

@freezed
class CustomerQueryState with _$CustomerQueryState {
  const factory CustomerQueryState.initial() = _Initial;
  const factory CustomerQueryState.loading(PageOptions<Customer> pageOptions) =
      _Loading;
  const factory CustomerQueryState.loaded(PageOptions<Customer> pageOptions) =
      _Loaded;
  const factory CustomerQueryState.error(String error) = _Error;
}

@freezed
class CustomerQueryEvent with _$CustomerQueryEvent {
  const factory CustomerQueryEvent.fetch({
    PageOptions<Customer>? pageOptions,
    Customer? parent,
  }) = _Fetch;
}

class CustomerQueryBloc extends Bloc<CustomerQueryEvent, CustomerQueryState> {
  CustomerQueryBloc() : super(const _Initial()) {
    on<CustomerQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, parent) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await FinanceRepository.instance.customerFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              parent: parent,
            );
            emit(
              _Loaded(_pageOptions),
            );
          } catch (error) {
            emit(
              _Error(errorMessage(error)),
            );
          }
        },
      );
    });
  }
  PageOptions<Customer> _pageOptions = PageOptions.empty();
}
