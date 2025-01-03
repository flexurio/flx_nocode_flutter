import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_rupiah_query_bloc.freezed.dart';

@freezed
class ProductStockRupiahQueryState with _$ProductStockRupiahQueryState {
  const factory ProductStockRupiahQueryState.initial() = _Initial;
  const factory ProductStockRupiahQueryState.loading(
    PageOptions<ProductStockRupiah> pageOptions,
  ) = _Loading;
  const factory ProductStockRupiahQueryState.loaded(
    PageOptions<ProductStockRupiah> pageOptions,
  ) = _Loaded;
  const factory ProductStockRupiahQueryState.error(String error) = _Error;
}

@freezed
class ProductStockRupiahQueryEvent with _$ProductStockRupiahQueryEvent {
  const factory ProductStockRupiahQueryEvent.fetch({
    PageOptions<ProductStockRupiah>? pageOptions,
    DateTime? date,
  }) = _Fetch;
}

class ProductStockRupiahQueryBloc extends Bloc<ProductStockRupiahQueryEvent, ProductStockRupiahQueryState> {
  ProductStockRupiahQueryBloc() : super(const _Initial()) {
    on<ProductStockRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, date) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductStockRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              date: date,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductStockRupiah> _pageOptions = PageOptions.empty(sortBy: 'product_id');
}
