import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_status_rupiah_quarantine.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_status_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_status_rupiah_quarantine_query_bloc.freezed.dart';

@freezed
class MaterialStatusRupiahQuarantineQueryState with _$MaterialStatusRupiahQuarantineQueryState {
  const factory MaterialStatusRupiahQuarantineQueryState.initial() = _Initial;
  const factory MaterialStatusRupiahQuarantineQueryState.loading(
    PageOptions<MaterialStatusRupiahQuarantine> pageOptions,
  ) = _Loading;
  const factory MaterialStatusRupiahQuarantineQueryState.loaded(
    PageOptions<MaterialStatusRupiahQuarantine> pageOptions,
  ) = _Loaded;
  const factory MaterialStatusRupiahQuarantineQueryState.error(String error) = _Error;
}

@freezed
class MaterialStatusRupiahQuarantineQueryEvent with _$MaterialStatusRupiahQuarantineQueryEvent {
  const factory MaterialStatusRupiahQuarantineQueryEvent.fetch({
    PageOptions<MaterialStatusRupiahQuarantine>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialStatusRupiahQuarantineQueryBloc extends Bloc<MaterialStatusRupiahQuarantineQueryEvent, MaterialStatusRupiahQuarantineQueryState> {
  MaterialStatusRupiahQuarantineQueryBloc() : super(const _Initial()) {
    on<MaterialStatusRupiahQuarantineQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialStatusRupiahRepository.instance.fetchQuarantine(
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
  PageOptions<MaterialStatusRupiahQuarantine> _pageOptions = PageOptions.empty(sortBy: 'transaction_id');
}
