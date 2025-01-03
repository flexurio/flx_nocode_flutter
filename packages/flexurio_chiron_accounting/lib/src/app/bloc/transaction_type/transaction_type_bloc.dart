import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_type_bloc.freezed.dart';

@freezed
class TransactionTypeState with _$TransactionTypeState {
  const factory TransactionTypeState.initial() = _Initial;
  const factory TransactionTypeState.loading() = _Loading;
  const factory TransactionTypeState.success() = _Success;
  const factory TransactionTypeState.error(String error) = _Error;
}

@freezed
class TransactionTypeEvent with _$TransactionTypeEvent {
  const factory TransactionTypeEvent.create({
    required String id,
    required String name,
    required String code,
    required String value,
    required TransactionTypeFlag flag,
    required TypeTransaction type,
  }) = _Create;
  const factory TransactionTypeEvent.update({
    required String id,
    required String name,
    required String value,
  }) = _Update;
  const factory TransactionTypeEvent.delete({
    required String id,
  }) = _Delete;
}

class TransactionTypeBloc
    extends Bloc<TransactionTypeEvent, TransactionTypeState> {
  TransactionTypeBloc() : super(const _Initial()) {
    on<TransactionTypeEvent>((event, emit) async {
      await event.when(
        create: (id, name, code, value, flag, type) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.transactionTypeCreate(
              id: id,
              name: name,
              code: code,
              value: value,
              flag: flag,
              accessToken: UserRepositoryApp.instance.token!,
              type: type,
            );
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (id, name, value) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.transactionTypeUpdate(
              id: id,
              name: name,
              value: value,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.transactionTypeDelete(
              id: id,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
