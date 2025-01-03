import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_line.dart';
import 'package:flexurio_chiron_production/src/app/model/production_machine.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/model/production_service_order.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process_detail.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process_group.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_chiron_production/src/app/model/production_monitoring.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductionRepository extends Repository {
  ProductionRepository({required super.dio, required super.onUnauthorized});

  static final linePath = '${Api.urlApi}/lines';
  static final machinePath = '${Api.urlApi}/machines';
  static final subStagePath = '${Api.urlApi}/lines';
  static final stagePath = '${Api.urlApi}/productions/stages';
  static final stageProcessPath = '${Api.urlApi}/productions/stages/processes';
  static final serviceOrderPath = '${Api.urlApi}/product-service/orders';
  static final productionMonitoringPath = '${Api.urlApi}/report-production-monitoring-process';

  static ProductionRepository instance = ProductionRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Line
  Future<List<ProductionServiceOrder>> serviceOrderFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        serviceOrderPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final serviceOrders = <ProductionServiceOrder>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        serviceOrders
            .add(ProductionServiceOrder.fromJson(data as Map<String, dynamic>));
      }

      return serviceOrders;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> serviceOrderCreate({
    required String accessToken,
    required String productId,
    required String productName,
    required String customerId,
    required String batchNo,
    required String purchaseOrderId,
    required int quantity,
    required String description,
    required bool isBulk,
    required ProductionProductStatus status,
    required ProductionProductScale scale,
    required DateTime expirationDate,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        serviceOrderPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'product_id': productId,
          'product_name': productName,
          'customer_id': customerId,
          'batch_no': batchNo,
          'purchase_order_id': purchaseOrderId,
          'quantity': quantity,
          'description': description,
          'scale': scale.id,
          'is_bulk': isBulk,
          'product_status': status.id,
          'expiration_date': expirationDate.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> serviceOrderEdit({
    required String accessToken,
    required String productId,
    required String productName,
    required String customerId,
    required String batchNo,
    required String purchaseOrderId,
    required int quantity,
    required String description,
    required bool isBulk,
    required ProductionProductStatus status,
    required ProductionProductScale scale,
    required DateTime expirationDate,
    required ProductionServiceOrder productionServiceOrder,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$serviceOrderPath/${productionServiceOrder.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'product_id': productId,
          'product_name': productName,
          'customer_id': customerId,
          'batch_no': batchNo,
          'purchase_order_id': purchaseOrderId,
          'quantity': quantity,
          'description': description,
          'scale': scale.id,
          'is_bulk': isBulk,
          'product_status': status.id,
          'expiration_date': expirationDate.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> serviceOrderDelete({
    required String accessToken,
    required ProductionServiceOrder productionServiceOrder,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$serviceOrderPath/${productionServiceOrder.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> serviceOrderRework({
    required String accessToken,
    required ProductionServiceOrder productionServiceOrder,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$serviceOrderPath/${productionServiceOrder.id}/rework',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> serviceOrderCancelRework({
    required String accessToken,
    required ProductionServiceOrder productionServiceOrder,
    required String reason,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$serviceOrderPath/${productionServiceOrder.id}/cancel-rework',
        data: jsonEncode({'cancel_rework_reason': reason}),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Line
  Future<PageOptions<ProductionLine>> lineFetch({
    required String accessToken,
    required PageOptions<ProductionLine> pageOptions,
  }) async {
    try {
      final queryParameters = <String, dynamic>{}
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        linePath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductionLine.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> lineCreate({
    required String accessToken,
    required String name,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        linePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'name': name}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> lineUpdate({
    required String accessToken,
    required String name,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$linePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'name': name}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> lineDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$linePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Sub Stage
  Future<List<ProductionSubStage>> subStageFetch({
    required String accessToken,
    required ProductionStage stage,
    required bool? isActive,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (isActive != null) {
        queryParams['is_active.eq'] = isActive;
      }

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/${stage.id}/subs',
        queryParameters: queryParams,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final subStages = <ProductionSubStage>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        subStages
            .add(ProductionSubStage.fromJson(data as Map<String, dynamic>));
      }

      return subStages;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductionSubStage> subStageFetchById({
    required String accessToken,
    required ProductionSubStage subStage,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/subs/${subStage.id}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final json = response.data!['data'] as Map<String, dynamic>;

      return ProductionSubStage.fromJson(json);
    } catch (err) {
      throw checkErrorApi(err);
    }
  }

  Future<void> subStageCreate({
    required String accessToken,
    required String name,
    required int stageId,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/$stageId/subs',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> subStageUpdate({
    required String accessToken,
    required String name,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/subs/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> subStageDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/subs/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> subStageActivate({
    required String accessToken,
    required ProductionSubStage subStage,
  }) async {
    final id = subStage.id;
    try {
      await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/subs/$id/active',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> subStageDeactivate({
    required String accessToken,
    required ProductionSubStage subStage,
  }) async {
    final id = subStage.id;
    try {
      await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/productions/stages/subs/$id/non-active',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Stage
  Future<PageOptions<ProductionStage>> productionStageFetch({
    required String accessToken,
    required PageOptions<ProductionStage> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        stagePath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductionStage.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionStageCreate({
    required String accessToken,
    required String name,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        stagePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'name': name}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionStageUpdate({
    required String accessToken,
    required String name,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$stagePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'name': name}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionStageDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$stagePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Machine
  Future<PageOptions<ProductionMachine>> machineGet({
    required String accessToken,
    required PageOptions<ProductionMachine> pageOptions,
  }) async {
    try {
      final queryParameters = <String, dynamic>{}
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        machinePath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, ProductionMachine.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> machineCreate({
    required String accessToken,
    required String name,
    required String assetNumber,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        machinePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'asset_no': assetNumber,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> machineUpdate({
    required String accessToken,
    required String name,
    required int id,
    required String assetNumber,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$machinePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'asset_no': assetNumber,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> machineDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$machinePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Stage Process
  Future<PageOptions<ProductionStageProcess>> stageProcessFetch({
    required String accessToken,
    required PageOptions<ProductionStageProcess> pageOptions,
    String? type,
    Product? product,
    ProductionLine? line,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        stageProcessPath,
        queryParameters: {
          'production_type.eq': type ?? '',
          'product_id.eq': product?.id ?? '',
          'line_id.eq': line?.id ?? '',
          'page': pageOptions.page,
          'search': pageOptions.search,
          'sort': pageOptions.sortBy,
          'ascending': pageOptions.ascending,
          'limit': 90000,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductionStageProcess.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductionStageProcess>> stageProcessFetchFilter({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        stageProcessPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final productionStageProcess = <ProductionStageProcess>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productionStageProcess
            .add(ProductionStageProcess.fromJson(data as Map<String, dynamic>));
      }
      return productionStageProcess;
    } catch (e) {
      throw checkErrorApi(e);
    }
  }

  Future<int> stageProcessCreate({
    required String accessToken,
    required int ordinal,
    required double leadTime,
    required ProductionStageProcessType productionType,
    required ProductionSubStage subStage,
    required ProductionLine line,
    required Product product,
    required ProductionMachine machine,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        stageProcessPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'ordinal': ordinal,
          'lead_time': leadTime,
          'production_type': productionType.id,
          'production_substage_id': subStage.id,
          'machine_id': machine.id,
          'line_id': line.id,
          'product_id': product.id,
        }),
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return data['id'] as int;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<int> stageProcessEdit({
    required String accessToken,
    required int id,
    required int ordinal,
    required ProductionStageProcessGroup stageProcessGroup,
    required ProductionStageProcessDetail stageProcess,
  }) async {
    try {
      final response = await dio.put<Map<String, dynamic>>(
        '$stageProcessPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'ordinal': ordinal,
          'lead_time': stageProcess.leadTime,
          'production_type': stageProcessGroup.type.id,
          'production_substage_id': stageProcess.subStage.id,
          'machine_id': stageProcess.machine.id,
          'line_id': stageProcessGroup.line.id,
          'product_id': stageProcessGroup.product.id,
        }),
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return data['id'] as int;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> stageProcessDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      final message = await dio.delete<Map<String, dynamic>>(
        '$stageProcessPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return message.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductionMonitoring>> productionMonitoringFetch({
    required String accessToken,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$productionMonitoringPath',
        queryParameters: {
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
          'limit': 90000,
        },
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final productionMonitoring = <ProductionMonitoring>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productionMonitoring.add(ProductionMonitoring.fromJson(data as Map<String, dynamic>));
      }
      return productionMonitoring;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
