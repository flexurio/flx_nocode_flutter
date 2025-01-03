import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_usage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

part 'material_usage_batch_query_bloc.freezed.dart';

@freezed
class MaterialUsageBatchQueryState with _$MaterialUsageBatchQueryState {
  const factory MaterialUsageBatchQueryState.initial() = _Initial;
  const factory MaterialUsageBatchQueryState.loading(
    PageOptions<MaterialUsageBatch> pageOptions,
  ) = _Loading;
  const factory MaterialUsageBatchQueryState.loaded(
    PageOptions<MaterialUsageBatch> pageOptions,
  ) = _Loaded;
  const factory MaterialUsageBatchQueryState.error(String error) = _Error;
}

@freezed
class MaterialUsageBatchQueryEvent with _$MaterialUsageBatchQueryEvent {
  const factory MaterialUsageBatchQueryEvent.fetch({
    PageOptions<MaterialUsageBatch>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    ProductionOrder? batch,
  }) = _Fetch;
}

class MaterialUsageBatchQueryBloc extends Bloc<MaterialUsageBatchQueryEvent, MaterialUsageBatchQueryState> {
  MaterialUsageBatchQueryBloc() : super(const _Initial()) {
    on<MaterialUsageBatchQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, batch) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialUsageRepository.instance.materialUsageBatchfetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              batch: batch,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialUsageBatch> _pageOptions = PageOptions.empty(
    sortBy: 'batch_no',
  );
}
