import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PendingRequestsRepository extends Repository {
  PendingRequestsRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final recapPath =
      '${Api.urlApi}/recap-sales-order-global-pending-recapitulation';
  static final unservedPath =
      '${Api.urlApi}/recap-sales-order-unserved-pending-requests-with-hna';
  static final detailPath =
      '${Api.urlApi}/recap-sales-order-pendingan-rekapitulasi-detail';

  static PendingRequestsRepository instance = PendingRequestsRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<PendingRequestsRecap>> fetchRecap({
    required String accessToken,
    required PageOptions<PendingRequestsRecap> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapPath,
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

  Future<PageOptions<PendingRequestsUnserved>> fetchUnserved({
    required String accessToken,
    required PageOptions<PendingRequestsUnserved> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        unservedPath,
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

      return pageOptions.setFromApi(response, PendingRequestsUnserved.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PendingRequestsDetail>> fetchDetail({
    required String accessToken,
    required PageOptions<PendingRequestsDetail> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
    Customer? customer,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        detailPath,
        queryParameters: {
          'product_request_date.gte': startDate?.toUtc().toIso8601String(),
          'product_request_date.lte': endDate?.toUtc().toIso8601String(),
          'department_id.eq': department?.id,
          'customer_id.eq': customer?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PendingRequestsDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PendingRequestsRecapGlobal>> fetchRecapGlobal({
    required String accessToken,
    required PageOptions<PendingRequestsRecapGlobal> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-global-pending-product',
        queryParameters: {
          'product_request_date.gte': startDate?.toUtc().toIso8601String(),
          'product_request_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, PendingRequestsRecapGlobal.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
