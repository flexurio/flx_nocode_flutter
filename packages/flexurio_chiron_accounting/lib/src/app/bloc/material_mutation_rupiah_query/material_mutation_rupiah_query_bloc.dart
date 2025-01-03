import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_mutation_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_mutation_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_mutation_rupiah_query_bloc.freezed.dart';

@freezed
class MaterialMutationRupiahQueryState with _$MaterialMutationRupiahQueryState {
  const factory MaterialMutationRupiahQueryState.initial() = _Initial;
  const factory MaterialMutationRupiahQueryState.loading(
    PageOptions<MaterialMutationRupiah> pageOptions,
  ) = _Loading;
  const factory MaterialMutationRupiahQueryState.loaded(
    PageOptions<MaterialMutationRupiah> pageOptions,
  ) = _Loaded;
  const factory MaterialMutationRupiahQueryState.error(String error) = _Error;
}

@freezed
class MaterialMutationRupiahQueryEvent with _$MaterialMutationRupiahQueryEvent {
  const factory MaterialMutationRupiahQueryEvent.fetch({
    PageOptions<MaterialMutationRupiah>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialMutationRupiahQueryBloc extends Bloc<MaterialMutationRupiahQueryEvent, MaterialMutationRupiahQueryState> {
  MaterialMutationRupiahQueryBloc() : super(const _Initial()) {
    on<MaterialMutationRupiahQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialMutationRupiahRepository.instance.fetch(
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
  PageOptions<MaterialMutationRupiah> _pageOptions = PageOptions.empty(sortBy: 'transaction_id');
}
