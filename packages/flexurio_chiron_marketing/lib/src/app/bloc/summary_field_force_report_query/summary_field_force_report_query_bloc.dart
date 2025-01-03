import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_field_force_report_query_bloc.freezed.dart';

@freezed
class SummaryFieldForceReportQueryState
    with _$SummaryFieldForceReportQueryState {
  const factory SummaryFieldForceReportQueryState.initial() = _Initial;
  const factory SummaryFieldForceReportQueryState.loading() = _Loading;
  const factory SummaryFieldForceReportQueryState.loaded(
    List<SummaryFieldForceGrade1> summaryFieldForce,
    int? periodStart,
    int? periodEnd,
    String? areaCode,
    String? jab,
  ) = _Success;
  const factory SummaryFieldForceReportQueryState.error(String error) = _Error;
}

@freezed
class SummaryFieldForceReportQueryEvent
    with _$SummaryFieldForceReportQueryEvent {
  const factory SummaryFieldForceReportQueryEvent.fetch({
    required int periodStart,
    required int periodEnd,
    required String areaCode,
    required String jab,
  }) = _Fetch;
}

class SummaryFieldForceReportQueryBloc extends Bloc<
    SummaryFieldForceReportQueryEvent, SummaryFieldForceReportQueryState> {
  SummaryFieldForceReportQueryBloc() : super(const _Initial()) {
    on<SummaryFieldForceReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, areaCode, jab) async {
          emit(const _Loading());
          if (jab == 'ASM') {
            jab = 'AM';
          } else if (jab == 'FSM') {
            jab = 'SM';
          }
          try {
            final summaryFieldForce =
                await MarketingRepository.instance.summaryFieldForceReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              areaCode: areaCode,
              position: jab,
            );

            emit(
              _Success(
                summaryFieldForceGroup(summaryFieldForce),
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
