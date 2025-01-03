import 'package:appointment/constant/company.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounting_cogs_process_bloc.freezed.dart';

@freezed
class AccountingCogsProcessState with _$AccountingCogsProcessState {
  const factory AccountingCogsProcessState.initial() = _Initial;
  const factory AccountingCogsProcessState.loading() = _Loading;
  const factory AccountingCogsProcessState.success() = _Success;
  const factory AccountingCogsProcessState.error(String message) = _Error;
}

@freezed
class AccountingCogsProcessEvent with _$AccountingCogsProcessEvent {
  const factory AccountingCogsProcessEvent.reprocess({
    required DateTime period,
    required Company company,
  }) = _Reprocess;
}

class AccountingCogsProcessBloc
    extends Bloc<AccountingCogsProcessEvent, AccountingCogsProcessState> {
  AccountingCogsProcessBloc() : super(const _Initial()) {
    on<AccountingCogsProcessEvent>((event, emit) async {
      await event.when(
        reprocess: (period, company) async {
          try {
            emit(const _Loading());
            await AccountingRepository.instance.cogsReprocess(
              accessToken: UserRepositoryApp.instance.token!,
              period: period,
              company: company,
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
