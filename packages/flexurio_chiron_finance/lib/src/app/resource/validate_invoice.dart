import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/validate_invoice.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:xml/xml.dart';

class ValidateInvoiceRepository extends Repository {
  ValidateInvoiceRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static ValidateInvoiceRepository instance = ValidateInvoiceRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<ResValidateInvoicePm> fetch({
    required String accessToken,
    required String url,
  }) async {
    try {
      final link = Uri.encodeComponent(url);
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/e-invoice/$link',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final xml = XmlDocument.parse(
          (response.data!['data'] as Map<String, dynamic>)['data'] as String);
      final result = ResValidateInvoicePm.fromXml(xml.rootElement);
      return result;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
