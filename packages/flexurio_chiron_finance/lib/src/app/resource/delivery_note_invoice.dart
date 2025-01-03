import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/delivery_note_invoice.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class DeliveryNoteInvoiceRepository extends Repository {
  DeliveryNoteInvoiceRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final deliveryNoteInvoicePath =
      '${Api.urlApi}/delivery-note-invoice-data-reports';

  static DeliveryNoteInvoiceRepository instance = DeliveryNoteInvoiceRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<DeliveryNoteInvoice>> fetch({
    required String accessToken,
    required PageOptions<DeliveryNoteInvoice> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        deliveryNoteInvoicePath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, DeliveryNoteInvoice.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
