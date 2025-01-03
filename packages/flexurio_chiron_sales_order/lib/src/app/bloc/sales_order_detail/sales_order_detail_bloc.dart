import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_history.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_detail_bloc.freezed.dart';

@freezed
abstract class SalesOrderDetailState with _$SalesOrderDetailState {
  const factory SalesOrderDetailState.initial({
    bool? isHistory,
    Map<SalesOrderDetail, ProductStock?>? salesOrderDetails,
  }) = _Initial;
  const factory SalesOrderDetailState.initialSetSalesOrderDetail({
    required List<SalesOrderDetail> salesOrderDetails,
  }) = _InitialSetSalesOrderDetail;
  const factory SalesOrderDetailState.loading() = _Loading;
  const factory SalesOrderDetailState.success(bool isTrue) = _Success;
  const factory SalesOrderDetailState.error(String error) = _Error;
}

@freezed
abstract class SalesOrderDetailEvent with _$SalesOrderDetailEvent {
  const factory SalesOrderDetailEvent.fetch({
    required SalesOrder salesOrder,
  }) = _Fetch;
  const factory SalesOrderDetailEvent.fetchById({
    required SalesOrderDetail salesOrderDetail,
  }) = _FetchById;
  const factory SalesOrderDetailEvent.fetchHistory({
    required SalesOrder salesOrder,
    required SalesOrderHistory revisionNo,
  }) = _FetchHistory;
  const factory SalesOrderDetailEvent.updateProductStock({
    required SalesOrderDetail salesOrderDetail,
    required String batchNo,
  }) = _UpdateProductStock;
  const factory SalesOrderDetailEvent.updateSalesOrderDetail({
    required SalesOrderDetail salesOrderDetail,
    required String batchNo,
  }) = _UpdateSalesOrderDetail;
  const factory SalesOrderDetailEvent.remove(
    SalesOrderDetail salesOrderDetail,
  ) = _Remove;
  const factory SalesOrderDetailEvent.delete(
    SalesOrderDetail salesOrderDetail,
  ) = _Delete;
}

class SalesOrderDetailBloc
    extends Bloc<SalesOrderDetailEvent, SalesOrderDetailState> {
  SalesOrderDetailBloc()
      : super(
          const _Initial(),
        ) {
    on<SalesOrderDetailEvent>((event, emit) async {
      await event.when(
        updateSalesOrderDetail: (salesOrderDetail, batchNo) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.updateSalesOrderDetail(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrderDetail: salesOrderDetail,
              batchNo: batchNo,
            );

            emit(const _Success(true));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (salesOrder) async {
          emit(const _Loading());
          try {
            _salesOrderDetails = [];
            _salesOrderDetail = <SalesOrderDetail, ProductStock?>{};

            _salesOrderDetails =
                await SalesOrderRepository.instance.salesOrderDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );

            for (final salesOrderDetail in _salesOrderDetails!) {
              _salesOrderDetail![salesOrderDetail] = null;
            }

            emit(const _Success(false));
            emit(
              _Initial(salesOrderDetails: _salesOrderDetail, isHistory: false),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchById: (salesOrderDetail) async {
          emit(const _Loading());
          try {
            _salesOrderDetails = [];
            _salesOrderDetail = <SalesOrderDetail, ProductStock?>{};

            _salesOrderDetails =
                await SalesOrderRepository.instance.salesOrderDetailFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrderDetail: salesOrderDetail,
            );

            for (final salesOrderDetail in _salesOrderDetails!) {
              _salesOrderDetail![salesOrderDetail] = null;
            }

            emit(const _Success(false));
            emit(
              _Initial(salesOrderDetails: _salesOrderDetail, isHistory: false),
            );
          } catch (error, stack) {
            print(stack);
            emit(_Error(errorMessage(error)));
          }
        },
        fetchHistory: (salesOrder, revisionNo) async {
          emit(const _Loading());
          try {
            _salesOrderDetails = [];
            _salesOrderDetail = <SalesOrderDetail, ProductStock?>{};

            _salesOrderDetails = await SalesOrderRepository.instance
                .salesOrderFetchHistoryDetail(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
              revisionNo: revisionNo,
            );

            for (final salesOrderDetail in _salesOrderDetails!) {
              _salesOrderDetail![salesOrderDetail] = null;
            }

            emit(const _Success(true));
            emit(
              _Initial(salesOrderDetails: _salesOrderDetail, isHistory: true),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        updateProductStock: (salesOrderDetail, batchNo) async {
          emit(const _Loading());
          try {
            final response =
                await ProductStockRepository.instance.productStockFetch(
              accessToken: UserRepositoryApp.instance.token!,
              batchId: batchNo,
              productId: salesOrderDetail.productId,
            );

            emit(const _Success(false));
            _salesOrderDetail![salesOrderDetail] = response[0];
            emit(
              _Initial(
                salesOrderDetails: Map.from(_salesOrderDetail!),
                isHistory: false,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        remove: (detail) {
          final newState = Map<SalesOrderDetail, ProductStock?>.from(
            _salesOrderDetail!,
          )..removeWhere((key, value) => key == detail);
          emit(
            _Initial(salesOrderDetails: newState, isHistory: false),
          );
        },
        delete: (salesOrderDetail) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.salesOrderDetailDelete(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrderDetail: salesOrderDetail,
            );
            emit(const _Success(true));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
  List<SalesOrderDetail>? _salesOrderDetails = [];
  Map<SalesOrderDetail, ProductStock?>? _salesOrderDetail =
      <SalesOrderDetail, ProductStock?>{};
}
