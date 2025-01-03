import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductionOrderRepository extends Repository {
  ProductionOrderRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static String productionOrderPath ({required bool isExternal }) =>
          isExternal
              ? '${Api.urlApi}/external/productions/orders'
              : '${Api.urlApi}/productions/orders';

  static ProductionOrderRepository instance = ProductionOrderRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<ProductionOrder>> productionOrderFetch({
    required String accessToken,
    required PageOptions<ProductionOrder> pageOptions,
    required bool isExternal,
    Product? product,
    DateTime? periodStart,
    DateTime? periodEnd,
    bool? isCancel,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productionOrderPath(isExternal: isExternal),
        queryParameters: {
          'created_at.gte': periodStart?.yyyyMMdd,
          'created_at.lte': periodEnd?.yyyyMMdd,
          'product_id.eq': product?.id,
          'is_cancel.eq': isCancel,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductionOrder.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Production Order
  Future<void> productionOrderNonProductionCreate({
    required String accessToken,
    required DateTime expirationDate,
    required Product product,
    required String? batchNo,
    required bool isExternal,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${productionOrderPath(isExternal: isExternal)}/non-production',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': batchNo,
          'product_id': product.id,
          'expiration_date': expirationDate.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionOrderCreate({
    required String accessToken,
    required bool isRuahan,
    required bool isTollIn,
    required DateTime expirationDate,
    required int batchSize,
    required Product product,
    required String batchNo,
    required String description,
    required ProductionProductStatus productStatus,
    required ProductionProductScale scale,
    required bool isExternal,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        productionOrderPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': batchNo,
          'product_id': product.id,
          'batch_size': batchSize,
          'description': description,
          'is_toll_in': isTollIn,
          'scale': scale.id,
          'is_bulk': isRuahan,
          'product_status': productStatus.id,
          'expiration_date': expirationDate.toUtc().toIso8601String(),
          'nie': product.nie ?? '',
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionOrderUpdate({
    required String accessToken,
    required String batchNo,
    required bool isRuahan,
    required bool isTollIn,
    required DateTime expirationDate,
    required int batchSize,
    required Product product,
    required String description,
    required ProductionProductStatus productStatus,
    required ProductionProductScale scale,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productionOrderPath(isExternal: isExternal)}/$batchNo/${product.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'batch_size': batchSize,
          'description': description,
          'is_toll_in': isTollIn,
          'scale': scale.id,
          'is_bulk': isRuahan,
          'product_status': productStatus.id,
          'expiration_date': expirationDate.toUtc().toIso8601String(),
          'nie': product.nie ?? '',
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionOrderDelete({
    required String accessToken,
    required ProductionOrder productionOrder,
    required bool isExternal,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${productionOrderPath(isExternal: isExternal)}/${productionOrder.id}/${productionOrder.product.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionOrderRework({
    required String accessToken,
    required ProductionOrder productionOrder,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productionOrderPath(isExternal: isExternal)}/${productionOrder.id}/${productionOrder.product.id}/rework',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionOrderCancelRework({
    required String accessToken,
    required ProductionOrder productionOrder,
    required String reason,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productionOrderPath(isExternal: isExternal)}/${productionOrder.id}/${productionOrder.product.id}/cancel-rework',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'cancel_rework_reason': reason,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productionOrderConfirm({
    required String accessToken,
    required ProductionOrder productionOrder,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productionOrderPath(isExternal: isExternal)}/${productionOrder.id}/${productionOrder.product.id}/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
