import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/delivery_date_recap.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PpicRepository extends Repository {
  PpicRepository({required super.dio, required super.onUnauthorized});
  static final productReceivePath = '${Api.urlApi}/products/receives';

  static PpicRepository instance = PpicRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<DeliveryDateRecap>> deliveryDateRecapFetch({
    required String accessToken,
    DateTime? deliveryOrderDateGte,
    DateTime? deliveryOrderDateLte,
    Customer? customer,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/recap-delivery-date',
        queryParameters: {
          'delivery_order_date.gte': deliveryOrderDateGte?.yyyyMMdd,
          'delivery_order_date.lte': deliveryOrderDateLte?.yyyyMMdd,
          'customer_id.eq': customer?.id,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <DeliveryDateRecap>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(DeliveryDateRecap.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  productReceiveFetch(
      {required String accessToken, PurchaseOrder? purchaseOrder}) {}
}
