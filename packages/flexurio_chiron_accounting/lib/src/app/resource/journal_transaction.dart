import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_transaction.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class JournalTransactionRepository extends Repository {
  JournalTransactionRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final journalTransactionPath =
      '${Api.urlApi}/query-journal-transactions';

  static JournalTransactionRepository instance = JournalTransactionRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<JournalTransaction>> fetch({
    required String accessToken,
    required PageOptions<JournalTransaction> pageOptions,
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

      return pageOptions.setFromApi(response, JournalTransaction.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
