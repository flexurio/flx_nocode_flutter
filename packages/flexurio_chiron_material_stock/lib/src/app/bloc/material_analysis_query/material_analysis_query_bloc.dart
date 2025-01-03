import 'package:flexurio_chiron_material_stock/src/app/model/material_analysis.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/resource/material_analysis.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_analysis_query_bloc.freezed.dart';

@freezed
class MaterialAnalysisQueryState with _$MaterialAnalysisQueryState {
  const factory MaterialAnalysisQueryState.initial() = _Initial;
  const factory MaterialAnalysisQueryState.loading() = _Loading;
  const factory MaterialAnalysisQueryState.loaded(
    List<MaterialAnalysis> materialAnalysis,
  ) = _Loaded;
  const factory MaterialAnalysisQueryState.error(String error) = _Error;
}

@freezed
class MaterialAnalysisQueryEvent with _$MaterialAnalysisQueryEvent {
  const factory MaterialAnalysisQueryEvent.fetch({
    String? barcodeNo,
  }) = _Fetch;
}

class MaterialAnalysisQueryBloc
    extends Bloc<MaterialAnalysisQueryEvent, MaterialAnalysisQueryState> {
  MaterialAnalysisQueryBloc() : super(const _Initial()) {
    on<MaterialAnalysisQueryEvent>((event, emit) async {
      await event.when(
        fetch: (barcodeNo) async {
          emit(_Loading());
          try {
            var response;
            List<MaterialAnalysis> materialAnalysis = [];
            if (barcodeNo != null) {
              response = await MaterialAnalysisRepository.instance
                  .materialAnalysisFetchById(
                      accessToken: UserRepositoryApp.instance.token!,
                      barcodeNo: barcodeNo);
              materialAnalysis.add(response);
            } else {
              response = await MaterialAnalysisRepository.instance
                  .materialAnalysisFetch(
                      accessToken: UserRepositoryApp.instance.token!);
              materialAnalysis = response;
            }
            emit(_Loaded(materialAnalysis));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
