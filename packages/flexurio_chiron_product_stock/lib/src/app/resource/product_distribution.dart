import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_distribution.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductDistributionRepository extends Repository {
  ProductDistributionRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final productDistributionPath =
      '${Api.urlApi}/recap-product-stock-distribution';

  static ProductDistributionRepository instance = ProductDistributionRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<ProductDistribution>> fetch({
    required String accessToken,
    required PageOptions<ProductDistribution> pageOptions,
    required DateTime createdAtStart,
    required DateTime createdAtEnd,
    required String productId,
    required String warehouseId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productDistributionPath,
        queryParameters: {
          'created_at.gte': createdAtStart.toUtcIso(),
          'created_at.lte': createdAtEnd.toUtcIso(),
          'product_id.eq': productId,
          'warehouse.eq': warehouseId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductDistribution.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
