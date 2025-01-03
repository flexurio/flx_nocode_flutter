import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement_new.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement_return.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PaymentSettlementRepository extends Repository {
  PaymentSettlementRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final paymentSettlementPath = '${Api.urlApi}/report-payment';
  static final paymentSettlementNewPath = '${Api.urlApi}/report-payment-new';
  static final paymentSettlementReturnPath = '${Api.urlApi}/report-return';

  static PaymentSettlementRepository instance = PaymentSettlementRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<PaymentSettlement>> fetchPaymentSettlement({
    required String accessToken,
    required PageOptions<PaymentSettlement> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        paymentSettlementPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PaymentSettlement.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PaymentSettlementNew>> fetchPaymentSettlementNew({
    required String accessToken,
    required PageOptions<PaymentSettlementNew> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        paymentSettlementNewPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PaymentSettlementNew.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PaymentSettlementReturn>> fetchPaymentSettlementReturn({
    required String accessToken,
    required PageOptions<PaymentSettlementReturn> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        paymentSettlementReturnPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PaymentSettlementReturn.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
