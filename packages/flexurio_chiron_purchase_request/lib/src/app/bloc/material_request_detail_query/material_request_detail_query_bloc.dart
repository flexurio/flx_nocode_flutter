import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/material_request_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_request_detail_query_bloc.freezed.dart';

@freezed
class MaterialRequestDetailQueryState with _$MaterialRequestDetailQueryState {
  const factory MaterialRequestDetailQueryState.initial() = _Initial;
  const factory MaterialRequestDetailQueryState.loading() = _Loading;
  const factory MaterialRequestDetailQueryState.loaded(
    List<PurchaseRequestDetail> materialRequest,
  ) = _Success;
  const factory MaterialRequestDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialRequestDetailQueryEvent with _$MaterialRequestDetailQueryEvent {
  const factory MaterialRequestDetailQueryEvent.fetch({
    required MaterialRequest materialRequest,
    PurchaseRequestDetailStatus? status,
  }) = _Fetch;
  const factory MaterialRequestDetailQueryEvent.print({
    DateTime? periodStart,
    DateTime? periodEnd,
    List<MaterialGroup>? materialGroupIdIn,
    List<Department>? departmentIdIn,
    bool? isRequestForm,
  }) = _Print;
  const factory MaterialRequestDetailQueryEvent.fetchAll({
    PurchaseRequestStatus? status,
    Department? department,
    MaterialGroup? materialGroup,
    List<Department>? departmentIdIn,
  }) = _FetchAll;
}

class MaterialRequestDetailQueryBloc extends Bloc<
    MaterialRequestDetailQueryEvent, MaterialRequestDetailQueryState> {
  MaterialRequestDetailQueryBloc() : super(const _Initial()) {
    on<MaterialRequestDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (purchaseRequest, status) async {
          emit(const _Loading());
          try {
            final purchaseRequestDetails = await PurchaseRequestRepository
                .instance
                .purchaseRequestDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseRequestId: purchaseRequest.id,
              status: status,
            );
            emit(_Success(purchaseRequestDetails));
          } catch (error) {
            emit(_Error(errorMessage(error)));
            print(error);
          }
        },
        print: (
          periodStart,
          periodEnd,
          materialGroupIdIn,
          departmentIdIn,
          isRequestForm,
        ) async {
          emit(const _Loading());
          try {
            final printPurchaseRequestDetails = await PurchaseRequestRepository
                .instance
                .purchaseRequestDetailPrintFetch(
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              materialGroupIdIn: materialGroupIdIn,
              departmentIdIn: departmentIdIn,
              isRequestForm: isRequestForm,
            );
            emit(_Success(printPurchaseRequestDetails));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchAll: (status, department, materialGroup, departmentIdIn) async {
          emit(const _Loading());
          try {
            if (department != null) {
              _department = department;
            }
            final purchaseRequestDetails = await PurchaseRequestRepository
                .instance
                .purchaseRequestAllDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              department: _department,
              status: status,
              materialGroup: materialGroup,
              departmentIdIn: departmentIdIn,
            );

            emit(_Success(purchaseRequestDetails));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  Department? _department;
}
