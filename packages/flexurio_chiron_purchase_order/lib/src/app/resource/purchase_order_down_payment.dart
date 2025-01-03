import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_down_payment.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PurchaseOrderDownPaymentRepository extends Repository {
  PurchaseOrderDownPaymentRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final purchaseOrderDownPaymentPath =
      '${Api.urlApi}/purchase-order-down-payments';

  static PurchaseOrderDownPaymentRepository instance =
      PurchaseOrderDownPaymentRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<PurchaseOrderDownPayment>> fetch({
    required String accessToken,
    required PageOptions<PurchaseOrderDownPayment> pageOptions,
    required String purchaseOrderId,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrderId);

      final response = await dio.get<Map<String, dynamic>>(
        '$purchaseOrderDownPaymentPath/$id',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(
        response,
        PurchaseOrderDownPayment.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> create({
    required String accessToken,
    required String purchaseOrderId,
    required DateTime dueDate,
    required double amount,
    required String description,
    required String accountNumber,
    required String accountName,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrderId);
      await dio.post<Map<String, dynamic>>(
        '$purchaseOrderDownPaymentPath/$id',
        data: jsonEncode({
          'amount': amount,
          'due_date': dueDate.toUtcIso(),
          'description': description,
          'account_number': accountNumber,
          'account_name': accountName,
        }),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
