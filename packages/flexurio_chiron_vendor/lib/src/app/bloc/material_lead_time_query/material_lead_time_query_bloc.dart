import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_lead_time_query_bloc.freezed.dart';

@freezed
class MaterialLeadTimeQueryState with _$MaterialLeadTimeQueryState {
  const factory MaterialLeadTimeQueryState.initial() = _Initial;
  const factory MaterialLeadTimeQueryState.loading() = _Loading;
  const factory MaterialLeadTimeQueryState.loaded(
    List<MaterialSupplierLeadTime> leadTimes,
  ) = _Success;
  const factory MaterialLeadTimeQueryState.error(String error) = _Error;
}

@freezed
class MaterialLeadTimeQueryEvent with _$MaterialLeadTimeQueryEvent {
  const factory MaterialLeadTimeQueryEvent.fetch({
    Material? material,
  }) = _Fetch;
}

class MaterialLeadTimeQueryBloc
    extends Bloc<MaterialLeadTimeQueryEvent, MaterialLeadTimeQueryState> {
  MaterialLeadTimeQueryBloc() : super(const _Initial()) {
    on<MaterialLeadTimeQueryEvent>((event, emit) async {
      await event.when(
        fetch: (material) async {
          emit(const _Loading());
          try {
            final materials =
                await MaterialRepository.instance.materialSupplierFetch(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
            );
            emit(_Success(materials));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
