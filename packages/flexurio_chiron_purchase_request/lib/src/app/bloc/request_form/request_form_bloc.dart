import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_hit.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'request_form_bloc.freezed.dart';

@freezed
class RequestFormState with _$RequestFormState {
  const factory RequestFormState.initial() = _Initial;
  const factory RequestFormState.loading() = _Loading;
  const factory RequestFormState.success() = _Success;
  const factory RequestFormState.error(String error) = _Error;
}

@freezed
class RequestFormEvent with _$RequestFormEvent {
  const factory RequestFormEvent.create({
    required DateTime dateOfNeed,
    required MaterialGroup materialGroup,
    required String description,
    required List<RequestFormDetail> materialRequestDetails,
    MaterialRequestHit? materialRequestHit,
    bool? isRequestForm,
    Department? department,
  }) = _Create;
  const factory RequestFormEvent.update({
    required DateTime dateOfNeed,
    required MaterialGroup materialGroup,
    required String description,
    required MaterialRequest materialRequest,
    required List<RequestFormDetail> materialRequestDetails,
  }) = _Update;

  const factory RequestFormEvent.close(MaterialRequest id) = _Close;
  const factory RequestFormEvent.print({
    required MaterialRequest materialRequest,
  }) = _Print;
  const factory RequestFormEvent.delete(String id) = _Delete;
}

class RequestFormBloc extends Bloc<RequestFormEvent, RequestFormState> {
  RequestFormBloc() : super(const _Initial()) {
    on<RequestFormEvent>((event, emit) async {
      await event.when(
        create: (
          dateOfNeed,
          materialGroup,
          description,
          materialRequestDetails,
          materialRequestHit,
          isRequestForm,
          department,
        ) async {
          emit(const _Loading());
          try {
            final departmentId =
                (department ?? UserRepositoryApp.instance.department!).id;
            final materialRequest =
                await PurchaseRequestRepository.instance.materialRequestCreate(
              accessToken: UserRepositoryApp.instance.token!,
              departmentId: departmentId,
              departmentBudgetingId: departmentId,
              dateOfNeed: dateOfNeed,
              materialGroup: materialGroup,
              description: description,
              isRequestForm: isRequestForm ?? true,
              isOrder: true,
            );
            for (final materialRequestDetail in materialRequestDetails) {
              await PurchaseRequestRepository.instance.requestFormDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                materialRequest: materialRequest,
                materialRequestDetail: materialRequestDetail,
              );
            }

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          dateOfNeed,
          materialGroup,
          description,
          materialRequest,
          materialRequestDetails,
        ) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.materialRequestUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              dateOfNeed: dateOfNeed,
              materialGroup: materialGroup,
              department: UserRepositoryApp.instance.department!,
              description: description,
              materialRequest: materialRequest,
            );

            await PurchaseRequestRepository.instance.materialRequestsDeleteAll(
              accessToken: UserRepositoryApp.instance.token!,
              id: materialRequest.id,
            );

            if (materialRequestDetails.isNotEmpty) {
              for (final materialRequestDetail in materialRequestDetails) {
                await PurchaseRequestRepository.instance
                    .requestFormDetailCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  materialRequest: materialRequest,
                  materialRequestDetail: materialRequestDetail,
                );
              }
            } else {
              await PurchaseRequestRepository.instance.materialRequestDelete(
                accessToken: UserRepositoryApp.instance.token!,
                materialRequest: materialRequest,
              );
            }

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        close: (materialRequest) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.materialRequestClose(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequest: materialRequest,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        print: (materialRequest) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.materialRequestPrint(
              accessToken: UserRepositoryApp.instance.token!,
              materialRequest: materialRequest,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await PurchaseRequestRepository.instance.materialRequestsDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
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
