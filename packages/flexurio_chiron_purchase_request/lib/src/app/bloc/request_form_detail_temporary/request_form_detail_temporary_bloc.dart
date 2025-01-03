import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'request_form_detail_temporary_bloc.freezed.dart';

@freezed
class RequestFormDetailTemporaryEvent with _$RequestFormDetailTemporaryEvent {
  const factory RequestFormDetailTemporaryEvent.fetch() = _Fetch;
  const factory RequestFormDetailTemporaryEvent.add({
    required RequestFormDetail requestFormDetails,
  }) = _Add;
  const factory RequestFormDetailTemporaryEvent.addAll({
    required List<RequestFormDetail> requestFormDetails,
  }) = _AddAll;
  const factory RequestFormDetailTemporaryEvent.remove(String id) = _Remove;
  const factory RequestFormDetailTemporaryEvent.clear() = _Clear;
  const factory RequestFormDetailTemporaryEvent.update({
    required RequestFormDetail requestFormDetails,
    required Material material,
  }) = _Update;
}

class RequestFormDetailTemporaryBloc
    extends Bloc<RequestFormDetailTemporaryEvent, List<RequestFormDetail>> {
  RequestFormDetailTemporaryBloc() : super([]) {
    on<RequestFormDetailTemporaryEvent>((event, emit) async {
      await event.when(
        fetch: () {
          emit(List.from(state));
        },
        addAll: (requestFormDetails) {
          emit(List.from(requestFormDetails));
        },
        add: (requestFormDetails) async {
          try {
            var materialRequestDetail = RequestFormDetail(
              id: DateTime.now().millisecondsSinceEpoch,
              material: requestFormDetails.material,
              quantity: requestFormDetails.quantity,
              isFastTrack: true,
              status: RequestFormDetailStatus.temporary,
              unit: requestFormDetails.unit,
              materialType: requestFormDetails.materialType,
              materialRequest: MaterialRequest.empty(),
              materialRequestFormId: requestFormDetails.materialRequestFormId,
            );

            final newState = List<RequestFormDetail>.from(state);

            final indexExists = newState.indexWhere(
              (element) =>
                  element.temporaryKey == materialRequestDetail.temporaryKey,
            );

            if (indexExists > -1) {
              materialRequestDetail = materialRequestDetail.copyWith(
                quantity: newState[indexExists].quantity +
                    materialRequestDetail.quantity,
              );
              newState.removeAt(indexExists);
            }

            newState.add(materialRequestDetail);

            emit(newState);
          } catch (e) {
            return null;
          }
        },
        remove: (id) {
          final newState = List<RequestFormDetail>.from(state)
            ..removeWhere((element) => element.id.toString() == id);
          emit(newState);
        },
        clear: () {
          emit(List.empty());
        },
        update: (requestFormDetails, materials) async {
          try {
            final newState = List<RequestFormDetail>.from(state);
            final index = newState
                .indexWhere((element) => element.id == requestFormDetails.id);

            if (index != -1) {
              final materialOld = materials;
              newState[index] = RequestFormDetail(
                material: materialOld,
                materialType: materialOld.materialType,
                id: requestFormDetails.id,
                unit: materialOld.materialUnit,
                quantity: requestFormDetails.quantity,
                isFastTrack: requestFormDetails.isFastTrack,
                status: requestFormDetails.status,
                materialRequest: requestFormDetails.materialRequest,
                materialRequestFormId: requestFormDetails.materialRequestFormId,
              );

              emit(newState);
            }
          } catch (e) {
            return null;
          }
        },
      );
    });
  }

  List<PurchaseRequestDetail> convertToPurchaseRequestDetails(
      List<RequestFormDetail> requestFormDetails) {
    return requestFormDetails
        .map(
          PurchaseRequestDetail.fromRequestFormDetail,
        )
        .toList();
  }
}
