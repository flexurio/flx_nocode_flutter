import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_initial.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/product_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_initial_query_bloc.freezed.dart';

@freezed
class ProductStockInitialQueryState with _$ProductStockInitialQueryState {
  const factory ProductStockInitialQueryState.initial() = _Initial;
  const factory ProductStockInitialQueryState.loading(
      PageOptions<ProductStockInitial> pageOptions) = _Loading;
  const factory ProductStockInitialQueryState.loaded(
      PageOptions<ProductStockInitial> pageOptions) = _Loaded;
  const factory ProductStockInitialQueryState.error(String error) = _Error;
}

@freezed
class ProductStockInitialQueryEvent with _$ProductStockInitialQueryEvent {
  const factory ProductStockInitialQueryEvent.fetch({
    PageOptions<ProductStockInitial>? pageOptions,
    DivisionType? divisionType,
    Product? product,
    Warehouse? warehouse,
  }) = _Fetch;
}

class ProductStockInitialQueryBloc
    extends Bloc<ProductStockInitialQueryEvent, ProductStockInitialQueryState> {
  ProductStockInitialQueryBloc() : super(const _Initial()) {
    on<ProductStockInitialQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, divisionType, product, warehouse) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance.fetchInit(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              divisionType: divisionType,
              product: product,
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
  PageOptions<ProductStockInitial> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
