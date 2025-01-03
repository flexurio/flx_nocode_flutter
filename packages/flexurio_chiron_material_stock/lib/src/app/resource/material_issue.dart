import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue_detail_report.dart';

class MaterialIssueRepository extends Repository {
  MaterialIssueRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static String materialIssueByAnalysisNumberPath({
    required bool isExternal,
  }) =>
      isExternal
          ? '${Api.urlApi}/external/report-material-issue-by-na'
          : '${Api.urlApi}/report-material-issue-by-na';

  static String materialIssueByBatchPath({
    required bool isExternal,
  }) =>
      isExternal
          ? '${Api.urlApi}/external/report-material-issue-by-product-batch'
          : '${Api.urlApi}/report-material-issue-by-product-batch';

  static get materialIssuePath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/material-issues'
              : '${Api.urlApi}/material-issues';

  static MaterialIssueRepository instance = MaterialIssueRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialIssueReport>> reportByAnalysisNumberFetch({
    required String accessToken,
    required PageOptions<MaterialIssueReport> pageOptions,
    required DateTime? startDate,
    required DateTime? endDate,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialIssueByAnalysisNumberPath(isExternal: isExternal),
        queryParameters: {
          'report_warehouse_material_issues.material_issue_date.gte':
              startDate?.toUtcIso(),
          'report_warehouse_material_issues.material_issue_date.lte':
              endDate?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialIssueReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialIssueReport>> reportByBatchFetch({
    required String accessToken,
    required PageOptions<MaterialIssueReport> pageOptions,
    required DateTime? startDate,
    required DateTime? endDate,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialIssueByBatchPath(isExternal: isExternal),
        queryParameters: {
          'report_warehouse_material_issues.material_issue_date.gte':
              startDate?.toUtcIso(),
          'report_warehouse_material_issues.material_issue_date.lte':
              endDate?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialIssueReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialIssue>> materialIssueFetch({
    required String accessToken,
    required PageOptions<MaterialIssue> pageOptions,
    String? transactionCode,
    Product? product,
    bool? isProduct,
    MaterialGroup? materialGroup,
    DateTime? startDate,
    DateTime? endDate,
    required String? departmentID,
    required bool isExternal,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'department_id.eq': departmentID,
        'transaction_code.eq': transactionCode,
        'product_id': product?.id,
        'product_yn': isProduct != null ? (isProduct ? 'Y' : 'N') : null,
        'material_group_id.eq': materialGroup?.id,
        'mi_date.gte': startDate?.startOfDay.toUtc().toIso8601String(),
        'mi_date.lte': endDate?.endOfDay.toUtc().toIso8601String(),
      }..addAll(pageOptions.toUrlQueryMap());
      final response = await dio.get<Map<String, dynamic>>(
        materialIssuePath(isExternal: isExternal),
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialIssue.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialIssueBom>> materialIssueBomFetch({
    required String accessToken,
    required Product product,
    required ProductionOrder productionOrder,
    required MaterialGroup materialGroup,
    required ProductionProductScale scale,
    required bool isExternal,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'product_id.eq': product.id,
        // TODO : UNCOMMENT
        // 'batch_no_id.eq': productionOrder.id,
        'material_group_id.eq': materialGroup.id,
        'scale.eq': scale.id,
      };

      final response = await dio.get<Map<String, dynamic>>(
        isExternal
            ? '${Api.urlApi}/external/recap-bill-of-material-vs-material-issues'
            : '${Api.urlApi}/recap-bill-of-material-vs-material-issues',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final materialIssueBoms = <MaterialIssueBom>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialIssueBoms.add(
          MaterialIssueBom.fromJson(data as Map<String, dynamic>),
        );
      }

      return materialIssueBoms;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialIssueCreate({
    required String accessToken,
    required String remarks,
    required Product product,
    required MaterialGroup materialGroup,
    required Department department,
    required ProductionOrder productionOrder,
    required TransactionType transactionType,
    required bool isExternal,
  }) async {
    try {
      final data = jsonEncode(
        {
          'material_group_id': materialGroup.id,
          'department_id': department.id,
          'batch_no_id': productionOrder.id,
          'product_id': product.id,
          'mi_type': transactionType.id,
          'remarks': remarks,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        materialIssuePath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialIssueNonMiCreate({
    required String accessToken,
    required String remarks,
    required Product? product,
    required MaterialGroup materialGroup,
    required Department department,
    required ProductionOrder? productionOrder,
    required TransactionType transactionType,
    required bool isExternal,
  }) async {
    try {
      final data = jsonEncode(
        {
          'material_group_id': materialGroup.id,
          'department_id': department.id,
          'mi_type': transactionType.id,
          'remarks': remarks,
          'batch_no_id': productionOrder?.id,
          'product_id': product?.id,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        '${materialIssuePath(isExternal: isExternal)}/non-mi',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialIssueDelete({
    required String accessToken,
    required MaterialIssue materialIssue,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(materialIssue.id);
      await dio.delete<Map<String, dynamic>>(
        '${materialIssuePath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialIssueDetail>> materialIssueDetailFetch({
    required String accessToken,
    required PageOptions<MaterialIssueDetail> pageOptions,
    required MaterialIssue? materialIssue,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(materialIssue!.id);
      final response = await dio.get<Map<String, dynamic>>(
        '${materialIssuePath(isExternal: isExternal)}/$id/details',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialIssueDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialIssuesDetailReport>> materialIssueDetailReportFetch({
    required String accessToken,
    required MaterialIssue materialIssue,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        isExternal
            ? '${Api.urlApi}/external/report-form-material-issues'
            : '${Api.urlApi}/report-form-material-issues',
        queryParameters: {
          'material_issue_id.eq': materialIssue.id,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialIssuesDetailReport = <MaterialIssuesDetailReport>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialIssuesDetailReport.add(
            MaterialIssuesDetailReport.fromJson(data as Map<String, dynamic>));
      }

      return materialIssuesDetailReport;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialIssueDetailCreate({
    required String accessToken,
    required String na,
    required String materialUnit,
    required double quantity,
    required double quantityRequired,
    required Material material,
    required MaterialIssue materialIssue,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(materialIssue.id);
      final data = jsonEncode(
        {
          'material_issue_id': materialIssue.id,
          'material_id': material.id,
          'material_unit_id': materialUnit,
          'material_name': material.name,
          'na': na,
          'quantity_required': quantityRequired,
          'quantity': quantity,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        '${materialIssuePath(isExternal: isExternal)}/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialIssueDetailEdit({
    required String accessToken,
    required String na,
    required double quantity,
    required Material material,
    required MaterialIssue materialIssue,
    required String materialUnit,
    required MaterialIssueDetail materialIssueDetail,
    required bool isExternal,
  }) async {
    try {
      final data = jsonEncode(
        {
          'material_issue_id': materialIssue.id,
          'material_id': material.id,
          'material_unit_id': materialUnit,
          'material_name': material.name,
          'na': na,
          'quantity': quantity,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '${materialIssuePath(isExternal: isExternal)}/details/${materialIssueDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialIssueDetailDelete({
    required String accessToken,
    required MaterialIssueDetail materialIssueDetail,
    required bool isExternal,
  }) async {
    try {
      final id = materialIssueDetail.id;
      await dio.delete<Map<String, dynamic>>(
        '${materialIssuePath(isExternal: isExternal)}/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
