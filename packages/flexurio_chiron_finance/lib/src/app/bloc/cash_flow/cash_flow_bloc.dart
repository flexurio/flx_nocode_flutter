import 'package:flexurio_chiron_finance/src/app/model/bank.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_core/src/app/model/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_flow_bloc.freezed.dart';

@freezed
class CashFlowState with _$CashFlowState {
  const factory CashFlowState.initial() = _Initial;
  const factory CashFlowState.loading() = _Loading;
  const factory CashFlowState.success() = _Success;
  const factory CashFlowState.error(String error) = _Error;
}

@freezed
class CashFlowEvent with _$CashFlowEvent {
  const factory CashFlowEvent.edit({
    required String transactionNo,
    required String code,
    required String subCode,
    required String mutationDate,
    required int transferFee,
    required int totalTransferFee,
    required Bank bank,
  }) = _Edit;
  const factory CashFlowEvent.approve(String transactionNo) = _Approve;
  const factory CashFlowEvent.open(String transactionNo) = _Open;
}

class CashFlowBloc extends Bloc<CashFlowEvent, CashFlowState> {
  CashFlowBloc() : super(const _Initial()) {
    on<CashFlowEvent>((event, emit) async {
      await event.when(
        edit: (
          transactionNo,
          code,
          subCode,
          mutationDate,
          transferFee,
          totalTransferFee,
          bank,
        ) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.cashFlowEdit(
              accessToken: UserRepositoryApp.instance.token!,
              transactionNo: transactionNo,
              code: code,
              subCode: subCode,
              mutationDate: mutationDate,
              transferFee: transferFee,
              totalTransfer: totalTransferFee,
              bank: bank,
            );
            emit(const _Success());
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        approve: (transactionNo) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.cashFlowApprove(
              accessToken: UserRepositoryApp.instance.token!,
              transactionNo: transactionNo,
            );
            emit(const _Success());
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        open: (transactionNo) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.cashFlowOpen(
              accessToken: UserRepositoryApp.instance.token!,
              transactionNo: transactionNo,
            );
            emit(const _Success());
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
