import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_status_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_status_rupiah_quarantine.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';

class MaterialStatusRupiahRepository extends Repository {
  MaterialStatusRupiahRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialStatusRupiahPath = '${Api.urlApi}/report-rupiah-material-release-reject';
  static final materialStatusRupiahQuarantinePath = '${Api.urlApi}/report-rupiah-material-quarantine';

  static MaterialStatusRupiahRepository instance = MaterialStatusRupiahRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialStatusRupiah>> fetch({
    required String accessToken,
    required PageOptions<MaterialStatusRupiah> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStatusRupiahPath,
        queryParameters: {
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialStatusRupiah.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialStatusRupiahQuarantine>> fetchQuarantine({
    required String accessToken,
    required PageOptions<MaterialStatusRupiahQuarantine> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStatusRupiahQuarantinePath,
        queryParameters: {
          'transaction_date.gte': startDate?.toUtc().toIso8601String(),
          'transaction_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialStatusRupiahQuarantine.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}