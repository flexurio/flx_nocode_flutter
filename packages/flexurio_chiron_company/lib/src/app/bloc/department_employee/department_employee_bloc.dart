import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_employee_bloc.freezed.dart';

@freezed
class DepartmentEmployeeState with _$DepartmentEmployeeState {
  const factory DepartmentEmployeeState.initial() = _Initial;
  const factory DepartmentEmployeeState.loading() = _Loading;
  const factory DepartmentEmployeeState.success() = _Success;
  const factory DepartmentEmployeeState.error(String error) = _Error;
}

@freezed
class DepartmentEmployeeEvent with _$DepartmentEmployeeEvent {
  const factory DepartmentEmployeeEvent.create(
    Employee employee,
  ) = _Create;
  const factory DepartmentEmployeeEvent.delete(
    Employee employee,
  ) = _Update;
}

class DepartmentEmployeeBloc
    extends Bloc<DepartmentEmployeeEvent, DepartmentEmployeeState> {
  DepartmentEmployeeBloc(this.department) : super(const _Initial()) {
    on<DepartmentEmployeeEvent>((event, emit) async {
      await event.when(
        create: (employee) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.departmentEmployeeCreate(
              accessToken: UserRepositoryApp.instance.token!,
              employee: employee,
              department: department,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (employee) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.departmentEmployeeDelete(
              accessToken: UserRepositoryApp.instance.token!,
              employee: employee,
              department: department,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final Department department;
}
