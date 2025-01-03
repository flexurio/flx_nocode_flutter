import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_group_bloc.freezed.dart';

@freezed
class BalanceGroupState with _$BalanceGroupState {
  const factory BalanceGroupState.initial() = _Initial;
  const factory BalanceGroupState.loading() = _Loading;
  const factory BalanceGroupState.success() = _Success;
  const factory BalanceGroupState.error(String error) = _Error;
}

@freezed
class BalanceGroupEvent with _$BalanceGroupEvent {
  const factory BalanceGroupEvent.create({
    required String name,
    required BalanceGroupType type,
    required BalanceGroupCategory category,
    required String id,
  }) = _Create;
  const factory BalanceGroupEvent.delete(String id) = _Delete;
}

class BalanceGroupBloc extends Bloc<BalanceGroupEvent, BalanceGroupState> {
  BalanceGroupBloc() : super(const _Initial()) {
    on<BalanceGroupEvent>((event, emit) async {
      await event.when(
        create: (
          name,
          type,
          category,
          id,
        ) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.balanceGroupCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              type: type,
              category: category,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.balanceGroupDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
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
