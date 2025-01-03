import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_stock_mutation_product_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_mutation_product_detail_query_bloc.freezed.dart';

@freezed
class ProductStockMutationProductDetailQueryState with _$ProductStockMutationProductDetailQueryState {
  const factory ProductStockMutationProductDetailQueryState.initial() = _Initial;
  const factory ProductStockMutationProductDetailQueryState.loading(
    PageOptions<ProductStockMutationProductDetail> pageOptions,
  ) = _Loading;
  const factory ProductStockMutationProductDetailQueryState.loaded(
    PageOptions<ProductStockMutationProductDetail> pageOptions,
  ) = _Loaded;
  const factory ProductStockMutationProductDetailQueryState.error(String message) = _Error;
}

@freezed
class ProductStockMutationProductDetailQueryEvent with _$ProductStockMutationProductDetailQueryEvent {
  const factory ProductStockMutationProductDetailQueryEvent.fetch({
    PageOptions<ProductStockMutationProductDetail>? pageOptions,
    Product? product,
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) = _Fetch;
}

class ProductStockMutationProductDetailQueryBloc extends Bloc<ProductStockMutationProductDetailQueryEvent, ProductStockMutationProductDetailQueryState> {
  ProductStockMutationProductDetailQueryBloc() : super(const _Initial()) {
    on<ProductStockMutationProductDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, product, startPeriod, endPeriod) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance.productStockMutationProductDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              product: product,
              startPeriod: startPeriod,
              endPeriod: endPeriod,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductStockMutationProductDetail> _pageOptions = PageOptions.empty(sortBy: 'product_id');
}