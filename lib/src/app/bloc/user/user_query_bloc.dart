import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_query_bloc.freezed.dart';

@freezed
class UserQueryState with _$UserQueryState {
  const factory UserQueryState.initial() = _Initial;
  const factory UserQueryState.loading() = _Loading;
  const factory UserQueryState.loaded(
    List<String> vehicles,
  ) = _Loaded;
  const factory UserQueryState.error(String message) = _Error;
}

@freezed
class UserQueryEvent with _$UserQueryEvent {
  const factory UserQueryEvent.fetch({
    Department? department,
  }) = _Fetch;
}

class UserQueryBloc extends Bloc<UserQueryEvent, UserQueryState> {
  UserQueryBloc() : super(const _Initial()) {
    on<UserQueryEvent>((event, emit) async {
      await event.when(
        fetch: (department) async {
          emit(const _Loading());
          try {
            final users =
                await CompanyRepository.instance.departmentEmployeeFetch(
              accessToken: UserRepositoryApp.instance.token!,
              department: department!,
            );
            emit(
              _Loaded(
                users,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
