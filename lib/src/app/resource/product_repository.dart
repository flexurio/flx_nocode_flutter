import 'dart:convert';

import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';

class ProductRepository extends Repository {
  ProductRepository({required super.dio, required super.onUnauthorized});

  static final pathProduct = '${Api.urlApi}/products';
  static final pathProductGroup = '${Api.urlApi}/products/groups';
  static final pathRecapProductStock =
      '${Api.urlApi}/recap-product-stock-status';

  static final pathProductIssue = '${Api.urlApi}/products/issued';
  static final pathProductIssueGlobalReport =
      '${Api.urlApi}/report-product-issue-global';
  static final pathProductReturnNote = '${Api.urlApi}/product-return-notes';
  static final pathProductReturn = '${Api.urlApi}/product-returns';

  static ProductRepository instance = ProductRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<ProductNie>> productNieFetch({
    required String accessToken,
    required String productId,
  }) async {
    try {
      final responseNie = await dio.get<Map<String, dynamic>>(
        '$pathProduct/$productId/nies',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final productNie = <ProductNie>[];
      final data = responseNie.data!['data'] as List;

      for (final data in data) {
        productNie.add(ProductNie.fromJson(data as Map<String, dynamic>));
      }
      return productNie;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> productNieCreate({
    required String id,
    required String accessToken,
    required String publisher,
    required String periodStart,
    required String periodEnd,
    required String productId,
    required ProductNieCategory category,
  }) async {
    final dateStart = DateFormat('MMMM d, yyyy').parse(periodStart).toUtc();
    final dateEnd = DateFormat('MMMM d, yyyy').parse(periodEnd).toUtc();

    try {
      final result = await dio.post<Map<String, dynamic>>(
        '$pathProduct/$productId/nies',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'start_period': dateStart.toIso8601String(),
          'end_period': dateEnd.toIso8601String(),
          'publisher': publisher,
          'product_id': productId,
          'category': category.label,
        }),
      );
      return result.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> productNieDelete({
    required String accessToken,
    required Product product,
    required ProductNie productNie,
  }) async {
    final productId = product.id;
    final periodStartConvert =
        productNie.periodStart.toUtc().toString().replaceAll('Z', '');
    final periodEndConvert =
        productNie.periodEnd.toUtc().toString().replaceAll('Z', '');
    try {
      final result = await dio.delete<Map<String, dynamic>>(
        '$pathProduct/$productId/nies/${productNie.id}/$periodStartConvert/$periodEndConvert',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return result.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductPrice>> productPriceFetch({
    required String accessToken,
    required Product? product,
  }) async {
    try {
      var pathPrice = '';
      if (product != null) {
        final id = Uri.encodeComponent(product.id);
        pathPrice = '$pathProduct/$id/prices';
      } else {
        pathPrice = '$pathProduct/prices';
      }
      final response = await dio.get<Map<String, dynamic>>(
        pathPrice,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final productPrice = <ProductPrice>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productPrice.add(ProductPrice.fromJson(data as Map<String, dynamic>));
      }

      return productPrice;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductPrice>> productPriceLatestFetch({
    required String accessToken,
    required String productId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProduct/prices',
        queryParameters: {
          'product_id.eq': productId,
          'end_date.eq': 'null',
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final productPrice = <ProductPrice>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productPrice.add(ProductPrice.fromJson(data as Map<String, dynamic>));
      }

      return productPrice;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productPriceCreate({
    required String accessToken,
    required int productPrice,
    required DateTime periodStart,
    required int bonusPrice,
    required int primaryPrice,
    required int hppStrip,
    required int stripPrice,
    required int tabletPrice,
    required String idCurrency,
    required String id,
  }) async {
    try {
      final productPriceId = Uri.encodeComponent(id);
      await dio.post<Map<String, dynamic>>(
        '$pathProduct/$productPriceId/prices',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'product_price': productPrice,
          'bonus_price': bonusPrice,
          'primary_price': primaryPrice,
          'strip_hpp': hppStrip,
          'strip_price': stripPrice,
          'tablet_price': tabletPrice,
          'start_date': periodStart.toUtc().toIso8601String(),
          'currency_id': idCurrency,
          'product_id': id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productPriceEdit({
    required String accessToken,
    required Product product,
    required double price,
    required DateTime periodStart,
    required double bonusPrice,
    required double primaryPrice,
    required double hppStrip,
    required double stripPrice,
    required double tabletPrice,
    required Currency currency,
    required ProductPrice productPrice,
  }) async {
    try {
      final productPriceId = Uri.encodeComponent(product.id);
      await dio.put<Map<String, dynamic>>(
        '$pathProduct/${productPriceId}/prices/${productPrice.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'product_price': price,
          'bonus_price': bonusPrice,
          'primary_price': primaryPrice,
          'strip_hpp': hppStrip,
          'strip_price': stripPrice,
          'tablet_price': tabletPrice,
          'start_date': periodStart.toUtc().toIso8601String(),
          'end_date': DateTime(0).toUtc().toIso8601String(),
          'currency_id': currency.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productPriceDelete({
    required String accessToken,
    required ProductPrice price,
    required Product product,
  }) async {
    try {
      final productPriceId = Uri.encodeComponent(product.id);
      await dio.delete<Map<String, dynamic>>(
        '$pathProduct/${productPriceId}/prices/${price.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productActivate({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProduct/$id/activate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productDeactivate({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProduct/$id/deactivate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productPhasedOut({
    required String accessToken,
    required Product product,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProduct/${product.id}/phased-out',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productNotPhasedOut({
    required String accessToken,
    required Product product,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProduct/${product.id}/not-phased-out',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductGroup>> productGroupFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProduct/groups',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final productGroupModels = <ProductGroup>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productGroupModels.add(
          ProductGroup.fromJson(data as Map<String, dynamic>),
        );
      }

      return productGroupModels;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productGroupCreate({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$pathProduct/groups',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            'id': id,
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productGroupDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathProduct/groups/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductIssue>> productIssueFetch({
    required String accessToken,
    required PageOptions<ProductIssue> pageOptions,
    String? productReturnID,
    String? remark,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'product_return_id.eq': productReturnID,
        'remark.eq': remark,
      }..addAll(pageOptions.toUrlQueryMap());
      final response = await dio.get<Map<String, dynamic>>(
        pathProductIssue,
        queryParameters: queryParameters,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, ProductIssue.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductIssueGlobal>> productIssueGlobalReportFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathProductIssueGlobalReport,
        queryParameters: {
          'warehouse.eq': 'PRODUK JADI',
        },
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final productIssueGlobal = <ProductIssueGlobal>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productIssueGlobal.add(
          ProductIssueGlobal.fromJson(data as Map<String, dynamic>),
        );
      }

      return productIssueGlobal;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productIssueDeliveryActual({
    required String accessToken,
    required ProductIssue productIssue,
    required DateTime deliveryOrderReceived,
    required DateTime deliveryDate,
    required String expedition,
    required String shippingNo,
    required ProductIssueShipmentVia shippingVia,
    required int packageQty,
    required DateTime endPackingDate,
    int? shippingCharge,
    int? kilogramQty,
  }) async {
    try {
      final id = Uri.encodeComponent(productIssue.id);
      final data = jsonEncode(
        {
          'delivery_order_received':
              deliveryOrderReceived.toUtc().toIso8601String(),
          'delivery_date': deliveryDate.toUtc().toIso8601String(),
          'expedition': expedition,
          'shipping_no': shippingNo,
          'shipment_via': shippingVia.id,
          'shipping_charge': shippingCharge ?? 0,
          'package_qty': packageQty,
          'kilogram_qty': kilogramQty ?? 0,
          'end_packing_date': endPackingDate.toUtc().toIso8601String(),
        },
      );
      await dio.put<Map<String, dynamic>>(
        '$pathProductIssue/$id/delivery',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productIssueDelivery({
    required String accessToken,
    required ProductIssue productIssue,
    required DateTime deliveryOrderDate,
    required DateTime salesOrderReceiveDate,
  }) async {
    try {
      final id = Uri.encodeComponent(productIssue.id);
      final data = jsonEncode(
        {
          'delivery_order_date': deliveryOrderDate.toUtc().toIso8601String(),
          'sales_order_receive_date':
              salesOrderReceiveDate.toUtc().toIso8601String(),
        },
      );
      await dio.put<Map<String, dynamic>>(
        '$pathProductIssue/$id/customer-sales-orders',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ProductIssueDetail>> productIssueDetailFetch({
    required String accessToken,
    required ProductIssue productIssue,
  }) async {
    try {
      final id = Uri.encodeComponent(productIssue.id);
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/product/issued/$id/details',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final products = <ProductIssueDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        products.add(ProductIssueDetail.fromJson(data as Map<String, dynamic>));
      }

      return products;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<RecapProductStock>> recapProductStockFetch({
    required String accessToken,
    required DateTime? period,
    required String? productGroupId,
    required String? productId,
    required String? batchId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathRecapProductStock,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
        queryParameters: {
          'period.eq': period?.formatPeriod,
          'product_group_id.eq': productGroupId,
          'product_id.eq': productId,
          'batch_no_id.eq': batchId,
        },
      );
      final recapProductStocks = <RecapProductStock>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        recapProductStocks.add(
          RecapProductStock.fromJson(data as Map<String, dynamic>),
        );
      }

      return recapProductStocks;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  //Product Return Note
  Future<PageOptions<ProductReturnNote>> productReturnNoteFetch({
    required String accessToken,
    required PageOptions<ProductReturnNote> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathProductReturnNote,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, ProductReturnNote.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReturnNote> productReturnNoteFetchById({
    required String accessToken,
    required String? id,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductReturnNote/${Uri.encodeComponent(id!)}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final productReturn = ProductReturnNote.fromJson(
          response.data!['data'] as Map<String, dynamic>);
      return productReturn;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnNoteCreate({
    required String accessToken,
    required String currencyId,
    required String customerId,
    required String departmentId,
    required String transactionTypeId,
    required int rateId,
    required String purchaseOrderId,
    required DateTime returnDate,
    required String shippingAddress,
    required String addressName,
    required DateTime deliveryNoteDate,
    required int termOfPayment,
    required String remark,
    required double subtotal,
    required double discountPercentage,
    required double discountValue,
    required Ppn ppnPercentage,
    required double ppnValue,
    required double total,
  }) async {
    try {
      final data = jsonEncode({
        'currency_id': currencyId,
        'customer_id': customerId,
        'department_id': departmentId,
        'transaction_type_id': transactionTypeId,
        'rate': rateId,
        'purchase_order_id': purchaseOrderId,
        'return_date': returnDate.toUtc().toIso8601String(),
        'shipping_address': shippingAddress,
        'address_name': addressName,
        'delivery_note_date': deliveryNoteDate.toUtc().toIso8601String(),
        'term_of_payment': termOfPayment,
        'remark': remark,
        'subtotal': subtotal,
        'discount_percentage': discountPercentage,
        'discount_value': discountValue,
        'ppn_percentage': ppnPercentage.id,
        'ppn_value': ppnValue,
        'total': total,
      });
      await dio.post<Map<String, dynamic>>(
        pathProductReturnNote,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnNoteEdit({
    required String accessToken,
    required String productReturnNoteId,
    required String shippingAddress,
    required String addressName,
    required DateTime deliveryNoteDate,
    required int termOfPayment,
    required String remark,
    required double subtotal,
    required double discountPercentage,
    required double discountValue,
    required Ppn ppnPercentage,
    required double ppnValue,
    required double total,
    required String currencyId,
    required String transactionTypeId,
    required int rateId,
    required String purchaseOrderId,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturnNoteId);
      final data = jsonEncode({
        'rate': rateId,
        'purchase_order_id': purchaseOrderId,
        'shipping_address': shippingAddress,
        'address_name': addressName,
        'delivery_note_date': deliveryNoteDate.toUtc().toIso8601String(),
        'term_of_payment': termOfPayment,
        'remark': remark,
        'subtotal': subtotal,
        'discount_percentage': discountPercentage,
        'discount_value': discountValue,
        'ppn_percentage': ppnPercentage.id,
        'ppn_value': ppnValue,
        'total': total,
        'currency_id': currencyId,
        'transaction_type_id': transactionTypeId,
      });
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturnNote/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnNoteDelete({
    required String accessToken,
    required String productReturnNoteId,
  }) async {
    final id = Uri.encodeComponent(productReturnNoteId);
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathProductReturnNote/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnNoteApprove({
    required String accessToken,
    required String productReturnNoteId,
  }) async {
    final id = Uri.encodeComponent(productReturnNoteId);
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturnNote/$id/approve',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnNoteDetail>> productReturnNoteDetailFetch({
    required String accessToken,
    required PageOptions<ProductReturnNoteDetail> pageOptions,
    required String? productReturnNoteId,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturnNoteId!);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductReturnNote/$id/details',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ProductReturnNoteDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnNoteDetailCreate({
    required String accessToken,
    required String productReturnNoteId,
    required String productReturnId,
    required String productId,
    required String batchNoId,
    required String deliveryOrderId,
    required String unitId,
    required int quantity,
    required double price,
    required double total,
  }) async {
    try {
      // final id = Uri.encodeComponent(productReturnNoteId);
      final data = jsonEncode({
        'product_return_note_id': productReturnNoteId,
        'product_return_id': productReturnId,
        'product_id': productId,
        'batch_no': batchNoId,
        'delivery_order_id': deliveryOrderId,
        'unit_id': unitId,
        'quantity': quantity,
        'price': price,
        'total': total,
      });
      await dio.post<Map<String, dynamic>>(
        '$pathProductReturnNote/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnNoteDetailDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathProductReturnNote/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  //Product Return
  Future<PageOptions<ProductReturn>> productReturnFetch({
    required String accessToken,
    required PageOptions<ProductReturn> pageOptions,
    String? status,
    String? departmentId,
    String? customerId,
    DateTime? createdDateStart,
    DateTime? createdDateEnd,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathProductReturn,
        queryParameters: {
          'status.eq': status,
          'department_id.eq': departmentId,
          'customer_id.eq': customerId,
          'created_at.gte': createdDateStart?.toUtcIso(),
          'created_at.lte': createdDateEnd?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ProductReturn.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReturn> productReturnFetchById({
    required String accessToken,
    required String? id,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductReturn/${Uri.encodeComponent(id!)}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final productReturn = ProductReturn.fromJson(
          response.data!['data'] as Map<String, dynamic>);
      return productReturn;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnDetail>> productReturnDetailFetch({
    required String accessToken,
    required PageOptions<ProductReturnDetail> pageOptions,
    required String productReturnId,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturnId);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductReturn/$id/details',
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ProductReturnDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnDetail>> productReturnDetailFetchById({
    required String accessToken,
    required PageOptions<ProductReturnDetail> pageOptions,
    required String productReturnId,
    required int idDetail,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturnId);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductReturn/$id/details',
        queryParameters: {'product_return_detail_id.eq': idDetail}
          ..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, ProductReturnDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnCheck>> productReturnCheckFetch({
    required String accessToken,
    required PageOptions<ProductReturnCheck> pageOptions,
    required String productReturnId,
    String? productId,
    String? batchId,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturnId);
      final response = await dio.get<Map<String, dynamic>>(
        '$pathProductReturn/$id/checks',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
        queryParameters: {
          'product_id.eq': productId ?? '',
          'batch.eq': batchId ?? '',
        },
      );
      return pageOptions.setFromApi(response, ProductReturnCheck.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<ProductReturn> productReturnCreate({
    required String accessToken,
    required Currency currency,
    required Customer customer,
    required Department department,
    required TransactionType transactionType,
    required String referenceNo,
    required String description,
    required double subtotal,
    required double discountPercent,
    required double discountValue,
    required double ppnPercent,
    required double ppnValue,
    required double accountValue,
  }) async {
    try {
      final data = jsonEncode({
        'currency_id': currency.id,
        'customer_id': customer.id,
        'department_id': department.id,
        'transaction_type_id': transactionType.id,
        'reference_no': referenceNo,
        'description': '-',
        'subtotal': subtotal,
        'discount_percent': discountPercent,
        'discount_value': discountValue,
        'ppn_percent': ppnPercent,
        'ppn_value': ppnValue,
        'account_value': 0,
      });
      final response = await dio.post<Map<String, dynamic>>(
        pathProductReturn,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return ProductReturn.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnEdit(
      {required String accessToken,
      required String productReturnId,
      required Currency currency,
      required Customer customer,
      required Department department,
      required TransactionType transactionType,
      required String description,
      required double subtotal,
      required double discountPercent,
      required double discountValue,
      required double ppnPercent,
      required double ppnValue,
      required double accountValue,
      required String referenceNo}) async {
    try {
      final id = Uri.encodeComponent(productReturnId);
      final data = jsonEncode({
        'account_value': accountValue,
        'currency_id': currency.id,
        'customer_id': customer.id,
        'department_id': department.id,
        'description': description,
        'discount_percent': discountPercent,
        'discount_value': discountValue,
        'ppn_percent': ppnPercent,
        'ppn_value': ppnValue,
        'reference_no': referenceNo,
        'subtotal': subtotal,
        'transaction_type_id': transactionType.id,
      });
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnConfirmMarketing({
    required String accessToken,
    required ProductReturn productReturn,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturn.id);
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/$id/confirm-marketing',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnConfirmPpic({
    required String accessToken,
    required ProductReturn productReturn,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturn.id);
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/$id/confirm-ppic',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnUndoConfirmMarketing({
    required String accessToken,
    required ProductReturn productReturn,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturn.id);
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/$id/cancel-confirm-marketing',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnUndoConfirmPpic({
    required String accessToken,
    required ProductReturn productReturn,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturn.id);
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/$id/cancel-confirm-ppic',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnDelete({
    required String accessToken,
    required ProductReturn productReturn,
  }) async {
    try {
      final id = Uri.encodeComponent(productReturn.id);
      await dio.delete<Map<String, dynamic>>(
        '$pathProductReturn/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnDetailCreate({
    required String accessToken,
    required ProductReturn productReturn,
    required ProductReturnDetail productReturnDetail,
  }) async {
    try {
      final data = jsonEncode({
        'product_return_id': productReturn.id,
        'product_id': productReturnDetail.product.id,
        'batch_no': productReturnDetail.batchNo.id,
        'delivery_order_id': productReturnDetail.deliveryOrderId,
        'unit_id': productReturnDetail.unit.id,
        'product_price': productReturnDetail.productPrice,
        'quantity': productReturnDetail.quantity,
        'total_product_price': productReturnDetail.totalProductPrice,
        'expiration_date':
            productReturnDetail.expirationDate.toUtc().toIso8601String(),
      });
      await dio.post<Map<String, dynamic>>(
        '$pathProductReturn/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnDetailEdit({
    required String accessToken,
    required int id,
    required int productPrice,
    required int quantity,
    required int totalProductPrice,
    required DateTime expirationDate,
  }) async {
    try {
      final data = jsonEncode({
        'product_price': productPrice,
        'quantity': quantity,
        'total_product_price': totalProductPrice,
        'expiration_date': expirationDate.toUtc().toIso8601String(),
      });
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnDetailDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathProductReturn/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnDetailCheckQC({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/details/$id/check-quality-control',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnCheckCreate(
      {required String accessToken,
      required String productReturnId,
      required String productId,
      required String productionOrderId,
      required String unitId,
      required int quantity,
      required String description,
      required String status}) async {
    try {
      final data = jsonEncode({
        'product_return_id': productReturnId,
        'product_id': productId,
        'batch_no': productionOrderId,
        'unit_id': unitId,
        'status': status,
        'quantity': quantity,
        'description': description,
      });
      await dio.post<Map<String, dynamic>>(
        '$pathProductReturn/checks',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnCheckDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathProductReturn/checks/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> productReturnCheckUpdateDelivery({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathProductReturn/checks/$id/print-delivery-order-returns',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
