import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialReceiveRepository extends Repository {
  MaterialReceiveRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialReceiveByStatusPath =
      '${Api.urlApi}/report-material-receive-by-status';
  static final materialReceiveByPoPath =
      '${Api.urlApi}/report-material-receive-by-po';
  static final materialReceiveByNonPath =
      '${Api.urlApi}/report-material-receive-by-non-po';
  static final materialReceiveByNaPath =
      '${Api.urlApi}/materials/receives/by-na';

  static get materialPath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/materials'
              : '${Api.urlApi}/materials';

  static get materialReceivePath => ({
        required bool isExternal,
      }) =>
          '${materialPath(isExternal: isExternal)}/receives';

  static MaterialReceiveRepository instance = MaterialReceiveRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialReceiveReport>> reportByStatus({
    required String accessToken,
    required PageOptions<MaterialReceiveReport> pageOptions,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceiveByStatusPath,
        queryParameters: {}..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialReceiveReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiveReport>> reportByNonPurchaseOrder({
    required String accessToken,
    required PageOptions<MaterialReceiveReport> pageOptions,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceiveByNonPath,
        queryParameters: {}..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialReceiveReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiveReport>> reportByPoPath({
    required String accessToken,
    required PageOptions<MaterialReceiveReport> pageOptions,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceiveByPoPath,
        queryParameters: {}..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialReceiveReport.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiveByNa>> materialReceiveByNaFetch(
      {required String accessToken,
      required PageOptions<MaterialReceiveByNa> pageOptions,
      String? materialStatusQc,
      String? materialGroupId,
      PurchaseOrder? purchaseOrder,}) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceiveByNaPath,
        queryParameters: {
          'material_status_qc.eq': materialStatusQc,
          'material_group_id.in': materialGroupId,
          'purchase_order_id.eq': purchaseOrder?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, MaterialReceiveByNa.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailReject({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required List<int> vatNo,
    required String reason,
    required String statusReject,
    required bool isExternal,
  }) async {
    try {
      final id = materialReceiveDetail.id;
      await dio.put<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/details/$id/reject',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'vat_no': vatNo,
          'severity_level': statusReject,
          'reject_reason': reason,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailRelease({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required List<int> vatNo,
    required bool isExternal,
    DateTime? retestDateQc,
  }) async {
    try {
      final id = materialReceiveDetail.id;

      final dataPut = <String, dynamic>{
        'vat_no': vatNo,
      };

      if (retestDateQc != null) {
        dataPut['retest_date_qc'] = retestDateQc.toUtc().toIso8601String();
      }

      await dio.put<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/details/$id/release',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(dataPut),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailRetest({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required List<int> vatNo,
    required DateTime retestDateQc,
    required bool isExternal,
  }) async {
    try {
      final id = materialReceiveDetail.id;
      await dio.put<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/details/$id/retest',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'vat_no': vatNo,
          'retest_date_qc': retestDateQc.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialReceiveDetail>> materialReceiveDetailFetchById({
    required String accessToken,
    required MaterialReceive materialReceive,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReceive.id);
      final response = await dio.get<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/$id/$id/details',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final receiveDetail = <MaterialReceiveDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        receiveDetail
            .add(MaterialReceiveDetail.fromJson(data as Map<String, dynamic>));
      }

      return receiveDetail;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDelete({
    required String accessToken,
    required MaterialReceive materialReceive,
    required bool isExternal,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReceive.id);
      await dio.delete<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveByNaDelete({
    required String accessToken,
    required MaterialReceive materialReceive,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReceive.id);
      await dio.delete<Map<String, dynamic>>(
        '$materialReceiveByNaPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailDelete({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required bool isExternal,
  }) async {
    try {
      final id = materialReceiveDetail.id;
      await dio.delete<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailReleaseX({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required bool isExternal,
  }) async {
    try {
      final id = materialReceiveDetail.id;
      await dio.put<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/details/$id/release',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailRejectX({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required bool isExternal,
  }) async {
    try {
      final id = materialReceiveDetail.id;
      await dio.put<Map<String, dynamic>>(
        '${materialReceivePath(isExternal: isExternal)}/details/$id/reject',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
