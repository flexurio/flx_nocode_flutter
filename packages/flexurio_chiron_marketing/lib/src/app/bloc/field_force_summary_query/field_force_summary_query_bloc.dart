import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/field_force_summary.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'field_force_summary_query_bloc.freezed.dart';

@freezed
class FieldForceSummaryQueryState with _$FieldForceSummaryQueryState {
  const factory FieldForceSummaryQueryState.initial() = _Initial;
  const factory FieldForceSummaryQueryState.loading() = _Loading;
  const factory FieldForceSummaryQueryState.loaded(
    List<FieldForceSummary> sales,
    List<FieldForceSummary> target,
    List<FieldForceSummary> estimation,
    List<FieldForceSummary> call,
    FieldForceSummaryFilter filter,
  ) = _Loaded;
  const factory FieldForceSummaryQueryState.error(String error) = _Error;
}

@freezed
class FieldForceSummaryQueryEvent with _$FieldForceSummaryQueryEvent {
  const factory FieldForceSummaryQueryEvent.fetch({
    required String areaCode,
    required DateTime periodStart,
    required DateTime periodEnd,
    required FieldForceSummaryFilter filter,
  }) = _Fetch;

  const factory FieldForceSummaryQueryEvent.addFilter({
    required FieldForceSummary data,
  }) = _AddFilter;

  const factory FieldForceSummaryQueryEvent.removeFilter({
    required FieldForceSummary data,
  }) = _RemoveFilter;
}

class FieldForceSummaryQueryBloc
    extends Bloc<FieldForceSummaryQueryEvent, FieldForceSummaryQueryState> {
  FieldForceSummaryQueryBloc() : super(const _Initial()) {
    var sales = <FieldForceSummary>[];
    var target = <FieldForceSummary>[];
    var estimation = <FieldForceSummary>[];
    var call = <FieldForceSummary>[];
    on<FieldForceSummaryQueryEvent>((event, emit) async {
      await event.when(
        addFilter: (data) {
          // emit(const _Loading());
          // filter.clear();
          // if (!filter.contains(data)) {
          //   filter.add(data);
          // }
          // emit(_Loaded(sales, target, estimation, call, filter));
        },
        removeFilter: (data) {
          // emit(const _Loading());
          // filter.remove(data);
          // emit(_Loaded(sales, target, estimation, call, filter));
        },
        fetch: (areaCode, periodStart, periodEnd, filter) async {
          emit(const _Loading());
          try {
            final (categorySub, flag1, flag2, flag3) = filter.categorySub;

            final summaryFieldForce =
                await FieldForceSummaryRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              areaCode: areaCode,
              categories: [
                FieldForceSummaryCategory.sales,
                FieldForceSummaryCategory.estimation,
                FieldForceSummaryCategory.target,
              ],
              dateEnd: periodEnd,
              dateStart: periodStart,
              flag1: flag1,
              flag2: flag2,
              flag3: flag3,
              flag4: 'ALL',
              flag5: 'ALL',
              categorySub: categorySub.value,
            )
                  ..sort((a, b) => a.date.compareTo(b.date));

            call = await FieldForceSummaryRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              areaCode: areaCode,
              categories: [
                FieldForceSummaryCategory.call,
              ],
              dateEnd: periodEnd,
              dateStart: periodStart,
              flag1: flag1,
              flag2: flag2,
              flag3: flag3,
              flag4: 'ALL',
              flag5: 'ALL',
              categorySub: categorySub.value,
            )
              ..sort((a, b) => a.date.compareTo(b.date));

            sales = [];
            target = [];
            estimation = [];

            for (final summary in summaryFieldForce) {
              if (summary.category == FieldForceSummaryCategory.sales) {
                sales.add(summary);
              }
              if (summary.category == FieldForceSummaryCategory.target) {
                target.add(summary);
              }
              if (summary.category == FieldForceSummaryCategory.estimation) {
                estimation.add(summary);
              }
            }

            emit(_Loaded(sales, target, estimation, call, filter));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
