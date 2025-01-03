import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_detail_filter_by_batch_query_bloc.freezed.dart';

@freezed
class SalesOrderDetailFilterByBatchQueryState
    with _$SalesOrderDetailFilterByBatchQueryState {
  const factory SalesOrderDetailFilterByBatchQueryState.initial() = _Initial;
  const factory SalesOrderDetailFilterByBatchQueryState.loading() = _Loading;
  const factory SalesOrderDetailFilterByBatchQueryState.loaded(
    List<SalesOrderDetail> sales,
  ) = _Loaded;
  const factory SalesOrderDetailFilterByBatchQueryState.error(String error) =
      _Error;
}

@freezed
class SalesOrderDetailFilterByBatchQueryEvent
    with _$SalesOrderDetailFilterByBatchQueryEvent {
  const factory SalesOrderDetailFilterByBatchQueryEvent.fetch(
    SalesOrder sales,
    String batchNo,
  ) = _Fetch;
}

class SalesOrderDetailFilterByBatchQueryBloc extends Bloc<
    SalesOrderDetailFilterByBatchQueryEvent,
    SalesOrderDetailFilterByBatchQueryState> {
  SalesOrderDetailFilterByBatchQueryBloc() : super(const _Initial()) {
    on<SalesOrderDetailFilterByBatchQueryEvent>((event, emit) async {
      await event.when(
        fetch: (sales, batchNo) async {
          emit(const _Loading());
          try {
            final salesOrder =
                await SalesOrderRepository.instance.salesOrderDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: sales,
              batchId: batchNo,
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
