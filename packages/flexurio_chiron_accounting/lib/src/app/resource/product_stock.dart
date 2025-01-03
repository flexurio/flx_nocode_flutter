import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_initial.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_mutation_recap.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_recap.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_return_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_rupiah.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class ProductStockRepository extends Repository {
  ProductStockRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final recapPath = '${Api.urlApi}/recap-stock-product';
  static final initialPath = '${Api.urlApi}/recap-initial-stock-product';
  static final mutationPath = '${Api.urlApi}/recap-of-product-stock-mutation';

  static ProductStockRepository instance = ProductStockRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<ProductStockRecap>> recapFetch({
    required String accessToken,
    required PageOptions<ProductStockRecap> pageOptions,
    DivisionType? divisionType,
    Product? product,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapPath,
        queryParameters: {
          'product_id.eq': product?.id,
          'division.eq': divisionType?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductStockRecap.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStockMutationRecap>> mutationRecapFetch({
    required String accessToken,
    required PageOptions<ProductStockMutationRecap> pageOptions,
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        recapPath,
        queryParameters: {
          'period_start.eq': dateStart.toUtcIso(),
          'period_end.eq': dateEnd.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ProductStockMutationRecap.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStockInitial>> fetchInit({
    required String accessToken,
    required PageOptions<ProductStockInitial> pageOptions,
    DivisionType? divisionType,
    Product? product,
    Warehouse? warehouse,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        initialPath,
        queryParameters: {
          'division.eq': divisionType?.id,
          'product_id.eq': product?.id,
          'warehouse.eq': warehouse?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        // queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductStockInitial.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ProductStockRupiah>> fetch({
    required String accessToken,
    required PageOptions<ProductStockRupiah> pageOptions,
    DateTime? date,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/recap-product-stock-rupiah',
        queryParameters: {
          'date.lte': date?.toUtc().toIso8601String(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, ProductStockRupiah.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReturnRupiah>> materialReturnRupiahFetch({
    required String accessToken,
    required PageOptions<MaterialReturnRupiah> pageOptions,
    DateTime? dateGte,
    DateTime? dateLte,
    MaterialGroup? materialGroupId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/report-rupiah-material-return',
        queryParameters: {
          'date.gte': dateGte?.toUtc().toIso8601String(),
          'date.lte': dateLte?.toUtc().toIso8601String(),
          'material_group_id': materialGroupId?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        MaterialReturnRupiah.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
