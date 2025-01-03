import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_return_note.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class RecapProductReturnNoteRepository extends Repository {
  RecapProductReturnNoteRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final recapProductReturnNotePath =
      '${Api.urlApi}/recap-product-return-notes';

  static RecapProductReturnNoteRepository instance =
      RecapProductReturnNoteRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<RecapProductReturnNote>> recapProductReturnNoteFetch({
    required String accessToken,
    required PageOptions<RecapProductReturnNote> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    ProductReturn? productReturn,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapProductReturnNotePath,
        queryParameters: {
          'date.gte': periodStart.toUtc().toIso8601String(),
          'date.Lte': periodEnd.toUtc().toIso8601String(),
          'customer_id.eq': customer.id,
          'product_return_id.eq': productReturn?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, RecapProductReturnNote.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
