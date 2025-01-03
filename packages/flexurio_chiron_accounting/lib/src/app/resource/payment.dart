import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_general_expense.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:file_picker/file_picker.dart';

class PaymentRepository extends Repository {
  PaymentRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final paymentPath = '${Api.urlApi}/payments';
  static final paymentDetailPath = '$paymentPath/details';
  static final paymentGeneralExpense = '${Api.urlApi}/payments/general-expense';

  static PaymentRepository instance = PaymentRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Payment
  Future<PageOptions<Payment>> paymentFetch({
    required String accessToken,
    required PageOptions<Payment> pageOptions,
    String? id,
    Transaction? transaction,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        paymentPath,
        queryParameters: {
          'id.like': id,
          'transaction_id.eq': transaction?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, Payment.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Payment By ID
  Future<Payment> paymentFetchById({
    required String accessToken,
    String? paymentId,
  }) async {
    try {
      final id = Uri.encodeComponent(paymentId!);
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/payments/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>;

      return Payment.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<Payment> paymentCreate({
    required String accessToken,
    required PaymentType type,
    required DateTime dateTime,
    required String id,
    required double kuCost,
    required double stampCost,
    required double roundingCost,
    required double amount,
    required double artCost,
    required double otherCost,
    required double rateGap,
    required double rate,
    required String description,
    required String? chartOfAccountRepaymentId,
    required String partnerId,
    required String departmentId,
    required String? accountNumber,
    required String? accountName,
  }) async {
    try {
      final data = jsonEncode({
        'id': id,
        'date': dateTime.toUtc().toIso8601String(),
        'type': type.id,
        'ku_cost': kuCost,
        'stamp_cost': stampCost,
        'rounding': roundingCost,
        'art_cost': artCost,
        'other_cost': otherCost,
        'rate_gap': rateGap,
        'down_payment': 0,
        'total': amount,
        'rate': rate,
        'account_value': amount,
        'remark': description,
        'account_number': accountNumber,
        'account_name': accountName,
        "chart_of_account_repayment": chartOfAccountRepaymentId,
        "partner_id": partnerId,
        "department_id": departmentId,
      });
      final response = await dio.post<Map<String, dynamic>>(
        paymentPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return Payment.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<Payment> paymentOtherCostEdit({
    required String accessToken,
    required String id,
    required double kuCost,
    required double stampCost,
    required double roundingCost,
    required double artCost,
    required double otherCost,
    required double rateGap,
    required double rate,
    required String description,
  }) async {
    try {
      final data = jsonEncode({
        'ku_cost': kuCost,
        'stamp_cost': stampCost,
        'rounding': roundingCost,
        'art_cost': artCost,
        'other_cost': otherCost,
        'rate_gap': rateGap,
        'description': description,
      });
      final response = await dio.post<Map<String, dynamic>>(
        paymentPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return Payment.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> paymentSalesOrderCreate({
    required String accessToken,
    required PaymentType type,
    required DateTime dateTime,
    required String id,
    required double kuCost,
    required double stampCost,
    required double roundingCost,
    required double amount,
    required double artCost,
    required double otherCost,
    required double rateGap,
    required double rate,
    required String description,
    required ChartOfAccountNumber chartOfAccount,
    required String chartOfAccountRepaymentId,
    required String customerId,
    required String? accountNumber,
    required String? accountName,
    required String departmentId,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/payments/sales-orders',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'chart_of_account_id': chartOfAccount.id,
          'date': dateTime.toUtc().toIso8601String(),
          'type': type.id,
          'ku_cost': kuCost,
          'stamp_cost': stampCost,
          'rounding': roundingCost,
          'art_cost': artCost,
          'other_cost': otherCost,
          'rate_gap': rateGap,
          'rate': rate,
          "remark": description,
          "chart_of_account_repayment": chartOfAccountRepaymentId,
          "partner_id": customerId,
          "department_id": departmentId,
          "account_number": accountNumber,
          "account_name": accountName,
        }),
      );
      final id = response.data?['data']?['id'];
      return id as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> paymentSalariesUpload({
    required String accessToken,
    required PlatformFile file,
    required String registerNo,
    required DateTime date,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$paymentPath/salaries/upload',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          'register_no': registerNo,
          'transaction_date': date.toUtcIso(),
          'document_input_salaries': MultipartFile.fromBytes(
            file.bytes!,
            filename: file.name,
          ),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Payment Details
  Future<PageOptions<PaymentDetail>> paymentDetailFetch({
    required String accessToken,
    required PageOptions<PaymentDetail> pageOptions,
    required Payment payment,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$paymentPath/${Uri.encodeComponent(payment.id)}/details',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, PaymentDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<PaymentDetailReceivable>> paymentDetailReceivableFetch({
    required String accessToken,
    required Payment payment,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$paymentPath/${Uri.encodeComponent(payment.id)}/details/receivable',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final paymentDetailReceivable = <PaymentDetailReceivable>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        paymentDetailReceivable.add(PaymentDetailReceivable.fromJson(data as Map<String, dynamic>));
      }
      return paymentDetailReceivable;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> paymentDetailCreate({
    required String accessToken,
    required Payment payment,
    required Department department,
    required String description,
    required Transaction transaction,
    required ChartOfAccountNumber chartOfAccount,
    required BudgetType? budgetType,
    required int index,
  }) async {
    try {
      final data = jsonEncode({
        'payment_id': payment.id,
        'transaction_id': transaction.id,
        'value': transaction.total,
        'department_id': department.id,
        'description': description,
        'budget_type': budgetType?.id,
        'chart_of_account_id': chartOfAccount.id,
        'order_id': transaction.orderId,
        'counter': index,
      });
      await dio.post<Map<String, dynamic>>(
        paymentDetailPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> paymentSalesOrderDetailCreate({
    required String accessToken,
    required Payment payment,
    required Department department,
    required String description,
    required List<Transaction> transactions,
    required ChartOfAccountNumber chartOfAccount,
    required BudgetType? budgetType,
    required int index,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/payments/details/sales-orders',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(transactions
            .map((e) => {
                  'chart_of_account_id': chartOfAccount.id,
                  'department_id': department.id,
                  'payment_id': payment.id,
                  'transaction_id': e.id,
                  'value': e.total,
                })
            .toList()),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> paymentSalesOrderDetailEdit({
    required String accessToken,
    required List<Transaction> transactions,
    required String paymentNo,
    required String chartOfAccountId,
    required String departmentId,
  }) async {
    try {
      final id = Uri.encodeComponent(paymentNo);
      await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/payments/details/sales-orders/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(transactions
            .map((e) => {
                  'transaction_id': e.id,
                  'value': e.total,
                  'chart_of_account_id': chartOfAccountId,
                  'department_id': departmentId,
                  'payment_id': paymentNo,
                })
            .toList()),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> paymentDetailCreateWithChartOfAccount({
    required String accessToken,
    required Payment payment,
    required double amount,
    required Department department,
    required String orderId,
    required String description,
    required ChartOfAccountNumber chartOfAccount,
    required BudgetType? budgetType,
  }) async {
    try {
      final data = jsonEncode({
        'payment_id': payment.id,
        'transaction_id': '',
        'value': amount,
        'chart_of_account_id': chartOfAccount.id,
        'department_id': department.id,
        'order_id': orderId,
        'description': description,
        'budget_type_id': budgetType?.id,
      });
      await dio.post<Map<String, dynamic>>(
        '$paymentDetailPath/with-chart-of-account',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PaymentGeneralExpense>> generalExpenseFetch({
    required String accessToken,
    required PageOptions<PaymentGeneralExpense> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        paymentGeneralExpense,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(
        response,
        PaymentGeneralExpense.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
