import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'request_form_detail_bloc.freezed.dart';

@freezed
class RequestFormDetailState with _$RequestFormDetailState {
  const factory RequestFormDetailState.initial() = _Initial;
  const factory RequestFormDetailState.loading() = _Loading;
  const factory RequestFormDetailState.success() = _Success;
  const factory RequestFormDetailState.error(String error) = _Error;
}

@freezed
class RequestFormDetailEvent with _$RequestFormDetailEvent {
  const factory RequestFormDetailEvent.confirm(
    List<RequestFormDetail> materialRequestDetail,
    MaterialGroup? materialGroup,
    MaterialRequest? materialRequest,
  ) = _Confirm;

  const factory RequestFormDetailEvent.reject(
    List<RequestFormDetail> materialRequestDetail,
    String reason,
  ) = _Reject;

  const factory RequestFormDetailEvent.delete(
    RequestFormDetail materialRequestDetail,
  ) = _Delete;

  const factory RequestFormDetailEvent.closeList({
    required List<RequestFormDetail> materialRequestDetail,
  }) = _CloseList;

  const factory RequestFormDetailEvent.close(
    RequestFormDetail materialRequestDetail,
  ) = _Close;

  const factory RequestFormDetailEvent.update({
    required RequestFormDetail requestFormDetail,
    required Material material,
  }) = _Update;

  const factory RequestFormDetailEvent.approveManager(
    List<RequestFormDetail> requestFormDetail,
  ) = _ApproveManager;
}

class RequestFormDetailBloc
    extends Bloc<RequestFormDetailEvent, RequestFormDetailState> {
  RequestFormDetailBloc() : super(const _Initial()) {
    on<RequestFormDetailEvent>((event, emit) async {
      await event.when(
        confirm: (materialRequestDetail, materialGroup, materialRequest) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.requestFormDetailConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetail,
              materialGroup: materialGroup,
              materialRequest: materialRequest,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        reject: (materialRequestDetail, reason) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.requestFormDetailReject(
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
            await PurchaseRequestRepository.instance.requestFormDetailDelete(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetails: materialRequestDetail,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        closeList: (materialRequestDetail) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.requestFormDetailCloseAll(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetail,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        close: (materialRequestDetail) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.requestFormDetailClose(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequestDetail: materialRequestDetail,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (requestFormDetail, material) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.requestFormDetailUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              requestFormDetail: requestFormDetail,
              material: material,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveManager: (requestFormDetail) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.requestFormDetailApprove(
              accessToken: UserRepositoryApp.instance.token!,
              requestFormDetail: requestFormDetail,
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
