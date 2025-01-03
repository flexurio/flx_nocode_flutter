import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_global.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PurchaseSummaryRepository extends Repository {
  PurchaseSummaryRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final purchaseSummaryDetailPath = '${Api.urlApi}/report-purchase-detail';
  static final purchaseSummaryGlobalPath = '${Api.urlApi}/report-purchase-global';

  static PurchaseSummaryRepository instance = PurchaseSummaryRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<PurchaseSummaryDetail>> fetchDetail({
    required String accessToken,
    required PageOptions<PurchaseSummaryDetail> pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        purchaseSummaryDetailPath,
        queryParameters: {
          'supplier_id.eq': supplier?.id,
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PurchaseSummaryDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PurchaseSummaryGlobal>> fetchGlobal({
    required String accessToken,
    required PageOptions<PurchaseSummaryGlobal> pageOptions,
    Supplier? supplier,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        purchaseSummaryGlobalPath,
        queryParameters: {
          'supplier_id.eq': supplier?.id,
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, PurchaseSummaryGlobal.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
