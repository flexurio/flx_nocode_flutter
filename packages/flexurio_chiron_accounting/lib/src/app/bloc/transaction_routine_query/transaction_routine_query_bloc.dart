import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_routine_query_bloc.freezed.dart';

@freezed
class TransactionRoutineQueryState with _$TransactionRoutineQueryState {
  const factory TransactionRoutineQueryState.initial() = _Initial;
  const factory TransactionRoutineQueryState.loading(
    PageOptions<TransactionRoutine> pageOptions,
  ) = _Loading;
  const factory TransactionRoutineQueryState.loaded(
    PageOptions<TransactionRoutine> pageOptions,
  ) = _Loaded;
  const factory TransactionRoutineQueryState.error(String error) = _Error;
}

@freezed
class TransactionRoutineQueryEvent with _$TransactionRoutineQueryEvent {
  const factory TransactionRoutineQueryEvent.fetch({
    String? active,
    PageOptions<TransactionRoutine>? pageOptions,
  }) = _Fetch;
}

class TransactionRoutineQueryBloc
    extends Bloc<TransactionRoutineQueryEvent, TransactionRoutineQueryState> {
  TransactionRoutineQueryBloc() : super(const _Initial()) {
    on<TransactionRoutineQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          active,
          pageOptions,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountingRepository.instance.transactionRoutineFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              active: active,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<TransactionRoutine> _pageOptions = PageOptions.empty();
}
