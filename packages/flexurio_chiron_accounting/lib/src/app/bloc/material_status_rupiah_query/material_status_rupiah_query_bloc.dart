import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_status_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_status_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_status_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialStatusRupiahQueryState with _$MaterialStatusRupiahQueryState {
  const factory MaterialStatusRupiahQueryState.initial() = _Initial;
  const factory MaterialStatusRupiahQueryState.loading(
    PageOptions<MaterialStatusRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialStatusRupiahQueryState.loaded(
    PageOptions<MaterialStatusRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialStatusRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialStatusRupiahQueryEvent with _$MaterialStatusRupiahQueryEvent {
  const factory MaterialStatusRupiahQueryEvent.fetch({
    PageOptions<MaterialStatusRupiah>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialStatusRupiahQueryBloc extends Bloc<MaterialStatusRupiahQueryEvent, MaterialStatusRupiahQueryState> {
  MaterialStatusRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialStatusRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialStatusRupiahRepository.instance.fetch(
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
  PageOptions<MaterialStatusRupiah> _pageOptions = PageOptions.empty(sortBy: 'transaction_id');
}
