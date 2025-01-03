import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/medical_treatment_expense_department.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/medical_treatment_expense_department.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_treatment_expense_department_query_bloc.freezed.dart';

@freezed
class MedicalTreatmentExpenseDepartmentQueryState
    with _$MedicalTreatmentExpenseDepartmentQueryState {
  const factory MedicalTreatmentExpenseDepartmentQueryState.initial() =
      _Initial;
  const factory MedicalTreatmentExpenseDepartmentQueryState.loading(
    PageOptions<MedicalTreatmentExpenseDepartment> pageOptions,
  ) = _Loading;
  const factory MedicalTreatmentExpenseDepartmentQueryState.loaded(
    PageOptions<MedicalTreatmentExpenseDepartment> pageOptions,
  ) = _Loaded;
  const factory MedicalTreatmentExpenseDepartmentQueryState.error(
    String error,
  ) = _Error;
}

@freezed
class MedicalTreatmentExpenseDepartmentQueryEvent
    with _$MedicalTreatmentExpenseDepartmentQueryEvent {
  const factory MedicalTreatmentExpenseDepartmentQueryEvent.fetch({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String departmentId,
    PageOptions<MedicalTreatmentExpenseDepartment>? pageOptions,
  }) = _Fetch;
}

class MedicalTreatmentExpenseDepartmentQueryBloc extends Bloc<
    MedicalTreatmentExpenseDepartmentQueryEvent,
    MedicalTreatmentExpenseDepartmentQueryState> {
  MedicalTreatmentExpenseDepartmentQueryBloc() : super(const _Initial()) {
    on<MedicalTreatmentExpenseDepartmentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (dataStart, dataEnd, departmentId, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await MedicalTreatmentExpenseDepartmentRepository
                .instance
                .fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              dateStart: dataStart,
              dateEnd: dataEnd,
              departmentId: departmentId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MedicalTreatmentExpenseDepartment> _pageOptions =
      PageOptions.empty(sortBy: 'product_id');
}
