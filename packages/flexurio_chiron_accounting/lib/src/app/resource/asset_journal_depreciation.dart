import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_journal_depreciation.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AssetJournalDepreciationRepository extends Repository {
  AssetJournalDepreciationRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final assetJournalPath = '${Api.urlApi}/asset-journals';
  static final assetDepreciationsPath = '${Api.urlApi}/asset-depreciations';

  static AssetJournalDepreciationRepository instance = AssetJournalDepreciationRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<AssetJournalDepreciation>> fetchAssetJournalDepreciation({
    required String accessToken,
    required PageOptions<AssetJournalDepreciation> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        assetJournalPath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AssetJournalDepreciation.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetJournalDepreciationCreate({
    required String accessToken,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        assetDepreciationsPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            "period_start": periodStart.toUtcIso(),
            "period_end": periodEnd.toUtcIso(),
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetJournalDepreciationDelete({
    required String accessToken,
    required AssetJournalDepreciation asset,
  }) async {
    try {
      final id = Uri.encodeComponent(asset.transactionId);
      await dio.delete<Map<String, dynamic>>(
        '$assetJournalPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
