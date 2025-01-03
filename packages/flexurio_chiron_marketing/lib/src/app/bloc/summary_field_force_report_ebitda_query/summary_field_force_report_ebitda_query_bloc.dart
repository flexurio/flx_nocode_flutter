import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force_ebitda.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/marketing_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/util/summary_field_force_group_ebitda.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_field_force_report_ebitda_query_bloc.freezed.dart';

@freezed
class SummaryFieldForceReportEbitdaQueryState
    with _$SummaryFieldForceReportEbitdaQueryState {
  const factory SummaryFieldForceReportEbitdaQueryState.initial() = _Initial;
  const factory SummaryFieldForceReportEbitdaQueryState.loading() = _Loading;
  const factory SummaryFieldForceReportEbitdaQueryState.loaded(
    List<SummaryFieldForceEbitdaGrade1> summaryFieldForce,
    int? periodStart,
    int? periodEnd,
    String? areaCode,
    String? jab,
  ) = _Success;
  const factory SummaryFieldForceReportEbitdaQueryState.error(String error) =
      _Error;
}

@freezed
class SummaryFieldForceReportEbitdaQueryEvent
    with _$SummaryFieldForceReportEbitdaQueryEvent {
  const factory SummaryFieldForceReportEbitdaQueryEvent.fetch({
    required int periodStart,
    required int periodEnd,
    required String areaCode,
    required String jab,
  }) = _Fetch;
}

class SummaryFieldForceReportEbitdaQueryBloc extends Bloc<
    SummaryFieldForceReportEbitdaQueryEvent,
    SummaryFieldForceReportEbitdaQueryState> {
  SummaryFieldForceReportEbitdaQueryBloc() : super(const _Initial()) {
    on<SummaryFieldForceReportEbitdaQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, areaCode, jab) async {
          emit(const _Loading());
          try {
            final summaryFieldForce = await MarketingRepository.instance
                .summaryFieldForceReportFetchEbitda(
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              areaCode: areaCode,
              jab: jab,
            );

            emit(
              _Success(
                summaryFieldForceGroupEbitda(summaryFieldForce),
                periodStart,
                periodEnd,
                areaCode,
                jab,
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
