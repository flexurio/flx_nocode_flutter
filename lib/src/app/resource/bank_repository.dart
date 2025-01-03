import 'package:flexurio_chiron_finance/src/app/model/bank.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class BankRepository extends Repository {
  BankRepository({required super.dio, required super.onUnauthorized});

  static final pathBank = '${Api.urlApi}/banks';

  static BankRepository instance = BankRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<Bank>> bankFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathBank,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <Bank>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(Bank.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
