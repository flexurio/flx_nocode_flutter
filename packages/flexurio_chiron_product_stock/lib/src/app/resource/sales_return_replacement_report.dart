import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/sales_return_replacement_report.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class SalesReturnReplacementReportRepository extends Repository {
  SalesReturnReplacementReportRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final salesReturnReplacementReportPath =
      '${Api.urlApi}/recap-product-return-replacement';

  static SalesReturnReplacementReportRepository instance =
      SalesReturnReplacementReportRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<SalesReturnReplacementReport>>
      salesReturnReplacementReportFetch({
    required String accessToken,
    required PageOptions<SalesReturnReplacementReport> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    Product? product,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        salesReturnReplacementReportPath,
        queryParameters: {
          'created_at.gte': periodStart.toUtc().toIso8601String(),
          'created_at.lte': periodEnd.toUtc().toIso8601String(),
          'customer_id.eq': customer.id,
          'product_issue_transaction_type_id.eq': 'PSR',
          'product_id.eq': product?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        SalesReturnReplacementReport.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
