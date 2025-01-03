import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_group_query_bloc.freezed.dart';

@freezed
class BalanceGroupQueryState with _$BalanceGroupQueryState {
  const factory BalanceGroupQueryState.initial() = _Initial;
  const factory BalanceGroupQueryState.loading() = _Loading;
  const factory BalanceGroupQueryState.loaded(
    List<BalanceGroup> balanceGroup,
  ) = _Success;
  const factory BalanceGroupQueryState.error(String error) = _Error;
}

@freezed
class BalanceGroupQueryEvent with _$BalanceGroupQueryEvent {
  const factory BalanceGroupQueryEvent.fetch() = _Get;
}

class BalanceGroupQueryBloc
    extends Bloc<BalanceGroupQueryEvent, BalanceGroupQueryState> {
  BalanceGroupQueryBloc() : super(const _Initial()) {
    on<BalanceGroupQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final banks = await AccountingRepository.instance.balanceGroupFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(banks));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
