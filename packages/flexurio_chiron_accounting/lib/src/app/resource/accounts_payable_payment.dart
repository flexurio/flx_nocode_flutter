import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment_global.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AccountsPayablePaymentRepository extends Repository {
  AccountsPayablePaymentRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final accountsPayablePaymentDailyPath = '${Api.urlApi}/report-account-payable';
  static final accountsPayablePaymentDetailPath = '${Api.urlApi}/report-payment-account-payable-detail';
  static final accountsPayablePaymentGlobalPath = '${Api.urlApi}/report-payment-account-payable-global';

  static AccountsPayablePaymentRepository instance = AccountsPayablePaymentRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<AccountsPayablePaymentDetail>> fetchDetail({
    required String accessToken,
    required PageOptions<AccountsPayablePaymentDetail> pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        accountsPayablePaymentDetailPath,
        queryParameters: {
          'partner_id.eq': supplier?.id,
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AccountsPayablePaymentDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsPayablePayment>> fetchDaily({
    required String accessToken,
    required PageOptions<AccountsPayablePayment> pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        accountsPayablePaymentDailyPath,
        queryParameters: {
          'supplier_id.eq': supplier?.id,
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AccountsPayablePayment.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsPayablePaymentGlobal>> fetchGlobal({
    required String accessToken,
    required PageOptions<AccountsPayablePaymentGlobal> pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        accountsPayablePaymentGlobalPath,
        queryParameters: {
          'partner_id.eq': supplier?.id,
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AccountsPayablePaymentGlobal.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
