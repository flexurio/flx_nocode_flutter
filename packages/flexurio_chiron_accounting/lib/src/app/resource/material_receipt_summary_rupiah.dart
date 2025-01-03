import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_receipt_summary_rupiah.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_receipt_detail_summary_purchase_order.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';

class MaterialReceiptSummaryRupiahRepository extends Repository {
  MaterialReceiptSummaryRupiahRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialReceiptSummaryRupiahPath = '${Api.urlApi}/report-receipt-of-material';
  static final materialReceiptDetailSummaryByPurchaseOrderPath = '${Api.urlApi}/report-rupiah-material-receipt-detail';

  static MaterialReceiptSummaryRupiahRepository instance = MaterialReceiptSummaryRupiahRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<MaterialReceiptSummaryRupiah>> fetch({
    required String accessToken,
    required PageOptions<MaterialReceiptSummaryRupiah> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceiptSummaryRupiahPath,
        queryParameters: {
          'material_receive_date.gte': startDate?.toUtc().toIso8601String(),
          'material_receive_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialReceiptSummaryRupiah.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiptDetailSummaryPurchaseOrder>> fetchDetail({
    required String accessToken,
    required PageOptions<MaterialReceiptDetailSummaryPurchaseOrder> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    MaterialGroup? materialGroup,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceiptDetailSummaryByPurchaseOrderPath,
        queryParameters: {
          'material_receive_date.gte': startDate?.toUtc().toIso8601String(),
          'material_receive_date.lte': endDate?.toUtc().toIso8601String(),
          'material_group_id.eq': materialGroup?.id,
          'material_id.eq': material?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialReceiptDetailSummaryPurchaseOrder.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
