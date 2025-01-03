import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductRepositoryX extends Repository {
  ProductRepositoryX({
    required super.dio,
    required super.onUnauthorized,
  });

  static get productPath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/products'
              : '${Api.urlApi}/products';
  static ProductRepositoryX instance = ProductRepositoryX(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<Product>> productFetch({
    required String accessToken,
    required PageOptions<Product> pageOptions,
    ProductGroup? productGroup,
    bool? active,
    bool? isPhaseOut,
    Product? product,
    required bool isExternal,
  }) async {
    try {
      final pathProducts = product != null
          ? '${productPath(isExternal: isExternal)}/${product.id}'
          : productPath(isExternal: isExternal);
      final response = await dio.get<Map<String, dynamic>>(
        pathProducts,
        queryParameters: {
          'is_active.eq': active,
          'is_phased_out.eq': isPhaseOut,
          'product_group_id.eq': productGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, Product.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> productCreate({
    required String accessToken,
    required String id,
    required String no,
    required String name,
    required String type,
    required ProductGroup productGroup,
    required MaterialUnit unitPacking,
    required MaterialUnit unitSmallest,
    required MaterialUnit unitOrder,
    required MaterialUnit unitSecondary,
    required int expiryPeriod,
    required bool tollOut,
    required int quantityTablet,
    required int quantityStrip,
    required int quantityBatch,
    required int quantityPack,
    required DivisionType divisionType,
    required bool isExternal,
    required String companyId,
  }) async {
    try {
      final result = await dio.post<Map<String, dynamic>>(
        productPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'name': name,
          'product_no': no,
          'type': type,
          'quantity_pack': quantityPack,
          'quantity_batch': quantityBatch,
          'quantity_strip': quantityStrip,
          'quantity_tablet': quantityTablet,
          'division': divisionType.id,
          'mf_code': '',
          'tl_code': '',
          'is_toll_out': tollOut,
          'expiry_period': expiryPeriod,
          'unit_smallest_id': unitSmallest.id,
          'product_group_id': productGroup.id,
          'unit_packing_id': unitPacking.id,
          'unit_order_id': unitOrder.id,
          'unit_secondary_id': unitSecondary.id,
          'company': companyId,
        }),
      );

      return result.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> productUpdate({
    required String accessToken,
    required String id,
    required String no,
    required String name,
    required String type,
    required ProductGroup productGroup,
    required MaterialUnit unitPacking,
    required MaterialUnit unitSmallest,
    required MaterialUnit unitOrder,
    required MaterialUnit unitSecondary,
    required int expiryPeriod,
    required bool tollOut,
    required int quantityTablet,
    required int quantityStrip,
    required int quantityBatch,
    required int quantityPack,
    required DivisionType divisionType,
    required bool isExternal,
  }) async {
    try {
      final result = await dio.put<Map<String, dynamic>>(
        '${productPath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'product_no': no,
          'type': type,
          'quantity_pack': quantityPack,
          'quantity_batch': quantityBatch,
          'quantity_strip': quantityStrip,
          'quantity_tablet': quantityTablet,
          'division': divisionType.id,
          'mf_code': '',
          'tl_code': '',
          'is_toll_out': tollOut,
          'expiry_period': expiryPeriod,
          'unit_smallest_id': unitSmallest.id,
          'product_group_id': productGroup.id,
          'unit_packing_id': unitPacking.id,
          'unit_order_id': unitOrder.id,
          'unit_secondary_id': unitSecondary.id,
        }),
      );
      return result.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> productDelete({
    required String accessToken,
    required String id,
    required bool isExternal,
  }) async {
    try {
      final result = await dio.delete<Map<String, dynamic>>(
        '${productPath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return result.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
