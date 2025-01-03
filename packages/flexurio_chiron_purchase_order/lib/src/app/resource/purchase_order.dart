import 'package:dio/dio.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_reject.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PurchaseOrderRepository extends Repository {
  PurchaseOrderRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final purchaseOrderRejectPath =
      '${Api.urlApi}/report-purchase-orders-reject';

  static PurchaseOrderRepository instance = PurchaseOrderRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<PurchaseOrderReject>> rejectFetch({
    required String accessToken,
    required PageOptions<PurchaseOrderReject> pageOptions,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        purchaseOrderRejectPath,
        queryParameters: {
          'created_at.gte': startDate?.toUtcIso(),
          'created_at.lte': endDate?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, PurchaseOrderReject.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
