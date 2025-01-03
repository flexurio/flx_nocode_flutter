import 'package:flexurio_chiron_company/src/app/model/department_group.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_group_query_bloc.freezed.dart';

@freezed
class DepartmentGroupQueryState with _$DepartmentGroupQueryState {
  const factory DepartmentGroupQueryState.initial() = _Initial;
  const factory DepartmentGroupQueryState.loading() = _Loading;
  const factory DepartmentGroupQueryState.loaded(List<DepartmentGroup> groups) =
      _Loaded;
  const factory DepartmentGroupQueryState.error(String error) = _Error;
}

@freezed
class DepartmentGroupQueryEvent with _$DepartmentGroupQueryEvent {
  const factory DepartmentGroupQueryEvent.fetch() = _Fetch;
}

class DepartmentGroupQueryBloc
    extends Bloc<DepartmentGroupQueryEvent, DepartmentGroupQueryState> {
  DepartmentGroupQueryBloc() : super(const _Initial()) {
    on<DepartmentGroupQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final groups =
                await CompanyRepository.instance.departmentGroupFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Loaded(groups));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
