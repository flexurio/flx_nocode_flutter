import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_general_expense.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_general_expense_query_bloc.freezed.dart';

@freezed
class PaymentGeneralExpenseQueryState with _$PaymentGeneralExpenseQueryState {
  const factory PaymentGeneralExpenseQueryState.initial() = _Initial;
  const factory PaymentGeneralExpenseQueryState.loading(
    PageOptions<PaymentGeneralExpense> pageOptions,
  ) = _Loading;
  const factory PaymentGeneralExpenseQueryState.loaded(
    PageOptions<PaymentGeneralExpense> pageOptions,
  ) = _Loaded;
  const factory PaymentGeneralExpenseQueryState.error(String error) = _Error;
}

@freezed
class PaymentGeneralExpenseQueryEvent with _$PaymentGeneralExpenseQueryEvent {
  const factory PaymentGeneralExpenseQueryEvent.fetch({
    PageOptions<PaymentGeneralExpense>? pageOptions,
  }) = _Fetch;
}

class PaymentGeneralExpenseQueryBloc extends Bloc<
    PaymentGeneralExpenseQueryEvent, PaymentGeneralExpenseQueryState> {
  PaymentGeneralExpenseQueryBloc() : super(const _Initial()) {
    on<PaymentGeneralExpenseQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PaymentRepository.instance.generalExpenseFetch(
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
  PageOptions<PaymentGeneralExpense> _pageOptions = PageOptions.empty(
    sortBy: 'transaction_no',
  );
}
