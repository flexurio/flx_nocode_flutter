import 'package:dio/dio.dart';
import 'package:flexurio_chiron_tax/src/app/model/sales_tax_report.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class TaxRepository extends Repository {
  TaxRepository({required super.dio, required super.onUnauthorized});

  static final salesTaxReportPath = '${Api.urlApi}/report-sales-e-invoice-general';

  static TaxRepository instance = TaxRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );
    Future<PageOptions<SalesTaxReport>> fetch({
    required String accessToken,
    required PageOptions<SalesTaxReport> pageOptions,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String transactionSalesType,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        salesTaxReportPath,
        queryParameters: {
          'transaction_date.gte': dateStart.toUtcIso(),
          'transaction_date.lte': dateEnd.toUtcIso(),
          'transaction_sales_type.eq': transactionSalesType,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        SalesTaxReport.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
