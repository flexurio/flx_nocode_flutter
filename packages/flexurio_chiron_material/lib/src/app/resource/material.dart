import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialRepositoryX extends Repository {
  MaterialRepositoryX({
    required super.dio,
    required super.onUnauthorized,
  });

  static get materialPath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/materials'
              : '${Api.urlApi}/materials';
  static MaterialRepositoryX instance = MaterialRepositoryX(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<Material>> materialFetch({
    required String accessToken,
    required PageOptions<Material> pageOptions,
    bool isExternal = false,
    String? materialGroupId,
    String? materialTypeId,
    bool? isActive,
    bool? isOrder,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'material_group_id.eq': materialGroupId,
        'material_type_id.eq': materialTypeId,
        'is_active.eq': isActive,
        'is_order.eq': isOrder,
      }..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        materialPath(isExternal: isExternal),
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, Material.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialCreate({
    required String accessToken,
    required MaterialUnit materialUnit,
    required MaterialUnit stockUnit,
    required MaterialGroup materialGroup,
    required String name,
    required String id,
    required bool isAsset,
    required int packSize,
    required MaterialType type,
    bool isExternal = false,
    required String companyId,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        materialPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'name': name,
          'is_asset': isAsset,
          'material_unit_id': materialUnit.id,
          'stock_unit_id': stockUnit.id,
          'material_group_id': materialGroup.id,
          'material_type_id': type.id,
          'pack_size': packSize,
          'is_order': true,
          'is_stock': true,
          'company': companyId
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialEdit({
    required String accessToken,
    required MaterialUnit materialUnitId,
    required MaterialGroup materialGroupId,
    required String name,
    required String idMaterial,
    required bool isAsset,
    required int packSize,
    required MaterialType type,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/$idMaterial',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'is_asset': isAsset,
          'material_unit_id': materialUnitId.id,
          'material_group_id': materialGroupId.id,
          'pack_size': packSize,
          'material_type_id': type.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDelete({
    required String accessToken,
    required String id,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.delete<Map<String, dynamic>>(
        '$path/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialActivate({
    required String accessToken,
    required String id,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/$id/activate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDeactivate({
    required String accessToken,
    required String id,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/$id/deactivate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialActivateIsStock({
    required String accessToken,
    required Material material,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/${material.id}/activate-is-stock',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDeactivateIsStock({
    required String accessToken,
    required Material material,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/${material.id}/deactivate-is-stock',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialActivateIsOrder({
    required String accessToken,
    required Material material,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/${material.id}/activate-is-order',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDeactivateIsOrder({
    required String accessToken,
    required Material material,
    bool isExternal = false,
  }) async {
    try {
      final path = materialPath(isExternal: isExternal);
      await dio.put<Map<String, dynamic>>(
        '$path/${material.id}/deactivate-is-order',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
