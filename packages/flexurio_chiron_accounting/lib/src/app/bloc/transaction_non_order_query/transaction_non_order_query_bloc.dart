import 'package:flexurio_chiron_accounting/src/app/model/transaction_non_order.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_non_order_query_bloc.freezed.dart';

@freezed
class TransactionNonOrderQueryState with _$TransactionNonOrderQueryState {
  const factory TransactionNonOrderQueryState.initial() = _Initial;
  const factory TransactionNonOrderQueryState.loading(
    PageOptions<TransactionNonOrder> pageOptions,
  ) = _Loading;
  const factory TransactionNonOrderQueryState.loaded(
    PageOptions<TransactionNonOrder> pageOptions,
  ) = _Loaded;
  const factory TransactionNonOrderQueryState.error(String error) = _Error;
}

@freezed
class TransactionNonOrderQueryEvent with _$TransactionNonOrderQueryEvent {
  const factory TransactionNonOrderQueryEvent.fetch({
    PageOptions<TransactionNonOrder>? pageOptions,
  }) = _Fetch;
}

class TransactionNonOrderQueryBloc
    extends Bloc<TransactionNonOrderQueryEvent, TransactionNonOrderQueryState> {
  TransactionNonOrderQueryBloc() : super(const _Initial()) {
    on<TransactionNonOrderQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountingRepository.instance.transactionNonOrderFetch(
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
  PageOptions<TransactionNonOrder> _pageOptions = PageOptions.empty();
}
