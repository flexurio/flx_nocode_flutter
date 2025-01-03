import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_distribution.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_distribution.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_distribution_query_bloc.freezed.dart';

@freezed
class ProductDistributionQueryState with _$ProductDistributionQueryState {
  const factory ProductDistributionQueryState.initial() = _Initial;
  const factory ProductDistributionQueryState.loading(
    PageOptions<ProductDistribution> pageOptions,
  ) = _Loading;
  const factory ProductDistributionQueryState.loaded(
    PageOptions<ProductDistribution> pageOptions,
  ) = _Success;
  const factory ProductDistributionQueryState.error(String error) = _Error;
}

@freezed
class ProductDistributionQueryEvent with _$ProductDistributionQueryEvent {
  const factory ProductDistributionQueryEvent.fetch({
    required DateTime createdAtStart,
    required DateTime createdAtEnd,
    required String productId,
    required String warehouseId,
    PageOptions<ProductDistribution>? pageOptions,
  }) = _Fetch;
}

class ProductDistributionQueryBloc
    extends Bloc<ProductDistributionQueryEvent, ProductDistributionQueryState> {
  ProductDistributionQueryBloc() : super(const _Initial()) {
    on<ProductDistributionQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          createdAtStart,
          createdAtEnd,
          productId,
          warehouseId,
          pageOptions,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductDistributionRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              createdAtStart: createdAtStart,
              createdAtEnd: createdAtEnd,
              productId: productId,
              warehouseId: warehouseId,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductDistribution> _pageOptions =
      PageOptions.empty(sortBy: 'product_id');
}
