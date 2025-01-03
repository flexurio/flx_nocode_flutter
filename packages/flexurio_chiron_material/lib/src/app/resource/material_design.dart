import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';

class MaterialDesignRepository extends Repository {
  MaterialDesignRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialDesignPath = ({
    required bool isExternal,
  }) =>
      isExternal
          ? '${Api.urlApi}/external/material-designs/codes'
          : '${Api.urlApi}/material-designs/codes';

  static MaterialDesignRepository instance = MaterialDesignRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialDesign>> materialDesignFetch({
    required String accessToken,
    required PageOptions<MaterialDesign> pageOptions,
    bool? active,
    Material? material,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialDesignPath(isExternal: isExternal),
        queryParameters: {
          'is_lock.eq': active != null ? !active : null,
          'material_id.eq': material?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialDesign.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDesignCreate({
    required String accessToken,
    required Material material,
    required String id,
    required String outsource,
    required ProductFormulation productFormulation,
    required bool isExternal,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        materialDesignPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'design_code': id,
          'material_id': material.id,
          'formulation_id': productFormulation.id,
          'description': outsource,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDesignEdit({
    required String accessToken,
    required MaterialDesign materialDesign,
    required String description,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${materialDesignPath(isExternal: isExternal)}/${materialDesign.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'design_code': materialDesign.designCode,
          'description': description,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDesignUpdate({
    required String accessToken,
    required String designCode,
    required int materialDesignId,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${materialDesignPath(isExternal: isExternal)}/$materialDesignId',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'design_code': designCode,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDesignDelete({
    required String accessToken,
    required MaterialDesign materialDesign,
    required bool isExternal,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${materialDesignPath(isExternal: isExternal)}/${materialDesign.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDesignActivate({
    required String accessToken,
    required MaterialDesign materialDesign,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${materialDesignPath(isExternal: isExternal)}/${materialDesign.id}/enable',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialDesignDisable({
    required String accessToken,
    required MaterialDesign materialDesign,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${materialDesignPath(isExternal: isExternal)}/${materialDesign.id}/disable',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
