import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/medical_treatment_expense_department.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MedicalTreatmentExpenseDepartmentRepository extends Repository {
  MedicalTreatmentExpenseDepartmentRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final medicalTreatmentExpenseDepartmentPath =
      '${Api.urlApi}/recap-of-expenditures-per-department';

  static MedicalTreatmentExpenseDepartmentRepository instance =
      MedicalTreatmentExpenseDepartmentRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MedicalTreatmentExpenseDepartment>> fetch({
    required String accessToken,
    required PageOptions<MedicalTreatmentExpenseDepartment> pageOptions,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String departmentId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        medicalTreatmentExpenseDepartmentPath,
        queryParameters: {
          'date.gte': dateStart.toUtcIso(),
          'date.lte': dateEnd.toUtcIso(),
          'department_id.eq': departmentId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MedicalTreatmentExpenseDepartment.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
