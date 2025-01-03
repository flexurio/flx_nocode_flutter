import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/model/formulation_quantity.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'formulation_query_quantity_bloc.freezed.dart';

@freezed
class FormulationQueryQuantityState with _$FormulationQueryQuantityState {
  factory FormulationQueryQuantityState.initial() = _Initial;
  factory FormulationQueryQuantityState.loading() = _Loading;
  factory FormulationQueryQuantityState.loaded({
    required FormulationQuantity formulationQuantities,
  }) = _Loaded;
  factory FormulationQueryQuantityState.error(String error) = _Error;
}

@freezed
class FormulationQueryQuantityEvent with _$FormulationQueryQuantityEvent {
  factory FormulationQueryQuantityEvent.fetch({
    required Product product,
    required Material material,
  }) = _Fetch;
}

class FormulationQueryQuantityBloc
    extends Bloc<FormulationQueryQuantityEvent, FormulationQueryQuantityState> {
  FormulationQueryQuantityBloc() : super(_Loading()) {
    on<FormulationQueryQuantityEvent>(
      (event, emit) async {
        await event.when(
          fetch: (product, material) async {
            emit(_Loading());
            try {
              final formulationQuantities =
                  await MaterialRepository.instance.formulationQuantities(
                accessToken: UserRepositoryApp.instance.token!,
                product: product,
                material: material,
              );
              emit(_Loaded(formulationQuantities: formulationQuantities));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
