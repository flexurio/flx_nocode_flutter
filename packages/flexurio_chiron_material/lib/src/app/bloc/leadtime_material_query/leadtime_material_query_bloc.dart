import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/leadtime_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leadtime_material_query_bloc.freezed.dart';

@freezed
class LeadtimeMaterialQueryState with _$LeadtimeMaterialQueryState {
  const factory LeadtimeMaterialQueryState.initial() = _Initial;
  const factory LeadtimeMaterialQueryState.loading() = _Loading;
  const factory LeadtimeMaterialQueryState.loaded(
    List<LeadtimeMaterial> leadtimeMaterial,
  ) = _Success;
  const factory LeadtimeMaterialQueryState.error(String error) = _Error;
}

@freezed
class LeadtimeMaterialQueryEvent with _$LeadtimeMaterialQueryEvent {
  const factory LeadtimeMaterialQueryEvent.fetch({
    required String leadtime,
    required List<MaterialGroup> listMaterialGroup,
  }) = _Fetch;
}

class LeadtimeMaterialQueryBloc extends Bloc<LeadtimeMaterialQueryEvent, LeadtimeMaterialQueryState> {
  LeadtimeMaterialQueryBloc() : super(const _Initial()) {
    on<LeadtimeMaterialQueryEvent>((event, emit) async {
      await event.when(
        fetch: (leadtime, listMaterialGroup) async {
          emit(const _Loading());
          try {
            final leadtimeMaterials = await MaterialRepository.instance.leadtimeMaterialFetch(
              accessToken: UserRepositoryApp.instance.token!,
              leadtime: leadtime,
              listMaterialGroup: listMaterialGroup,
            );
            emit(_Success(leadtimeMaterials));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
