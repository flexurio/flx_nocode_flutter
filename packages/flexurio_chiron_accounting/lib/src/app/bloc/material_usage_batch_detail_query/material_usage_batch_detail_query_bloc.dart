import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_usage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

part 'material_usage_batch_detail_query_bloc.freezed.dart';

@freezed
class MaterialUsageBatchDetailQueryState with _$MaterialUsageBatchDetailQueryState {
  const factory MaterialUsageBatchDetailQueryState.initial() = _Initial;
  const factory MaterialUsageBatchDetailQueryState.loading(
    PageOptions<MaterialUsageBatchDetail> pageOptions,
  ) = _Loading;
  const factory MaterialUsageBatchDetailQueryState.loaded(
    PageOptions<MaterialUsageBatchDetail> pageOptions,
  ) = _Loaded;
  const factory MaterialUsageBatchDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialUsageBatchDetailQueryEvent with _$MaterialUsageBatchDetailQueryEvent {
  const factory MaterialUsageBatchDetailQueryEvent.fetch({
    PageOptions<MaterialUsageBatchDetail>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    ProductionOrder? batch,
  }) = _Fetch;
}

class MaterialUsageBatchDetailQueryBloc extends Bloc<MaterialUsageBatchDetailQueryEvent, MaterialUsageBatchDetailQueryState> {
  MaterialUsageBatchDetailQueryBloc() : super(const _Initial()) {
    on<MaterialUsageBatchDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, batch) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialUsageRepository.instance.materialUsageBatchDetailfetch(
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
  PageOptions<MaterialUsageBatchDetail> _pageOptions = PageOptions.empty(
    sortBy: 'batch_no',
  );
}
