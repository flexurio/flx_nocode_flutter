import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_material.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'request_form_material_query_bloc.freezed.dart';

@freezed
class RequestFormMaterialQueryState with _$RequestFormMaterialQueryState {
  const factory RequestFormMaterialQueryState.initial() = _Initial;
  const factory RequestFormMaterialQueryState.loading() = _Loading;
  const factory RequestFormMaterialQueryState.loaded(
    List<RequestFormMaterial> materialRequest,
  ) = _Success;
  const factory RequestFormMaterialQueryState.error(String error) = _Error;
}

@freezed
class RequestFormMaterialQueryEvent with _$RequestFormMaterialQueryEvent {
  const factory RequestFormMaterialQueryEvent.fetch({
    required MaterialGroup materialGroup,
  }) = _Fetch;
}

class RequestFormMaterialQueryBloc
    extends Bloc<RequestFormMaterialQueryEvent, RequestFormMaterialQueryState> {
  RequestFormMaterialQueryBloc() : super(const _Initial()) {
    on<RequestFormMaterialQueryEvent>((event, emit) async {
      await event.when(
        fetch: (materialGroup) async {
          emit(const _Loading());
          try {
            final materialRequestDetails = await PurchaseRequestRepository
                .instance
                .requestFormMaterialFetch(
              accessToken: UserRepositoryApp.instance.token!,
              materialGroup: materialGroup,
            );

            emit(_Success(materialRequestDetails));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
