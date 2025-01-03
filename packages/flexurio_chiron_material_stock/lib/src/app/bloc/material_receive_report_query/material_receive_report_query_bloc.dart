import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_report.dart';
import 'package:flexurio_chiron_material_stock/src/app/resource/material_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_report_query_bloc.freezed.dart';

@freezed
class MaterialReceiveReportQueryState with _$MaterialReceiveReportQueryState {
  const factory MaterialReceiveReportQueryState.initial() = _Initial;
  const factory MaterialReceiveReportQueryState.loading(
    PageOptions<MaterialReceiveReport> pageOptions,
  ) = _Loading;
  const factory MaterialReceiveReportQueryState.loaded(
    PageOptions<MaterialReceiveReport> pageOptions,
  ) = _Loaded;
  const factory MaterialReceiveReportQueryState.error(String error) = _Error;
}

@freezed
class MaterialReceiveReportQueryEvent with _$MaterialReceiveReportQueryEvent {
  const factory MaterialReceiveReportQueryEvent.fetch({
    required DateTime? startDate,
    required DateTime? endDate,
    required MaterialReceiveReportType type,
    PageOptions<MaterialReceiveReport>? pageOptions,
  }) = _Fetch;
}

class MaterialReceiveReportQueryBloc extends Bloc<
    MaterialReceiveReportQueryEvent, MaterialReceiveReportQueryState> {
  MaterialReceiveReportQueryBloc() : super(const _Initial()) {
    on<MaterialReceiveReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (startDate, endDate, type, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            if (type == MaterialReceiveReportType.byStatus) {
              _pageOptions =
                  await MaterialReceiveRepository.instance.reportByStatus(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                startDate: startDate,
                endDate: endDate,
              );
            } else if (type == MaterialReceiveReportType.byNonPurchaseOrder) {
              _pageOptions = await MaterialReceiveRepository.instance
                  .reportByNonPurchaseOrder(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                startDate: startDate,
                endDate: endDate,
              );
            } else if (type == MaterialReceiveReportType.byPurchaseOrder) {
              _pageOptions = await MaterialReceiveRepository.instance
                  .reportByNonPurchaseOrder(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                startDate: startDate,
                endDate: endDate,
              );
            } else {
              throw Exception('Invalid report type');
            }

            emit(
              _Loaded(_pageOptions),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialReceiveReport> _pageOptions =
      PageOptions.empty(sortBy: 'id');
}
