import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ScheduleRepository extends Repository {
  ScheduleRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static String schedulePath({required bool isExternal}) => isExternal
      ? '${Api.urlApi}/external/schedule-headers'
      : '${Api.urlApi}/schedule-headers';

  static String reportManHourProductionPath({required bool isExternal}) =>
      isExternal
          ? '${Api.urlApi}/external/report-man-hour-production'
          : '${Api.urlApi}/report-man-hour-production';

  static ScheduleRepository instance = ScheduleRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<Schedule>> scheduleFetch({
    required String accessToken,
    required PageOptions<Schedule> pageOptions,
    required bool isExternal,
  }) async {
    try {
      final queryParameters = <String, dynamic>{}
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        schedulePath(isExternal: isExternal),
        queryParameters: queryParameters,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, Schedule.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<Map<String, dynamic>>> scheduleCreate({
    required String accessToken,
    required DateTime startTime,
    required ProductionOrder productionOrder,
    required List<ProductionStageProcess> stageProcess,
    required Product product,
    required bool isExternal,
  }) async {
    try {
      final response = <Map<String, dynamic>>[];

      if (stageProcess.isEmpty) {
        final result = await dio.post<Map<String, dynamic>>(
          schedulePath(isExternal: isExternal),
          options: Options(
            headers: {RequestHeader.authorization: 'Bearer $accessToken'},
          ),
          data: jsonEncode({
            'start_time': startTime.toUtc().toIso8601String(),
            'production_order_id': productionOrder.id,
            'production_stage_process_id': '',
            'product_id': product.id,
            'unit_id': product.unitPacking.id,
            'is_toll': productionOrder.isTollIn,
          }),
        );
        response.add(Map<String, dynamic>.from(result.data!['data'] as Map));
      } else {
        for (final stageProcess in stageProcess) {
          final result = await dio.post<Map<String, dynamic>>(
            schedulePath(isExternal: isExternal),
            options: Options(
              headers: {RequestHeader.authorization: 'Bearer $accessToken'},
            ),
            data: jsonEncode({
              'start_time': startTime.toUtc().toIso8601String(),
              'production_order_id': productionOrder.id,
              'production_stage_process_id': stageProcess.id,
              'product_id': product.id,
              'unit_id': product.unitPacking.id,
              'is_toll': productionOrder.isTollIn,
            }),
          );
          response.add(Map<String, dynamic>.from(result.data!['data'] as Map));
        }
      }

      return response;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleCreateActual({
    required String accessToken,
    required int id,
    required DateTime actualStartTime,
    required DateTime actualEndTime,
    required String notes,
    required bool isExternal,
    WorkHourShift? workHourShift,
    String? qtyMan,
    String? yieldSchedule,
    ScheduleDetailStatus? status,
  }) async {
    try {
      print(yieldSchedule);
      print(
        double.parse(
          yieldSchedule != null ? yieldSchedule.replaceAll(',', '') : '0',
        ),
      );

      await dio.put<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/$id/actual',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: status == ScheduleDetailStatus.start
            ? jsonEncode({
                'actual_start_time': actualStartTime.toUtc().toIso8601String(),
                'work_hour_shift_id': workHourShift?.id,
              })
            : status == ScheduleDetailStatus.finish
                ? jsonEncode({
                    'quantity_man': int.parse(qtyMan ?? '0'),
                    'actual_end_time': actualEndTime.toUtc().toIso8601String(),
                    'Yield': double.parse(
                      yieldSchedule != null
                          ? yieldSchedule.replaceAll(',', '')
                          : '0',
                    ),
                    'Notes': notes == '' ? '' : notes,
                  })
                : status == null
                    ? jsonEncode({
                        'quantity_man': int.parse(qtyMan ?? '0'),
                        'actual_start_time':
                            actualStartTime.toUtc().toIso8601String(),
                        'actual_end_time':
                            actualEndTime.toUtc().toIso8601String(),
                        'Yield': double.parse(
                          yieldSchedule != null
                              ? yieldSchedule.replaceAll(',', '')
                              : '0',
                        ),
                        'Notes': notes == '' ? '' : notes,
                        'work_hour_shift_id': workHourShift?.id,
                      })
                    : null,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<Map<String, dynamic>>> scheduleEdit({
    required String accessToken,
    required DateTime startTime,
    required ProductionOrder productionOrder,
    required List<ProductionStageProcess> stageProcess,
    required Product product,
    required Schedule schedule,
    required bool isExternal,
  }) async {
    try {
      final responseDataList = <Map<String, dynamic>>[];

      for (final stageProcess in stageProcess) {
        final result = await dio.put<Map<String, dynamic>>(
          '${schedulePath(isExternal: isExternal)}/${schedule.id}',
          options: Options(
            headers: {RequestHeader.authorization: 'Bearer $accessToken'},
          ),
          data: jsonEncode({
            'start_time': startTime.toUtc().toIso8601String(),
            'production_order_id': productionOrder.id,
            'production_stage_process_id': stageProcess.id,
            'product_id': product.id,
            'unit_id': product.unitPacking.id,
            'is_toll': productionOrder.isTollIn,
          }),
        );
        responseDataList
            .add(Map<String, dynamic>.from(result.data!['data'] as Map));
      }

      return responseDataList;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleClose({
    required String accessToken,
    required Schedule schedule,
    required bool isExternal,
  }) async {
    final id = Uri.encodeComponent(schedule.id.toString());
    try {
      await dio.put<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/$id/close',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleDelete({
    required String accessToken,
    required Schedule schedule,
    required bool isExternal,
  }) async {
    try {
      final result = await dio.delete<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/${schedule.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return result.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Schedule Detail
  Future<List<ScheduleDetail>> scheduleDetailFetch({
    required String accessToken,
    required int id,
    required bool isExternal,
  }) async {
    try {
      final result = await dio.get<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final details = <ScheduleDetail>[];
      final data = result.data!['data'] as List;

      for (final data in data) {
        details.add(ScheduleDetail.fromJson(data as Map<String, dynamic>));
      }
      return details;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleDetailCreate({
    required String accessToken,
    required int id,
    required ScheduleDetailStatus status,
    required DateTime startTime,
    required int picId,
    required String remarks,
    required bool isExternal,
  }) async {
    try {
      final data = jsonEncode(
        {
          'status': status.id,
          'start_time': startTime.toUtc().toIso8601String(),
          'pic_id': picId,
          'Remarks': remarks,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );

      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleDetailEdit({
    required String accessToken,
    required int id,
    required ScheduleDetailStatus status,
    required DateTime startTime,
    required int picId,
    required String remarks,
    required bool isExternal,
  }) async {
    try {
      final data = jsonEncode(
        {
          'status': status.id,
          'start_time': startTime.toUtc().toIso8601String(),
          'pic_id': picId,
          'remarks': remarks,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );

      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleDetailValidate({
    required String accessToken,
    required ScheduleDetail scheduleDetail,
    required bool isExternal,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/details/${scheduleDetail.id}/valid',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> scheduleDetailDelete({
    required String accessToken,
    required int id,
    required bool isExternal,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${schedulePath(isExternal: isExternal)}/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ReportManHourProduction>> reportManHourProductionFetch({
    required String accessToken,
    required PageOptions<ReportManHourProduction> pageOptions,
    required Product? product,
    required DateTime? period,
    required String? batchNo,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        reportManHourProductionPath(isExternal: isExternal),
        queryParameters: {
          'period.eq': period?.toUtc().toIso8601String(),
          'batch_no.eq': batchNo,
          'product_id.eq': product?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ReportManHourProduction.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
