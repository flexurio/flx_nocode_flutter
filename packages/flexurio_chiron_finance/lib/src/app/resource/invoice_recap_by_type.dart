import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_detail.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_detail_special.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global_special.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global_special_all.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class InvoiceRecapByTypeRepository extends Repository {
  InvoiceRecapByTypeRepository(
      {required super.dio, required super.onUnauthorized,});

  final invoiceRecapBySalesGlobalPath =
      '${Api.urlApi}/global-sales-invoice-recap';
  final invoiceRecapBySalesDetailPath =
      '${Api.urlApi}/detailed-sales-invoice-recap';
  final invoiceRecapBySalesGlobalSpecialPath =
      '${Api.urlApi}/special-global-sales-invoice-recap';
  final invoiceRecapBySalesDetailSpecialPath =
      '${Api.urlApi}/special-details-sales-invoice-recap';
  final invoiceRecapBySalesGlobalSpecialAllPath =
      '${Api.urlApi}/special-global-all-sales-invoice-recap';
  final invoiceRecapByTypePath = '${Api.urlApi}/invoice-recap-by-type';

  static InvoiceRecapByTypeRepository instance = InvoiceRecapByTypeRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<void> reprocess({required String accessToken}) async {
    try {
      await dio.post<Map<String, dynamic>>(
        invoiceRecapByTypePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<InvoiceRecapBySalesGlobal>> fetchBySalesGlobal({
    required String accessToken,
    required PageOptions<InvoiceRecapBySalesGlobal> pageOptions,
    required DateTime? transactionDateStart,
    required DateTime? transactionDateEnd,
    required String? transactionTypeId,
    required String? customerId,
    required String? transactionId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceRecapBySalesGlobalPath,
        queryParameters: {
          'trans.eq': transactionId,
          'transaction_type_id.eq': transactionTypeId,
          'customer_id.eq': customerId,
          'transaction_date.gte': transactionDateStart?.toUtcIso(),
          'transaction_date.lte': transactionDateEnd?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        InvoiceRecapBySalesGlobal.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<InvoiceRecapBySalesDetail>> fetchBySalesDetail({
    required String accessToken,
    required PageOptions<InvoiceRecapBySalesDetail> pageOptions,
    required DateTime? transactionDateStart,
    required DateTime? transactionDateEnd,
    required String? transactionTypeId,
    required String? customerId,
    required String? transactionId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceRecapBySalesDetailPath,
        queryParameters: {
          'transaction_type_id.eq': transactionTypeId,
          'customer_id.eq': customerId,
          'transaction_date.gte': transactionDateStart?.toUtcIso(),
          'transaction_date.lte': transactionDateEnd?.toUtcIso(),
          'trans.eq': transactionId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(
        response,
        InvoiceRecapBySalesDetail.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<InvoiceRecapBySalesGlobalSpecial>>
      fetchBySalesGlobalSpecial({
    required String accessToken,
    required PageOptions<InvoiceRecapBySalesGlobalSpecial> pageOptions,
    required DateTime? transactionDateStart,
    required DateTime? transactionDateEnd,
    required String? transactionTypeId,
    required String? customerId,
    required String? transactionId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceRecapBySalesGlobalSpecialPath,
        queryParameters: {
          'trans.eq': transactionId,
          'transaction_type_id.eq': transactionTypeId,
          'customer_id.eq': customerId,
          'transaction_date.gte': transactionDateStart?.toUtcIso(),
          'transaction_date.lte': transactionDateEnd?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        InvoiceRecapBySalesGlobalSpecial.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<InvoiceRecapBySalesDetailSpecial>>
      fetchBySalesDetailSpecial({
    required String accessToken,
    required PageOptions<InvoiceRecapBySalesDetailSpecial> pageOptions,
    required DateTime? transactionDateStart,
    required DateTime? transactionDateEnd,
    required String? transactionTypeId,
    required String? customerId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceRecapBySalesDetailSpecialPath,
        queryParameters: {
          'transaction_type_id.eq': transactionTypeId,
          'customer_id.eq': customerId,
          'transaction_date.gte': transactionDateStart?.toUtcIso(),
          'transaction_date.lte': transactionDateEnd?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(
        response,
        InvoiceRecapBySalesDetailSpecial.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<InvoiceRecapBySalesGlobalSpecialAll>>
      fetchBySalesGlobalSpecialAll({
    required String accessToken,
    required PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions,
    required DateTime? transactionDateStart,
    required DateTime? transactionDateEnd,
    required String? transactionTypeId,
    required String? customerId,
    required String? transactionId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        invoiceRecapBySalesGlobalSpecialAllPath,
        queryParameters: {
          'trans.eq': transactionId,
          'transaction_type_id.eq': transactionTypeId,
          'customer_id.eq': customerId,
          'transaction_date.gte': transactionDateStart?.toUtcIso(),
          'transaction_date.lte': transactionDateEnd?.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        InvoiceRecapBySalesGlobalSpecialAll.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
