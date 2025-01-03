import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_stock_rupiah.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_stock_card_rupiah.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';

class MaterialStockRupiahRepository extends Repository {
  MaterialStockRupiahRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialStockRupiahPath = '${Api.urlApi}/report-rupiah-material-mutation';
  static final materialStockCardRupiahPath = '${Api.urlApi}/report-rupiah-material-stock-card-detail';

  static MaterialStockRupiahRepository instance = MaterialStockRupiahRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialStockRupiah>> fetch({
    required String accessToken,
    required PageOptions<MaterialStockRupiah> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockRupiahPath,
        queryParameters: {
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialStockRupiah.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialStockCardRupiah>> fetchCard({
    required String accessToken,
    required PageOptions<MaterialStockCardRupiah> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockCardRupiahPath,
        queryParameters: {
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
          'material_id.eq': material?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialStockCardRupiah.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
