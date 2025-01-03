import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_usage.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_detail_query_bloc.freezed.dart';

@freezed
class MaterialUsageDetailQueryState with _$MaterialUsageDetailQueryState {
  const factory MaterialUsageDetailQueryState.initial() = _Initial;
  const factory MaterialUsageDetailQueryState.loading(
    PageOptions<MaterialUsageDetail> pageOptions,
  ) = _Loading;
  const factory MaterialUsageDetailQueryState.loaded(
    PageOptions<MaterialUsageDetail> pageOptions,
  ) = _Loaded;
  const factory MaterialUsageDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialUsageDetailQueryEvent with _$MaterialUsageDetailQueryEvent {
  const factory MaterialUsageDetailQueryEvent.fetch({
    PageOptions<MaterialUsageDetail>? pageOptions,
    TransactionType? transactionType,
    MaterialGroup? materialGroup,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class MaterialUsageDetailQueryBloc
    extends Bloc<MaterialUsageDetailQueryEvent, MaterialUsageDetailQueryState> {
  MaterialUsageDetailQueryBloc() : super(const _Initial()) {
    on<MaterialUsageDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, transactionType, materialGroup, startDate,
            endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialUsageRepository.instance.fetchDetail(
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
  PageOptions<MaterialUsageDetail> _pageOptions = PageOptions.empty(
    sortBy: 'material_issue_id',
  );
}
