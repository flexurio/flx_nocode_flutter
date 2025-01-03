import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_recap.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/product_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_recap_query_bloc.freezed.dart';

@freezed
class ProductStockRecapQueryState with _$ProductStockRecapQueryState {
  const factory ProductStockRecapQueryState.initial() = _Initial;
  const factory ProductStockRecapQueryState.loading(
    PageOptions<ProductStockRecap> pageOptions,
  ) = _Loading;
  const factory ProductStockRecapQueryState.loaded(
    PageOptions<ProductStockRecap> pageOptions,
  ) = _Loaded;
  const factory ProductStockRecapQueryState.error(String error) = _Error;
}

@freezed
class ProductStockRecapQueryEvent with _$ProductStockRecapQueryEvent {
  const factory ProductStockRecapQueryEvent.fetch({
    PageOptions<ProductStockRecap>? pageOptions,
    DivisionType? divisionType,
    Product? product,
  }) = _Fetch;
}

class ProductStockRecapQueryBloc
    extends Bloc<ProductStockRecapQueryEvent, ProductStockRecapQueryState> {
  ProductStockRecapQueryBloc() : super(const _Initial()) {
    on<ProductStockRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, divisionType, product) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance.recapFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              divisionType: divisionType,
              product: product,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductStockRecap> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
