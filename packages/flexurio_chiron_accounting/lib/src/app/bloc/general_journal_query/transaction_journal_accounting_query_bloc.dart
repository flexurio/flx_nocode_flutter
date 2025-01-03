import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_journal_accounting_query_bloc.freezed.dart';

@freezed
class TransactionJournalAccountingQueryState
    with _$TransactionJournalAccountingQueryState {
  const factory TransactionJournalAccountingQueryState.initial() = _Initial;
  const factory TransactionJournalAccountingQueryState.loading(
    PageOptions<TransactionJournalAccounting> pageOptions,
  ) = _Loading;
  const factory TransactionJournalAccountingQueryState.loaded(
    PageOptions<TransactionJournalAccounting> pageOptions,
  ) = _Loaded;
  const factory TransactionJournalAccountingQueryState.error(String error) =
      _Error;
}

@freezed
class TransactionJournalAccountingQueryEvent
    with _$TransactionJournalAccountingQueryEvent {
  const factory TransactionJournalAccountingQueryEvent.fetch({
    PageOptions<TransactionJournalAccounting>? pageOptions,
    required bool generals,
    String? transactionNoEq,
  }) = _Fetch;
}

class TransactionJournalAccountingQueryBloc extends Bloc<
    TransactionJournalAccountingQueryEvent,
    TransactionJournalAccountingQueryState> {
  TransactionJournalAccountingQueryBloc() : super(const _Initial()) {
    on<TransactionJournalAccountingQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, generals, transactionNoEq) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            final result = await AccountingRepository.instance
                .transactionJournalAccountingFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              generals: generals,
              transactionNoEq: transactionNoEq,
            );
            emit(_Loaded(result));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<TransactionJournalAccounting> _pageOptions = PageOptions.empty();
}
