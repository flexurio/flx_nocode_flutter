import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'office_employee_query_bloc.freezed.dart';

@freezed
class OfficeEmployeeQueryState with _$OfficeEmployeeQueryState {
  const factory OfficeEmployeeQueryState.initial() = _Initial;
  const factory OfficeEmployeeQueryState.loading() = _Loading;
  const factory OfficeEmployeeQueryState.loaded(
    List<Employee> employees,
    List<String> officeEmployees,
  ) = _Success;
  const factory OfficeEmployeeQueryState.error(String error) = _Error;
}

@freezed
class OfficeEmployeeQueryEvent with _$OfficeEmployeeQueryEvent {
  const factory OfficeEmployeeQueryEvent.get() = _Get;
}

class OfficeEmployeeQueryBloc
    extends Bloc<OfficeEmployeeQueryEvent, OfficeEmployeeQueryState> {
  OfficeEmployeeQueryBloc(this.officeId) : super(const _Initial()) {
    on<OfficeEmployeeQueryEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const _Loading());
          try {
            final employee = await CompanyRepository.instance.employeeFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            final officeEmployee =
                await CompanyRepository.instance.officeEmployeeFetch(
              accessToken: UserRepositoryApp.instance.token!,
              officeId: officeId,
            );
            emit(_Success(employee, officeEmployee));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final int officeId;
}
