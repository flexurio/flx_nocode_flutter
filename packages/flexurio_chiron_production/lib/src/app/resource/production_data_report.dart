import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_data_report.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductionDataReportRepository extends Repository {
  ProductionDataReportRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final productionDataReportPath = '${Api.urlApi}/report-production-data';

  static ProductionDataReportRepository instance = 
    ProductionDataReportRepository(
      dio: Api.dio,
      onUnauthorized: AuthenticationRepository.logout,
    );

  Future<PageOptions<ProductionDataReport>> productionDataReportFetch({
    required String accessToken,
    required PageOptions<ProductionDataReport> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Product product,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productionDataReportPath,
        queryParameters: {
          'actual_start_time.gte': periodStart.toUtc().toIso8601String(),
          'actual_end_time.lte': periodEnd.toUtc().toIso8601String(),
          'product_name.eq': product.name,
          'product_id.eq': product.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response, 
        ProductionDataReport.fromJson,
      );
      
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
