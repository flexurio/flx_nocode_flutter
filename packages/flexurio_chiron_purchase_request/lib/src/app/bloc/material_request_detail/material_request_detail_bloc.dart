import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_request_detail_bloc.freezed.dart';

@freezed
class MaterialRequestDetailState with _$MaterialRequestDetailState {
  const factory MaterialRequestDetailState.initial() = _Initial;
  const factory MaterialRequestDetailState.loading() = _Loading;
  const factory MaterialRequestDetailState.success() = _Success;
  const factory MaterialRequestDetailState.error(String error) = _Error;
}

@freezed
class MaterialRequestDetailEvent with _$MaterialRequestDetailEvent {
  const factory MaterialRequestDetailEvent.confirm(
    List<PurchaseRequestDetail> materialRequestDetail,
    MaterialGroup? materialGroup,
  ) = _Close;
  const factory MaterialRequestDetailEvent.reject(
    List<PurchaseRequestDetail> materialRequestDetail,
    String reason,
  ) = _Reject;
  const factory MaterialRequestDetailEvent.undoConfirm(
    List<PurchaseRequestDetail> materialRequestDetail,
  ) = _UndoConfirm;
  const factory MaterialRequestDetailEvent.rejectManager(
    List<PurchaseRequestDetail> materialRequestDetail,
    String reason,
  ) = _RejectManager;
  const factory MaterialRequestDetailEvent.delete(
    RequestFormDetail materialRequestDetail,
  ) = _Delete;
  const factory MaterialRequestDetailEvent.close(
    String materialRequestDetail,
  ) = _Closer;
}

class MaterialRequestDetailBloc
    extends Bloc<MaterialRequestDetailEvent, MaterialRequestDetailState> {
  MaterialRequestDetailBloc() : super(const _Initial()) {
    on<MaterialRequestDetailEvent>((event, emit) async {
      await event.when(
        confirm: (materialRequestDetails, materialGroup) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance
                .materialRequestDetailConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetails,
              materialGroup: materialGroup,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        reject: (materialRequestDetail, reason) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance
                .materialRequestDetailReject(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetail,
              reason: reason,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        undoConfirm: (materialRequestDetail) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance
                .materialRequestDetailUndoConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetail,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rejectManager: (materialRequestDetail, reason) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance
                .materialRequestDetailRejectManager(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetail,
              reason: reason,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (materialRequestDetail) async {
          emit(const _Loading());
          try {
            // await MaterialRequestRepository.instance.materialRequestDetailDelete(
            //   accessToken: UserRepository.instance.token!,
            //   materialRequestDetail: materialRequestDetail,
            // );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        close: (materialRequestDetail) async {
          emit(const _Loading());
          try {
            // await MaterialRequestRepository.instance.materialRequestDetailClose(
            //   accessToken: UserRepository.instance.token!,
            //   materialRequestDetail: materialRequestDetail,
            // );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
