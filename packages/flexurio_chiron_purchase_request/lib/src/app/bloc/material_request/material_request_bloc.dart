import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_request_bloc.freezed.dart';

@freezed
class MaterialRequestState with _$MaterialRequestState {
  const factory MaterialRequestState.initial() = _Initial;
  const factory MaterialRequestState.loading() = _Loading;
  const factory MaterialRequestState.success(
    MaterialRequest materialRequest,
  ) = _Success;
  const factory MaterialRequestState.error(String error) = _Error;
}

@freezed
class MaterialRequestEvent with _$MaterialRequestEvent {
  const factory MaterialRequestEvent.create({
    required DateTime dateOfNeed,
    required MaterialGroup materialGroup,
    required Vendor? vendor,
    required String description,
    required List<PurchaseRequestDetail> materialRequestDetails,
    required String departmentId,
    required String departmentBudgetingId,
    bool? isRequestForm,
  }) = _Create;
  const factory MaterialRequestEvent.update({
    required DateTime dateOfNeed,
    required MaterialGroup materialGroup,
    required Vendor? vendor,
    required String description,
    required MaterialRequest materialRequest,
    required List<PurchaseRequestDetail> materialRequestDetails,
  }) = _Update;

  const factory MaterialRequestEvent.close(MaterialRequest id) = _Close;
  const factory MaterialRequestEvent.print({
    required MaterialRequest materialRequest,
  }) = _Print;
  const factory MaterialRequestEvent.delete(String id) = _Delete;
}

class MaterialRequestBloc
    extends Bloc<MaterialRequestEvent, MaterialRequestState> {
  MaterialRequestBloc() : super(const _Initial()) {
    on<MaterialRequestEvent>((event, emit) async {
      await event.when(
        create: (
          dateOfNeed,
          materialGroup,
          vendor,
          description,
          materialRequestDetails,
          departmentId,
          departmentBudgetingId,
          isRequestForm,
        ) async {
          emit(const _Loading());
          try {
            final materialRequest =
                await PurchaseRequestRepository.instance.materialRequestCreate(
              accessToken: UserRepositoryApp.instance.token!,
              departmentId: departmentId,
              departmentBudgetingId: departmentBudgetingId,
              dateOfNeed: dateOfNeed,
              materialGroup: materialGroup,
              vendor: vendor,
              description: description,
              isRequestForm: isRequestForm ?? false,
              isOrder: materialRequestDetails.first.isOrder,
            );

            for (final materialRequestDetail in materialRequestDetails) {
              if (materialRequestDetail.batchExpiredDate != null) {
                await ProductionOrderRepository.instance
                    .productionOrderNonProductionCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  product: materialRequestDetail.product!,
                  batchNo: materialRequestDetail.batchNo,
                  expirationDate: materialRequestDetail.batchExpiredDate!,
                  isExternal: false,
                );
              }

              await PurchaseRequestRepository.instance
                  .materialRequestDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                materialRequest: materialRequest,
                materialRequestDetail: materialRequestDetail,
              );
            }

            emit(_Success(materialRequest));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          dateOfNeed,
          materialGroup,
          vendorId,
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
              vendor: vendorId,
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
                    .materialRequestDetailCreate(
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

            emit(_Success(MaterialRequest.empty()));
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
            emit(_Success(MaterialRequest.empty()));
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
            emit(_Success(MaterialRequest.empty()));
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

            emit(_Success(MaterialRequest.empty()));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
