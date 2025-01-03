import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_report.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_mutation_report.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialStockRepository extends Repository {
  MaterialStockRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialStockPath = '${Api.urlApi}/report-material-stock';
  static final materialStockMutationPath = '${Api.urlApi}/report-material-stock-mutation';

  static MaterialStockRepository instance = MaterialStockRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialStockReport>> fetch({
    required String accessToken,
    required PageOptions<MaterialStockReport> pageOptions,
    required String? materialStatusQcId,
    required String? materialUnitId,
    required String? materialId,
    required String? materialGroupId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockPath,
        queryParameters: {
          'material_status_qc.eq': materialStatusQcId,
          'material_unit_id.eq': materialUnitId,
          'material_id.eq': materialId,
          'material_group_id.eq': materialGroupId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialStockReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialStockMutationReport>> fetchReportMutation({
    required String accessToken,
    required PageOptions<MaterialStockMutationReport> pageOptions,
    required String? materialGroupId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockMutationPath,
        queryParameters: {
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroupId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialStockMutationReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
  
}
