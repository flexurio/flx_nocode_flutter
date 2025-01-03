import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/invoice_discount.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class InvoiceDiscountRepository extends Repository {
  InvoiceDiscountRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final journalTransactionPath =
      '${Api.urlApi}/report-invoice-discount-value';

  static InvoiceDiscountRepository instance = InvoiceDiscountRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<InvoiceDiscount>> fetch({
    required String accessToken,
    required PageOptions<InvoiceDiscount> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        journalTransactionPath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, InvoiceDiscount.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
