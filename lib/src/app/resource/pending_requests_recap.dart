import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/pending_requests_recap.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PendingRequestsRecapRepository extends Repository {
  PendingRequestsRecapRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialStockRupiahPath =
      '${Api.urlApi}/recap-sales-order-global-pending-recapitulation';

  static PendingRequestsRecapRepository instance =
      PendingRequestsRecapRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<PendingRequestsRecap>> fetch({
    required String accessToken,
    required PageOptions<PendingRequestsRecap> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockRupiahPath,
        queryParameters: {
          'product_request_date.gte': startDate?.toUtc().toIso8601String(),
          'product_request_date.lte': endDate?.toUtc().toIso8601String(),
          'department_id.eq': department?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PendingRequestsRecap.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
