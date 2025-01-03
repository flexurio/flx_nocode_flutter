import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_mutation_rupiah.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_mutation_loans_borrowings.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialMutationRupiahRepository extends Repository {
  MaterialMutationRupiahRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final reportSummaryOfMaterialMutationRupiahPath = '${Api.urlApi}/report-rupiah-material-mutation';
  static final materialMutationLoansBorrowingsPath = '${Api.urlApi}/report-rupiah-material-loan-mutation';

  static MaterialMutationRupiahRepository instance = MaterialMutationRupiahRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialMutationRupiah>> fetch({
    required String accessToken,
    required PageOptions<MaterialMutationRupiah> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        reportSummaryOfMaterialMutationRupiahPath,
        queryParameters: {
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialMutationRupiah.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialMutationLoansBorrowings>> fetchMutation({
    required String accessToken,
    required PageOptions<MaterialMutationLoansBorrowings> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialMutationLoansBorrowingsPath,
        queryParameters: {
          'date.gte': startDate?.toUtc().toIso8601String(),
          'date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
          'material_id.eq': material?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response, 
        MaterialMutationLoansBorrowings.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
