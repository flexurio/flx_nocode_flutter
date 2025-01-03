import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_detail_filter_by_product_query_bloc.freezed.dart';

@freezed
class SalesOrderDetailFilterByProductQueryState
    with _$SalesOrderDetailFilterByProductQueryState {
  const factory SalesOrderDetailFilterByProductQueryState.initial() = _Initial;
  const factory SalesOrderDetailFilterByProductQueryState.loading() = _Loading;
  const factory SalesOrderDetailFilterByProductQueryState.loaded(
    List<SalesOrderDetail> sales,
  ) = _Loaded;
  const factory SalesOrderDetailFilterByProductQueryState.error(String error) =
      _Error;
}

@freezed
class SalesOrderDetailFilterByProductQueryEvent
    with _$SalesOrderDetailFilterByProductQueryEvent {
  const factory SalesOrderDetailFilterByProductQueryEvent.fetch(
    SalesOrder sales,
    String productId,
  ) = _Fetch;
}

class SalesOrderDetailFilterByProductQueryBloc extends Bloc<
    SalesOrderDetailFilterByProductQueryEvent,
    SalesOrderDetailFilterByProductQueryState> {
  SalesOrderDetailFilterByProductQueryBloc() : super(const _Initial()) {
    on<SalesOrderDetailFilterByProductQueryEvent>((event, emit) async {
      await event.when(
        fetch: (sales, productId) async {
          emit(const _Loading());
          try {
            final salesOrder =
                await SalesOrderRepository.instance.salesOrderDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: sales,
              productId: productId,
            );
            emit(_Loaded(salesOrder));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
