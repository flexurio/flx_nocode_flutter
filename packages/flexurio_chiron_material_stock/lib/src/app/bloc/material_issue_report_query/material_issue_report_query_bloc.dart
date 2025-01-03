import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_report_query_bloc.freezed.dart';

@freezed
class MaterialIssueReportQueryState with _$MaterialIssueReportQueryState {
  const factory MaterialIssueReportQueryState.initial() = _Initial;
  const factory MaterialIssueReportQueryState.loading(
    PageOptions<MaterialIssueReport> pageOptions,
  ) = _Loading;
  const factory MaterialIssueReportQueryState.loaded(
    PageOptions<MaterialIssueReport> pageOptions,
  ) = _Loaded;
  const factory MaterialIssueReportQueryState.error(String error) = _Error;
}

@freezed
class MaterialIssueReportQueryEvent with _$MaterialIssueReportQueryEvent {
  const factory MaterialIssueReportQueryEvent.fetch({
    required DateTime? startDate,
    required DateTime? endDate,
    required MaterialIssueReportType type,
    PageOptions<MaterialIssueReport>? pageOptions,
  }) = _Fetch;
}

class MaterialIssueReportQueryBloc
    extends Bloc<MaterialIssueReportQueryEvent, MaterialIssueReportQueryState> {
      final bool isExternal;
  MaterialIssueReportQueryBloc({
    required this.isExternal
  }) : super(const _Initial()) {
    on<MaterialIssueReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (startDate, endDate, type, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            if (type == MaterialIssueReportType.byBatch) {
              _pageOptions =
                  await MaterialIssueRepository.instance.reportByBatchFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                startDate: startDate,
                endDate: endDate,
                isExternal: isExternal
              );
            } else {
              _pageOptions = await MaterialIssueRepository.instance
                  .reportByAnalysisNumberFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                startDate: startDate,
                endDate: endDate,
                isExternal: isExternal
              );
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
  PageOptions<MaterialIssueReport> _pageOptions =
      PageOptions.empty(sortBy: 'id');
}
