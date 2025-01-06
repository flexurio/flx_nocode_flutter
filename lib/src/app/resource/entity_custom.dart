import 'package:dio/dio.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EntityCustomRepository extends Repository {
  EntityCustomRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static EntityCustomRepository instance = EntityCustomRepository(
    dio: Api.dio,
    onUnauthorized: () {},
  );

  Future<PageOptions<Map>> fetch({
    required String accessToken,
    required PageOptions<Map> pageOptions,
    required String path,
    required String method,
  }) async {
    try {
      final headers = {
        RequestHeader.authorization: 'Bearer $accessToken',
      };

      Response<Map<String, dynamic>> response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await dio.get<Map<String, dynamic>>(
            path,
            queryParameters: pageOptions.toUrlQueryMap(),
            options: Options(headers: headers),
          );
          break;
        case 'POST':
          response = await dio.post<Map<String, dynamic>>(
            path,
            options: Options(headers: headers),
          );
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }

      var totalData = 0;
      if (response.data!.containsKey('total_data')) {
        totalData = response.data!['total_data'] as int;
      }

      return pageOptions.copyWith(
        data: (response.data!['data'] as List).cast(),
        totalRows: totalData,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
