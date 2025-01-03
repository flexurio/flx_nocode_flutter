import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue_detail_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_detail_report_query_bloc.freezed.dart';

@freezed
class MaterialIssueDetailReportQueryState
    with _$MaterialIssueDetailReportQueryState {
  factory MaterialIssueDetailReportQueryState.initial() = _Initial;
  factory MaterialIssueDetailReportQueryState.loading() = _Loading;
  factory MaterialIssueDetailReportQueryState.loaded(
    List<MaterialIssuesDetailReport> materialIssueDetailReport,
  ) = _Loaded;
  factory MaterialIssueDetailReportQueryState.error(String error) = _Error;
}

@freezed
class MaterialIssueDetailReportQueryEvent
    with _$MaterialIssueDetailReportQueryEvent {
  factory MaterialIssueDetailReportQueryEvent.fetch(
    MaterialIssue materialIssue,
  ) = _Fetch;
}

class MaterialIssueDetailReportQueryBloc extends Bloc<
    MaterialIssueDetailReportQueryEvent, MaterialIssueDetailReportQueryState> {
  final bool isExternal;
  MaterialIssueDetailReportQueryBloc({
    required this.isExternal,
  }) : super(_Initial()) {
    on<MaterialIssueDetailReportQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (materialIssue) async {
            emit(_Loading());
            try {
              final materialIssueDetailReport = await MaterialIssueRepository
                  .instance
                  .materialIssueDetailReportFetch(
                accessToken: UserRepositoryApp.instance.token!,
                materialIssue: materialIssue,
                isExternal: isExternal,
              );
              emit(_Loaded(materialIssueDetailReport));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
