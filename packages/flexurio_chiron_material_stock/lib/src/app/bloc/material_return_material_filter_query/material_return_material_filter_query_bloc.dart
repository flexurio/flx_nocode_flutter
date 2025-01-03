import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_material.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_return_material_filter_query_bloc.freezed.dart';

@freezed
class MaterialReturnMaterialFilterQueryState
    with _$MaterialReturnMaterialFilterQueryState {
  const factory MaterialReturnMaterialFilterQueryState.initial() = _Initial;
  const factory MaterialReturnMaterialFilterQueryState.loading() = _Loading;
  const factory MaterialReturnMaterialFilterQueryState.loaded(
    List<MaterialReturnMaterial> materialReturnMaterials,
  ) = _Loaded;
  const factory MaterialReturnMaterialFilterQueryState.error(String error) =
      _Error;
}

@freezed
class MaterialReturnMaterialFilterQueryEvent
    with _$MaterialReturnMaterialFilterQueryEvent {
  const factory MaterialReturnMaterialFilterQueryEvent.fetch({
    required MaterialReturnDetail detail,
  }) = _Fetch;
}

class MaterialReturnMaterialFilterQueryBloc extends Bloc<
    MaterialReturnMaterialFilterQueryEvent,
    MaterialReturnMaterialFilterQueryState> {
  MaterialReturnMaterialFilterQueryBloc() : super(const _Initial()) {
    on<MaterialReturnMaterialFilterQueryEvent>((event, emit) async {
      await event.when(
        fetch: (detail) async {
          emit(const _Loading());
          try {
            final materialReturnMaterials = await MaterialRepository.instance
                .materialReturnFetchMaterialByFilter(
              accessToken: UserRepositoryApp.instance.token!,
              details: detail,
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
