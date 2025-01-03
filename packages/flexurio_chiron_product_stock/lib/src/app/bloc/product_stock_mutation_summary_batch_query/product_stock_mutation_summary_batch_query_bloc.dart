import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_mutation_summary_batch_query_bloc.freezed.dart';

@freezed
class ProductStockMutationSummaryBatchQueryState
    with _$ProductStockMutationSummaryBatchQueryState {
  const factory ProductStockMutationSummaryBatchQueryState.initial() = _Initial;
  const factory ProductStockMutationSummaryBatchQueryState.loading(
    PageOptions<ProductStock> pageOptions,
  ) = _Loading;
  const factory ProductStockMutationSummaryBatchQueryState.loaded(
    PageOptions<ProductStock> pageOptions,
  ) = _Loaded;
  const factory ProductStockMutationSummaryBatchQueryState.error(
      String message) = _Error;
}

@freezed
class ProductStockMutationSummaryBatchQueryEvent
    with _$ProductStockMutationSummaryBatchQueryEvent {
  const factory ProductStockMutationSummaryBatchQueryEvent.fetch({
    PageOptions<ProductStock>? pageOptions,
    Product? product,
    DateTime? period,
    Division? division,
    List<Warehouse>? warehouse,
  }) = _Fetch;
}

class ProductStockMutationSummaryBatchQueryBloc extends Bloc<
    ProductStockMutationSummaryBatchQueryEvent,
    ProductStockMutationSummaryBatchQueryState> {
  ProductStockMutationSummaryBatchQueryBloc() : super(const _Initial()) {
    on<ProductStockMutationSummaryBatchQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, product, period, division, warehouse) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance
                .productStockMutationSummaryFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              product: product,
              period: period,
              division: division,
              endingBalance: 0,
              warehouse: warehouse,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }

  PageOptions<ProductStock> _pageOptions = PageOptions.empty(sortBy: 'period');
}
