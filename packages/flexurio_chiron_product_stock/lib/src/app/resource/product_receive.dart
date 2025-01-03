import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';

class ProductReceiveRepository extends Repository {
  ProductReceiveRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static get productReceivePath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/products/receives'
              : '${Api.urlApi}/products/receives';

  static ProductReceiveRepository instance = ProductReceiveRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<ProductReceive> productReceiveByNonPurchaseOrderCreate({
    required String accessToken,
    required String departmentId,
    required ProductReceiveFormTransaction productReceiveForm,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/non-purchase-orders',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'description': productReceiveForm.description,
          'transaction_type_id': productReceiveForm.transactionType!.id,
          'department_id': departmentId,
          'supplier_id': productReceiveForm.supplier?.id,
          'delivery_order_id': productReceiveForm.deliveryOrderId,
          'delivery_order_date':
              productReceiveForm.deliveryOrderDate!.toUtc().toIso8601String(),
        }),
      );

      return ProductReceive.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReceive> productReceiveByNonPurchaseOrderEdit({
    required String accessToken,
    required ProductReceive productReceive,
    required ProductReceiveFormTransaction productReceiveForm,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(productReceive.id);
      final response = await dio.put<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'delivery_order_id': productReceiveForm.deliveryOrderId,
          'delivery_order_date':
              productReceiveForm.deliveryOrderDate!.toUtc().toIso8601String(),
          'description': productReceiveForm.description,
        }),
      );

      return ProductReceive.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReceive> productReceiveByPacking({
    required String accessToken,
    required String description,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/packing',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'description': description,
          'transaction_type_id': '77',
        }),
      );

      return ProductReceive.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReceive> productReceiveByPurchaseOrderCreate({
    required String accessToken,
    required ProductReceiveFormTransaction productReceiveForm,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/purchase-orders',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'description': productReceiveForm.description,
          'department_id': productReceiveForm.purchaseOrder!.department.id,
          'transaction_type_id': '2A',
          'purchase_order_id': productReceiveForm.purchaseOrder!.id,
          'delivery_order_id': productReceiveForm.deliveryOrderId,
          'delivery_order_date':
              productReceiveForm.deliveryOrderDate!.toUtc().toIso8601String(),
        }),
      );

      return ProductReceive.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReceiveDetailCreate({
    required String accessToken,
    required ProductReceive productReceive,
    required ProductReceiveDetail productReceiveDetail,
    required ProductReceiveType type,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(productReceive.id);

      late String endpoint;
      switch (type) {
        case ProductReceiveType.purchaseOrder:
          endpoint = 'purchase-orders';
        case ProductReceiveType.packing:
          endpoint = 'packing';
        case ProductReceiveType.nonPurchaseOrder:
          endpoint = 'non-purchase-orders';
      }

      await dio.post<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/$endpoint/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'product_id': productReceiveDetail.product.id,
          'batch_no': productReceiveDetail.productionOrder.id,
          'expired_date':
              productReceiveDetail.expiredDate.toUtc().toIso8601String(),
          'unit_id': productReceiveDetail.unit.id,
          'qty': productReceiveDetail.quantity,
          'warehouse': productReceiveDetail.warehouse.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReceiveDetailDelete({
    required String accessToken,
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/details/${productReceiveDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReceiveHeaderEdit({
    required String accessToken,
    required ProductReceive productReceive,
    required String description,
    String? deliveryOrder,
    DateTime? deliveryOrderDate,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(productReceive.id);
      await dio.put<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'delivery_order_id': deliveryOrder,
          'delivery_order_date': deliveryOrderDate!.toUtc().toIso8601String(),
          'description': description,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReceiveDetailEdit({
    required String accessToken,
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) async {
    try {
      late String endpoint;
      if (productReceiveDetail.productReceive.type.id ==
          ProductReceiveType.purchaseOrder.id) {
        endpoint = 'purchase-order';
      } else if (productReceiveDetail.productReceive.type.id ==
          ProductReceiveType.packing.id) {
        endpoint = 'packing';
      } else if (productReceiveDetail.productReceive.type.id ==
          ProductReceiveType.nonPurchaseOrder.id) {
        endpoint = 'non-purchase-orders';
      }

      await dio.put<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/$endpoint/details/${productReceiveDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'qty': productReceiveDetail.quantity,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Product Receive Detail
  Future<PageOptions<ProductReceiveDetail>> productReceiveDetailFetch({
    required String accessToken,
    required PageOptions<ProductReceiveDetail> pageOptions,
    ProductReceive? productReceive,
    String? status,
    required bool isExternal,
  }) async {
    try {
      var path = productReceivePath(isExternal: isExternal);
      if (productReceive != null) {
        final id = Uri.encodeComponent(productReceive.id);
        path += '/$id';
      }
      final response = await dio.get<Map<String, dynamic>>(
        '$path/details',
        queryParameters: {
          'status.eq': status,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, ProductReceiveDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReceiveDetail>> productReceiveDetailPrintFetch({
    required String accessToken,
    required PageOptions<ProductReceiveDetail> pageOptions,
    List<Warehouse>? warehouseIn,
    String? productId,
    DateTime? createdAtGte,
    DateTime? createdAtLte,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/details',
        queryParameters: {
          'product_id.eq': productId,
          'created_at.gte': createdAtGte?.yyyyMMdd,
          'created_at.lte': createdAtLte?.yyyyMMdd,
          'warehouse.in': warehouseIn?.map((e) {
            return e.id;
          }).join(','),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, ProductReceiveDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReceiveDetailReject({
    required String accessToken,
    required ProductReceiveDetail productReceiveDetail,
    required String reason,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/details/${productReceiveDetail.id}/reject',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'reject_reason': reason,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReceiveDetailRelease({
    required String accessToken,
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/details/${productReceiveDetail.id}/release',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductReceive>> productReceiveFetch({
    required String accessToken,
    String? purchaseOrderId,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productReceivePath(isExternal: isExternal),
        queryParameters: {
          'purchase_order_id.eq': purchaseOrderId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <ProductReceive>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(ProductReceive.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReceive> productReceiveFetchById({
    required String accessToken,
    required ProductReceive productReceive,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(productReceive.id);
      final response = await dio.get<Map<String, dynamic>>(
        '${productReceivePath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return ProductReceive.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
