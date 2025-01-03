import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/src/app/model/employee.dart';
import 'package:hive/hive.dart';

class EmployeeRepository {
  static late Box<Employee> box;
  static bool hasFetch = false;
  static Future<void> initialize() async {
    box = await Hive.openBox('employee');
  }

  static Future<Employee?> findById(String accessToken, String id) async {
    final employees = await fetch(accessToken);
    final index = employees.indexWhere((element) => element.nip == id);
    if (index > -1) {
      return employees[index];
    }
    return null;
  }

  static Future<List<Employee>> fetch(String accessToken) async {
    final employees = box.values.toList();

    if (!EmployeeRepository.hasFetch) {
      EmployeeRepository.hasFetch = true;

      Future<List<Employee>> fetchApi({
        required String accessToken,
      }) async {
        final response = await Dio().get<Map<String, dynamic>>(
          '${Api.urlAuth}/users',
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
        await box.clear();
        await box.addAll(employees);
        return employees;
      }

      if (employees.isEmpty) {
        return fetchApi(accessToken: accessToken);
      } else {
        unawaited(fetchApi(accessToken: accessToken));
        return employees;
      }
    }
    return employees;
  }
}
