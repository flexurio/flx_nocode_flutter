import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_mutation_report.dart';
import 'package:flexurio_chiron_material_stock/src/app/resource/material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_mutation_report_query_bloc.freezed.dart';

@freezed
class MaterialStockMutationReportQueryState with _$MaterialStockMutationReportQueryState {
  const factory MaterialStockMutationReportQueryState.initial() = _Initial;
  const factory MaterialStockMutationReportQueryState.loading(
    PageOptions<MaterialStockMutationReport> pageOptions,
  ) = _Loading;
  const factory MaterialStockMutationReportQueryState.loaded(
    PageOptions<MaterialStockMutationReport> pageOptions,
  ) = _Loaded;
  const factory MaterialStockMutationReportQueryState.error(String error) = _Error;
}

@freezed
class MaterialStockMutationReportQueryEvent with _$MaterialStockMutationReportQueryEvent {
  const factory MaterialStockMutationReportQueryEvent.fetch({
    PageOptions<MaterialStockMutationReport>? pageOptions,
    String? materialGroupId,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class MaterialStockMutationReportQueryBloc
    extends Bloc<MaterialStockMutationReportQueryEvent, MaterialStockMutationReportQueryState> {
  MaterialStockMutationReportQueryBloc() : super(const _Initial()) {
    on<MaterialStockMutationReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          materialGroupId,
          startDate,
          endDate,
        ) async {
          emit(_Loading(_pageOptions));
          if (pageOptions != null) {
            _pageOptions = pageOptions;
          }
          try {
            _pageOptions = await MaterialStockRepository.instance.fetchReportMutation(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              materialGroupId: materialGroupId,
              startDate: startDate,
              endDate: endDate,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialStockMutationReport> _pageOptions = PageOptions.empty();
}
