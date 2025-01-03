import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_detail_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_global_invoice_date.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class BusinessDebtReportRepository extends Repository {
  BusinessDebtReportRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final debtBalanceDetailInvoiceDatePath = '${Api.urlApi}/report-detail-debt-balance';
  static final debtBalanceGlobalInvoiceDatePath = '${Api.urlApi}/report-global-debt-balance';

  static BusinessDebtReportRepository instance = BusinessDebtReportRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<DebtBalanceDetailInvoiceDate>> fetchDetail({
    required String accessToken,
    required PageOptions<DebtBalanceDetailInvoiceDate> pageOptions,
    Supplier? supplier,
    DateTime? transactionDate,
    DateTime? dueDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        debtBalanceDetailInvoiceDatePath,
        queryParameters: {
          'supplier_id.eq': supplier?.id,
          'transaction_date.lte': transactionDate?.toUtc().toIso8601String(),
          'due_date.lte': dueDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, DebtBalanceDetailInvoiceDate.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<DebtBalanceGlobalInvoiceDate>> fetchGlobal({
    required String accessToken,
    required PageOptions<DebtBalanceGlobalInvoiceDate> pageOptions,
    Supplier? supplier,
    DateTime? transactionDate,
    DateTime? dueDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        debtBalanceGlobalInvoiceDatePath,
        queryParameters: {
          'transaction_date.lte': transactionDate?.toUtc().toIso8601String(),
          'due_date.lte': dueDate?.toUtc().toIso8601String(),
          'supplier.eq': supplier?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, DebtBalanceGlobalInvoiceDate.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
