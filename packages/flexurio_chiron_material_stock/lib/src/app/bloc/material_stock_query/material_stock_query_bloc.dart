import 'package:appointment/src/app/resource/material_stock_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_query_bloc.freezed.dart';

@freezed
class MaterialStockQueryState with _$MaterialStockQueryState {
  const factory MaterialStockQueryState.initial() = _Initial;
  const factory MaterialStockQueryState.loading(
    PageOptions<MaterialStock> pageOptions,
  ) = _Loading;
  const factory MaterialStockQueryState.loaded(
    PageOptions<MaterialStock> pageOptions,
  ) = _Success;
  const factory MaterialStockQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockQueryEvent with _$MaterialStockQueryEvent {
  const factory MaterialStockQueryEvent.fetch({
    PageOptions<MaterialStock>? pageOptions,
    DateTime? period,
    MaterialGroup? materialGroup,
    Material? material,
    String? na,
    String? materialGroupIdIn,
  }) = _Fetch;

  const factory MaterialStockQueryEvent.fetchByMaterialId({
    PageOptions<MaterialStock>? pageOptions,
    required String materialId,
    required DateTime period,
  }) = _FetchByMaterialId;
}

class MaterialStockQueryBloc
    extends Bloc<MaterialStockQueryEvent, MaterialStockQueryState> {
  final bool isExternal;
  MaterialStockQueryBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<MaterialStockQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          period,
          materialGroup,
          material,
          na,
          materialGroupIdIn,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            final materialStock =
                await MaterialStockRepository.instance.materialStockFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              period: period,
              materialGroup: materialGroup,
              material: material,
              na: na,
              materialGroupIdIn: materialGroupIdIn,
              isExternal: isExternal,
            );
            emit(_Success(materialStock));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchByMaterialId: (
          pageOptions,
          materialId,
          period,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            final materialStock = await MaterialStockRepository.instance
                .materialStockFetchByMaterialId(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              period: period,
              materialId: materialId,
              isExternal: isExternal,
            );
            emit(_Success(materialStock));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialStock> _pageOptions = PageOptions.empty();
}
