import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_stock_card_batch_query_bloc.freezed.dart';

@freezed
class ProductStockCardBatchQueryState with _$ProductStockCardBatchQueryState {
  const factory ProductStockCardBatchQueryState.initial() = _Initial;
  const factory ProductStockCardBatchQueryState.loading(
    PageOptions<ProductStockCardBatch> pageOptions,
  ) = _Loading;
  const factory ProductStockCardBatchQueryState.loaded(
    PageOptions<ProductStockCardBatch> pageOptions,
  ) = _Loaded;
  const factory ProductStockCardBatchQueryState.error(String message) = _Error;
}

@freezed
class ProductStockCardBatchQueryEvent with _$ProductStockCardBatchQueryEvent {
  const factory ProductStockCardBatchQueryEvent.fetch({
    PageOptions<ProductStockCardBatch>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Product? product,
    Warehouse? warehouse,
  }) = _Fetch;
}

class ProductStockCardBatchQueryBloc extends Bloc<
    ProductStockCardBatchQueryEvent, ProductStockCardBatchQueryState> {
  ProductStockCardBatchQueryBloc() : super(const _Initial()) {
    on<ProductStockCardBatchQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, product, warehouse) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance
                .productStockCardBatchFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              product: product,
              warehouse: warehouse,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
  PageOptions<ProductStockCardBatch> _pageOptions = PageOptions.empty();
}
