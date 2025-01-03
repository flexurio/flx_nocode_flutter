import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_mutation_recap.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_mutation_recap_query_bloc.freezed.dart';

@freezed
class ProductStockMutationRecapQueryState
    with _$ProductStockMutationRecapQueryState {
  const factory ProductStockMutationRecapQueryState.initial() = _Initial;
  const factory ProductStockMutationRecapQueryState.loading(
    PageOptions<ProductStockMutationRecap> pageOptions,
  ) = _Loading;
  const factory ProductStockMutationRecapQueryState.loaded(
    PageOptions<ProductStockMutationRecap> pageOptions,
  ) = _Loaded;
  const factory ProductStockMutationRecapQueryState.error(String error) =
      _Error;
}

@freezed
class ProductStockMutationRecapQueryEvent
    with _$ProductStockMutationRecapQueryEvent {
  const factory ProductStockMutationRecapQueryEvent.fetch({
    required DateTime startDate,
    required DateTime endDate,
    PageOptions<ProductStockMutationRecap>? pageOptions,
  }) = _Fetch;
}

class ProductStockMutationRecapQueryBloc extends Bloc<
    ProductStockMutationRecapQueryEvent, ProductStockMutationRecapQueryState> {
  ProductStockMutationRecapQueryBloc() : super(const _Initial()) {
    on<ProductStockMutationRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch: (dateStart, dateEnd, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await ProductStockRepository.instance.mutationRecapFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateStart: dateStart,
              dateEnd: dateEnd,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductStockMutationRecap> _pageOptions = PageOptions.empty(
    sortBy: 'product_id',
  );
}
