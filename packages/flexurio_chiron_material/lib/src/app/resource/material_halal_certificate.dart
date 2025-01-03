import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material_halal_certificate.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialHalalCertificateRepository extends Repository {
  MaterialHalalCertificateRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialHalalCertificatePath =
      '${Api.urlApi}/certificate-halal-reports';

  static MaterialHalalCertificateRepository instance =
      MaterialHalalCertificateRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialHalalCertificate>> fetch({
    required String accessToken,
    required PageOptions<MaterialHalalCertificate> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialHalalCertificatePath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MaterialHalalCertificate.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
