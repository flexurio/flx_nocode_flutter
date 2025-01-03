import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch_global.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_usage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

part 'material_usage_batch_global_query_bloc.freezed.dart';

@freezed
class MaterialUsageBatchGlobalQueryState with _$MaterialUsageBatchGlobalQueryState {
  const factory MaterialUsageBatchGlobalQueryState.initial() = _Initial;
  const factory MaterialUsageBatchGlobalQueryState.loading(
    PageOptions<MaterialUsageBatchGlobal> pageOptions,
  ) = _Loading;
  const factory MaterialUsageBatchGlobalQueryState.loaded(
    PageOptions<MaterialUsageBatchGlobal> pageOptions,
  ) = _Loaded;
  const factory MaterialUsageBatchGlobalQueryState.error(String error) = _Error;
}

@freezed
class MaterialUsageBatchGlobalQueryEvent with _$MaterialUsageBatchGlobalQueryEvent {
  const factory MaterialUsageBatchGlobalQueryEvent.fetch({
    PageOptions<MaterialUsageBatchGlobal>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    // ProductionOrder? batch,
  }) = _Fetch;
}

class MaterialUsageBatchGlobalQueryBloc extends Bloc<MaterialUsageBatchGlobalQueryEvent, MaterialUsageBatchGlobalQueryState> {
  MaterialUsageBatchGlobalQueryBloc() : super(const _Initial()) {
    on<MaterialUsageBatchGlobalQueryEvent>((event, emit) async {
      await event.when(
        // fetch: (pageOptions, startDate, endDate, batch) async {
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialUsageRepository.instance.materialUsageBatchGlobalfetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              // batch: batch,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialUsageBatchGlobal> _pageOptions = PageOptions.empty(
    sortBy: 'batch_no',
  );
}
