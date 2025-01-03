import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_query_bloc.freezed.dart';

@freezed
class TransactionQueryState with _$TransactionQueryState {
  const factory TransactionQueryState.initial() = _Initial;
  const factory TransactionQueryState.loading(
    PageOptions<Transaction> pageOptions,
  ) = _Loading;
  const factory TransactionQueryState.loaded(
    PageOptions<Transaction> pageOptions,
  ) = _Loaded;
  const factory TransactionQueryState.error(String error) = _Error;
}

@freezed
class TransactionQueryEvent with _$TransactionQueryEvent {
  const factory TransactionQueryEvent.fetch({
    PageOptions<Transaction>? pageOptions,
    double? paymentRemainingGreaterThan,
    DateTime? dateGraterThanEqualTo,
    DateTime? dateLessThanEqualTo,
    TransactionJournalType? type,
    Supplier? supplier,
    Customer? customer,
  }) = _Fetch;
}

class TransactionQueryBloc
    extends Bloc<TransactionQueryEvent, TransactionQueryState> {
  TransactionQueryBloc() : super(const _Initial()) {
    on<TransactionQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          paymentRemainingGreaterThan,
          dateGraterThanEqualTo,
          dateLessThanEqualTo,
          type,
          supplier,
          customer,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await FinanceRepository.instance.transactionFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              paymentRemainingGreaterThan: paymentRemainingGreaterThan,
              dateGraterThanEqualTo: dateGraterThanEqualTo,
              dateLessThanEqualTo: dateLessThanEqualTo,
              type: type,
              supplier: supplier,
              customer: customer,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<Transaction> _pageOptions = PageOptions.empty();
}
