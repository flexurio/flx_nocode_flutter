import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch_global.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_global.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_summary_rupiah.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

class MaterialUsageRepository extends Repository {
  MaterialUsageRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final recapUsageMaterialDetailPath =
      '${Api.urlApi}/report-material-usage-detail';
  static final recapUsageMaterialGlobalPath =
      '${Api.urlApi}/report-material-usage-global';
  static final materialUsageSummaryRupiahPath =
      '${Api.urlApi}/report-rupiah-material-usage';

  static MaterialUsageRepository instance = MaterialUsageRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialUsageDetail>> fetchDetail({
    required String accessToken,
    required PageOptions<MaterialUsageDetail> pageOptions,
    TransactionType? transactionType,
    MaterialGroup? materialGroup,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapUsageMaterialDetailPath,
        queryParameters: {
          'material_issue_type.eq': transactionType?.id,
          'material_group_id.eq': materialGroup?.id,
          'material_issue_date.gte': startDate?.toUtc().toIso8601String(),
          'material_issue_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialUsageDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialUsageGlobal>> fetchGlobal({
    required String accessToken,
    required PageOptions<MaterialUsageGlobal> pageOptions,
    TransactionType? transactionType,
    MaterialGroup? materialGroup,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapUsageMaterialGlobalPath,
        queryParameters: {
          'material_issue_type.eq': transactionType?.id,
          'material_group_id.eq': materialGroup?.id,
          'material_issue_date.gte': startDate?.toUtc().toIso8601String(),
          'material_issue_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialUsageGlobal.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialUsageSummaryRupiah>> fetch({
    required String accessToken,
    required PageOptions<MaterialUsageSummaryRupiah> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialUsageSummaryRupiahPath,
        queryParameters: {
          'product_issue_date.gte': startDate?.toUtc().toIso8601String(),
          'product_issue_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MaterialUsageSummaryRupiah.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialUsageBatch>> materialUsageBatchfetch({
    required String accessToken,
    required PageOptions<MaterialUsageBatch> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    ProductionOrder? batch,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-material-usage-per-batch',
        queryParameters: {
          'transaction_date.lte': startDate?.toUtc().toIso8601String(),
          'transaction_date.gte': endDate?.toUtc().toIso8601String(),
          'batch_no.eq': batch?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MaterialUsageBatch.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialUsageBatchDetail>> materialUsageBatchDetailfetch({
    required String accessToken,
    required PageOptions<MaterialUsageBatchDetail> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    ProductionOrder? batch,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-material-usage-per-batch-detail',
        queryParameters: {
          'transaction_date.lte': startDate?.toUtc().toIso8601String(),
          'transaction_date.gte': endDate?.toUtc().toIso8601String(),
          'batch_no.eq': batch?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MaterialUsageBatchDetail.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialUsageBatchGlobal>> materialUsageBatchGlobalfetch({
    required String accessToken,
    required PageOptions<MaterialUsageBatchGlobal> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    // ProductionOrder? batch,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-material-usage-per-batch-global',
        queryParameters: {
          'transaction_date.lte': startDate?.toUtc().toIso8601String(),
          'transaction_date.gte': endDate?.toUtc().toIso8601String(),
          // 'batch_no.eq': batch?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MaterialUsageBatchGlobal.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
