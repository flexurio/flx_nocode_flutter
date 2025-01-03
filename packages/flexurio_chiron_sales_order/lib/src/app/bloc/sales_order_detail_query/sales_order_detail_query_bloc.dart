import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_detail_query_bloc.freezed.dart';

@freezed
class SalesOrderDetailQueryState with _$SalesOrderDetailQueryState {
  const factory SalesOrderDetailQueryState.initial() = _Initial;
  const factory SalesOrderDetailQueryState.loading() = _Loading;
  const factory SalesOrderDetailQueryState.loaded(
    List<SalesOrderDetail> sales,
  ) = _Loaded;
  const factory SalesOrderDetailQueryState.error(String error) = _Error;
}

@freezed
class SalesOrderDetailQueryEvent with _$SalesOrderDetailQueryEvent {
  const factory SalesOrderDetailQueryEvent.fetch(SalesOrder sales) = _Fetch;
}

class SalesOrderDetailQueryBloc
    extends Bloc<SalesOrderDetailQueryEvent, SalesOrderDetailQueryState> {
  SalesOrderDetailQueryBloc() : super(const _Initial()) {
    on<SalesOrderDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (sales) async {
          emit(const _Loading());
          try {
            final salesOrder =
                await SalesOrderRepository.instance.salesOrderDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: sales,
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
