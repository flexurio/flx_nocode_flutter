import 'dart:convert';

import 'package:flexurio_chiron_presence/src/app/model/presence.dart';
import 'package:flexurio_chiron_presence/src/app/model/presence_employee.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';

class PresenceRepository extends Repository {
  PresenceRepository({required super.dio, required super.onUnauthorized});

  static PresenceRepository instance = PresenceRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<Presence>> monthlyAllEmployeeFetch({
    required String accessToken,
    required int year,
    required int month,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/presences/monthly/1/$year-${month.toString().padLeft(2, '0')}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final presences = <Presence>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        presences.add(Presence.fromJson(data as Map<String, dynamic>));
      }

      return presences;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<PresenceEmployee>> monthlyPerEmployeeFetch({
    required String accessToken,
    required String nip,
    required DateTime dateTime,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/users/$nip/presence/${DateFormat('yyyy-MM').format(dateTime)}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final presences = <PresenceEmployee>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        presences.add(PresenceEmployee.fromJson(data as Map<String, dynamic>));
      }

      return presences;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<WorkHourShift>> shiftFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <WorkHourShift>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(WorkHourShift.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> shiftCreate({
    required String accessToken,
    required String name,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'start_period': periodStart.toUtc().toIso8601String(),
          'end_period': periodEnd.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> shiftUpdate({
    required String accessToken,
    required String name,
    required DateTime periodStart,
    required DateTime periodEnd,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'start_period': periodStart.toUtc().toIso8601String(),
          'end_period': periodEnd.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> shiftDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Work Hour
  Future<List<WorkHour>> workHourFetch({
    required String accessToken,
    required int shiftId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts/$shiftId/work-hours',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <WorkHour>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(WorkHour.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> workHourCreate({
    required String accessToken,
    required WorkHour workHour,
    required int shiftId,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts/$shiftId/work-hours',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'day': workHour.day.day,
          'start': workHour.start.toTime,
          'end': workHour.end.toTime,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> workHourEdit({
    required String accessToken,
    required WorkHour workHour,
    required int shiftId,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts/work-hours/${workHour.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'day': workHour.day.day,
          'start': workHour.start.toTime,
          'end': workHour.end.toTime,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> workHourDelete({
    required String accessToken,
    required WorkHour workHour,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/work-hour-shifts/work-hours/${workHour.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
