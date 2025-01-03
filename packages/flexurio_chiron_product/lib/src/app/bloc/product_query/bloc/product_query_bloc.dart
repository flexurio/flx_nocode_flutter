import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/src/app/resource/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_query_bloc.freezed.dart';

@freezed
class ProductQueryState with _$ProductQueryState {
  const factory ProductQueryState.initial() = _Initial;
  const factory ProductQueryState.loading(
    PageOptions<Product> pageOptions,
  ) = _Loading;
  const factory ProductQueryState.loaded(
    PageOptions<Product> pageOptions,
  ) = _Success;
  const factory ProductQueryState.error(String error) = _Error;
}

@freezed
class ProductQueryEvent with _$ProductQueryEvent {
  const factory ProductQueryEvent.fetch({
    PageOptions<Product>? pageOptions,
    bool? active,
    bool? isPhaseOut,
    ProductGroup? productGroup,
    Product? product,
  }) = _Fetch;
}

class ProductQueryBloc extends Bloc<ProductQueryEvent, ProductQueryState> {
  final bool isExternal;
  ProductQueryBloc({
    bool? pagination,
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, active, isPhaseOut, productGroup, product) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            if (pagination == false) {
              _pageOptions = PageOptions.emptyNoLimit();
            }
            _pageOptions = await ProductRepositoryX.instance.productFetch(
              accessToken: UserRepositoryApp.instance.token!,
              active: active,
              isPhaseOut: isPhaseOut,
              pageOptions: _pageOptions,
              productGroup: productGroup,
              product: product,
              isExternal: isExternal,
            );

            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Product> _pageOptions = PageOptions.empty();
}
