import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_global.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_usage.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_global_query_bloc.freezed.dart';

@freezed
class MaterialUsageGlobalQueryState with _$MaterialUsageGlobalQueryState {
  const factory MaterialUsageGlobalQueryState.initial() = _Initial;
  const factory MaterialUsageGlobalQueryState.loading(
    PageOptions<MaterialUsageGlobal> pageOptions,
  ) = _Loading;
  const factory MaterialUsageGlobalQueryState.loaded(
    PageOptions<MaterialUsageGlobal> pageOptions,
  ) = _Loaded;
  const factory MaterialUsageGlobalQueryState.error(String error) = _Error;
}

@freezed
class MaterialUsageGlobalQueryEvent with _$MaterialUsageGlobalQueryEvent {
  const factory MaterialUsageGlobalQueryEvent.fetch({
    PageOptions<MaterialUsageGlobal>? pageOptions,
    TransactionType? transactionType,
    MaterialGroup? materialGroup,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class MaterialGlobalUsageQueryBloc
    extends Bloc<MaterialUsageGlobalQueryEvent, MaterialUsageGlobalQueryState> {
  MaterialGlobalUsageQueryBloc() : super(const _Initial()) {
    on<MaterialUsageGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, transactionType, materialGroup, startDate,
            endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialUsageRepository.instance.fetchGlobal(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionType: transactionType,
              materialGroup: materialGroup,
              startDate: startDate,
              endDate: endDate,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialUsageGlobal> _pageOptions = PageOptions.empty(
    sortBy: 'material_issue_id',
  );
}
