import 'dart:convert';

import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';

class CompanyRepository extends Repository {
  CompanyRepository({required super.dio, required super.onUnauthorized});

  static final pathOffice = '${Api.urlApi}/offices';
  static const employeePath = '${Api.urlAuth}/users';
  static final departmentPath = '${Api.urlApi}/departments';
  static final departmentGroupPath = '$departmentPath/groups';
  static final departmentTypePath = '$departmentPath/types';
  static final userDepartmentPath = '${Api.urlApi}/users/departments';

  static CompanyRepository instance = CompanyRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Employee
  Future<List<Employee>> employeeFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        employeePath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final employees = <Employee>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        employees.add(Employee.fromJson(data as Map<String, dynamic>));
      }
      return employees;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Office
  Future<List<Office>> officeFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathOffice,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <Office>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(Office.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> officeCreate({
    required String accessToken,
    required String name,
    required String address,
    required String description,
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        pathOffice,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'address': address,
          'description': description,
          'latitude': latitude,
          'longitude': longitude,
          'name': name,
          'radius': radius,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> officeUpdate({
    required String accessToken,
    required int id,
    required String name,
    required String address,
    required String description,
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathOffice/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'address': address,
          'description': description,
          'latitude': latitude,
          'longitude': longitude,
          'name': name,
          'radius': radius,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> officeDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathOffice/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Office Employee
  Future<List<String>> officeEmployeeFetch({
    required String accessToken,
    required int officeId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/offices/$officeId/users',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final data = response.data!['data'] as List;

      return data
          .map(
            (e) => ((e as Map<String, dynamic>)['user_id'] as int).toString(),
          )
          .toList();
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> officeEmployeeCreate({
    required String accessToken,
    required int officeId,
    required String employeeId,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/offices/$officeId/users/$employeeId',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> officeEmployeeDelete({
    required String accessToken,
    required int officeId,
    required String employeeId,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/offices/$officeId/users/$employeeId',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Department
  Future<PageOptions<Department>> departmentFetch({
    required String accessToken,
    required PageOptions<Department> pageOptions,
    String? departmentType,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        departmentPath,
        queryParameters: {
          'department_type.eq': departmentType ?? '',
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, Department.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<Department>> departmentFetchById({
    required String accessToken,
    required PageOptions<Department> pageOptions,
    String? departmentId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        departmentPath,
        queryParameters: {
          'id.eq': departmentId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, Department.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> departmentCreate({
    required String accessToken,
    required String id,
    required String name,
    required DepartmentGroup group,
    required DepartmentType type,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        departmentPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'name': name,
          'email': 'x@metiska.co.id',
          'department_group_id': group.id,
          'department_type_id': type.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> departmentEdit({
    required String accessToken,
    required Department department,
    required String name,
    required DepartmentGroup group,
    required DepartmentType type,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$departmentPath/${department.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'email': 'x@metiska.co.id',
          'department_group_id': group.id,
          'department_type_id': type.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> departmentDelete({
    required String accessToken,
    required Department department,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$departmentPath/${department.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Department Group
  Future<List<DepartmentGroup>> departmentGroupFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        departmentGroupPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final departmentGroups = <DepartmentGroup>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        departmentGroups
            .add(DepartmentGroup.fromJson(data as Map<String, dynamic>));
      }

      return departmentGroups;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

// Department Type
  Future<List<DepartmentType>> departmentTypeFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        departmentTypePath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final departmentTypes = <DepartmentType>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        departmentTypes
            .add(DepartmentType.fromJson(data as Map<String, dynamic>));
      }

      return departmentTypes;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // User Department
  Future<List<Department>> userDepartment({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        userDepartmentPath,
        queryParameters: {
          'nip.eq': userId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final departments = <Department>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        departments.add(
          Department.fromJson(
            (data as Map<String, dynamic>)['department']
                as Map<String, dynamic>,
          ),
        );
      }
      return departments;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Department Employee
  Future<List<String>> departmentEmployeeFetch({
    required String accessToken,
    required Department department,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        userDepartmentPath,
        queryParameters: {
          'department_id.eq': department.id,
          'sort': 'name',
          'ascending': true,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final data = response.data!['data'] as List;

      return data
          .map(
            (e) => ((e as Map<String, dynamic>)['nip'] as int).toString(),
          )
          .toList();
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> departmentEmployeeCreate({
    required String accessToken,
    required Department department,
    required Employee employee,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        userDepartmentPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
        data: jsonEncode({
          'nip': int.parse(employee.nip),
          'department_id': department.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> departmentEmployeeDelete({
    required String accessToken,
    required Department department,
    required Employee employee,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/departments/${department.id}/users/${employee.nip}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
