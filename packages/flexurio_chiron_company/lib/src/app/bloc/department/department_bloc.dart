import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_bloc.freezed.dart';

@freezed
class DepartmentState with _$DepartmentState {
  const factory DepartmentState.initial() = _Initial;
  const factory DepartmentState.loading() = _Loading;
  const factory DepartmentState.success() = _Success;
  const factory DepartmentState.error(String error) = _Error;
}

@freezed
class DepartmentEvent with _$DepartmentEvent {
  const factory DepartmentEvent.create({
    required String id,
    required String name,
    required DepartmentGroup group,
    required DepartmentType type,
  }) = _Create;
  const factory DepartmentEvent.update({
    required String name,
    required Department department,
    required DepartmentGroup group,
    required DepartmentType type,
  }) = _Update;
  const factory DepartmentEvent.delete({required Department department}) =
      _Delete;
}

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc() : super(const _Initial()) {
    on<DepartmentEvent>((event, emit) async {
      await event.when(
        create: (name, id, group, type) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.departmentCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              id: id,
              group: group,
              type: type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (name, department, group, type) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.departmentEdit(
              accessToken: UserRepositoryApp.instance.token!,
              department: department,
              name: name,
              group: group,
              type: type,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (department) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.departmentDelete(
              accessToken: UserRepositoryApp.instance.token!,
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
}
