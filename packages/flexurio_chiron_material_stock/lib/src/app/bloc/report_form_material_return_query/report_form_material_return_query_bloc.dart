import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/report_form_material_return.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'report_form_material_return_query_bloc.freezed.dart';

@freezed
class ReportFormMaterialReturnQueryState with _$ReportFormMaterialReturnQueryState {
  factory ReportFormMaterialReturnQueryState.initial() = _Initial;
  factory ReportFormMaterialReturnQueryState.loading() = _Loading;
  factory ReportFormMaterialReturnQueryState.loaded({
    required List<ReportFormMaterialReturn> ReportFormMaterialReturns,
  }) = _Loaded;
  factory ReportFormMaterialReturnQueryState.error(String error) = _Error;
}

@freezed
class ReportFormMaterialReturnQueryEvent with _$ReportFormMaterialReturnQueryEvent {
  factory ReportFormMaterialReturnQueryEvent.fetch({
    required MaterialReturn materialReturn,
    required bool isExternal,
  }) = _Fetch;
}

class ReportFormMaterialReturnQueryBloc extends Bloc<ReportFormMaterialReturnQueryEvent,
    ReportFormMaterialReturnQueryState> {
  ReportFormMaterialReturnQueryBloc() : super(_Initial()) {
    on<ReportFormMaterialReturnQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (materialReturn, isExternal) async {
            emit(_Loading());
            try {
              final ReportFormMaterialReturns =
                  await MaterialRepository.instance.reportFormMaterialReturn(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturn: materialReturn,
                isExternal: isExternal,
              );
              emit(_Loaded(ReportFormMaterialReturns: ReportFormMaterialReturns));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
