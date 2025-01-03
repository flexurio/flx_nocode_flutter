import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_transaction.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/journal_transaction.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_transaction_query_bloc.freezed.dart';

@freezed
class JournalTransactionQueryState with _$JournalTransactionQueryState {
  const factory JournalTransactionQueryState.initial() = _Initial;
  const factory JournalTransactionQueryState.loading(
    PageOptions<JournalTransaction> pageOptions,
  ) = _Loading;
  const factory JournalTransactionQueryState.loaded(
    PageOptions<JournalTransaction> pageOptions,
  ) = _Loaded;
  const factory JournalTransactionQueryState.error(String error) = _Error;
}

@freezed
class JournalTransactionQueryEvent with _$JournalTransactionQueryEvent {
  const factory JournalTransactionQueryEvent.fetch({
    PageOptions<JournalTransaction>? pageOptions,
  }) = _Fetch;
}

class JournalTransactionQueryBloc
    extends Bloc<JournalTransactionQueryEvent, JournalTransactionQueryState> {
  JournalTransactionQueryBloc() : super(const _Initial()) {
    on<JournalTransactionQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await JournalTransactionRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<JournalTransaction> _pageOptions =
      PageOptions.empty(sortBy: 'date');
}
