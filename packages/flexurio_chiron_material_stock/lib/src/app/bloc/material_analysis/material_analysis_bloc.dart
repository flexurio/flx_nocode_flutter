import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/resource/material_analysis.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_analysis_bloc.freezed.dart';

@freezed
class MaterialAnalysisState with _$MaterialAnalysisState {
  const factory MaterialAnalysisState.initial() = _Initial;
  const factory MaterialAnalysisState.loading() = _Loading;
  const factory MaterialAnalysisState.success() = _Success;
  const factory MaterialAnalysisState.error(String error) = _Error;
}

@freezed
class MaterialAnalysisEvent with _$MaterialAnalysisEvent {
  const factory MaterialAnalysisEvent.create({
    required String? materialReceiveId,
    required String? supplierId,
    required String? materialGroupId,
    required String? materialId,
    required String? materialUnitId,
    required String? batchNo,
    required double? density,
    required double? qtySample,
    required DateTime? samplingDate,
    required int? samplingBy,
    required double? qtyRetainSample,
    required DateTime? retainSamplingDate,
    required int? retainSamplingBy,
    required int? qtyPackOpened,
    required int? qtyPackTotal,
    required String? na,
    required double? assay,
    required String? warehouse,
    required DateTime? microbiologyReleaseDate,
    required int? microbiologyReleaseBy,
    required bool? coaAvailability,
    required DateTime? materialReceiptDate,
  }) = _Create;
  const factory MaterialAnalysisEvent.update({
    required String barcodeNo,
    required double? qtySample,
    required double? qtyRetainSample,
    required int? qtyPackOpened,
    required int? qtyPackTotal,
    required double? assay,
  }) = _Update;
}

class MaterialAnalysisBloc
    extends Bloc<MaterialAnalysisEvent, MaterialAnalysisState> {
  MaterialAnalysisBloc() : super(const _Initial()) {
    on<MaterialAnalysisEvent>((event, emit) async {
      await event.when(
        create: (
          materialReceiveId,
          supplierId,
          materialGroupId,
          materialId,
          materialUnitId,
          batchNo,
          density,
          qtySample,
          samplingDate,
          samplingBy,
          qtyRetainSample,
          retainSamplingDate,
          retainSamplingBy,
          qtyPackOpened,
          qtyPackTotal,
          na,
          assay,
          warehouse,
          microbiologyReleaseDate,
          microbiologyReleaseBy,
          coaAvailability,
          materialReceiptDate,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialAnalysisCreate(
              accessToken: UserRepositoryApp.instance.token!,
              materialReceiveId: materialReceiveId,
              supplierId: supplierId,
              materialGroupId: materialGroupId,
              materialId: materialId,
              materialUnitId: materialUnitId,
              batchNo: batchNo,
              density: density,
              qtySample: qtySample,
              samplingDate: samplingDate,
              samplingBy: samplingBy,
              qtyRetainSample: qtyRetainSample,
              retainSamplingDate: retainSamplingDate,
              retainSamplingBy: retainSamplingBy,
              qtyPackOpened: qtyPackOpened,
              qtyPackTotal: qtyPackTotal,
              na: na,
              assay: assay,
              warehouse: warehouse,
              microbiologyReleaseDate: microbiologyReleaseDate,
              microbiologyReleaseBy: microbiologyReleaseBy,
              coaAvailability: coaAvailability,
              materialReceiptDate: materialReceiptDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          barcodeNo,
          qtySample,
          qtyRetainSample,
          qtyPackOpened,
          qtyPackTotal,
          assay,
        ) async {
          emit(const _Loading());
          try {
            await MaterialAnalysisRepository.instance.materialAnalysisUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              barcodeNo: barcodeNo,
              qtySample: qtySample,
              qtyRetainSample: qtyRetainSample,
              qtyPackOpened: qtyPackOpened,
              qtyPackTotal: qtyPackTotal,
              assay: assay,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
