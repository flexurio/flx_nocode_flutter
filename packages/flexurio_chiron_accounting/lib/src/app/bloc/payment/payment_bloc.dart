import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_bloc.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial({
    List<Transaction>? transaction,
    Payment? payment,
    ChartOfAccountNumber? chartOfAccountNumber,
    Department? department,
  }) = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.success(String? id) = _Success;
  const factory PaymentState.error(String error) = _Error;
}

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.initialize(
    Payment payment,
    Transaction? transaction,
  ) = _Initialize;

  const factory PaymentEvent.createFormTransaction(
    List<Transaction> transactions,
    String customerId,
  ) = _CreateFormTransaction;

  const factory PaymentEvent.createFormPayment({
    required Payment payment,
    required ChartOfAccountNumber chartOfAccountNumber,
    required Department department,
  }) = _CreateFormPayment;

  const factory PaymentEvent.submit({
    TransactionPayment? transactionPayment,
  }) = _Submit;

  const factory PaymentEvent.uploadSalaries({
    required PlatformFile file,
    required String registerNo,
    required DateTime date,
  }) = _UploadSalaries;

  const factory PaymentEvent.edit({
    required List<Transaction> transactions,
    required double rate,
    required double kuCost,
    required double stampCost,
    required double roundingCost,
    required double artCost,
    required double otherCost,
    required double rateGap,
    required String chartOfAccountId,
    required String departmentId,
    required String description,
    required String paymentNo,
  }) = _Edit;
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const _Initial()) {
    on<PaymentEvent>((event, emit) async {
      await event.when(
        edit: (
          transactions,
          rate,
          kuCost,
          stampCost,
          roundingCost,
          artCost,
          otherCost,
          rateGap,
          chartOfAccountId,
          departmentId,
          description,
          paymentNo,
        ) async {
          emit(const _Loading());
          try {
            await Future.wait([
              PaymentRepository.instance.paymentSalesOrderDetailEdit(
                accessToken: UserRepositoryApp.instance.token!,
                transactions: transactions,
                chartOfAccountId: chartOfAccountId,
                departmentId: departmentId,
                paymentNo: paymentNo,
              ),
              PaymentRepository.instance.paymentOtherCostEdit(
                accessToken: UserRepositoryApp.instance.token!,
                artCost: artCost,
                kuCost: kuCost,
                otherCost: otherCost,
                rate: rate,
                rateGap: rateGap,
                roundingCost: roundingCost,
                stampCost: stampCost,
                description: description,
                id: paymentNo,
              ),
            ]);
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        uploadSalaries: (file, registerNo, date) async {
          emit(const _Loading());
          try {
            await PaymentRepository.instance.paymentSalariesUpload(
              accessToken: UserRepositoryApp.instance.token!,
              file: file,
              registerNo: registerNo,
              date: date,
            );
            emit(const _Success(null));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createFormPayment: (payment, chartOfAccount, department) async {
          emit(const _Loading());
          _payment = payment;
          _chartOfAccount = chartOfAccount;
          _department = department;

          emit(
            _Initial(
              payment: _payment,
              transaction: _transactions,
              department: _department,
              chartOfAccountNumber: _chartOfAccount,
            ),
          );
        },
        createFormTransaction: (transaction, customerId) async {
          emit(const _Loading());
          _transactions = transaction;
          _customerId = customerId;
          emit(
            _Initial(
              payment: _payment,
              transaction: _transactions,
              department: _department,
              chartOfAccountNumber: _chartOfAccount,
            ),
          );
        },
        submit: (transactionPayment) async {
          emit(const _Loading());
          try {
            String? paymentId;
            if (transactionPayment!.isPayable) {
              final payment = await PaymentRepository.instance.paymentCreate(
                accessToken: UserRepositoryApp.instance.token!,
                accountName: _payment?.accountName,
                accountNumber: _payment?.accountNumber,
                amount: transactionPayment.paymentRemaining,
                artCost: _payment!.artCost,
                dateTime: _payment!.date,
                description: _payment!.remark,
                id: '',
                departmentId: _department!.id,
                partnerId: _customerId!,
                chartOfAccountRepaymentId: _chartOfAccount!.id,
                kuCost: _payment!.kuCost,
                otherCost: _payment!.otherCost,
                rate: _payment!.rate,
                rateGap: _payment!.rateGap,
                roundingCost: _payment!.rounding,
                stampCost: _payment!.stampCost,
                type: _payment!.type,
              );
              paymentId = payment.id;

              var index = 0;
              await PaymentRepository.instance.paymentDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                index: index++,
                transaction: Transaction.empty().copyWith(
                  id: transactionPayment.transactionNo,
                  total: transactionPayment.total,
                  orderId: transactionPayment.orderId,
                ),
                payment: payment,
                budgetType: BudgetType.empty(),
                department: _department!,
                chartOfAccount: _chartOfAccount!,
                description: _payment!.remark,
              );
            } else if (transactionPayment.isReceivable) {
              final payment =
                  await PaymentRepository.instance.paymentSalesOrderCreate(
                accountName: _payment?.accountName,
                accountNumber: _payment?.accountNumber,
                chartOfAccountRepaymentId: _chartOfAccount!.id,
                customerId: _customerId!,
                departmentId: _department!.id,
                accessToken: UserRepositoryApp.instance.token!,
                artCost: _payment!.artCost,
                kuCost: _payment!.kuCost,
                otherCost: _payment!.otherCost,
                rate: _payment!.rate,
                rateGap: _payment!.rateGap,
                roundingCost: _payment!.rounding,
                stampCost: _payment!.stampCost,
                amount: transactionPayment.paymentRemaining,
                dateTime: _payment!.date,
                description: _payment!.remark,
                type: _payment!.type,
                id: '',
                chartOfAccount: _chartOfAccount!,
              );
              paymentId = payment;

              var index = 0;
              await PaymentRepository.instance.paymentSalesOrderDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                index: index++,
                transactions: _transactions!,
                payment: Payment.empty().copyWith(id: payment),
                budgetType: BudgetType.empty(),
                department: _department!,
                chartOfAccount: _chartOfAccount!,
                description: _payment!.remark,
              );
            }

            emit(_Success(paymentId));
          } catch (error, s) {
            print(s);
            emit(_Error(errorMessage(error)));
          }
        },
        initialize: (payment, transaction) async {
          emit(const _Loading());
          try {
            if (transaction != null) {
              final payments = await PaymentRepository.instance.paymentFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: PageOptions.emptyNoLimit(),
                transaction: transaction,
              );

              _payment = payments.data.first;
              _department = payments.data.first.department;

              final paymentDetails =
                  await PaymentRepository.instance.paymentDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                payment: payments.data.first,
                pageOptions: PageOptions.emptyNoLimit(),
              );

              if (paymentDetails.data.isNotEmpty) {
                _chartOfAccount = paymentDetails.data.first.chartOfAccount;
              }
              emit(
                _Initial(
                  payment: _payment,
                  transaction:
                      paymentDetails.data.map((e) => e.transaction).toList(),
                  department: _department,
                  chartOfAccountNumber: _chartOfAccount,
                ),
              );
            } else {
              final paymentDetails =
                  await PaymentRepository.instance.paymentDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                payment: payment,
                pageOptions: PageOptions.emptyNoLimit(),
              );
              _payment = payment;
              _department = payment.department;
              if (paymentDetails.data.isNotEmpty) {
                _chartOfAccount = paymentDetails.data.first.chartOfAccount;
              }

              emit(
                _Initial(
                  payment: _payment,
                  transaction:
                      paymentDetails.data.map((e) => e.transaction).toList(),
                  department: _department,
                  chartOfAccountNumber: _chartOfAccount,
                ),
              );
            }
          } catch (e) {
            emit(_Error(errorMessage(e)));
          }
        },
      );
    });
  }
  Payment? _payment;
  ChartOfAccountNumber? _chartOfAccount;
  Department? _department;
  List<Transaction>? _transactions;
  String? _customerId;
}
