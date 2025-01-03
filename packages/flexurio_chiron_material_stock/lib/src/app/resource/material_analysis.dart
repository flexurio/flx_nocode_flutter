import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_analysis.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class MaterialAnalysisRepository extends Repository {
  MaterialAnalysisRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final materialAnalysisPath = '${Api.urlApi}/material-analysis';

  static MaterialAnalysisRepository instance = MaterialAnalysisRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<MaterialAnalysis> materialAnalysisFetchById({
    required String accessToken,
    required String barcodeNo,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$materialAnalysisPath/$barcodeNo',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final data = response.data!['data'];

      return MaterialAnalysis.fromJson(data as Map<String, dynamic>);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialAnalysis>> materialAnalysisFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialAnalysisPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialAnalysis = <MaterialAnalysis>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialAnalysis
            .add(MaterialAnalysis.fromJson(data as Map<String, dynamic>));
      }

      return materialAnalysis;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialAnalysisUpdate({
    required String accessToken,
    required String barcodeNo,
    required double? qtySample,
    required int? qtyPackTotal,
    required int? qtyPackOpened,
    required double? qtyRetainSample,
    required double? assay,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialAnalysisPath/$barcodeNo',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            "qty_sample": qtySample ?? 0,
            "qty_pack_opened": qtyPackOpened ?? 0,
            "qty_pack_total": qtyPackTotal ?? 0,
            "qty_retain_sample": qtyRetainSample ?? 0,
            "assay": assay ?? 0,
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
