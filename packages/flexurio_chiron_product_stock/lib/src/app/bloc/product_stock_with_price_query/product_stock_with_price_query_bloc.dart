import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_stock_with_price.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_with_price_query_bloc.freezed.dart';

@freezed
class ProductStockWithPriceQueryState with _$ProductStockWithPriceQueryState {
  const factory ProductStockWithPriceQueryState.initial() = _Initial;
  const factory ProductStockWithPriceQueryState.loading(
    PageOptions<ProductStockWithPrice> pageOptions,
  ) = _Loading;
  const factory ProductStockWithPriceQueryState.loaded(
    PageOptions<ProductStockWithPrice> pageOptions,
  ) = _Success;
  const factory ProductStockWithPriceQueryState.error(String error) = _Error;
}

@freezed
class ProductStockWithPriceQueryEvent with _$ProductStockWithPriceQueryEvent {
  const factory ProductStockWithPriceQueryEvent.fetch({
    PageOptions<ProductStockWithPrice>? pageOptions,
  }) = _Fetch;
}

class ProductStockWithPriceQueryBloc extends Bloc<
    ProductStockWithPriceQueryEvent, ProductStockWithPriceQueryState> {
  ProductStockWithPriceQueryBloc() : super(const _Initial()) {
    on<ProductStockWithPriceQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductStockWithPrice> _pageOptions =
      PageOptions.empty(sortBy: 'name');
}
