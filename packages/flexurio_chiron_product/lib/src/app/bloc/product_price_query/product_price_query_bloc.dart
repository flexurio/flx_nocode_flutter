import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_price_query_bloc.freezed.dart';

@freezed
class ProductPriceQueryState with _$ProductPriceQueryState {
  const factory ProductPriceQueryState.initial() = _Initial;
  const factory ProductPriceQueryState.loading() = _Loading;
  const factory ProductPriceQueryState.loaded(
    List<ProductPrice> productsPrice,
  ) = _Success;
  const factory ProductPriceQueryState.error(String error) = _Error;
}

@freezed
class ProductPriceQueryEvent with _$ProductPriceQueryEvent {
  const factory ProductPriceQueryEvent.fetch({
    required Product? product,
    bool? isEndDateNull,
  }) = _Fetch;
}

class ProductPriceQueryBloc
    extends Bloc<ProductPriceQueryEvent, ProductPriceQueryState> {
  ProductPriceQueryBloc() : super(const _Initial()) {
    on<ProductPriceQueryEvent>((event, emit) async {
      await event.when(
        fetch: (product, isEndDateNull) async {
          emit(const _Loading());
          try {
            late List<ProductPrice> productsPrice;
            if (product != null && isEndDateNull == true) {
              productsPrice =
                  await ProductRepository.instance.productPriceLatestFetch(
                accessToken: UserRepositoryApp.instance.token!,
                productId: product.id,
              );
            } else {
              productsPrice =
                  await ProductRepository.instance.productPriceFetch(
                accessToken: UserRepositoryApp.instance.token!,
                product: product,
              );
            }

            emit(_Success(productsPrice));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
