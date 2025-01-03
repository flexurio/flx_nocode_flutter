import 'package:flexurio_chiron_material_stock/src/app/model/material_return_material.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_return_material_query_bloc.freezed.dart';

@freezed
class MaterialReturnMaterialQueryState with _$MaterialReturnMaterialQueryState {
  const factory MaterialReturnMaterialQueryState.initial() = _Initial;
  const factory MaterialReturnMaterialQueryState.loading() = _Loading;
  const factory MaterialReturnMaterialQueryState.loaded(
    List<MaterialReturnMaterial> materialReturnMaterials,
  ) = _Loaded;
  const factory MaterialReturnMaterialQueryState.error(String error) = _Error;
}

@freezed
class MaterialReturnMaterialQueryEvent with _$MaterialReturnMaterialQueryEvent {
  const factory MaterialReturnMaterialQueryEvent.fetch({
    String? materialGroupId,
    String? productId,
    String? batchId,
  }) = _Fetch;
}

class MaterialReturnMaterialQueryBloc extends Bloc<
    MaterialReturnMaterialQueryEvent, MaterialReturnMaterialQueryState> {
  final bool isExternal;
  MaterialReturnMaterialQueryBloc({required this.isExternal})
      : super(const _Initial()) {
    on<MaterialReturnMaterialQueryEvent>((event, emit) async {
      await event.when(
        fetch: (materialGroupId, productId, batchId) async {
          emit(const _Loading());
          try {
            final materialReturnMaterials =
                await MaterialRepository.instance.materialReturnFetchMaterial(
              accessToken: UserRepositoryApp.instance.token!,
              materialGroupId: materialGroupId,
              productId: productId,
              batchId: batchId,
              isExternal: isExternal,
            );
            emit(_Loaded(materialReturnMaterials));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
