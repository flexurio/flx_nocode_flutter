import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/resource/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_query_bloc.freezed.dart';

@freezed
class MaterialQueryState with _$MaterialQueryState {
  const factory MaterialQueryState.initial() = _Initial;
  const factory MaterialQueryState.loading(
    PageOptions<Material> pageOptions,
  ) = _Loading;
  const factory MaterialQueryState.loaded(
    PageOptions<Material> pageOptions,
  ) = _Loaded;
  const factory MaterialQueryState.error(String error) = _Error;
}

@freezed
class MaterialQueryEvent with _$MaterialQueryEvent {
  const factory MaterialQueryEvent.initialize() = _Initialize;
  const factory MaterialQueryEvent.fetch({
    PageOptions<Material>? pageOptions,
    MaterialGroup? materialGroup,
    MaterialType? materialType,
    bool? isActive,
    bool? isOrder,
  }) = _Fetch;
  const factory MaterialQueryEvent.fetchByVendorId({
    PageOptions<Material>? pageOptions,
    MaterialGroup? materialGroup,
    required String vendorId,
  }) = _FetchByVendorId;
  const factory MaterialQueryEvent.fetchByMaterialGroup({required String id}) =
      _FetchByMaterialGroup;
}

class MaterialQueryBloc extends Bloc<MaterialQueryEvent, MaterialQueryState> {
  final bool isExternal;

  MaterialQueryBloc({bool? pagination, this.isExternal = false})
      : super(const _Initial()) {
    on<MaterialQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const MaterialQueryEvent.fetch());
          } else {
            _pageOptions = await MaterialRepositoryX.instance.materialFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
              isExternal: isExternal,
            );
            emit(_Loaded(_pageOptions));
          }
        },
        fetch: (
          pageOptions,
          materialGroup,
          materialType,
          isActive,
          isOrder,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            if (pagination == false) {
              _pageOptions = PageOptions.emptyNoLimit();
            }
            _pageOptions = await MaterialRepositoryX.instance.materialFetch(
              accessToken: UserRepositoryApp.instance.token!,
              materialGroupId: materialGroup?.id,
              materialTypeId: materialType?.id,
              pageOptions: _pageOptions,
              isActive: isActive,
              isExternal: isExternal,
              isOrder: isOrder,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchByVendorId: (
          pageOptions,
          materialGroup,
          vendorId,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            final materialVendors =
                await MaterialRepository.instance.materialApprovedVendorFetch(
              accessToken: UserRepositoryApp.instance.token!,
              vendorId: vendorId,
              pageOptions: PageOptions.empty(),
            );
            final materialFiltered = <Material>[];
            for (final materialVendor in materialVendors.data) {
              if (materialGroup != null &&
                  materialVendor.material.materialGroup.id ==
                      materialGroup.id) {
                materialFiltered.add(materialVendor.material);
              }
            }
            _pageOptions = _pageOptions.copyWith(data: materialFiltered);

            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchByMaterialGroup: (id) async {
          emit(_Loading(_pageOptions));
          try {
            _pageOptions = await MaterialRepositoryX.instance.materialFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: PageOptions.emptyNoLimit(),
              materialGroupId: id,
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
  PageOptions<Material> _pageOptions = PageOptions.empty();
}
