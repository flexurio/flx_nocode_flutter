import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_query_bloc.freezed.dart';

@freezed
class ProductStockQueryState with _$ProductStockQueryState {
  const factory ProductStockQueryState.initial() = _Initial;
  const factory ProductStockQueryState.loading() = _Loading;
  const factory ProductStockQueryState.loaded(
    List<ProductStock> productsStock,
  ) = _Loaded;
  const factory ProductStockQueryState.error(String message) = _Error;
}

@freezed
class ProductStockQueryEvent with _$ProductStockQueryEvent {
  const factory ProductStockQueryEvent.fetch({
    DateTime? period,
    String? productGroupId,
    String? productId,
    String? batchId,
    double? endingBalance,
    String? unitId,
    List<Warehouse>? warehouse,
  }) = _Fetch;
}

class ProductStockQueryBloc
    extends Bloc<ProductStockQueryEvent, ProductStockQueryState> {
  ProductStockQueryBloc() : super(const _Initial()) {
    on<ProductStockQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          period,
          productGroupId,
          productId,
          batchId,
          endingBalance,
          unitId,
          warehouse,
        ) async {
          emit(const _Loading());
          try {
            final productsStock =
                await ProductStockRepository.instance.productStockFetch(
              accessToken: UserRepositoryApp.instance.token!,
              period: period,
              productGroupId: productGroupId,
              productId: productId,
              batchId: batchId,
              endingBalance: endingBalance,
              warehouse: warehouse,
              unitId: unitId,
            );
            emit(_Loaded(productsStock));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
