import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'office_employee_bloc.freezed.dart';

@freezed
class OfficeEmployeeState with _$OfficeEmployeeState {
  const factory OfficeEmployeeState.initial() = _Initial;
  const factory OfficeEmployeeState.loading() = _Loading;
  const factory OfficeEmployeeState.success() = _Success;
  const factory OfficeEmployeeState.error(String error) = _Error;
}

@freezed
class OfficeEmployeeEvent with _$OfficeEmployeeEvent {
  const factory OfficeEmployeeEvent.create(
    String employeeId,
  ) = _Create;
  const factory OfficeEmployeeEvent.delete(
    String employeeId,
  ) = _Update;
}

class OfficeEmployeeBloc
    extends Bloc<OfficeEmployeeEvent, OfficeEmployeeState> {
  OfficeEmployeeBloc(this.officeId) : super(const _Initial()) {
    on<OfficeEmployeeEvent>((event, emit) async {
      await event.when(
        create: (employeeId) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.officeEmployeeCreate(
              accessToken: UserRepositoryApp.instance.token!,
              officeId: officeId,
              employeeId: employeeId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (employeeId) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.officeEmployeeDelete(
              accessToken: UserRepositoryApp.instance.token!,
              officeId: officeId,
              employeeId: employeeId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final int officeId;
}
