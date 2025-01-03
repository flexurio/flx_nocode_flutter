import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_formulation_query_bloc.freezed.dart';

@freezed
class ProductFormulationQueryState with _$ProductFormulationQueryState {
  const factory ProductFormulationQueryState.initial() = _Initial;
  const factory ProductFormulationQueryState.loading(
    PageOptions<ProductFormulation> pageOptions,
  ) = _Loading;
  const factory ProductFormulationQueryState.loaded(
    PageOptions<ProductFormulation> pageOptions,
  ) = _Loaded;
  const factory ProductFormulationQueryState.error(String error) = _Error;
}

@freezed
class ProductFormulationQueryEvent with _$ProductFormulationQueryEvent {
  const factory ProductFormulationQueryEvent.fetch({
    PageOptions<ProductFormulation>? pageOptions,
    bool? isActive,
    bool? isConfirm,
    Product? product,
  }) = _Fetch;
}

class ProductFormulationQueryBloc
    extends Bloc<ProductFormulationQueryEvent, ProductFormulationQueryState> {
  final bool isExternal;
  ProductFormulationQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductFormulationQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, isActive, isConfirm, product) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await ProductFormulationRepository.instance
                .productFormulationFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              isActive: isActive,
              isConfirm: isConfirm,
              product: product,
              isExternal: isExternal,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductFormulation> _pageOptions = PageOptions.empty();
}
