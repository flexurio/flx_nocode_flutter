import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/field_force_summary.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'national_sales_versus_target_query_bloc.freezed.dart';

@freezed
class NationalTargetVersusSalesQueryState
    with _$NationalTargetVersusSalesQueryState {
  const factory NationalTargetVersusSalesQueryState.initial() = _Initial;
  const factory NationalTargetVersusSalesQueryState.loading() = _Loading;
  const factory NationalTargetVersusSalesQueryState.loaded({
    required List<FieldForceSummary> sales,
    required List<FieldForceSummary> target,
  }) = _Success;
  const factory NationalTargetVersusSalesQueryState.error(String error) =
      _Error;
}

@freezed
class NationalSalesVersusTargetEvent with _$NationalSalesVersusTargetEvent {
  const factory NationalSalesVersusTargetEvent.fetch({
    required DateTime date,
  }) = _Fetch;
}

class NationalSalesVersusTargetBloc extends Bloc<NationalSalesVersusTargetEvent,
    NationalTargetVersusSalesQueryState> {
  NationalSalesVersusTargetBloc() : super(const _Initial()) {
    on<NationalSalesVersusTargetEvent>(
      (event, emit) async {
        await event.when(
          fetch: (date) async {
            emit(const _Loading());
            try {
              final result = await Future.wait([
                FieldForceSummaryRepository.instance.fetch(
                  accessToken: UserRepositoryApp.instance.token!,
                  dateStart: date,
                  dateEnd: date,
                  position: MarketingPositionE.md,
                  categories: [FieldForceSummaryCategory.sales],
                  categorySub:
                      FieldForceSummaryCategorySub.salesDailyNational.value,
                ),
                FieldForceSummaryRepository.instance.fetch(
                  accessToken: UserRepositoryApp.instance.token!,
                  dateStart: date,
                  dateEnd: date,
                  position: MarketingPositionE.md,
                  categories: [FieldForceSummaryCategory.target],
                  categorySub:
                      FieldForceSummaryCategorySub.targetDailyNational.value,
                ),
              ]);
              emit(
                _Success(
                  sales: result[0],
                  target: result[1],
                ),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
