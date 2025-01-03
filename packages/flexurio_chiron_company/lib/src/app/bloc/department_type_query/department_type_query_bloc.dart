import 'package:flexurio_chiron_company/src/app/model/department_type.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_type_query_bloc.freezed.dart';

@freezed
class DepartmentTypeQueryState with _$DepartmentTypeQueryState {
  const factory DepartmentTypeQueryState.initial() = _Initial;
  const factory DepartmentTypeQueryState.loading() = _Loading;
  const factory DepartmentTypeQueryState.loaded(List<DepartmentType> types) =
      _Loaded;
  const factory DepartmentTypeQueryState.error(String error) = _Error;
}

@freezed
class DepartmentTypeQueryEvent with _$DepartmentTypeQueryEvent {
  const factory DepartmentTypeQueryEvent.fetch() = _Fetch;
}

class DepartmentTypeQueryBloc
    extends Bloc<DepartmentTypeQueryEvent, DepartmentTypeQueryState> {
  DepartmentTypeQueryBloc() : super(const _Initial()) {
    on<DepartmentTypeQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final types = await CompanyRepository.instance.departmentTypeFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Loaded(types));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
