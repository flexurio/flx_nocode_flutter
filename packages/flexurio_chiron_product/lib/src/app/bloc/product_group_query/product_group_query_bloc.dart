import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_group_query_bloc.freezed.dart';

@freezed
class ProductGroupQueryState with _$ProductGroupQueryState {
  const factory ProductGroupQueryState.initial() = _Initial;
  const factory ProductGroupQueryState.loading() = _Loading;
  const factory ProductGroupQueryState.loaded(
    List<ProductGroup> productGroups,
  ) = _Success;
  const factory ProductGroupQueryState.error(String error) = _Error;
}

@freezed
class ProductGroupQueryEvent with _$ProductGroupQueryEvent {
  const factory ProductGroupQueryEvent.fetch() = _Fetch;
}

class ProductGroupQueryBloc
    extends Bloc<ProductGroupQueryEvent, ProductGroupQueryState> {
  ProductGroupQueryBloc() : super(const _Initial()) {
    on<ProductGroupQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: () async {
            emit(const _Loading());
            try {
              final productGroups =
                  await ProductRepository.instance.productGroupFetch(
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(
                _Success(productGroups),
              );
            } catch (error) {
              emit(
                _Error(
                  errorMessage(error),
                ),
              );
            }
          },
        );
      },
    );
  }
}
