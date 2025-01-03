import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'office_query_bloc.freezed.dart';

@freezed
class OfficeQueryState with _$OfficeQueryState {
  const factory OfficeQueryState.initial() = _Initial;
  const factory OfficeQueryState.loading() = _Loading;
  const factory OfficeQueryState.loaded(
    List<Office> offices,
  ) = _Success;
  const factory OfficeQueryState.error(String error) = _Error;
}

@freezed
class OfficeQueryEvent with _$OfficeQueryEvent {
  const factory OfficeQueryEvent.fetch() = _Fetch;
}

class OfficeQueryBloc extends Bloc<OfficeQueryEvent, OfficeQueryState> {
  OfficeQueryBloc() : super(const _Initial()) {
    on<OfficeQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final offices = await CompanyRepository.instance.officeFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(offices));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
