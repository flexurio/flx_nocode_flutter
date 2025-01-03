import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_loans_borrowings.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialLoansBorrowingsRepository extends Repository {
  MaterialLoansBorrowingsRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final reportDetailedSummaryOfMaterialLoansBorrowingsPath = '${Api.urlApi}/report-rupiah-borrowing-material';

  static MaterialLoansBorrowingsRepository instance = MaterialLoansBorrowingsRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialLoansBorrowings>> fetch({
    required String accessToken,
    required PageOptions<MaterialLoansBorrowings> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        reportDetailedSummaryOfMaterialLoansBorrowingsPath,
        queryParameters: { 
          'material_issue_date.gte': startDate?.toUtc().toIso8601String(),
          'material_issue_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialLoansBorrowings.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
