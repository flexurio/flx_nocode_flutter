import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductFormulationRepository extends Repository {
  ProductFormulationRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final productFormulationPath = ({
    required bool isExternal,
  }) =>
      isExternal
          ? '${Api.urlApi}/external/formulations'
          : '${Api.urlApi}/formulations';

  static final productFormulationDetailPath = ({
    required bool isExternal,
  }) =>
      isExternal
          ? '${Api.urlApi}/external/formulations/details'
          : '${Api.urlApi}/formulations/details';

  static ProductFormulationRepository instance = ProductFormulationRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<ProductFormulation>> productFormulationFetch({
    required String accessToken,
    required PageOptions<ProductFormulation> pageOptions,
    bool? isActive,
    bool? isConfirm,
    Product? product,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productFormulationPath(isExternal: isExternal),
        queryParameters: {
          'is_active.eq': isActive,
          'is_confirm.eq': isConfirm,
          'product_id.eq': product?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, ProductFormulation.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<int> productFormulationCreate({
    required String accessToken,
    required String productId,
    required String type,
    required double quantity,
    required String scale,
    required String productUnitId,
    required String remark,
    required String name,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        productFormulationPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'product_id': productId,
          'type': type,
          'quantity': quantity,
          'scale': scale,
          'unit_id': productUnitId,
          'description': remark,
          // 'product_unit_id': productUnitId,
        }),
      );
      return (response.data!['data'] as Map)['id'] as int;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<int> productFormulationUpdate({
    required String accessToken,
    required int id,
    required String productId,
    required String type,
    required double quantity,
    required String scale,
    required String productUnitId,
    required String name,
    required String remark,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.put<Map<String, dynamic>>(
        '${productFormulationPath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'product_id': productId,
          'type': type,
          'quantity': quantity,
          'scale': scale,
          'product_unit_id': productUnitId,
          'name': name,
          'description': remark,
        }),
      );
      return (response.data!['data'] as Map)['id'] as int;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationConfirm({
    required String accessToken,
    required int id,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productFormulationPath(isExternal: isExternal)}/$id/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationActive({
    required String accessToken,
    required ProductFormulation productFormulation,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productFormulationPath(isExternal: isExternal)}/${productFormulation.id}/active',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationNonActive({
    required String accessToken,
    required int id,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productFormulationPath(isExternal: isExternal)}/$id/non-active',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationDelete({
    required String accessToken,
    required int id,
    required bool isExternal,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${productFormulationPath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductFormulationDetail>> productFormulationDetailFetch({
    required String accessToken,
    int? id,
    Material? material,
    bool? isActive,
    Product? product,
    ProductFormulationScale? scale,
    required bool isExternal,
  }) async {
    try {
      final path = id == null
          ? '${productFormulationPath(isExternal: isExternal)}/details'
          : '${productFormulationPath(isExternal: isExternal)}/$id/details';
      final response = await dio.get<Map<String, dynamic>>(
        queryParameters: {
          'material_id.eq': material?.id,
          'is_active.eq': isActive,
          'product_id.eq': product?.id,
          'scale.eq': scale?.productFormulationScale,
        },
        path,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <ProductFormulationDetail>[];
      final dynamic responseData = response.data!['data'];
      if (responseData is List) {
        for (final data in responseData) {
          lines.add(
            ProductFormulationDetail.fromJson(data as Map<String, dynamic>),
          );
        }
      } else if (responseData is Map<String, dynamic>) {
        lines.add(ProductFormulationDetail.fromJson(responseData));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationDetailCreate({
    required String accessToken,
    required int formulationId,
    required Material material,
    required double quantity,
    required String materialUnitId,
    required bool isExternal,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        productFormulationDetailPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'formulation_id': formulationId,
          'material_id': material.id,
          'quantity': quantity,
          // 'material_unit_id': materialUnitId,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationDetailUpdate({
    required int id,
    required String accessToken,
    required int formulationId,
    required Material material,
    required double quantity,
    required String materialUnitId,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${productFormulationDetailPath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'formulation_id': formulationId,
          'material_id': material.id,
          'quantity': quantity,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productFormulationDetailDelete({
    required String accessToken,
    required int id,
    required bool isExternal,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${productFormulationDetailPath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
