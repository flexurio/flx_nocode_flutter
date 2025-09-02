import 'package:dio/dio.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_cache.dart';

class EntityCustomRepository extends Repository {
  EntityCustomRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  /// Singleton instance
  static final EntityCustomRepository instance = EntityCustomRepository(
    dio: Api.dio,
    onUnauthorized: () {}, // You can replace with auth handler
  );

  /// Internal request handler
  Future<Response<T>> _request<T>({
    required String? accessToken,
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

    print('[EntityCustomRepository] $method $url');

    final options = Options(headers: headers);

    switch (method.toUpperCase()) {
      case 'GET':
        return dio.get<T>(
          url,
          queryParameters: queryParameters,
          options: options,
        );
      case 'POST':
        return dio.post<T>(
          url,
          data: body != null ? FormData.fromMap(body) : null,
          options: options,
        );
      case 'PUT':
        return dio.put<T>(
          url,
          data: body != null ? FormData.fromMap(body) : null,
          options: options,
        );
      case 'DELETE':
        return dio.delete<T>(
          url,
          options: options,
        );
      default:
        throw UnsupportedError('Unsupported HTTP method: $method');
    }
  }

  /// Fetch list data (with pagination + filtering)
  Future<PageOptions<Map<String, dynamic>>> fetch({
    required String? accessToken,
    required PageOptions<Map<String, dynamic>> pageOptions,
    required String path,
    required String method,
    required Map<String, dynamic> filterMap,
    int? cachedDurationSeconds,
  }) async {
    try {
      final cacheKey = EntityCustomCache.buildKey(
        url: path,
        method: method,
        filterMap: filterMap,
      );

      // 🔹 cek cache lebih dulu
      if (cachedDurationSeconds != null) {
        final cachedData = await EntityCustomCache.get(
          cacheKey,
          durationSeconds: cachedDurationSeconds,
        );
        if (cachedData != null) {
          final data = pageOptions.copyWith(
            data: cachedData,
            totalRows: cachedData.length,
          );
          return data;
        }
      }

      final queryParams = pageOptions.toUrlQueryMap()..addAll(filterMap);

      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path,
        method: method,
        queryParameters: queryParams,
      );

      final dataList =
          (response.data?['data'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      final total = response.data?['total_data'] as int? ?? dataList.length;

      final newPageOptions = pageOptions.copyWith(
        data: dataList,
        totalRows: total,
      );

      // 🔹 simpan ke cache setelah ambil dari API
      await EntityCustomCache.put(cacheKey, newPageOptions.data);

      return newPageOptions;
    } catch (error) {
      print('[EntityCustomRepository] fetch error: $error');
      throw checkErrorApi(error);
    }
  }

  /// Fetch single record by ID
  Future<Map<String, dynamic>> fetchById({
    required String? accessToken,
    required String path,
    required String method,
    required String id,
  }) async {
    try {
      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path.replaceFirst('{id}', id),
        method: method,
        queryParameters: PageOptions.empty().toUrlQueryMap(),
      );
      return (response.data?['data'] as List)
          .cast<Map<String, dynamic>>()
          .first;
    } catch (error) {
      print('[EntityCustomRepository] fetchById error: $error');
      throw checkErrorApi(error);
    }
  }

  /// Create or update a record
  Future<Map<String, dynamic>> modify({
    required String? accessToken,
    required String path,
    required String method,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path,
        method: method,
        body: data,
      );
      return response.data ?? {};
    } catch (error) {
      print('[EntityCustomRepository] modify error: $error');
      throw checkErrorApi(error);
    }
  }
}
