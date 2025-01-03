import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_query_bloc.freezed.dart';

@freezed
abstract class SalesOrderQueryState with _$SalesOrderQueryState {
  const factory SalesOrderQueryState.initial() = _Initial;
  const factory SalesOrderQueryState.loading(
    PageOptions<SalesOrder> pageOptions,
  ) = _Loading;
  const factory SalesOrderQueryState.loaded(
    PageOptions<SalesOrder> pageOptions,
    List<Customer> filterCustomer,
  ) = _Loaded;
  const factory SalesOrderQueryState.error(String error) = _Error;
}

@freezed
abstract class SalesOrderQueryEvent with _$SalesOrderQueryEvent {
  const factory SalesOrderQueryEvent.fetch({
    PageOptions<SalesOrder>? pageOptions,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? status,
    Customer? customer,
    String? orderTypeId,
  }) = _Fetch;

  const factory SalesOrderQueryEvent.fetchById(String id) = _FetchById;
}

class SalesOrderQueryBloc
    extends Bloc<SalesOrderQueryEvent, SalesOrderQueryState> {
  SalesOrderQueryBloc() : super(const _Initial()) {
    on<SalesOrderQueryEvent>((event, emit) async {
      await event.when(
        fetchById: (id) async {
          emit(_Loading(_pageOptions));
          try {
            final salesOrder =
                await SalesOrderRepository.instance.salesOrderFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(
              _Loaded(
                PageOptions<SalesOrder>.empty().copyWith(
                  data: [salesOrder],
                ),
                [],
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (pageOptions, periodStart, periodEnd, status, customer,
            orderTypeId) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _salesOrderFilterCustomer = [];
            _pageOptions = await SalesOrderRepository.instance.salesOrderFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              status: status,
              periodStart: periodStart,
              periodEnd: periodEnd,
              customer: customer,
              orderTypeId: orderTypeId,
            );
            for (var index = 0; index < _pageOptions.data.length; index++) {
              if (_salesOrderFilterCustomer.isEmpty) {
                _salesOrderFilterCustomer
                    .add(_pageOptions.data[index].productRequest!.customer);
              } else {
                final checkValue = _salesOrderFilterCustomer.indexWhere(
                  (item) =>
                      item.id ==
                      _pageOptions.data[index].productRequest!.customer.id,
                );

                if (checkValue == -1) {
                  _salesOrderFilterCustomer
                      .add(_pageOptions.data[index].productRequest!.customer);
                }
              }
            }
            emit(
              _Loaded(
                _pageOptions,
                _salesOrderFilterCustomer,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  List<Customer> _salesOrderFilterCustomer = [];
  PageOptions<SalesOrder> _pageOptions = PageOptions.empty();
}
