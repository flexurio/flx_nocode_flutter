import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_query_bloc.freezed.dart';

@freezed
class DriverQueryState with _$DriverQueryState {
  const factory DriverQueryState.initial() = _Initial;
  const factory DriverQueryState.loading() = _Loading;
  const factory DriverQueryState.loaded(
    List<Employee> employees,
    List<String> departmentEmployees,
  ) = _Success;
  const factory DriverQueryState.error(String error) = _Error;
}

@freezed
class DriverQueryEvent with _$DriverQueryEvent {
  const factory DriverQueryEvent.get({
    Department? department,
  }) = _Get;
}

class DriverQueryBloc extends Bloc<DriverQueryEvent, DriverQueryState> {
  DriverQueryBloc() : super(const _Initial()) {
    on<DriverQueryEvent>((event, emit) async {
      await event.when(
        get: (department) async {
          emit(const _Loading());
          try {
            final employee = await EmployeeRepository.fetch(
              UserRepositoryApp.instance.token!,
            );
            final departmentEmployee =
                await CompanyRepository.instance.departmentEmployeeFetch(
              accessToken: UserRepositoryApp.instance.token!,
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
