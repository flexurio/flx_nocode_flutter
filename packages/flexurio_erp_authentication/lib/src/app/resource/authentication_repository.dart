import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AuthenticationRepositoryApi extends Repository {
  AuthenticationRepositoryApi({
    required super.dio,
    required super.onUnauthorized,
  });

  static const pathLogin = '${Api.urlAuth}/users/login';
  static const pathVerifyCode = '${Api.urlAuth}/users/token_auth';
  static final rolesPath = '${Api.urlApi}/roles';
  static final rolePath = '${Api.urlApi}/role';

  static AuthenticationRepositoryApi instance = AuthenticationRepositoryApi(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<String> login({
    required String nip,
    required String password,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathLogin,
        options: Options(
          headers: {
            RequestHeader.authorization: getBasicAuthHeader(nip, password),
          },
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw ApiException.fromType(ExceptionType.invalidUsernamePassword);
      }

      return data['auth_at'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> verifyCode({
    required String authId,
    required String code,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathVerifyCode,
        options: Options(
          headers: {
            RequestHeader.authorization: getBasicAuthHeader(authId, code),
          },
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw ApiException.fromType(ExceptionType.invalidCredentials);
      }

      return data['access_token'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Role Permission
  Future<List<String>> rolePermissionFetch({
    required String accessToken,
    required Role role,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$rolesPath/${role.id}/permissions',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final roles = <String>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        roles.add((data as Map<String, dynamic>)['permission_id'] as String);
      }

      return roles;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> rolePermissionCreate({
    required String accessToken,
    required Role role,
    required String permission,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$rolesPath/${role.id}/permissions/$permission',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> rolePermissionDelete({
    required String accessToken,
    required Role role,
    required String permission,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$rolesPath/${role.id}/permissions/$permission',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Role
  Future<PageOptions<Role>> roleFetch({
    required String accessToken,
    required PageOptions<Role> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        rolePath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, Role.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleCreate({
    required String accessToken,
    required String description,
    required String name,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        rolesPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'description': description,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleUpdate({
    required String accessToken,
    required Role role,
    required String name,
    required String description,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$rolesPath/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'description': description,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleDelete({
    required String accessToken,
    required Role role,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$rolesPath/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Role Employee
  Future<List<Role>> employeeRoleFetch({
    required String accessToken,
    required String employeeId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/users/$employeeId/roles',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final roles = <Role>[];

      for (final data in response.data!['data'] as List) {
        final role = Role.fromJson(
          (data as Map<String, dynamic>)['role_id'] as Map<String, dynamic>,
        );
        roles.add(role);
      }

      return roles;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<String>> roleEmployeeFetch({
    required String accessToken,
    required Role role,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$rolesPath/${role.id}/users',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final employee = <String>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        employee
            .add(((data as Map<String, dynamic>)['user_id'] as int).toString());
      }

      return employee;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleEmployeeCreate({
    required String accessToken,
    required String userId,
    required Role role,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/users/$userId/roles/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleEmployeeDelete({
    required String accessToken,
    required String userId,
    required Role role,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/users/$userId/roles/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
