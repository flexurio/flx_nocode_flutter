import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail_create.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PettyCashRepository extends Repository {
  PettyCashRepository({required super.dio, required super.onUnauthorized});

  static final pettyCashPath = '${Api.urlApi}/petty-cashes';

  static PettyCashRepository instance = PettyCashRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Petty Cash
  Future<PageOptions<PettyCash>> pettyCashFetch({
    required String accessToken,
    required PageOptions<PettyCash> pageOptions,
    PettyCashStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? approvedStartDate,
    DateTime? approvedEndDate,
    String? realizationNo,
    String? type,
  }) async {
    final formattedStartDate = startDate?.toUtcIso();
    final formattedEndDate =
        endDate?.add(const Duration(hours: 23, minutes: 59)).toUtcIso();
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pettyCashPath,
        queryParameters: {
          'status.eq': status?.id,
          'created_at.gte': formattedStartDate,
          'created_at.lte': formattedEndDate,
          'approve_finance_at.gte': approvedStartDate?.toUtcIso(),
          'approve_finance_at.lte': approvedEndDate?.endOfDay.toUtcIso(),
          'realization_no.eq': realizationNo,
          'type.eq': type,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, PettyCash.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PettyCash> pettyCashFetchById({
    required String accessToken,
    required String? id,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pettyCashPath/${Uri.encodeComponent(id!)}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final pettyCash =
          PettyCash.fromJson(response.data!['data'] as Map<String, dynamic>);
      return pettyCash;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PettyCash> pettyCashCreate({
    required String accessToken,
    required double amount,
    String? purchaseOrderId,
    String? vehicleRentId,
    String? description,
    required PettyCashType type,
  }) async {
    try {
      if (purchaseOrderId == null && vehicleRentId == null) {
        throw ApiException('Please provide purchase order or business trip');
      }

      final response = await dio.post<Map<String, dynamic>>(
        pettyCashPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'type': type.id,
          'purchase_order_id': purchaseOrderId,
          'business_trip_id': vehicleRentId,
          'description': description,
          'amount': amount,
        }),
      );

      final data = response.data!['data'] as Map<String, dynamic>;

      return PettyCash.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashRealization({
    required String accessToken,
    required String pettyCashId,
    required double ppn,
    required String supplierId,
    required double subtotal,
    required double pphAmount,
    required double discountAmount,
    required double shippingCost,
    required String recipient,
    required double rounding,
    required String? description,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCashId);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/realization',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'subtotal': subtotal,
          'supplier_id': supplierId,
          'ppn_percent': ppn,
          'pph': pphAmount,
          'shipping_cost': shippingCost,
          'discount': discountAmount,
          'recipient': recipient,
          'rounding': rounding,
          'description': description,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashClose({
    required String accessToken,
    required PettyCash pettyCash,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/close',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashApproveManager({
    required String accessToken,
    required PettyCash pettyCash,
    required String recipient,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/approve-manager',
        data: jsonEncode({'recipient': recipient}),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashRejectManager({
    required String accessToken,
    required PettyCash pettyCash,
    required String reason,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/reject-manager',
        data: jsonEncode({'reject_reason': reason}),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashApproveAccounting({
    required String accessToken,
    required PettyCash pettyCash,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/approve-accounting',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashRejectAccounting({
    required String accessToken,
    required PettyCash pettyCash,
    required String reason,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/reject-accounting',
        data: jsonEncode({'reject_reason': reason}),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashApproveFinance({
    required String accessToken,
    required PettyCash pettyCash,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/approve-finance',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashRejectFinance({
    required String accessToken,
    required PettyCash pettyCash,
    required String reason,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/reject-finance',
        data: jsonEncode({'reject_reason': reason}),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashDocumentReceive({
    required String accessToken,
    required PettyCash pettyCash,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCash.id);
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/$id/document-receive',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Petty Cash Detail
  Future<void> pettyCashDetailCreate({
    required String accessToken,
    required String pettyCashId,
    required List<PettyCashDetailCreate> data,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCashId);
      await dio.post<Map<String, dynamic>>(
        '$pettyCashPath/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(data.map((e) => e.toJson()).toList()),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<PettyCashDetail>> pettyCashDetailFetchByPettyCashId({
    required String accessToken,
    required String pettyCashId,
  }) async {
    try {
      final id = Uri.encodeComponent(pettyCashId);
      final response = await dio.get<Map<String, dynamic>>(
        '$pettyCashPath/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final data = response.data!['data'] as List;

      final pettyCashDetail = <PettyCashDetail>[];
      for (final data in data) {
        pettyCashDetail
            .add(PettyCashDetail.fromJson(data as Map<String, dynamic>));
      }
      return pettyCashDetail;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PettyCashDetail>> pettyCashDetailFetch({
    required String accessToken,
    required DateTime documentReceiveAtStart,
    required DateTime documentReceiveAtEnd,
    required PageOptions<PettyCashDetail> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pettyCashPath/details',
        queryParameters: {
          'type.eq': 'Petty Cash',
          'document_receive_at.gte': documentReceiveAtStart.toUtcIso(),
          'document_receive_at.lte': documentReceiveAtEnd.endOfDay.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, PettyCashDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> pettyCashDetailRealization({
    required String accessToken,
    required PettyCashDetail pettyCashDetail,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pettyCashPath/details/${pettyCashDetail.id}/realization',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'quantity': pettyCashDetail.quantity,
          'realization_price': pettyCashDetail.price,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
