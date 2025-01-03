import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_type_query_bloc.freezed.dart';

@freezed
class TransactionTypeQueryState with _$TransactionTypeQueryState {
  const factory TransactionTypeQueryState.initial() = _Initial;
  const factory TransactionTypeQueryState.loading(
    PageOptions<TransactionType> pageOptions,
  ) = _Loading;
  const factory TransactionTypeQueryState.loaded(
    PageOptions<TransactionType> pageOptions,
  ) = _Loaded;
  const factory TransactionTypeQueryState.error(String error) = _Error;
}

@freezed
class TransactionTypeQueryEvent with _$TransactionTypeQueryEvent {
  const factory TransactionTypeQueryEvent.fetch({
    PageOptions<TransactionType>? pageOptions,
    String? name,
    String? flag,
    String? code,
    String? type,
    String? value,
    List<String>? codes,
    List<String>? id,
  }) = _Fetch;
}

class TransactionTypeQueryBloc
    extends Bloc<TransactionTypeQueryEvent, TransactionTypeQueryState> {
  TransactionTypeQueryBloc() : super(const _Initial()) {
    on<TransactionTypeQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, name, flag, code, type, value, codes, id) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await FinanceRepository.instance.transactionTypeFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              flag: flag,
              code: code,
              type: type,
              id: id,
              value: value,
              codes: codes,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<TransactionType> _pageOptions = PageOptions.empty();
}
