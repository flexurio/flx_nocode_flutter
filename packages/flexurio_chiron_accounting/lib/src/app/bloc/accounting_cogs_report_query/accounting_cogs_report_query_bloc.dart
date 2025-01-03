import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/util/cogs_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'accounting_cogs_report_query_bloc.freezed.dart';

@freezed
class AccountingCogsReportQueryState with _$AccountingCogsReportQueryState {
  const factory AccountingCogsReportQueryState.initial() = _Initial;
  const factory AccountingCogsReportQueryState.loading() = _Loading;
  const factory AccountingCogsReportQueryState.loaded(
    List<CogsGrade1> cogs,
    Company division,
    int year,
  ) = _Success;
  const factory AccountingCogsReportQueryState.error(String error) = _Error;
}

@freezed
class AccountingCogsReportQueryEvent with _$AccountingCogsReportQueryEvent {
  const factory AccountingCogsReportQueryEvent.fetch({
    required Company division,
    required int year,
  }) = _Fetch;
}

class AccountingCogsReportQueryBloc extends Bloc<AccountingCogsReportQueryEvent,
    AccountingCogsReportQueryState> {
  AccountingCogsReportQueryBloc() : super(const _Initial()) {
    on<AccountingCogsReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (division, year) async {
          emit(const _Loading());
          try {
            final cogs = await AccountingRepository.instance.cogsFetch(
              accessToken: UserRepositoryApp.instance.token!,
              year: year,
              division: division.id,
            );

            emit(_Success(cogsGroup(cogs), division, year));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
