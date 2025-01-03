import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';

class ProductStockRepository extends Repository {
  ProductStockRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final pathProductStock = '${Api.urlApi}/product/stocks';
  static final productStockWithPricePath =
      '${Api.urlApi}/product/stocks-with-price';

  static ProductStockRepository instance = ProductStockRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<ProductStock>> productStockFetch({
    required String accessToken,
    DateTime? period,
    String? productGroupId,
    String? productId,
    String? batchId,
    String? unitId,
    double? endingBalance,
    List<Warehouse>? warehouse,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathProductStock,
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
          'ending_balance.eq': endingBalance,
          'unit_id.eq': unitId,
          'warehouse.in': warehouse?.map((e) {
            return e.id;
          }).join(','),
        },
      );

      final productStocks = <ProductStock>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        productStocks.add(ProductStock.fromJson(data as Map<String, dynamic>));
      }

      return productStocks;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStock>> productStockMutationSummaryFetch({
    required String accessToken,
    required PageOptions<ProductStock> pageOptions,
    Product? product,
    DateTime? period,
    Division? division,
    List<Warehouse>? warehouse,
    int? endingBalance,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathProductStock,
        queryParameters: {
          'product_id.eq': product?.id,
          'period.eq': DateFormat('yyyyMM').format(period ?? DateTime.now()),
          'division.eq': division,
          'warehouse.in': warehouse?.map((e) {
            return e.id;
          }).join(','),
          'ending_balance.eq': endingBalance,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductStock.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStockWithPrice>> fetch({
    required String accessToken,
    required PageOptions<ProductStockWithPrice> pageOptions,
    List<String>? warehouses,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        productStockWithPricePath,
        queryParameters: {
          'warehouse.in': warehouses,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductStockWithPrice.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStockCardBatch>> productStockCardBatchFetch({
    required String accessToken,
    required PageOptions<ProductStockCardBatch> pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Product? product,
    Warehouse? warehouse,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/recap-card-stock-product-batch',
        queryParameters: {
          'created_at.gte': startDate?.toUtc().toUtc().toIso8601String(),
          'created_at.lte': endDate?.toUtc().toIso8601String(),
          'product_id.eq': product?.id,
          'warehouse.eq': warehouse,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductStockCardBatch.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStockMutationProductDetail>>
      productStockMutationProductDetailFetch({
    required String accessToken,
    required PageOptions<ProductStockMutationProductDetail> pageOptions,
    Product? product,
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/recap-mutation-stock-product-detail',
        queryParameters: {
          'created_at.gte': startPeriod?.toUtc().toIso8601String(),
          'created_at.lte': endPeriod?.toUtc().toIso8601String(),
          'product_id.eq': product?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, ProductStockMutationProductDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
