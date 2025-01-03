import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_nie_bloc.freezed.dart';

class ProductNieBloc extends Bloc<ProductNieEvent, ProductNieState> {
  ProductNieBloc() : super(const _Initial()) {
    on<ProductNieEvent>((event, emit) async {
      await event.when(
        create: (
          id,
          publisher,
          periodStart,
          periodEnd,
          productId,
          category,
        ) async {
          emit(const _Loading());
          try {
            final result = await ProductRepository.instance.productNieCreate(
              id: id,
              publisher: publisher,
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              productId: productId,
              category: category,
            );
            emit(_Success(success: result));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (productNie, product) async {
          emit(const _Loading());
          try {
            final result = await ProductRepository.instance.productNieDelete(
              product: product,
              accessToken: UserRepositoryApp.instance.token!,
              productNie: productNie,
            );
            emit(_Success(success: result));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}

@freezed
class ProductNieEvent with _$ProductNieEvent {
  const factory ProductNieEvent.create({
    required String id,
    required String publisher,
    required String periodStart,
    required String periodEnd,
    required String productId,
    required ProductNieCategory category,
  }) = _Create;

  const factory ProductNieEvent.delete(ProductNie productNie, Product product) =
      _Delete;
}

@freezed
class ProductNieState with _$ProductNieState {
  const factory ProductNieState.error(String error) = _Error;
  const factory ProductNieState.initial() = _Initial;
  const factory ProductNieState.loading() = _Loading;
  const factory ProductNieState.success({String? success}) = _Success;
}
