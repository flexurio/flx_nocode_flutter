import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_query_bloc.freezed.dart';

@freezed
class DepartmentQueryState with _$DepartmentQueryState {
  const factory DepartmentQueryState.initial() = _Initial;
  const factory DepartmentQueryState.loading(
    PageOptions<Department> pageOptions,
  ) = _Loading;
  const factory DepartmentQueryState.loaded(
    PageOptions<Department> pageOptions,
  ) = _Loaded;
  const factory DepartmentQueryState.error(String error) = _Error;
}

@freezed
class DepartmentQueryEvent with _$DepartmentQueryEvent {
  const factory DepartmentQueryEvent.fetch({
    PageOptions<Department>? pageOptions,
    String? departmentType,
  }) = _Fetch;
  const factory DepartmentQueryEvent.fetchById({
    String? departmentId,
    PageOptions<Department>? pageOptions,
  }) = _FetchById;
}

class DepartmentQueryBloc
    extends Bloc<DepartmentQueryEvent, DepartmentQueryState> {
  DepartmentQueryBloc() : super(const _Initial()) {
    on<DepartmentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, departmentType) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await CompanyRepository.instance.departmentFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              departmentType: departmentType,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchById: (departmentId, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await CompanyRepository.instance.departmentFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              departmentId: departmentId,
              pageOptions: _pageOptions,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Department> _pageOptions = PageOptions.empty();
}
