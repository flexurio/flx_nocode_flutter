import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_report.dart';
import 'package:flexurio_chiron_material_stock/src/app/resource/material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_report_query_bloc.freezed.dart';

@freezed
class MaterialStockReportQueryState with _$MaterialStockReportQueryState {
  const factory MaterialStockReportQueryState.initial() = _Initial;
  const factory MaterialStockReportQueryState.loading(
    PageOptions<MaterialStockReport> pageOptions,
  ) = _Loading;
  const factory MaterialStockReportQueryState.loaded(
    PageOptions<MaterialStockReport> pageOptions,
  ) = _Loaded;
  const factory MaterialStockReportQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockReportQueryEvent with _$MaterialStockReportQueryEvent {
  const factory MaterialStockReportQueryEvent.fetch({
    PageOptions<MaterialStockReport>? pageOptions,
    String? materialStatusQcId,
    String? materialUnitId,
    String? materialId,
    String? materialGroupId,
  }) = _Fetch;
}

class MaterialStockReportQueryBloc
    extends Bloc<MaterialStockReportQueryEvent, MaterialStockReportQueryState> {
  MaterialStockReportQueryBloc() : super(const _Initial()) {
    on<MaterialStockReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          materialStatusQcId,
          materialUnitId,
          materialId,
          materialGroupId,
        ) async {
          emit(_Loading(_pageOptions));
          if (pageOptions != null) {
            _pageOptions = pageOptions;
          }
          try {
            _pageOptions = await MaterialStockRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              materialStatusQcId: materialStatusQcId,
              materialUnitId: materialUnitId,
              materialId: materialId,
              materialGroupId: materialGroupId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialStockReport> _pageOptions = PageOptions.empty();
}
