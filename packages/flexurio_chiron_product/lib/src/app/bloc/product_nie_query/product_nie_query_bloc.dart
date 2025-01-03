import 'package:flexurio_chiron_product/src/app/model/product_nie.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_nie_query_bloc.freezed.dart';

@freezed
class ProductNieQueryState with _$ProductNieQueryState {
  const factory ProductNieQueryState.initial() = _Initial;
  const factory ProductNieQueryState.loading() = _Loading;
  const factory ProductNieQueryState.loaded(
    List<ProductNie> productNie,
  ) = _Success;
  const factory ProductNieQueryState.error(String error) = _Error;
}

@freezed
class ProductNieQueryEvent with _$ProductNieQueryEvent {
  const factory ProductNieQueryEvent.get({
    String? productId,
  }) = _Get;
}

class ProductNieQueryBloc
    extends Bloc<ProductNieQueryEvent, ProductNieQueryState> {
  ProductNieQueryBloc() : super(const _Initial()) {
    on<ProductNieQueryEvent>((event, emit) async {
      await event.when(
        get: (productId) async {
          emit(const _Loading());
          try {
            final productNie = await ProductRepository.instance.productNieFetch(
              accessToken: UserRepositoryApp.instance.token!,
              productId: productId!,
            );

            emit(_Success(productNie));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
