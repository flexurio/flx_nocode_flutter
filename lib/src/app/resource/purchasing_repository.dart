import 'dart:convert';

import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_outstanding.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_outstanding_product.dart';

class PurchasingRepository extends Repository {
  PurchasingRepository({required super.dio, required super.onUnauthorized});
  static final supplierPath = '${Api.urlApi}/suppliers';
  static final vendorPath = '${Api.urlApi}/vendors';
  static final purchaseOrderPath = '${Api.urlApi}/purchase-orders';
  static final pathProductRequest = '${Api.urlApi}/product-requests';
  static final pathOrderType = '${Api.urlApi}/product-requests';
  static final invoiceReceivePath = '${Api.urlApi}/purchase-order-invoices';
  static final invoiceReceiveByIdPath = '${Api.urlApi}/purchase-order-invoice';
  static final pathSalesDiscounts = '${Api.urlApi}/sales-discounts';
  static final fuelsPath = '${Api.urlApi}/fuels';
  static final fuelsCurrentPeriodPath = '${Api.urlApi}/fuel_groups';
  static final vehiclesPath = '${Api.urlApi}/vehicles';
  static final vehicleRentPath = '${Api.urlApi}/business_trips';
  static final vehicleRentByIdPath = '${Api.urlApi}/business_trip';
  static final vehicleRentApproveManagerPath =
      '${Api.urlApi}/business_trip_approve_manager';
  static final vehicleRentRejectManagerPath =
      '${Api.urlApi}/business_trip_reject_manager';
  static final vehicleRentApproveCSPath =
      '${Api.urlApi}/business_trip_approve_cs';
  static final vehicleRentRejectCSPath =
      '${Api.urlApi}/business_trip_reject_cs';
  static final vehicleRentActualStartPath =
      '${Api.urlApi}/business_actual_start';
  static final vehicleRentActualEndPath = '${Api.urlApi}/business_actual_end';

  static PurchasingRepository instance = PurchasingRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Invoice Receive
  Future<PageOptions<InvoiceReceive>> invoiceReceiveFetch({
    required String accessToken,
    required PageOptions<InvoiceReceive> pageOptions,
    DateTime? createdAtStart,
    DateTime? createdAtEnd,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceReceivePath,
        queryParameters: {
          'created_at.gte': createdAtStart?.toUtcIso(),
          'created_at.lte': createdAtEnd?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, InvoiceReceive.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<InvoiceReceive> invoiceReceiveFetchById({
    required String accessToken,
    required String? id,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$invoiceReceiveByIdPath/${Uri.encodeComponent(id!)}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final invoiceReceive = InvoiceReceive.fromJson(
          response.data!['data'] as Map<String, dynamic>);
      return invoiceReceive;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<InvoiceReceive> invoiceReceiveCreate({
    required String accessToken,
    required String invoiceNo,
    required PurchaseOrder purchaseOrder,
    required Supplier supplier,
    required double rate,
    required DateTime invoiceDate,
    required String deliveryOrderId,
    required DateTime deliveryOrderDate,
    required String taxInvoiceNo,
    required DateTime taxInvoiceDate,
    required double subtotal,
    required Ppn ppn,
    required TaxType taxType,
    required double total,
    required int termOfPayment,
    required DateTime dueDate,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        invoiceReceivePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'invoice_no': invoiceNo,
          'order_id': purchaseOrder.id,
          'supplier_id': supplier.id,
          'rate': rate,
          'invoice_date': invoiceDate.toUtc().toIso8601String(),
          'delivery_order_id': deliveryOrderId,
          'delivery_order_date': deliveryOrderDate.toUtc().toIso8601String(),
          'tax_invoice_no': taxInvoiceNo,
          'tax_invoice_date': taxInvoiceDate.toUtc().toIso8601String(),
          'subtotal': subtotal,
          'ppn': ppn.id,
          'pph': taxType.taxPercent,
          'total': total,
          'term_of_payment': termOfPayment,
          'due_date': dueDate.toUtc().toIso8601String(),
        }),
      );

      final data = response.data!['data'] as Map<String, dynamic>;
      return InvoiceReceive.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> invoiceReceiveEdit({
    required String accessToken,
    required InvoiceReceive invoiceReceive,
    required double subtotal,
    required Ppn ppn,
    required TaxType taxType,
    required double total,
    required int termOfPayment,
    required DateTime dueDate,
  }) async {
    try {
      final id = Uri.encodeComponent(invoiceReceive.id);
      await dio.put<Map<String, dynamic>>(
        '$invoiceReceivePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'subtotal': subtotal,
          'ppn': ppn.id,
          'pph': taxType.taxPercent,
          'total': total,
          'term_of_payment': termOfPayment,
          'due_date': dueDate.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> invoiceReceiveDelete({
    required String accessToken,
    required InvoiceReceive invoiceReceive,
  }) async {
    try {
      final id = Uri.encodeComponent(invoiceReceive.id);
      await dio.delete<Map<String, dynamic>>(
        '$invoiceReceivePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<InvoiceReceiveDetail>> invoiceReceiveDetailFetch({
    required String accessToken,
    required PageOptions<InvoiceReceiveDetail> pageOptions,
    required String invoiceId,
  }) async {
    try {
      final id = Uri.encodeComponent(invoiceId);
      final response = await dio.get<Map<String, dynamic>>(
        '$invoiceReceivePath/$id/details',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, InvoiceReceiveDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> invoiceReceiveDetailCreate({
    required String accessToken,
    required InvoiceReceive invoiceReceive,
    required String? unitId,
    required String? materialId,
    required String? productId,
    required double qtyInvoice,
    required double price,
    required double total,
  }) async {
    try {
      final data = jsonEncode({
        'purchase_order_invoice_id': invoiceReceive.id,
        'unit_id': unitId,
        'material_id': materialId,
        'product_id': productId,
        'quantity_invoice': qtyInvoice,
        'price': price,
        'total': total,
      });
      final response = await dio.post<Map<String, dynamic>>(
        '$invoiceReceivePath/details',
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

  Future<void> invoiceReceiveDetailDelete({
    required String accessToken,
    required InvoiceReceiveDetail invoiceReceiveDetail,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$invoiceReceivePath/details/${invoiceReceiveDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> invoiceReceiveConfirmFinance({
    required String accessToken,
    required InvoiceReceive invoiceReceive,
  }) async {
    try {
      final id = Uri.encodeComponent(invoiceReceive.deliveryOrderId);
      await dio.put<Map<String, dynamic>>(
        '$invoiceReceivePath/$id/confirm-finance',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> invoiceReceiveApproveHeadAccounting({
    required String accessToken,
    required InvoiceReceive invoiceReceive,
  }) async {
    try {
      final id = Uri.encodeComponent(invoiceReceive.deliveryOrderId);
      await dio.put<Map<String, dynamic>>(
        '$invoiceReceivePath/$id/approve-head-accounting',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Invoice Receive Document
  Future<void> invoiceReceiveUploadDocument({
    required String accessToken,
    required PlatformFile file,
    required InvoiceReceive invoiceReceive,
    required String description,
    required String name,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$invoiceReceivePath/documents',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          'purchase_order_id': invoiceReceive.purchaseOrder.id,
          'purchase_order_invoice_id': invoiceReceive.id,
          'name': name,
          'description': description,
          'document': MultipartFile.fromBytes(
            file.bytes!,
            filename: file.name,
          ),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<InvoiceReceiveDocument?> invoiceReceiveDocumentFetch({
    required String accessToken,
    required InvoiceReceive invoiceReceive,
  }) async {
    try {
      final id = Uri.encodeComponent(invoiceReceive.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$invoiceReceivePath/$id/documents',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>?;
      if (data == null) {
        return null;
      }
      return InvoiceReceiveDocument.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> invoiceReceiveDocumentDelete({
    required String accessToken,
    required InvoiceReceiveDocument invoiceReceiveDocument,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$invoiceReceivePath/documents/${invoiceReceiveDocument.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<int>?> invoiceReceiveDocumentFetchBytes({
    required String accessToken,
    required String purchaseOrderId,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrderId);
      final response = await dio.get<List<int>>(
        '$invoiceReceivePath/$id/documents/views',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
          responseType: ResponseType.bytes,
        ),
      );
      return response.data;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Product Request
  Future<void> productRequestCancelConfirm({
    required String accessToken,
    required ProductRequestFormPurchaseOrder productRequest,
  }) async {
    final enCodeId = Uri.encodeComponent(productRequest.id!);
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProductRequest/$enCodeId/undo-confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productRequestConfirm({
    required String accessToken,
    required ProductRequestFormPurchaseOrder productRequest,
  }) async {
    final enCodeId = Uri.encodeComponent(productRequest.id!);
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProductRequest/$enCodeId/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductRequest> productRequestCreate({
    required String accessToken,
    required double rate,
    required int termOfPayment,
    required String typeProduct,
    required String purchaseOrderDistributor,
    required double discountPercent,
    required double ppnPercent,
    required double pph22Percent,
    required String description,
    required TransactionType transactionType,
    required TransactionType orderType,
    required Department department,
    required Customer customer,
    required Currency currency,
    required Customer address,
    required double bankFee,
    required DateTime purchaseOrderDate,
    required DateTime receiveDate,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        pathProductRequest,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'rate': rate,
          'purchase_order_distributor_date': purchaseOrderDate.toUtcIso(),
          'purchase_order_distributor_date_receive': receiveDate.toUtcIso(),
          'term_of_payment': termOfPayment,
          'type_product': typeProduct,
          'purchase_order_distributor': purchaseOrderDistributor,
          'discount_percent': discountPercent,
          'ppn_percent': ppnPercent,
          'pph_22_percent': pph22Percent,
          'description': description,
          'transaction_type_id': transactionType.id,
          'order_type_id': orderType.id,
          'department_id': department.id,
          'customer_id': customer.id,
          'currency_id': currency.id,
          'delivery_address_id': address.id,
          'bank_fee': bankFee,
        }),
      );

      return ProductRequest.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Sales Discount
  Future<List<SalesDiscount>> salesDiscountFetch({
    required String accessToken,
    Customer? customer,
    String? period,
  }) async {
    try {
      final customerId = customer!.id;
      period = period ?? '';
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSalesDiscounts?customer_id.eq=$customerId&date_now=$period',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final salesDiscount = <SalesDiscount>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        salesDiscount.add(SalesDiscount.fromJson(data as Map<String, dynamic>));
      }

      return salesDiscount;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productRequestDelete({
    required String accessToken,
    required ProductRequest productRequest,
  }) async {
    try {
      final id = Uri.encodeComponent(productRequest.id);
      await dio.delete<Map<String, dynamic>>(
        '$pathProductRequest/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productRequestDetailCreate({
    required String accessToken,
    required String productRequestId,
    required ProductRequestDetail productRequestDetail,
    required double discountPrice,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$pathProductRequest/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'quantity': productRequestDetail.quantity,
          'price': productRequestDetail.price,
          'discount_percent': discountPrice,
          'product_price': productRequestDetail.productPrice,
          'product_request_id': productRequestId,
          'product_id': productRequestDetail.product!.id,
          'unit': productRequestDetail.unit,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productRequestDetailDelete({
    required String accessToken,
    required ProductRequestDetail productRequestDetail,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathProductRequest/details/${productRequestDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductRequestDetail>> productRequestDetailFetch({
    required String accessToken,
    required ProductRequest productRequest,
  }) async {
    try {
      final id = Uri.encodeComponent(productRequest.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductRequest/$id/details',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final productRequestDetails = <ProductRequestDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productRequestDetails
            .add(ProductRequestDetail.fromJson(data as Map<String, dynamic>));
      }

      return productRequestDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productRequestDetailUpdate({
    required String accessToken,
    required ProductRequestFormPurchaseOrder productRequest,
    required ProductRequestDetail productRequestDetail,
  }) async {
    try {
      final id = Uri.encodeComponent(productRequestDetail.id.toString());
      await dio.put<Map<String, dynamic>>(
        '$pathProductRequest/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'quantity_remaining': productRequestDetail.quantity,
          'quantity': productRequestDetail.quantity,
          'price': productRequestDetail.price,
          'discount_percent': productRequestDetail.discountValue,
          'product_price': productRequestDetail.productPrice,
          'product_request_id': productRequest.id,
          'product_id': productRequestDetail.product!.id,
          'unit': productRequestDetail.unit,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductRequest>> productRequestFetch({
    required String accessToken,
    required PageOptions<ProductRequest> pageOptions,
    String? purchaseOrderDistributorId,
    String? status,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathProductRequest,
        queryParameters: {
          'purchase_order_distributor.eq': purchaseOrderDistributorId,
          'status.eq': status,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductRequest.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductRequest> productRequestFetchById({
    required String accessToken,
    required ProductRequestFormPurchaseOrder productRequest,
  }) async {
    try {
      final id = Uri.encodeComponent(productRequest.id!);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductRequest/$id',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return ProductRequest.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductRequest> productRequestUpdate({
    required String accessToken,
    required ProductRequest productRequest,
    required ProductRequestFormPurchaseOrder purchaseOrderForm,
  }) async {
    try {
      final id = Uri.encodeComponent(productRequest.id);
      final response = await dio.put<Map<String, dynamic>>(
        '$pathProductRequest/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'rate': productRequest.rate,
          'term_of_payment': productRequest.termOfPayment,
          'type_product': productRequest.typeProduct,
          'purchase_order_distributor': productRequest.purchaseOrderDistributor,
          'discount_percent': productRequest.discountPercent,
          'ppn_percent': productRequest.ppnPercent,
          'pph_22_percent': productRequest.pph22Percent,
          'description': productRequest.description,
          'transaction_type_id': productRequest.transactionType.id,
          'order_type_id': productRequest.orderType.id,
          'department_id': productRequest.department.id,
          'customer_id': productRequest.customer.id,
          'currency_id': productRequest.currency.id,
          'delivery_address_id': productRequest.deliveryAddress.id,
          'bank_fee': productRequest.bankFee,
        }),
      );

      return ProductRequest.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Purchase Order
  Future<PageOptions<PurchaseOrder>> purchaseOrderFetch({
    required String accessToken,
    required PageOptions<PurchaseOrder> pageOptions,
    List<PurchaseOrderStatus>? status,
    List<String>? materialGroupId,
    MaterialRequest? materialRequest,
    PurchaseOrderPaymentType? paymentType,
    double? downPaymentGreaterThan,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'material_group_id.in': materialGroupId?.join(','),
        'material_request_id.eq': materialRequest?.id,
        'status.in': status?.map((e) => e.id).join(','),
        'payment_type.eq': paymentType?.id,
        'dp_percent.gt': downPaymentGreaterThan,
      }..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        purchaseOrderPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, PurchaseOrder.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PurchaseOrder> purchaseOrderFetchById({
    required String accessToken,
    String? purchaseOrderId,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrderId!);
      final response = await dio.get<Map<String, dynamic>>(
        '$purchaseOrderPath/$id',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>;

      return PurchaseOrder.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderConfirm({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderConfirmAccounting({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/confirm-accounting',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderConfirmClose({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/close',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderUploadDocument({
    required String accessToken,
    required PlatformFile file,
    required PurchaseOrder purchaseOrder,
    required String description,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.post<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/documents',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          'revision_no': purchaseOrder.revisionNo,
          'description': description,
          'document_purchase_order': MultipartFile.fromBytes(
            file.bytes!,
            filename: file.name,
          ),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PurchaseOrder> purchaseOrderCreate({
    required String accessToken,
    required MaterialRequest materialRequest,
    required Currency currency,
    required String quotationNo,
    required double discountPercent,
    required TaxType taxType,
    required Ppn ppn,
    required double downPaymentPercent,
    required int termOfPayment,
    required String description,
    required PurchaseOrderPaymentType paymentType,
    required DateTime deliveryDate,
    required Department department,
    Supplier? supplier,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        purchaseOrderPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'material_request_id': materialRequest.id,
          'department_id': department.id,
          'supplier_id': supplier?.id,
          'currency_id': currency.id,
          'quotation_no': quotationNo,
          'discount_percent': discountPercent,
          'tax_type': taxType.label,
          'ppn_percent': ppn.id,
          'dp_percent': downPaymentPercent,
          'term_of_payment': termOfPayment,
          'description': description,
          'delivery_date': deliveryDate.toUtc().toIso8601String(),
          'is_stock': true,
          'payment_type': paymentType.id,
        }),
      );

      return PurchaseOrder.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDelete({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.delete<Map<String, dynamic>>(
        '$purchaseOrderPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Purchase Order Document
  Future<List<PurchaseOrderDocument>> purchaseOrderDocumentFetch({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
    required int revisionNo,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/documents',
        queryParameters: {
          'revision_no.eq': revisionNo,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final purchaseOrderDocuments = <PurchaseOrderDocument>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        purchaseOrderDocuments
            .add(PurchaseOrderDocument.fromJson(data as Map<String, dynamic>));
      }

      return purchaseOrderDocuments;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<int>?> purchaseOrderDocumentFetchBytes({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
    required PurchaseOrderDocument purchaseOrderDocument,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      final response = await dio.get<List<int>>(
        '$purchaseOrderPath/$id/documents/${purchaseOrderDocument.documentPath.split('/').last}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
          responseType: ResponseType.bytes,
        ),
      );
      return response.data;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDocumentDelete({
    required String accessToken,
    required PurchaseOrderDocument purchaseOrderDocument,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$purchaseOrderPath/documents/${purchaseOrderDocument.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Purchase Order Detail
  Future<List<PurchaseOrderDetail>> purchaseOrderDetailFetch({
    required String accessToken,
    required String purchaseOrderId,
    String? materialGroupId,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrderId);
      final response = await dio.get<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/details',
        queryParameters: {
          'material_group.eq': materialGroupId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final purchaseOrderDetails = <PurchaseOrderDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        purchaseOrderDetails
            .add(PurchaseOrderDetail.fromJson(data as Map<String, dynamic>));
      }

      return purchaseOrderDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<PurchaseOrderDetail>> purchaseOrderDetailFetchAll({
    required String accessToken,
    Material? material,
    Product? product,
    List<Material>? materials,
    List<Product>? products,
    PurchaseOrder? purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder?.id ?? '');
      var path = '$purchaseOrderPath/details';
      if (purchaseOrder != null) {
        path = '$purchaseOrderPath/$id/details';
      } else if (purchaseOrder == null) {
        path = '$purchaseOrderPath/details';
      }
      final response = await dio.get<Map<String, dynamic>>(
        path,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
        queryParameters: {
          'material_id.eq': material?.id,
          'product_id.eq': product?.id,
          'product_id.in': products?.map((e) => e.id).join(','),
          'material_id.in': materials?.map((e) => e.id).join(','),
        },
      );
      final purchaseOrderDetails = <PurchaseOrderDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        purchaseOrderDetails
            .add(PurchaseOrderDetail.fromJson(data as Map<String, dynamic>));
      }

      return purchaseOrderDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDetailCreate({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
    required double purchaseOrderQuantity,
    required double price,
    required int purchaseRequestDetailId,
    required String? materialId,
    required String? productId,
    required String? batchNo,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      final body = {
        'quantity_po': purchaseOrderQuantity,
        'price': price,
        'batch_no_id': batchNo,
        'description': '',
        'material_request_detail_id': purchaseRequestDetailId,
        'material_id': materialId,
        'product_id': productId,
      };

      await dio.post<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(body),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDetailCreateNonMaterialRequest({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
    required PurchaseOrderDetail purchaseOrderDetail,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      final body = {
        'quantity': purchaseOrderDetail.quantity,
        'price': purchaseOrderDetail.price,
        'description': '',
        'material_id': purchaseOrderDetail.material!.id,
      };

      await dio.post<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/non-material-request/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(body),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDetailEdit({
    required String accessToken,
    required PurchaseOrderDetail purchaseOrderDetail,
  }) async {
    try {
      final body = {
        'quantity_po': purchaseOrderDetail.quantity,
        'price': purchaseOrderDetail.price,
        'description': '',
      };

      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/details/${purchaseOrderDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(body),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDetailDelete({
    required String accessToken,
    required PurchaseOrderDetail purchaseOrderDetail,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$purchaseOrderPath/detail/${purchaseOrderDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Purchase Order Detail History
  Future<List<PurchaseOrderDetail>> purchaseOrderDetailHistoryFetch({
    required String accessToken,
    required PurchaseOrderHistory purchaseOrderHistory,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrderHistory.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/details/histories',
        queryParameters: {'revision_no.eq': purchaseOrderHistory.revisionNo},
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final purchaseOrderDetails = <PurchaseOrderDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        purchaseOrderDetails
            .add(PurchaseOrderDetail.fromJson(data as Map<String, dynamic>));
      }

      return purchaseOrderDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderDetailUpdate({
    required String accessToken,
    required PurchaseOrderDetail purchaseOrderDetail,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/detail/${purchaseOrderDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'quantity_po': purchaseOrderDetail.quantity,
          'price': purchaseOrderDetail.price,
          'description': '',
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Purchase Order History
  Future<List<PurchaseOrderHistory>> purchaseOrderHistoryFetch({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);

      final response = await dio.get<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/histories',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final purchaseOrderHistories = <PurchaseOrderHistory>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        purchaseOrderHistories
            .add(PurchaseOrderHistory.fromJson(data as Map<String, dynamic>));
      }

      return purchaseOrderHistories;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderUndoConfirm({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/undo-confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderUndoConfirmAccounting({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/undo-confirm-accounting',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> purchaseOrderUpdateStatusAccountingReject({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
    required String reason,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id/reject-accounting',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'reject_reason': reason}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PurchaseOrder> purchaseOrderEdit({
    required String accessToken,
    required PurchaseOrder purchaseOrder,
    required PurchaseOrderFormSupplier supplierForm,
    required PurchaseOrderFormDiscount discountForm,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseOrder.id);
      final response = await dio.put<Map<String, dynamic>>(
        '$purchaseOrderPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'supplier_id': supplierForm.supplier.id,
          'currency_id': supplierForm.currency.id,
          'quotation_no': supplierForm.quotationNo,
          'discount_percent': discountForm.discountPercent,
          'tax_type': discountForm.taxType.label,
          'ppn_percent': discountForm.ppn.id,
          'dp_percent': discountForm.downPaymentPercent,
          'term_of_payment': discountForm.termOfPayment,
          'delivery_date': supplierForm.deliveryDate.toUtc().toIso8601String(),
          'description': discountForm.description,
        }),
      );

      return PurchaseOrder.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> supplierCreate({
    required String accessToken,
    required String id,
    required String name,
    required String address,
    required String city,
    required String country,
    // required City city,
    // required Country country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required int termOfPayment,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        supplierPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'name': name,
          'address': address,
          // 'city_id': city.id,
          // 'country_id': country.id,
          'city_name': city,
          'country_name': country,
          'postal_code': postalCode,
          'phone': phone,
          'fax': fax,
          'pic': pic,
          'email': email,
          'npwp': npwp,
          'term_of_payment': termOfPayment,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> supplierDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<String>(
        '$supplierPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Supplier
  Future<PageOptions<Supplier>> supplierFetch({
    required String accessToken,
    required PageOptions<Supplier> pageOptions,
  }) async {
    try {
      final queryParameters = <String, dynamic>{}
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        supplierPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, Supplier.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<Supplier> supplierFetchById({
    required String accessToken,
    String? supplierId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$supplierPath/$supplierId',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>;

      return Supplier.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> supplierUpdate({
    required String accessToken,
    required String id,
    required String name,
    required String address,
    // required City city,
    // required Country country,
    required String city,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required int termOfPayment,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$supplierPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'address': address,
          'city_name': city,
          'country_name': country,
          'postal_code': postalCode,
          'phone': phone,
          'fax': fax,
          'pic': pic,
          'email': email,
          'npwp': npwp,
          'term_of_payment': termOfPayment,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vendorCreate({
    required String accessToken,
    required String id,
    required String name,
    required String address,
    required String city,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required int termOfPayment,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        vendorPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'name': name,
          'address': address,
          'city_name': city,
          'country_name': country,
          'postal_code': postalCode,
          'phone': phone,
          'fax': fax,
          'pic': pic,
          'email': email,
          'npwp': npwp,
          'term_of_payment': termOfPayment,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vendorDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<String>(
        '$vendorPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Vendor
  Future<PageOptions<Vendor>> vendorFetch({
    required String accessToken,
    required PageOptions<Vendor> pageOptions,
  }) async {
    try {
      final queryParameters = <String, dynamic>{}
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        vendorPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, Vendor.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vendorUpdate({
    required String accessToken,
    required String id,
    required String name,
    required String address,
    required String city,
    required String country,
    // required City city,
    // required Country country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$vendorPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'address': address,
          'city_name': city,
          'country_name': country,
          // 'city_id': city.id,
          // 'country_id': country.id,
          'postal_code': postalCode,
          'phone': phone,
          'fax': fax,
          'pic': pic,
          'email': email,
          'npwp': npwp,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Fuel
  Future<List<Fuel>> fuelFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        fuelsPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final fuel = <Fuel>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        fuel.add(Fuel.fromJson(data as Map<String, dynamic>));
      }
      return fuel;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<Fuel>> fuelFetchCurrentPeriod({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        fuelsCurrentPeriodPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final fuel = <Fuel>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        fuel.add(Fuel.fromJson(data as Map<String, dynamic>));
      }
      return fuel;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<Fuel>> fuelHistoryFetch({
    required String accessToken,
    required Fuel fuel,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        fuelsPath,
        queryParameters: {
          'name.eq': fuel.name,
        },
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final fuels = <Fuel>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        fuels.add(Fuel.fromJson(data as Map<String, dynamic>));
      }
      return fuels;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> fuelCreate({
    required String accessToken,
    required String name,
    required double price,
    required DateTime startDate,
    required String typeFuel,
    required String brand,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        fuelsPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'price': price,
          'start_date': DateFormat('y-MM-dd').format(startDate),
          'type_fuel': typeFuel,
          'brand': brand,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> fuelUpdate({
    required String accessToken,
    required Fuel fuel,
    required double price,
    required DateTime startDate,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$fuelsPath/${fuel.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'price': price,
          'start_date': DateFormat('y-MM-dd').format(startDate),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> fuelDelete({
    required String accessToken,
    required Fuel fuel,
  }) async {
    try {
      final id = fuel.id;
      await dio.delete<Map<String, dynamic>>(
        '$fuelsPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Vehicle
  Future<PageOptions<Vehicle>> vehicleFetch({
    required String accessToken,
    required PageOptions<Vehicle> pageOptions,
    bool? isActive,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        vehiclesPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        queryParameters: {
          'is_active.eq': isActive ?? '',
        }..addAll(pageOptions.toUrlQueryMap()),
      );
      return pageOptions.setFromApi(response, Vehicle.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleCreate({
    required String accessToken,
    required String vehicleNo,
    required String brand,
    required String category,
    required String fuel,
    required int manufacturerYear,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        vehiclesPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'vehicle_registration_number': vehicleNo,
          'brand': brand,
          'category': category,
          'type_fuel': fuel,
          'manufacture_year': manufacturerYear,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleUpdate({
    required String accessToken,
    required Vehicle vehicle,
    required String fuel,
    required String brand,
    required String category,
    required int manufacturerYear,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$vehiclesPath/${vehicle.vehicleRegistrationNumber}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'brand': brand,
          'category': category,
          'type_fuel': fuel,
          'manufacture_year': manufacturerYear,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleDelete({
    required String accessToken,
    required Vehicle vehicle,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicle.vehicleRegistrationNumber);
      await dio.delete<Map<String, dynamic>>(
        '$vehiclesPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleActive({
    required String accessToken,
    required Vehicle vehicle,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicle.vehicleRegistrationNumber);
      await dio.put<Map<String, dynamic>>(
        '$vehiclesPath/$id/activate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleDeActive({
    required String accessToken,
    required Vehicle vehicle,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicle.vehicleRegistrationNumber);
      await dio.put<Map<String, dynamic>>(
        '$vehiclesPath/$id/deactivate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<VehicleRent>> vehicleRentFetch({
    required String accessToken,
    required PageOptions<VehicleRent> pageOptions,
    Vehicle? vehicle,
    String? status,
    DateTime? scheduleStart,
    DateTime? scheduleEnd,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        vehicleRentPath,
        queryParameters: {
          'status.eq': status ?? '',
          'schedule_start.gte': scheduleStart?.toUtcIso(),
          'schedule_start.lte': scheduleEnd?.toUtcIso(),
          'vehicle_id.eq':
              vehicle != null ? vehicle.vehicleRegistrationNumber : '',
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, VehicleRent.fromJson);
    } catch (error, stack) {
      print('al');
      print(stack);
      throw checkErrorApi(error);
    }
  }

  Future<VehicleRent> vehicleRentFetchById({
    required String accessToken,
    required VehicleRentFormHeader vehicleRent,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id!);
      final response = await dio.get<Map<String, dynamic>>(
        '$vehicleRentByIdPath/$id',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return VehicleRent.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> cekAddressDetailFetch({
    required String latitude,
    required String longitude,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://nominatim.foxlogger.info/reverse?format=json&lat=$latitude&lon=$longitude&addressdetails=1',
      );
      final data = response.data!['display_name'];
      return data as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<LatLng> cekAddressByCityFetch({
    required String city,
  }) async {
    try {
      final response = await dio.get<List<dynamic>>(
        'https://nominatim.foxlogger.info/search.php?q=$city&format=jsonv2',
      );
      final dataResponse = response.data?[0] as Map<String, dynamic>;
      final dataLat = dataResponse['lat'] as String;
      final dataLng = dataResponse['lon'] as String;

      final data = LatLng(double.parse(dataLat), double.parse(dataLng));
      return data;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentCreate({
    required String accessToken,
    required int userId,
    required String description,
    required double totalCost,
    required Department department,
    required DateTime startDate,
    required DateTime endDate,
    required String points,
    required String type,
    int? driverId,
    Vehicle? vehicle,
  }) async {
    try {
      final dataJson = {
        'user_id': userId,
        'description': description,
        'total_cost': totalCost,
        'department_id': department.id,
        'scheduled_start_date': startDate.toUtc().toIso8601String(),
        'scheduled_end_date': endDate.toUtc().toIso8601String(),
        'type': type,
        'point': points,
      };
      if (driverId != null) {
        dataJson['driver_id'] = driverId;
      }

      if (vehicle != null) {
        dataJson['vehicle_id'] = vehicle.vehicleRegistrationNumber;
      }
      await dio.post<Map<String, dynamic>>(
        vehicleRentPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(dataJson),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentUpdate({
    required String accessToken,
    required String id,
    required int userId,
    required String description,
    required double totalCost,
    required Department department,
    required DateTime startDate,
    required DateTime endDate,
    required String points,
    required String type,
    int? driverId,
    Vehicle? vehicle,
  }) async {
    try {
      final dataJson = {
        'user_id': userId,
        'description': description,
        'total_cost': totalCost,
        'department_id': department.id,
        'scheduled_start_date': startDate.toUtc().toIso8601String(),
        'scheduled_end_date': endDate.toUtc().toIso8601String(),
        'type': type,
        'point': points,
      };
      if (driverId != null) {
        dataJson['driver_id'] = driverId;
      }

      if (vehicle != null) {
        if (vehicle.vehicleRegistrationNumber != '') {
          dataJson['vehicle_id'] = vehicle.vehicleRegistrationNumber;
        }
      }
      final idEnCode = Uri.encodeComponent(id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentByIdPath/$idEnCode',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(dataJson),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentApproveManager({
    required String accessToken,
    required VehicleRent vehicleRent,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentApproveManagerPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentRejectManager({
    required String accessToken,
    required VehicleRent vehicleRent,
    required String reason,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentRejectManagerPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'explanation_reject': reason,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentApproveCS({
    required String accessToken,
    required VehicleRent vehicleRent,
    required int driverId,
    required String vehicleRegistrationNumber,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentApproveCSPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'scheduled_start_date':
              vehicleRent.scheduledStartDate.toUtc().toIso8601String(),
          'scheduled_end_date':
              vehicleRent.scheduledEndDate.toUtc().toIso8601String(),
          'driver_id': driverId,
          'vehicle_id': vehicleRegistrationNumber,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentRejectCS({
    required String accessToken,
    required VehicleRent vehicleRent,
    required String reason,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentRejectCSPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'explanation_reject': reason,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentDelete({
    required String accessToken,
    required VehicleRent vehicleRent,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.delete<Map<String, dynamic>>(
        '$vehicleRentByIdPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentActualStartDateUpdate({
    required String accessToken,
    required VehicleRent vehicleRent,
    required DateTime startDate,
    required double kiloMeter,
    required int fuelBar,
    required String vehicleCheckNote,
    required List<PlatformFile> attachments,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentActualStartPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          'image_check_before': attachments
              .map((e) async =>
                  await MultipartFile.fromBytes(e.bytes!, filename: e.name))
              .toList(),
          'initial_kilometer': kiloMeter,
          'fuel_before': fuelBar,
          'actual_start_date': startDate.toUtc().toIso8601String(),
          'vehicle_check_before': vehicleCheckNote,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> vehicleRentActualEndDateUpdate({
    required String accessToken,
    required VehicleRent vehicleRent,
    required DateTime endDate,
    required double kiloMeter,
    required int fuelBar,
    required String vehicleCheckNote,
    required List<PlatformFile> attachments,
  }) async {
    try {
      final id = Uri.encodeComponent(vehicleRent.id);
      await dio.put<Map<String, dynamic>>(
        '$vehicleRentActualEndPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          'image_check_after': attachments
              .map((e) async =>
                  await MultipartFile.fromBytes(e.bytes!, filename: e.name))
              .toList(),
          'final_kilometer': kiloMeter,
          'fuel_after': fuelBar,
          'actual_end_date': endDate.toUtc().toIso8601String(),
          'vehicle_check_after': vehicleCheckNote,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PurchaseOrderOutstanding>> purchaseOrderOutstandingFetch({
    required String accessToken,
    required PageOptions<PurchaseOrderOutstanding> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-outstanding-purchase-order',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(
          response, PurchaseOrderOutstanding.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<PurchaseOrderOutstandingProduct>>
      purchaseOrderOutstandingProductFetch({
    required String accessToken,
    required PageOptions<PurchaseOrderOutstandingProduct> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-outstanding-purchase-order-product',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(
          response, PurchaseOrderOutstandingProduct.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
