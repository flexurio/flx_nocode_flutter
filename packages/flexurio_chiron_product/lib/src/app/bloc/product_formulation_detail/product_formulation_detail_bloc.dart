import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_formulation_detail_bloc.freezed.dart';

@freezed
abstract class ProductFormulationDetailEvent
    with _$ProductFormulationDetailEvent {
  const factory ProductFormulationDetailEvent.create({
    required Material material,
    required double quantity,
  }) = _Create;
  const factory ProductFormulationDetailEvent.update(
    ProductFormulationDetailTemporary data,
  ) = _Update;
  const factory ProductFormulationDetailEvent.delete(int id) = _Delete;
  const factory ProductFormulationDetailEvent.clear() = _Clear;
  const factory ProductFormulationDetailEvent.see() = _See;
  const factory ProductFormulationDetailEvent.fetch({
    int? id,
    Product? product,
    ProductFormulationScale? scale,
  }) = _Fetch;
  const factory ProductFormulationDetailEvent.addAll({
    required List<ProductFormulationDetailTemporary> productFormulationDetail,
  }) = _AddAll;
}

class ProductFormulationDetailBloc extends Bloc<ProductFormulationDetailEvent,
    List<ProductFormulationDetailTemporary>> {
      final bool isExternal;
  ProductFormulationDetailBloc({
    required this.isExternal,
  }) : super([]) {
    on<ProductFormulationDetailEvent>((event, emit) async {
      await event.when(
        create: (material, quantity) {
          final newState = [
            ...state,
            ProductFormulationDetailTemporary(
              id: DateTime.now().millisecondsSinceEpoch,
              material: material,
              quantity: quantity,
            ),
          ];
          emit(newState);
        },
        update: (data) {
          final index = state.indexWhere((element) => element.id == data.id);
          if (index != -1) {
            final newState = [...state];
            newState[index] = data;
            emit(newState);
          }
        },
        delete: (id) {
          final newState = [...state]..removeWhere((item) => item.id == id);
          emit(newState);
        },
        clear: () {
          emit([]);
        },
        see: () {
          emit(state);
        },
        fetch: (id, product, scale) async {
          final productFormulationDetails = await ProductFormulationRepository
              .instance
              .productFormulationDetailFetch(
            accessToken: UserRepositoryApp.instance.token!,
            id: id,
            product: product,
            scale: scale,
                isExternal: isExternal,
          );

          final tempProductFormulationDetails = productFormulationDetails
              .map(
                ProductFormulationDetailTemporary.fromProductFormulationDetail,
              )
              .toList();
          _initialState = tempProductFormulationDetails;
          emit(tempProductFormulationDetails);
        },
        addAll: (productFormulationDetail) {
          emit(List.from(productFormulationDetail));
        },
      );
    });
  }
  List<ProductFormulationDetailTemporary> _initialState = [];
  List<ProductFormulationDetailTemporary> get initialState => _initialState;
}
