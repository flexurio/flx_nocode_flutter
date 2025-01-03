import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_recap.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductReceiveRecapRepository extends Repository {
  ProductReceiveRecapRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final productReceiveRecapPath =
      '${Api.urlApi}/products/receives/details';

  static ProductReceiveRecapRepository instance = ProductReceiveRecapRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<ProductReceiveRecap>> productReturnReceiveReportFetch({
    required String accessToken,
    required PageOptions<ProductReceiveRecap> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Product product,
    required List<Warehouse> warehouseIn,
  }) async {
    try {
      final warehouseSelect = warehouseIn.map((e) => e.id).join(',');
      final response = await dio.get<Map<String, dynamic>>(
        productReceiveRecapPath,
        queryParameters: {
          'created_at.gte': DateFormat('yyyy-MM-dd').format(periodStart),
          'created_at.lte': DateFormat('yyyy-MM-dd').format(periodEnd),
          'warehouse.in': warehouseSelect,
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
        ProductReceiveRecap.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
