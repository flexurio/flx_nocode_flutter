import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_history.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_order_history_query_bloc.freezed.dart';

@freezed
abstract class SalesOrderHistoryQueryState with _$SalesOrderHistoryQueryState {
  const factory SalesOrderHistoryQueryState.initial() = _Initial;
  const factory SalesOrderHistoryQueryState.loading() = _Loading;
  const factory SalesOrderHistoryQueryState.loaded(
    List<SalesOrderHistory> salesOrderHistories,
  ) = _Success;
  const factory SalesOrderHistoryQueryState.error(String error) = _Error;
}

@freezed
abstract class SalesOrderHistoryQueryEvent with _$SalesOrderHistoryQueryEvent {
  const factory SalesOrderHistoryQueryEvent.fetch(
    SalesOrder salesOrder,
  ) = _Fetch;
}

class SalesOrderHistoryQueryBloc
    extends Bloc<SalesOrderHistoryQueryEvent, SalesOrderHistoryQueryState> {
  SalesOrderHistoryQueryBloc() : super(const _Initial()) {
    on<SalesOrderHistoryQueryEvent>((event, emit) async {
      await event.when(
        fetch: (salesOrder) async {
          emit(const _Loading());
          try {
            final salesOrderHistories = await SalesOrderRepository.instance
                .salesOrderFetchHistoriesHeader(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );
            emit(_Success(salesOrderHistories));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
