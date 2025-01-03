import 'dart:convert';

import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_attachment.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_donation_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_history.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_malk_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_loan_requests_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_summary.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';

class SalesOrderRepository extends Repository {
  SalesOrderRepository({required super.dio, required super.onUnauthorized});

  static final pathSalesOrder = '${Api.urlApi}/sales-orders';

  static SalesOrderRepository instance = SalesOrderRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<SalesOrder>> salesOrderInitialFetch({
    required String accessToken,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? status,
    Customer? customer,
    SalesOrder? salesOrder,
    SalesOrder? revisionNo,
  }) async {
    try {
      status = status ?? '';
      final parsePeriodStart =
          periodStart != null ? DateFormat('yyyyMMdd').format(periodStart) : '';
      final parsePeriodEnd =
          periodEnd != null ? DateFormat('yyyyMMdd').format(periodEnd) : '';
      final finalCustomer = customer != null ? customer.id : '';
      final salesOrderId = salesOrder == null ? '' : salesOrder.id;
      final revision = revisionNo == null ? '' : revisionNo.revisionNo;
      final response = await dio.get<Map<String, dynamic>>(
        pathSalesOrder,
        queryParameters: {
          'status.eq': status,
          'start_date': parsePeriodStart,
          'end_date': parsePeriodEnd,
          'customer_id.eq': finalCustomer,
          'id.eq': salesOrderId,
          'revision_no': revision,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final salesOrders = <SalesOrder>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        salesOrders.add(SalesOrder.fromJson(data as Map<String, dynamic>));
      }

      return salesOrders;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<SalesOrder>> salesOrderFetch({
    required String accessToken,
    required PageOptions<SalesOrder> pageOptions,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? status,
    Customer? customer,
    SalesOrder? salesOrder,
    SalesOrder? revisionNo,
    String? orderTypeId,
  }) async {
    status = status ?? '';
    final parsePeriodStart =
        periodStart != null ? DateFormat('yyyyMMdd').format(periodStart) : '';
    final parsePeriodEnd =
        periodEnd != null ? DateFormat('yyyyMMdd').format(periodEnd) : '';
    final finalCustomer = customer != null ? customer.id : '';
    final salesOrderId = salesOrder == null ? '' : salesOrder.id;
    final revision = revisionNo == null ? '' : revisionNo.revisionNo;
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathSalesOrder,
        queryParameters: {
          'status.eq': status,
          'start_date': parsePeriodStart,
          'end_date': parsePeriodEnd,
          'customer_id.eq': finalCustomer,
          'id.eq': salesOrderId,
          'revision_no': revision,
          'order_type_id.eq': orderTypeId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, SalesOrder.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<SalesOrder> salesOrderFetchById({
    required String accessToken,
    required String id,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesOrder/${Uri.encodeComponent(id)}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return SalesOrder.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> salesOrderConfirm({
    required String accessToken,
    required SalesOrder salesOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$pathSalesOrder/$id/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> salesOrderUndoConfirm({
    required String accessToken,
    required SalesOrder salesOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$pathSalesOrder/$id/undo-confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> salesOrderDelete({
    required String accessToken,
    required SalesOrder salesOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      await dio.delete<Map<String, dynamic>>(
        '$pathSalesOrder/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SalesOrderDetail>> salesOrderDetailFetch({
    required String accessToken,
    required SalesOrder salesOrder,
    String? productId,
    String? batchId,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesOrder/$id/details',
        queryParameters: {
          'product_id.eq': productId,
          'batch_no_id.eq': batchId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <SalesOrderDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(SalesOrderDetail.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SalesOrderDetail>> salesOrderDetailFetchById({
    required String accessToken,
    required SalesOrderDetail salesOrderDetail,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesOrder/details/${salesOrderDetail.id}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <SalesOrderDetail>[];
      final data = response.data!['data'];

      lines.add(SalesOrderDetail.fromJson(data as Map<String, dynamic>));

      return lines;
    } catch (error, stack) {
      print(stack);
      throw checkErrorApi(error);
    }
  }

  Future<void> salesOrderDetailDelete({
    required String accessToken,
    required SalesOrderDetail salesOrderDetail,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathSalesOrder/details/${salesOrderDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SalesOrderAttachment>> salesOrderFetchDataFile({
    required String accessToken,
    required SalesOrder salesOrder,
    required int revisionNo,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesOrder/documents',
        queryParameters: {
          'revision_no.eq': revisionNo,
          'sales_order_id.like': salesOrder.id,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <SalesOrderAttachment>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(SalesOrderAttachment.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SalesOrderHistory>> salesOrderFetchHistoriesHeader({
    required String accessToken,
    required SalesOrder salesOrder,
    SalesOrderHistory? revisionNo,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      final revision = revisionNo == null ? '' : revisionNo.revisionNo;
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesOrder/$id/history',
        queryParameters: {
          'revision_no': revision,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <SalesOrderHistory>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(SalesOrderHistory.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SalesOrderDetail>> salesOrderFetchHistoryDetail({
    required String accessToken,
    required SalesOrder salesOrder,
    required SalesOrderHistory revisionNo,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesOrder/histories/$id/${revisionNo.revisionNo}/details',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <SalesOrderDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(
          SalesOrderDetail.fromJson(data as Map<String, dynamic>),
        );
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<int>> salesOrderFetchFile({
    required String accessToken,
    required SalesOrderAttachment attachment,
  }) async {
    try {
      final response = await dio.get<List<int>>(
        '$pathSalesOrder/documents/${attachment.document.replaceAll('file/documents/', '')}',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = response.data!;

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> uploadSalesOrder({
    required String accessToken,
    required SalesOrder salesOrder,
    required String description,
    required PlatformFile attachment,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      await dio.post<String>(
        '$pathSalesOrder/$id/documents',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          'document': MultipartFile.fromBytes(
            attachment.bytes!,
            filename: attachment.name,
          ),
          'description': description,
          'revision_no': salesOrder.revisionNo,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> salesOrderPrintInvoice({
    required String accessToken,
    required SalesOrder salesOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      final response = await dio.put<Map<String, dynamic>>(
        '$pathSalesOrder/$id/print-invoice',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return data['tax_invoice_no'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<SalesOrder> create({
    required String accessToken,
    String? deliveryAddress,
    required double bankFee,
    String? productRequestId,
    double? specialDiscountPercent,
    double? ppnPercent,
    double? pph22Percent,
    String? note,
    double? rate,
    String? customerId,
    String? currencyId,
    String? orderTypeId,
    String? departmentId,
    String? transactionTypeId,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        pathSalesOrder,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'delivery_address_id': deliveryAddress,
          'discount_percent': specialDiscountPercent,
          'ppn_percent': ppnPercent,
          'pph_22_percent': pph22Percent,
          'description': note,
          'additional_discount_type': '',
          'additional_discount_percent': 0,
          'special_discount_percent': 0,
          'is_toll_in': false,
          'bonus': false,
          'product_request_id': productRequestId,
          'bank_fee': bankFee,
          'rate': rate,
          'customer_id': customerId,
          'currency_id': currencyId,
          'order_type_id': orderTypeId,
          'department_id': departmentId,
          'transaction_type_id': transactionTypeId,
        }),
      );
      return SalesOrder.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> editAdditionalDiscount({
    required String accessToken,
    required String salesOrderId,
    required String type,
    required int termOfPayment,
    required double? discountPercent,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrderId);
      await dio.put<Map<String, dynamic>>(
        '$pathSalesOrder/$id/additional-discount',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'additional_discount_type': type,
          'term_of_payment': termOfPayment,
          'additional_discount_percent': discountPercent,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> updateSalesOrderDetail(
      {required String accessToken,
      required SalesOrderDetail salesOrderDetail,
      required String batchNo}) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathSalesOrder/details/${salesOrderDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'qty': salesOrderDetail.quantity,
          'discount_percent': salesOrderDetail.discountPercent,
          'qty_delivery': salesOrderDetail.qtyDelivery,
          'sales_order_id': salesOrderDetail.salesOrderId,
          'product_id': salesOrderDetail.productId,
          'batch_no_id': batchNo,
          'unit_id': salesOrderDetail.unitId,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> detailCreate({
    required String accessToken,
    required SalesOrder salesOrder,
    required int quantity,
    required int quantityDelivery,
    required String batchNoId,
    required String unitId,
    required String productId,
    required String warehouse,
    required double discountPercent,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      await dio.post<Map<String, dynamic>>(
        '$pathSalesOrder/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'qty': quantity,
          'discount_percent': discountPercent,
          'qty_delivery': quantityDelivery,
          'warehouse': warehouse,
          'sales_order_id': salesOrder.id,
          'product_id': productId,
          'batch_no_id': batchNoId,
          'unit_id': unitId,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> updateDeliveryOrder({
    required String accessToken,
    required SalesOrder salesOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(salesOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$pathSalesOrder/$id/print-delivery-order',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<SalesOrderSummary>> fetchSalesOrderSummary({
    required String accessToken,
    required PageOptions<SalesOrderSummary> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-sales-order-all-hna',
        queryParameters: {
          'sales_order_date.gte': startDate?.toUtc().toIso8601String(),
          'sales_order_date.lte': endDate?.toUtc().toIso8601String(),
          'department_id.eq': department?.id,
          'sales_order_id.in': 'SOW,SO6,SOA,SOF,SOQ',
          'transaction_type_id.eq': 'BS',
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, SalesOrderSummary.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<SalesOrderMalkSummary>> fetchSalesOrderMalkSummary({
    required String accessToken,
    required PageOptions<SalesOrderMalkSummary> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-distributor-sales-order-all-hna',
        queryParameters: {
          'report_warehouse_sales_outs.transaction_type_id.ne': 'BS',
          'report_warehouse_sales_outs.customer_id.eq': 'MALK',
          'sales_order_date.gte': startDate?.toUtc().toIso8601String(),
          'sales_order_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, SalesOrderMalkSummary.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<SalesOrderLoanRequestsSummary>>
      fetchSalesOrderLoanRequestsSummary({
    required String accessToken,
    required PageOptions<SalesOrderLoanRequestsSummary> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-distributor-sales-order-all-hna',
        queryParameters: {
          'report_warehouse_sales_outs.transaction_type_id.ne': 'BS',
          'report_warehouse_sales_outs.sales_order_id.in': 'SOF',
          'sales_order_date.gte': startDate?.toUtc().toIso8601String(),
          'sales_order_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, SalesOrderLoanRequestsSummary.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<SalesOrderDonationSummary>>
      fetchSalesOrderDonationSummary({
    required String accessToken,
    required PageOptions<SalesOrderDonationSummary> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-distributor-sales-order-all-hna',
        queryParameters: {
          'report_warehouse_sales_outs.transaction_type_id.ne': 'BS',
          'report_warehouse_sales_outs.sales_order_id.in': 'SOW,SOA',
          'sales_order_date.gte': startDate?.toUtc().toIso8601String(),
          'sales_order_date.lte': endDate?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, SalesOrderDonationSummary.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
