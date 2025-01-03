import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_of_account_group_query_bloc.freezed.dart';

@freezed
class ChartOfAccountGroupQueryState with _$ChartOfAccountGroupQueryState {
  factory ChartOfAccountGroupQueryState.initial() = _Initial;
  factory ChartOfAccountGroupQueryState.loading() = _Loading;
  factory ChartOfAccountGroupQueryState.loaded(
    List<ChartOfAccountGroup> chartOfAccountGroups,
  ) = _Loaded;
  factory ChartOfAccountGroupQueryState.error(String error) = _Error;
}

@freezed
class ChartOfAccountGroupQueryEvent with _$ChartOfAccountGroupQueryEvent {
  factory ChartOfAccountGroupQueryEvent.fetch() = _Fetch;
}

class ChartOfAccountGroupQueryBloc
    extends Bloc<ChartOfAccountGroupQueryEvent, ChartOfAccountGroupQueryState> {
  ChartOfAccountGroupQueryBloc() : super(_Initial()) {
    on<ChartOfAccountGroupQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: () async {
            emit(_Loading());
            try {
              final chartOfAccountGroups =
                  await AccountingRepository.instance.chartOfAccountGroupFetch(
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(
                _Loaded(chartOfAccountGroups),
              );
            } catch (error) {
              emit(
                _Error(
                  errorMessage(error),
                ),
              );
            }
          },
        );
      },
    );
  }
}
