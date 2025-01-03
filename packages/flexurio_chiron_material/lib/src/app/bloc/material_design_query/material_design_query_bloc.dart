import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_design_query_bloc.freezed.dart';

@freezed
class MaterialDesignQueryState with _$MaterialDesignQueryState {
  const factory MaterialDesignQueryState.initial() = _Initial;
  const factory MaterialDesignQueryState.loading(
    PageOptions<MaterialDesign> pageOptions,
  ) = _Loading;
  const factory MaterialDesignQueryState.loaded(
    PageOptions<MaterialDesign> pageOptions,
  ) = _Loaded;
  const factory MaterialDesignQueryState.error(String error) = _Error;
}

@freezed
class MaterialDesignQueryEvent with _$MaterialDesignQueryEvent {
  const factory MaterialDesignQueryEvent.fetch({
    PageOptions<MaterialDesign>? pageOptions,
    bool? active,
    Material? material,
  }) = _Fetch;
}

class MaterialDesignQueryBloc
    extends Bloc<MaterialDesignQueryEvent, MaterialDesignQueryState> {
  final bool isExternal;
  MaterialDesignQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<MaterialDesignQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, active, material) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await MaterialDesignRepository.instance.materialDesignFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              active: active,
              material: material,
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
  PageOptions<MaterialDesign> _pageOptions = PageOptions.empty();
}
