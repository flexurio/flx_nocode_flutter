import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_journal_accounting_bloc.freezed.dart';

@freezed
class TransactionJournalAccountingState
    with _$TransactionJournalAccountingState {
  const factory TransactionJournalAccountingState.initial() = _Initial;
  const factory TransactionJournalAccountingState.loading() = _Loading;
  const factory TransactionJournalAccountingState.success() = _Success;
  const factory TransactionJournalAccountingState.error(String error) = _Error;
}

@freezed
class TransactionJournalAccountingEvent
    with _$TransactionJournalAccountingEvent {
  const factory TransactionJournalAccountingEvent.create({
    required List<TransactionJournalAccounting> transactionJournalAccounting,
  }) = _Create;
  const factory TransactionJournalAccountingEvent.deleteByTransactionNo({
    required TransactionJournalAccounting transactionJournalAccounting,
  }) = _DeleteByTransactionNo;
  const factory TransactionJournalAccountingEvent.deleteById({
    required TransactionJournalAccounting transactionJournalAccounting,
  }) = _DeleteById;
}

class TransactionJournalAccountingBloc extends Bloc<
    TransactionJournalAccountingEvent, TransactionJournalAccountingState> {
  TransactionJournalAccountingBloc() : super(const _Initial()) {
    on<TransactionJournalAccountingEvent>((event, emit) async {
      await event.when(
        create: (transactionJournalAccounting) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance
                .transactionJournalAccountingCreate(
              accessToken: UserRepositoryApp.instance.token!,
              transactions: transactionJournalAccounting,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deleteByTransactionNo: (transactionJournalAccounting) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance
                .transactionJournalAccountingDeleteByTransactionNo(
              accessToken: UserRepositoryApp.instance.token!,
              transactionJournalAccounting: transactionJournalAccounting,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deleteById: (transactionJournalAccounting) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance
                .transactionJournalAccountingDeleteById(
              accessToken: UserRepositoryApp.instance.token!,
              transactionJournalAccounting: transactionJournalAccounting,
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
