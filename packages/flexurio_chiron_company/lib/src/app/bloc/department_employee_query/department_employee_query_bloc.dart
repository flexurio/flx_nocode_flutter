import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_employee_query_bloc.freezed.dart';

@freezed
class DepartmentEmployeeQueryState with _$DepartmentEmployeeQueryState {
  const factory DepartmentEmployeeQueryState.initial() = _Initial;
  const factory DepartmentEmployeeQueryState.loading() = _Loading;
  const factory DepartmentEmployeeQueryState.loaded(
    List<Employee> employees,
    List<String> departmentEmployees,
  ) = _Success;
  const factory DepartmentEmployeeQueryState.error(String error) = _Error;
}

@freezed
class DepartmentEmployeeQueryEvent with _$DepartmentEmployeeQueryEvent {
  const factory DepartmentEmployeeQueryEvent.get({
    Department? department,
  }) = _Get;
}

class DepartmentEmployeeQueryBloc
    extends Bloc<DepartmentEmployeeQueryEvent, DepartmentEmployeeQueryState> {
  DepartmentEmployeeQueryBloc() : super(const _Initial()) {
    on<DepartmentEmployeeQueryEvent>((event, emit) async {
      await event.when(
        get: (department) async {
          emit(const _Loading());
          try {
            final accessToken = UserRepositoryApp.instance.token!;
            final employee = await EmployeeRepository.fetch(accessToken);
            final departmentEmployee =
                await CompanyRepository.instance.departmentEmployeeFetch(
              accessToken: accessToken,
              department: department!,
            );
            emit(_Success(employee, departmentEmployee));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
