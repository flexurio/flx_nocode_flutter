import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_non_order.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_non_order_bloc.freezed.dart';

@freezed
class TransactionNonOrderState with _$TransactionNonOrderState {
  const factory TransactionNonOrderState.initial() = _Initial;
  const factory TransactionNonOrderState.loading() = _Loading;
  const factory TransactionNonOrderState.success() = _Success;
  const factory TransactionNonOrderState.error(String error) = _Error;
}

@freezed
class TransactionNonOrderEvent with _$TransactionNonOrderEvent {
  const factory TransactionNonOrderEvent.create({
    required String name,
    required String value,
    required ChartOfAccountNumber coaNumber,
  }) = _Create;
  const factory TransactionNonOrderEvent.delete({
    required TransactionNonOrder transactionNonOrder,
  }) = _Delete;
}

class TransactionNonOrderBloc
    extends Bloc<TransactionNonOrderEvent, TransactionNonOrderState> {
  TransactionNonOrderBloc() : super(const _Initial()) {
    on<TransactionNonOrderEvent>((event, emit) async {
      await event.when(
        create: (
          name,
          value,
          coaNumber,
        ) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.transactionNonOrderCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              value: value,
              coaNumber: coaNumber,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (transactionNonOrder) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.transactionNonOrderDelete(
              accessToken: UserRepositoryApp.instance.token!,
              transactionNonOrder: transactionNonOrder,
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
