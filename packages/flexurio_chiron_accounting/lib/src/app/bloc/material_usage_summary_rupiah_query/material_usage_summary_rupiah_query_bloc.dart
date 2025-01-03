import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_summary_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_usage.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_summary_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialUsageSummaryRupiahQueryState with _$MaterialUsageSummaryRupiahQueryState {
  const factory MaterialUsageSummaryRupiahQueryState.initial() = _Initial;
  const factory MaterialUsageSummaryRupiahQueryState.loading(
    PageOptions<MaterialUsageSummaryRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialUsageSummaryRupiahQueryState.loaded(
    PageOptions<MaterialUsageSummaryRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialUsageSummaryRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialUsageSummaryRupiahQueryEvent with _$MaterialUsageSummaryRupiahQueryEvent {
  const factory MaterialUsageSummaryRupiahQueryEvent.fetch({
    PageOptions<MaterialUsageSummaryRupiah>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialUsageSummaryRupiahQueryBloc extends Bloc<MaterialUsageSummaryRupiahQueryEvent, MaterialUsageSummaryRupiahQueryState> {
  MaterialUsageSummaryRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialUsageSummaryRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialUsageRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              materialGroup: materialGroup,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialUsageSummaryRupiah> _pageOptions = PageOptions.empty(sortBy: 'material_issue_type_id');
}
