import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_formulation_detail_query_bloc.freezed.dart';

@freezed
class ProductFormulationDetailQueryState
    with _$ProductFormulationDetailQueryState {
  const factory ProductFormulationDetailQueryState.initial() = _Initial;
  const factory ProductFormulationDetailQueryState.loading() = _Loading;
  const factory ProductFormulationDetailQueryState.loaded(
    List<ProductFormulationDetail> details,
  ) = _Loaded;
  const factory ProductFormulationDetailQueryState.error(String error) = _Error;
}

@freezed
class ProductFormulationDetailQueryEvent
    with _$ProductFormulationDetailQueryEvent {
  const factory ProductFormulationDetailQueryEvent.fetch({
    ProductFormulation? productFormulation,
    Material? material,
    bool? isActive,
    Product? product,
    ProductFormulationScale? scale,
  }) = _Fetch;
}

class ProductFormulationDetailQueryBloc extends Bloc<
    ProductFormulationDetailQueryEvent, ProductFormulationDetailQueryState> {
  final bool isExternal;
  ProductFormulationDetailQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductFormulationDetailQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch:
              (productFormulation, material, isActive, product, scale) async {
            emit(const _Loading());
            try {
              final formulation = await ProductFormulationRepository.instance
                  .productFormulationDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                id: productFormulation?.id,
                material: material,
                isActive: isActive,
                scale: scale,
                isExternal: isExternal,
                product: product,
              );
              emit(_Loaded(formulation));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
