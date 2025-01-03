import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date_new.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_mutation_report_invoice_due_date.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class DebtRepository extends Repository {
  DebtRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final debtCardReportPerSupplierPath = '${Api.urlApi}/report-debt-card-by-supplier';
  static final debtCardReportPerSupplierNewPath = '${Api.urlApi}/report-debt-card-by-supplier-new';
  static final reportDebtMutationPath = '${Api.urlApi}/report-debt-mutation';

  static DebtRepository instance = DebtRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<DebtCardReportPerSupplierInvoiceDate>> fetchInvoiceDueDate({
    required String accessToken,
    required PageOptions<DebtCardReportPerSupplierInvoiceDate> pageOptions,
    DateTime? transactionDateLte,
    DateTime? transactionDateGte,
    DateTime? dueDateLte,
    DateTime? dueDateGte,
    Supplier? supplier,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        debtCardReportPerSupplierPath,
        queryParameters: {
          'transaction_date.lte': transactionDateLte?.toUtc().toIso8601String(),
          'transaction_date.gte': transactionDateGte?.toUtc().toIso8601String(),
          'due_date.lte': dueDateLte?.toUtc().toIso8601String(),
          'due_date.gte': dueDateGte?.toUtc().toIso8601String(),
          'supplier_id.eq': supplier?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response, DebtCardReportPerSupplierInvoiceDate.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<DebtCardReportPerSupplierInvoiceDateNew>> fetchInvoiceDueDateNew({
    required String accessToken,
    required PageOptions<DebtCardReportPerSupplierInvoiceDateNew> pageOptions,
    DateTime? transactionDateLte,
    DateTime? transactionDateGte,
    Supplier? supplier,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        debtCardReportPerSupplierNewPath,
        queryParameters: {
          'transaction_date.lte': transactionDateLte?.toUtc().toIso8601String(),
          'transaction_date.gte': transactionDateGte?.toUtc().toIso8601String(),
          'supplier_id.eq': supplier?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response, DebtCardReportPerSupplierInvoiceDateNew.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<DebtMutationReportInvoiceDueDate>> fetchMutationInvoiceDueDate({
    required String accessToken,
    required PageOptions<DebtMutationReportInvoiceDueDate> pageOptions,
    DateTime? transactionDateLte,
    DateTime? transactionDateGte,
    DateTime? dueDateLte,
    DateTime? dueDateGte,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        reportDebtMutationPath,
        queryParameters: {
          'transaction_date.lte': transactionDateLte?.toUtc().toIso8601String(),
          'transaction_date.gte': transactionDateGte?.toUtc().toIso8601String(),
          'due_date.lte': dueDateLte?.toUtc().toIso8601String(),
          'due_date.gte': dueDateGte?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response, DebtMutationReportInvoiceDueDate.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
