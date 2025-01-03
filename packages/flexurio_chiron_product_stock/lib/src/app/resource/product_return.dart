import 'package:dio/dio.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductReturnRepository extends Repository {
  ProductReturnRepository({required super.dio, required super.onUnauthorized});

  static final recapDispositionPath =
      '${Api.urlApi}/recap-disposition-product-return';
  static final recapProductExpenditurePath =
      '${Api.urlApi}/recap-product-expenditures';
  static final recapExpiredProductPath = '${Api.urlApi}/recap-stock-product';
  static final productReturnPbfPath = '${Api.urlApi}/report-return-pbf';
  static final productReturnReceiveReportPath =
      '${Api.urlApi}/recap-product-return-receive';
  static final productReturnOutstandingReportPath =
      '${Api.urlApi}/recap-outstanding-product-return';
  static final productReturnNoteRecapPath =
      '${Api.urlApi}/recap-product-return-notes';

  static ProductReturnRepository instance = ProductReturnRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<ProductReturnRecapDisposition>> recapDispositionFetch({
    required String accessToken,
    required PageOptions<ProductReturnRecapDisposition> pageOptions,
    DateTime? createdAtStart,
    DateTime? createdAtEnd,
    ProductReturnCheckStatus? status,
    String? productId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapDispositionPath,
        queryParameters: {
          'created_at.gte': createdAtStart?.toUtcIso(),
          'created_at.lte': createdAtEnd?.toUtcIso(),
          'status.eq': status?.id,
          'product_id.eq': productId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductReturnRecapDisposition.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnPbf>> pbfFetch({
    required String accessToken,
    required PageOptions<ProductReturnPbf> pageOptions,
    DateTime? deliverOrderDataStart,
    DateTime? deliverOrderDataEnd,
    String? productId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapDispositionPath,
        queryParameters: {
          'report_warehouse_product_issues.delivery_order_date.gte':
              deliverOrderDataStart?.toUtcIso(),
          'report_warehouse_product_issues.delivery_order_date.lte':
              deliverOrderDataEnd?.toUtcIso(),
          'product_id.eq': productId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductReturnPbf.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<RecapProductExpenditure>> fetch({
    required String accessToken,
    required PageOptions<RecapProductExpenditure> pageOptions,
    required DateTime dateStart,
    required DateTime dateEnd,
    required Division division,
    required RecapProductExpenditureWarehouse warehouse,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapProductExpenditurePath,
        queryParameters: {
          'created_at.gte': dateStart.toUtcIso(),
          'created_at.lte': dateEnd.toUtcIso(),
          'division.eq': division.alk,
          'warehouse.eq': warehouse.ruahan,
          'limit': 9999,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        RecapProductExpenditure.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<RecapExpiredProduct>> fetchRecapExpiredProduct({
    required String accessToken,
    required PageOptions<RecapExpiredProduct> pageOptions,
    required DateTime dateExpired,
    required String? productId,
    required Division division,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapExpiredProductPath,
        queryParameters: {
          'expired_date.gte': dateExpired.toUtcIso(),
          'ending_balance.eq': 0,
          'product_id.eq': productId,
          'division.eq': division.alk,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        RecapExpiredProduct.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnReceiveReport>>
      productReturnReceiveReportFetch({
    required String accessToken,
    required PageOptions<ProductReturnReceiveReport> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    required Department department,
    Product? product,
    required bool qualityAssurance,
    String? status,
    String? transactionTypeIdIn,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'created_at.gte': periodStart.toUtc().toIso8601String(),
        'created_at.lte': periodEnd.toUtc().toIso8601String(),
        'customer_id.eq': customer.id,
        'department_id.eq': department.id,
        'transaction_type_id.in': transactionTypeIdIn,
        'status.eq': status,
        'product_id.eq': product?.id,
      };

      if (qualityAssurance == true) {
        queryParameters['quantity_check.eq'] = 0;
      } else {
        queryParameters['quantity_not_yet_check.eq'] = 0;
      }

      final response = await dio.get<Map<String, dynamic>>(
        productReturnReceiveReportPath,
        queryParameters: queryParameters..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductReturnReceiveReport.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnReceiveReport>>
      productReturnStockReportFetch({
    required String accessToken,
    required PageOptions<ProductReturnReceiveReport> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productReturnReceiveReportPath,
        queryParameters: {
          'created_at.gte': periodStart.toUtc().toIso8601String(),
          'created_at.lte': periodEnd.toUtc().toIso8601String(),
          'customer_id.eq': customer.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductReturnReceiveReport.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnOutstandingReport>>
      productReturnOutstandingReportFetch({
    required String accessToken,
    required PageOptions<ProductReturnOutstandingReport> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required bool qualityAssurance,
    Customer? customer,
    String? status,
    String? transactionTypeIdIn,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'created_at.gte': periodStart.toUtc().toIso8601String(),
        'created_at.lte': periodEnd.toUtc().toIso8601String(),
        'customer_id.eq': customer == null ? '' : customer.id,
        'transaction_type_id.in': transactionTypeIdIn,
        'status.eq': status,
      };

      if (qualityAssurance == true) {
        queryParameters['quantity_check.eq'] = 0;
      } else {
        queryParameters['quantity_not_yet_check.eq'] = 0;
      }

      final response = await dio.get<Map<String, dynamic>>(
        productReturnOutstandingReportPath,
        queryParameters: queryParameters..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductReturnOutstandingReport.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductReturnNoteRecap>> productReturnNoteRecapFetch({
    required String accessToken,
    required PageOptions<ProductReturnNoteRecap> pageOptions,
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    ProductReturn? productReturn,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productReturnNoteRecapPath,
        queryParameters: {
          'date.gte': periodStart.toUtc().toIso8601String(),
          'date.lte': periodEnd.toUtc().toIso8601String(),
          'customer_id.eq': customer.id,
          'product_return_id.eq': productReturn?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductReturnNoteRecap.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
