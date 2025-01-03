import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap_detail.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AgingScheduleAPRepository extends Repository {
  AgingScheduleAPRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static AgingScheduleAPRepository instance = AgingScheduleAPRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<AgingScheduleAP>> fetch({
    required String accessToken,
    required PageOptions<AgingScheduleAP> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-aging-schedule-account-payable',
        queryParameters: {
          'transaction_date.lte': startDate?.toUtc().toIso8601String(),
          'transaction_date.gte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AgingScheduleAP.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AgingScheduleAPDetail>> detailFetch({
    required String accessToken,
    required PageOptions<AgingScheduleAPDetail> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-aging-schedule-account-payable-details',
        queryParameters: {
          'transaction_date.lte': startDate?.toUtc().toIso8601String(),
          'transaction_date.gte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AgingScheduleAPDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
