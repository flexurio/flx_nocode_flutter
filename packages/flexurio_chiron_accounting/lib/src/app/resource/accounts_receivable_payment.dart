import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_global.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_value.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AccountsReceivablePaymentRepository extends Repository {
  AccountsReceivablePaymentRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final arPaymentDetailPath =
      '${Api.urlApi}/recap-payments/REKAP PEMBAYARAN PIUTANG DETAIL';
  static final arPaymentGlobalPath =
      '${Api.urlApi}/recap-payments/REKAP PEMBAYARAN PIUTANG GLOBAL';
  static final arPaymentValuePath =
      '${Api.urlApi}/recap-payments/REKAP PEMBAYARAN PIUTANG DETAIL BY NILAI BAYAR';

  static AccountsReceivablePaymentRepository instance =
      AccountsReceivablePaymentRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<AccountsReceivablePaymentDetail>> fetchDetail({
    required String accessToken,
    required PageOptions<AccountsReceivablePaymentDetail> pageOptions,
    Customer? customer,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        arPaymentDetailPath,
        queryParameters: {
          'customer_id.eq': customer?.id,
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivablePaymentDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivablePaymentGlobal>> fetchGlobal({
    required String accessToken,
    required PageOptions<AccountsReceivablePaymentGlobal> pageOptions,
    Customer? customer,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        arPaymentGlobalPath,
        queryParameters: {
          'customer_id.eq': customer?.id,
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivablePaymentGlobal.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivablePaymentValue>> fetchValue({
    required String accessToken,
    required PageOptions<AccountsReceivablePaymentValue> pageOptions,
    Customer? customer,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        arPaymentValuePath,
        queryParameters: {
          'customer_id.eq': customer?.id,
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivablePaymentValue.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
