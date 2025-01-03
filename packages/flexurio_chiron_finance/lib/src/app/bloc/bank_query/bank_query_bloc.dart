import 'package:flexurio_chiron_finance/src/app/model/bank.dart';
import 'package:appointment/src/app/resource/bank_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_query_bloc.freezed.dart';

@freezed
class BankQueryState with _$BankQueryState {
  const factory BankQueryState.initial() = _Initial;
  const factory BankQueryState.loading() = _Loading;
  const factory BankQueryState.loaded(
    List<Bank> bank,
  ) = _Success;
  const factory BankQueryState.error(String error) = _Error;
}

@freezed
class BankQueryEvent with _$BankQueryEvent {
  const factory BankQueryEvent.fetch() = _Get;
}

class BankQueryBloc extends Bloc<BankQueryEvent, BankQueryState> {
  BankQueryBloc() : super(const _Initial()) {
    on<BankQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final banks = await BankRepository.instance.bankFetch(
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
