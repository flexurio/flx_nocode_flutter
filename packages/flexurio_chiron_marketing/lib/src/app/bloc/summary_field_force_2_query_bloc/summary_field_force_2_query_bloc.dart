import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/field_force_summary.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'summary_field_force_2_query_bloc.freezed.dart';

@freezed
class SummaryFieldForce2QueryState with _$SummaryFieldForce2QueryState {
  const factory SummaryFieldForce2QueryState.initial() = _Initial;
  const factory SummaryFieldForce2QueryState.loading() = _Loading;
  const factory SummaryFieldForce2QueryState.loaded(
    List<FieldForceSummary> summaryFieldForce,
  ) = _Success;
  const factory SummaryFieldForce2QueryState.error(String error) = _Error;
}

@freezed
class SummaryFieldForce2QueryEvent with _$SummaryFieldForce2QueryEvent {
  const factory SummaryFieldForce2QueryEvent.fetch({
    required DateTime dateStart,
    required DateTime dateEnd,
    required FieldForceSummaryCategory category,
    required FieldForceSummaryCategorySub categorySub,
    required MarketingPositionE position,
    String? areaCode,
  }) = _Fetch;
}

class SummaryFieldForce2QueryBloc
    extends Bloc<SummaryFieldForce2QueryEvent, SummaryFieldForce2QueryState> {
  SummaryFieldForce2QueryBloc() : super(const _Initial()) {
    on<SummaryFieldForce2QueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (
            dateStart,
            dateEnd,
            category,
            categorySub,
            position,
            areaCode,
          ) async {
            emit(const _Loading());
            try {
              final result = await FieldForceSummaryRepository.instance.fetch(
                accessToken: UserRepositoryApp.instance.token!,
                dateStart: dateStart,
                dateEnd: dateEnd,
                position: position,
                categories: [category],
                areaCode: areaCode,
                categorySub: categorySub.value,
              );
              emit(_Success(result));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
