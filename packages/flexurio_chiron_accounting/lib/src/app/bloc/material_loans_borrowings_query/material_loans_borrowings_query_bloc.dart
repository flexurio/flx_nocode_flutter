import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_loans_borrowings.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/material_loans_borrowings.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_loans_borrowings_query_bloc.freezed.dart';

@freezed
class MaterialLoansBorrowingsQueryState with _$MaterialLoansBorrowingsQueryState {
  const factory MaterialLoansBorrowingsQueryState.initial() = _Initial;
  const factory MaterialLoansBorrowingsQueryState.loading(
    PageOptions<MaterialLoansBorrowings> pageOptions,
  ) = _Loading;
  const factory MaterialLoansBorrowingsQueryState.loaded(
    PageOptions<MaterialLoansBorrowings> pageOptions,
  ) = _Loaded;
  const factory MaterialLoansBorrowingsQueryState.error(String error) = _Error;
}

@freezed
class MaterialLoansBorrowingsQueryEvent with _$MaterialLoansBorrowingsQueryEvent {
  const factory MaterialLoansBorrowingsQueryEvent.fetch({
    PageOptions<MaterialLoansBorrowings>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) = _Fetch;
}

class MaterialLoansBorrowingsQueryBloc extends Bloc<MaterialLoansBorrowingsQueryEvent, MaterialLoansBorrowingsQueryState> {
  MaterialLoansBorrowingsQueryBloc() : super(const _Initial()) {
    on<MaterialLoansBorrowingsQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, materialGroup) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MaterialLoansBorrowingsRepository.instance.fetch(
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
  PageOptions<MaterialLoansBorrowings> _pageOptions = PageOptions.empty(sortBy: 'material_issue_type_id');
}
