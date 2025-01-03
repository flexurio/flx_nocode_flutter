import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cost_report.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class CostRepository extends Repository {
  CostRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final costReportPath = '${Api.urlApi}/cost-reports';

  static CostRepository instance = CostRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<CostReport>> reportFetch({
    required String accessToken,
    required PageOptions<CostReport> pageOptions,
    required DateTime dateStart,
    required DateTime dateEnd,
    String? departmentId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        costReportPath,
        queryParameters: {
          'date.gte': dateStart.toUtcIso(),
          'date.lte': dateEnd.toUtcIso(),
          'department_id.eq': departmentId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, CostReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
