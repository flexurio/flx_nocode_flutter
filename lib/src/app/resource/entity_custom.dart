import 'package:dio/dio.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_cache.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

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
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final combinedHeaders = {
      if (accessToken != null && accessToken != '')
        RequestHeader.authorization: 'Bearer $accessToken',
      ...?headers,
    };

    if (!combinedHeaders.containsKey(RequestHeader.authorization)) {
      combinedHeaders[RequestHeader.authorization] =
          'Bearer {{auth_token}}'.interpolateJavascript();
    }

    var url = path.interpolateJavascript();
    url = url.replaceAll('{backend_host}', Configuration.instance.backendHost);

    print('[EntityCustomRepository] $method $url');

    final options = Options(headers: combinedHeaders);

    print('[EntityCustomRepository] Headers: $combinedHeaders');
    if (queryParameters != null && queryParameters.isNotEmpty) {
      print('[EntityCustomRepository] Query Parameters: $queryParameters');
    }

    try {
      switch (method.toUpperCase()) {
        case 'GET':
          return await dio.get<T>(
            url,
            queryParameters: queryParameters,
            options: options,
          );
        case 'POST':
          return await dio.post<T>(
            url,
            data: body != null ? FormData.fromMap(body) : null,
            options: options,
          );
        case 'PUT':
          return await dio.put<T>(
            url,
            data: body != null ? FormData.fromMap(body) : null,
            options: options,
          );
        case 'DELETE':
          return await dio.delete<T>(
            url,
            options: options,
          );
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }
    } catch (e) {
      if (e is DioException) {
        print('[EntityCustomRepository] Request Error: ${e.message}');
        if (e.response != null) {
          print(
              '[EntityCustomRepository] Response Status: ${e.response?.statusCode}');
          print('[EntityCustomRepository] Response Data: ${e.response?.data}');
        }
      }
      rethrow;
    }
  }

  /// Fetch list data (with pagination + filtering)
  Future<PageOptions<Map<String, dynamic>>> fetch({
    required String? accessToken,
    required PageOptions<Map<String, dynamic>> pageOptions,
    required String path,
    required String method,
    required Map<String, dynamic> filterMap,
    Map<String, String>? headers,
    int? cachedDurationSeconds,
    bool mockEnabled = false,
    Object? mockData,
  }) async {
    try {
      if (mockEnabled) {
        print('──────────────────────────────────────────────────');
        print('[EntityCustomRepository] 🎭 MOCK FETCH REQUEST');
        print('📂 Path   : $path');
        print('──────────────────────────────────────────────────');
        final dataList = (mockData is List)
            ? mockData.cast<Map<String, dynamic>>()
            : (mockData is Map && mockData.containsKey('data'))
                ? (mockData['data'] as List).cast<Map<String, dynamic>>()
                : <Map<String, dynamic>>[];
        final total = (mockData is Map && mockData.containsKey('total_data'))
            ? mockData['total_data'] as int
            : dataList.length;

        return pageOptions.copyWith(
          data: dataList,
          totalRows: total,
        );
      }
      print('──────────────────────────────────────────────────');
      print('[EntityCustomRepository] 🔍 FETCH REQUEST');
      print('📂 Path   : $path');
      print('🛠 Method : $method');
      if (filterMap.isNotEmpty) print('🔬 Filter : $filterMap');
      if (headers != null && headers.isNotEmpty) print('📋 Headers: $headers');
      print('──────────────────────────────────────────────────');
      final cacheKey = EntityCustomCache.buildKey(
        url: path,
        method: method,
        filterMap: filterMap,
      );

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
        headers: headers,
        queryParameters: queryParams,
      );

      final dataList =
          (response.data?['data'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      final total = response.data?['total_data'] as int? ?? dataList.length;

      final newPageOptions = pageOptions.copyWith(
        data: dataList,
        totalRows: total,
      );

      if (cachedDurationSeconds != null) {
        await EntityCustomCache.put(cacheKey, newPageOptions.data);
      }
      return newPageOptions;
    } catch (error) {
      print('❌ [EntityCustomRepository] FETCH ERROR');
      print('   $error');
      print('──────────────────────────────────────────────────');
      throw checkErrorApi(error);
    }
  }

  /// Fetch single record by ID
  Future<Map<String, dynamic>> fetchById({
    required String? accessToken,
    required String path,
    required String method,
    required String id,
    Map<String, String>? headers,
    bool mockEnabled = false,
    Object? mockData,
  }) async {
    try {
      if (mockEnabled) {
        print('──────────────────────────────────────────────────');
        print('[EntityCustomRepository] 🎭 MOCK FETCH BY ID REQUEST');
        print('📂 Path   : $path');
        print('──────────────────────────────────────────────────');
        if (mockData is List) {
          return mockData.cast<Map<String, dynamic>>().first;
        } else if (mockData is Map) {
          if (mockData.containsKey('data')) {
            final list =
                (mockData['data'] as List).cast<Map<String, dynamic>>();
            return list.first;
          }
          return mockData as Map<String, dynamic>;
        }
        return {};
      }
      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path.replaceFirst('{id}', id),
        method: method,
        headers: headers,
        queryParameters: PageOptions.empty().toUrlQueryMap(),
      );
      return (response.data?['data'] as List)
          .cast<Map<String, dynamic>>()
          .first;
    } catch (error) {
      print('❌ [EntityCustomRepository] FETCH BY ID ERROR');
      print('   $error');
      print('──────────────────────────────────────────────────');
      throw checkErrorApi(error);
    }
  }

  /// Create or update a record
  Future<Map<String, dynamic>> modify({
    required String? accessToken,
    required String path,
    required String method,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
    bool mockEnabled = false,
    Object? mockData,
  }) async {
    try {
      if (mockEnabled) {
        print('──────────────────────────────────────────────────');
        print('[EntityCustomRepository] 🎭 MOCK MODIFY REQUEST');
        print('📂 Path  : $path');
        print('──────────────────────────────────────────────────');
        return (mockData as Map<String, dynamic>?) ?? {};
      }
      if (data != null) {
        print('──────────────────────────────────────────────────');
        print('[EntityCustomRepository] 🆕 MODIFY REQUEST');
        print('📂 Path  : $path');
        print('🛠 Method: $method');
        print('📦 Body  :');
        data.forEach((key, value) {
          print('   👉 $key: $value');
        });
        print('──────────────────────────────────────────────────');
      }

      final response = await _request<Map<String, dynamic>>(
        accessToken: accessToken,
        path: path,
        method: method,
        headers: headers,
        body: data,
      );
      return response.data ?? {};
    } catch (error) {
      print('❌ [EntityCustomRepository] MODIFY ERROR');
      print('   $error');
      print('──────────────────────────────────────────────────');
      throw checkErrorApi(error);
    }
  }
}
