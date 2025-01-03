import 'package:dio/dio.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class FieldForceSummaryRepository extends Repository {
  FieldForceSummaryRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final fieldForceSummary = '${Api.urlApi}/field-force-summary-ffs';

  static FieldForceSummaryRepository instance = FieldForceSummaryRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<FieldForceSummary>> fetch({
    required String accessToken,
    required DateTime dateStart,
    required DateTime dateEnd,
    required List<FieldForceSummaryCategory> categories,
    required String categorySub,
    MarketingPositionE? position,
    String? flag1,
    String? flag2,
    String? flag3,
    String? flag4,
    String? flag5,
    String? areaCode,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        fieldForceSummary,
        queryParameters: {
          'year.gte': dateStart.year,
          'month.gte': dateStart.month,
          'year.lte': dateEnd.year,
          'month.lte': dateEnd.month,
          'area_code.eq': areaCode,
          'jab_code.eq': position?.id,
          'category.in': categories.map((e) => e.value).toList().join(','),
          'category_sub.eq': categorySub,
          'flag1.in': flag1,
          'flag2.eq': flag2,
          'flag3.eq': flag3,
          'flag4.eq': flag4 ?? 'ALL',
          'flag5.eq': flag5 ?? 'ALL',
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final fieldForceSummaries = <FieldForceSummary>[];
      final data = response.data!['data'] as List?;

      if (data == null) return fieldForceSummaries;

      for (final data in data) {
        fieldForceSummaries
            .add(FieldForceSummary.fromJson(data as Map<String, dynamic>));
      }

      return fieldForceSummaries
        ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
