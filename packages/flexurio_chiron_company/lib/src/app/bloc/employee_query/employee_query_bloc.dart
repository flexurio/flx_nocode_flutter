import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_query_bloc.freezed.dart';

@freezed
class EmployeeQueryState with _$EmployeeQueryState {
  const factory EmployeeQueryState.initial() = _Initial;
  const factory EmployeeQueryState.loading() = _Loading;
  const factory EmployeeQueryState.loaded(
    List<Employee> employees,
  ) = _Success;
  const factory EmployeeQueryState.error(String error) = _Error;
}

@freezed
class EmployeeQueryEvent with _$EmployeeQueryEvent {
  const factory EmployeeQueryEvent.fetch() = _Get;
}

class EmployeeQueryBloc extends Bloc<EmployeeQueryEvent, EmployeeQueryState> {
  EmployeeQueryBloc() : super(const _Initial()) {
    on<EmployeeQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final accessToken = UserRepositoryApp.instance.token!;
            final employee = await EmployeeRepository.fetch(accessToken);
            emit(_Success(employee));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
