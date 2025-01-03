import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_mutation_loans_borrowings.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_mutation_rupiah.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_mutation_loans_borrowings_query_bloc.freezed.dart';

@freezed
class MaterialMutationLoansBorrowingsQueryState with _$MaterialMutationLoansBorrowingsQueryState {
  const factory MaterialMutationLoansBorrowingsQueryState.initial() = _Initial;
  const factory MaterialMutationLoansBorrowingsQueryState.loading(
    PageOptions<MaterialMutationLoansBorrowings> pageOptions,
  ) = _Loading;
  const factory MaterialMutationLoansBorrowingsQueryState.loaded(
    PageOptions<MaterialMutationLoansBorrowings> pageOptions,
  ) = _Loaded;
  const factory MaterialMutationLoansBorrowingsQueryState.error(String error) = _Error;
}

@freezed
class MaterialMutationLoansBorrowingsQueryEvent with _$MaterialMutationLoansBorrowingsQueryEvent {
  const factory MaterialMutationLoansBorrowingsQueryEvent.fetch({
    PageOptions<MaterialMutationLoansBorrowings>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
  }) = _Fetch;
}

class MaterialMutationLoansBorrowingsQueryBloc extends Bloc<MaterialMutationLoansBorrowingsQueryEvent, MaterialMutationLoansBorrowingsQueryState> {
  MaterialMutationLoansBorrowingsQueryBloc() : super(const _Initial()) {
    on<MaterialMutationLoansBorrowingsQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup, material) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialMutationRupiahRepository.instance.fetchMutation(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              materialGroup: materialGroup,
              material: material,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialMutationLoansBorrowings> _pageOptions = PageOptions.empty(sortBy: 'transaction_id');
}
