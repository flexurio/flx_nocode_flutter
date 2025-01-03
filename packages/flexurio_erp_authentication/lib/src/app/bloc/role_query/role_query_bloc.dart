import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_query_bloc.freezed.dart';

@freezed
class RoleQueryState with _$RoleQueryState {
  const factory RoleQueryState.initial() = _Initial;
  const factory RoleQueryState.loading(
    PageOptions<Role> pageOptions,
  ) = _Loading;
  const factory RoleQueryState.loaded(
    PageOptions<Role> pageOptions,
  ) = _Success;
  const factory RoleQueryState.error(String error) = _Error;
}

@freezed
class RoleQueryEvent with _$RoleQueryEvent {
  const factory RoleQueryEvent.fetch({
    PageOptions<Role>? pageOptions,
  }) = _Fetch;
}

class RoleQueryBloc extends Bloc<RoleQueryEvent, RoleQueryState> {
  RoleQueryBloc({required this.accessToken}) : super(const _Initial()) {
    on<RoleQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await AuthenticationRepositoryApi.instance.roleFetch(
              accessToken: accessToken,
              pageOptions: _pageOptions,
            );
            emit(
              _Success(_pageOptions),
            );
          } catch (error) {
            emit(
              _Error(errorMessage(error)),
            );
          }
        },
      );
    });
  }
  final String accessToken;
  PageOptions<Role> _pageOptions = PageOptions.empty();
}
