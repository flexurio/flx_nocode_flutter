import 'package:dio/dio.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_chiron_marketing/src/app/model/marketing_area.dart';
import 'package:flexurio_chiron_marketing/src/app/model/marketing_position.dart';
import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force.dart';
import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force_ebitda.dart';
import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force_year.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';

class MarketingRepository extends Repository {
  MarketingRepository({required super.dio, required super.onUnauthorized});

  static final pathSummaryFfs = '${Api.urlApi}/summary_ffs';
  static final pathSummaryFFperYear = '${Api.urlApi}/summary_ffs_year';
  static final pathSummaryFfsYear = '${Api.urlApi}/estimation/summary_ffs';

  static MarketingRepository instance = MarketingRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<FieldForceSummary>> fieldForceSummary({
    required String accessToken,
    required String areaCode,
    required List<FieldForceSummaryCategory> categories,
    required FieldForceSummaryFlag flag,
    required DateTime periodStart,
    required DateTime periodEnd,
    String area = '',
    String dataEqual = '',
    String dataLike = '',
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathSummaryFfs,
        queryParameters: {
          'year.gte': periodStart.year,
          'month.gte': periodStart.month,
          'year.lte': periodEnd.year,
          'month.lte': periodEnd.month,
          'area_code.eq': areaCode,
          'category.in': categories.map((e) => e.value).join(','),
          'flag.eq': flag.value,
          'data.eq': dataEqual,
          'data.like': dataLike,
          'area.eq': area,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final fieldForceSummaries = <FieldForceSummary>[];
      final data = response.data!['data'] as List?;

      if (data == null) {
        return [];
      }

      for (final data in data) {
        fieldForceSummaries
            .add(FieldForceSummary.fromJson(data as Map<String, dynamic>));
      }

      return fieldForceSummaries;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SummaryFieldForceYearRaw>> summaryFieldForceReportYearFetch({
    required String accessToken,
    required int year,
    required String areaCode,
    required String jab,
    String? area,
    String? dataFlag,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSummaryFFperYear/headers',
        queryParameters: {
          'year.eq': year,
          'area_code.eq': areaCode,
          'jab_code.eq': jab,
          'area.eq': area ?? '',
          'data.eq': dataFlag ?? '',
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final summaryFieldForce = <SummaryFieldForceYearRaw>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        summaryFieldForce.add(
          SummaryFieldForceYearRaw.fromJson(data as Map<String, dynamic>),
        );
      }

      return summaryFieldForce;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SummaryFieldForceRaw>> summaryFieldForceReportFetch({
    required String accessToken,
    required int periodStart,
    required int periodEnd,
    required String areaCode,
    required String position,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathSummaryFfsYear,
        queryParameters: {
          'area_code.eq': areaCode,
          'jab_code.eq': position,
          'period_start.like': periodStart,
          'period_end.like': periodEnd,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final summaryFieldForce = <SummaryFieldForceRaw>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        summaryFieldForce
            .add(SummaryFieldForceRaw.fromJson(data as Map<String, dynamic>));
      }

      return summaryFieldForce;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<SummaryFieldForceEbitdaRaw>> summaryFieldForceReportFetchEbitda({
    required String accessToken,
    required int periodStart,
    required int periodEnd,
    required String areaCode,
    required String jab,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSummaryFfs/ebitda_marketing',
        queryParameters: {
          'area_code.eq': areaCode,
          'jab_code.eq': jab,
          'period_start.like': periodStart,
          'period_end.like': periodEnd,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final summaryFieldForce = <SummaryFieldForceEbitdaRaw>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        summaryFieldForce.add(
          SummaryFieldForceEbitdaRaw.fromJson(data as Map<String, dynamic>),
        );
      }

      return summaryFieldForce;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MarketingArea>> marketingAreaFetch({
    required String accessToken,
    required String jab,
  }) async {
    try {
      final year = DateFormat('yyyy').format(DateTime.now());
      final month = DateFormat('MM').format(DateTime.now());
      final response = await dio.get<Map<String, dynamic>>(
        '$pathSummaryFFperYear/structure',
        queryParameters: {
          'tahun.eq': year,
          'bulan.eq': month,
          'jab_kode.eq': jab,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final marketingArea = <MarketingArea>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        marketingArea.add(MarketingArea.fromJson(data as Map<String, dynamic>));
      }

      return marketingArea;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MarketingPosition>> marketingPositionFetch({
    required String accessToken,
  }) async {
    try {
      final now = DateFormat('yyyyMM').format(DateTime.now());
      final response = await dio.get<Map<String, dynamic>>(
        'https://api-mkt.farmasys.com/marketings/positions?period.eq=$now',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final marketingArea = <MarketingPosition>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        marketingArea
            .add(MarketingPosition.fromJson(data as Map<String, dynamic>));
      }

      return marketingArea;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
