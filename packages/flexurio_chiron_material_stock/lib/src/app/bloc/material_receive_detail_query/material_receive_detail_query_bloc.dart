import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_detail_query_bloc.freezed.dart';

@freezed
class MaterialReceiveDetailQueryState with _$MaterialReceiveDetailQueryState {
  const factory MaterialReceiveDetailQueryState.initial() = _Initial;
  const factory MaterialReceiveDetailQueryState.loading(
    PageOptions<MaterialReceiveDetail> pageOptions,
  ) = _Loading;
  const factory MaterialReceiveDetailQueryState.loaded(
    PageOptions<MaterialReceiveDetail> pageOptions,
  ) = _Loaded;
  const factory MaterialReceiveDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialReceiveDetailQueryEvent with _$MaterialReceiveDetailQueryEvent {
  const factory MaterialReceiveDetailQueryEvent.fetch({
    PageOptions<MaterialReceiveDetail>? pageOptions,
    MaterialReceive? materialReceive,
    DateTime? period,
    String? materialStatusQc,
    String? materialGroupId,
  }) = _Fetch;
  const factory MaterialReceiveDetailQueryEvent.print({
    PageOptions<MaterialReceiveDetail>? pageOptions,
    DateTime? createdAtGte,
    DateTime? createdAtLte,
    List<WarehouseMaterialReceive>? warehouseIn,
    List<MaterialGroup>? materialGroupIn,
  }) = _Print;
  const factory MaterialReceiveDetailQueryEvent.fetchNa({
    PageOptions<MaterialReceiveDetail>? pageOptions,
    Material? materials,
    DateTime? expiredDateLte,
    String? materialStatusQc,
  }) = _FetchNa;
}

class MaterialReceiveDetailQueryBloc extends Bloc<
    MaterialReceiveDetailQueryEvent, MaterialReceiveDetailQueryState> {
  final bool isExternal;
  MaterialReceiveDetailQueryBloc({bool? pagination, required this.isExternal})
      : super(const _Initial()) {
    on<MaterialReceiveDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          materialReceive,
          period,
          materialStatusQc,
          materialGroupId,
        ) async {
          if (pagination == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await MaterialRepository.instance.materialReceiveDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              materialReceive: materialReceive,
              period: period,
              materialStatusQc: materialStatusQc,
              materialGroupId: materialGroupId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        print: (
          pageOptions,
          createdAtGte,
          createdAtLte,
          warehouseIn,
          materialGroupIn,
        ) async {
          if (pagination == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialRepository.instance
                .materialReceiveDetailPrintFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              createdAtGte: createdAtGte,
              createdAtLte: createdAtLte,
              warehouseIn: warehouseIn,
              materialGroupIn: materialGroupIn,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchNa:
            (pageOptions, materials, expiredDateLte, materialStatusQc) async {
          if (pagination == false) {
            _pageOptions = PageOptions.emptyNoLimit();
          }
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await MaterialRepository.instance.materialReceiveDetailNaFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              material: materials,
              expiredDateLte: expiredDateLte,
              materialStatusQc: materialStatusQc,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialReceiveDetail> _pageOptions = PageOptions.empty();
}
