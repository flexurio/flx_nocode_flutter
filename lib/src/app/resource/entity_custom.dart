import 'dart:convert';

import 'package:appointment/src/app/model/configuration.dart';
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

  Future<Response<T>> _request<T>({
    required String accessToken,
    required String path,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    final headers = {
      RequestHeader.authorization: 'Bearer $accessToken',
    };

    final url =
        path.replaceFirst('{backend_host}', Configuration.instance.backendHost);

    switch (method.toUpperCase()) {
      case 'GET':
        return dio.get<T>(
          url,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      case 'POST':
        return dio.post<T>(
          url,
          data: body != null ? jsonEncode(body) : null,
          options: Options(headers: headers),
        );
      case 'PUT':
        return dio.put<T>(
          url,
          data: body != null ? jsonEncode(body) : null,
          options: Options(headers: headers),
        );
      case 'DELETE':
        return dio.delete<T>(
          url,
          options: Options(headers: headers),
        );
      default:
        throw UnsupportedError('Unsupported HTTP method: $method');
    }
  }

  Future<PageOptions<Map<String, dynamic>>> fetch({
    required String accessToken,
    required PageOptions<Map<String, dynamic>> pageOptions,
    required String path,
    required String method,
  }) async {
    try {
      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path,
        method: method,
        queryParameters: pageOptions.toUrlQueryMap(),
      );

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

  Future<Map<String, dynamic>> fetchById({
    required String accessToken,
    required String path,
    required String method,
    required String id,
  }) async {
    try {
      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path.replaceFirst('{id}', id),
        method: method,
      );
      return (response.data!)['data'][0];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<Map<String, dynamic>> modify({
    required String accessToken,
    required String path,
    required String method,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _request<Map<String, dynamic>?>(
        accessToken: accessToken,
        path: path,
        method: method,
        body: data,
      );
      return response.data!;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
