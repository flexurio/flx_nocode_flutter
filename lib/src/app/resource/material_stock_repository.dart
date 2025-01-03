import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_fefo.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_fifo.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';

class MaterialStockRepository extends Repository {
  MaterialStockRepository({required super.dio, required super.onUnauthorized});

  static get materialStockPath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/material-stocks'
              : '${Api.urlApi}/material-stocks';

  static MaterialStockRepository instance = MaterialStockRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialStock>> materialStockFetch({
    required String accessToken,
    required PageOptions<MaterialStock> pageOptions,
    DateTime? period,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
    String? na,
    String? materialGroupIdIn,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockPath(isExternal: isExternal),
        queryParameters: {
          'period.eq':
              period != null ? DateFormat('yyyyMM').format(period) : null,
          'material_group_id.eq': materialGroup?.id,
          'material_id.eq': material?.id,
          'na.eq': na,
          'material_group_id.in': materialGroupIdIn,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialStock.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialStock>> materialStockFetchByMaterialId({
    required String accessToken,
    required PageOptions<MaterialStock> pageOptions,
    required DateTime period,
    required String materialId,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${materialStockPath(isExternal: isExternal)}/$materialId',
        queryParameters: {
          'period.eq':
              DateFormat('yyyyMM').format(period),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialStock.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialStockFefo> materialStockFefoFetch({
    required String accessToken,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/material-stocks/${material?.id}/fefo',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>;
      final materialStockFefo = MaterialStockFefo.fromJson(data);

      return materialStockFefo;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialStockFifo> materialStockFifoFetch({
    required String accessToken,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/material-stocks/${material?.id}/fifo',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>;
      final materialStockFifo = MaterialStockFifo.fromJson(data);

      return materialStockFifo;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
