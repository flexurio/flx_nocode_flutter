import 'package:dio/dio.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_depreciation.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AssetRepository extends Repository {
  AssetRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final assetDepreciationPath =
      '${Api.urlApi}/asset-depreciation-reports';

  static AssetRepository instance = AssetRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<PageOptions<AssetDepreciation>> depreciationFetch({
    required String accessToken,
    required PageOptions<AssetDepreciation> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        assetDepreciationPath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AssetDepreciation.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
