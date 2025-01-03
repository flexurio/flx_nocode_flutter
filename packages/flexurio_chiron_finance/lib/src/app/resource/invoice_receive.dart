import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receipt.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class InvoiceReceiptRepository extends Repository {
  InvoiceReceiptRepository({required super.dio, required super.onUnauthorized});

  static final invoiceReceiptPath = '${Api.urlApi}/invoice-receipts';

  static InvoiceReceiptRepository instance = InvoiceReceiptRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<InvoiceReceipt>> fetch({
    required String accessToken,
    required String? taxInvoiceNumber,
    required PageOptions<InvoiceReceipt> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceReceiptPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, InvoiceReceipt.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
