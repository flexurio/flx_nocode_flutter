import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force_year.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/marketing_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/util/summary_field_force_group_year.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_field_force_report_year_query_bloc.freezed.dart';

@freezed
class SummaryFieldForceReportYearQueryState
    with _$SummaryFieldForceReportYearQueryState {
  const factory SummaryFieldForceReportYearQueryState.initial() = _Initial;
  const factory SummaryFieldForceReportYearQueryState.loading() = _Loading;
  const factory SummaryFieldForceReportYearQueryState.loaded(
    List<SummaryFieldForceYearGrade1> summaryFieldForce,
    int? year,
    String? areaCode,
    String? jab,
    String? area,
    String? dataFlag,
  ) = _Success;
  const factory SummaryFieldForceReportYearQueryState.error(String error) =
      _Error;
}

@freezed
class SummaryFieldForceReportYearQueryEvent
    with _$SummaryFieldForceReportYearQueryEvent {
  const factory SummaryFieldForceReportYearQueryEvent.fetch({
    required int year,
    required String areaCode,
    required String jab,
    String? area,
    String? dataFlag,
  }) = _Fetch;
}

class SummaryFieldForceReportYearQueryBloc extends Bloc<
    SummaryFieldForceReportYearQueryEvent,
    SummaryFieldForceReportYearQueryState> {
  SummaryFieldForceReportYearQueryBloc() : super(const _Initial()) {
    on<SummaryFieldForceReportYearQueryEvent>((event, emit) async {
      await event.when(
        fetch: (year, areaCode, jab, area, dataFlag) async {
          emit(const _Loading());
          try {
            final summaryFieldForce = await MarketingRepository.instance
                .summaryFieldForceReportYearFetch(
              accessToken: UserRepositoryApp.instance.token!,
              year: year,
              areaCode: areaCode,
              jab: jab,
              area: area,
              dataFlag: dataFlag,
            );

            emit(
              _Success(
                summaryFieldForceYearGroup(summaryFieldForce),
                year,
                areaCode,
                jab,
                area,
                dataFlag,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
