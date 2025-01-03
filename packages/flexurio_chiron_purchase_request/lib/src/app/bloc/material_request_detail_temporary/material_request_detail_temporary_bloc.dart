import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_request_detail_temporary_bloc.freezed.dart';

@freezed
class MaterialRequestDetailTemporaryEvent
    with _$MaterialRequestDetailTemporaryEvent {
  const factory MaterialRequestDetailTemporaryEvent.add({
    required Material? material,
    required MaterialDesign? materialDesign,
    required Product? product,
    required String? batchNo,
    required DateTime? batchExpiredDate,
    required double quantity,
    required bool isFastTrack,
    required MaterialUnit unit,
    required DateTime dueDate,
  }) = _Add;
  const factory MaterialRequestDetailTemporaryEvent.addAll({
    required List<PurchaseRequestDetail> materials,
  }) = _AddAll;
  const factory MaterialRequestDetailTemporaryEvent.remove(int id) = _Remove;
  const factory MaterialRequestDetailTemporaryEvent.clear() = _Clear;
}

class MaterialRequestDetailTemporaryBloc extends Bloc<
    MaterialRequestDetailTemporaryEvent, List<PurchaseRequestDetail>> {
  MaterialRequestDetailTemporaryBloc() : super([]) {
    on<MaterialRequestDetailTemporaryEvent>((event, emit) async {
      await event.when(
        addAll: (materialRequestDetails) {
          emit(List.from(materialRequestDetails));
        },
        add: (
          material,
          designCodeId,
          product,
          batchNo,
          batchExpiredDate,
          quantity,
          isFastTrack,
          unit,
          dueDate,
        ) async {
          try {
            var materialRequestDetail = PurchaseRequestDetail(
              id: DateTime.now().millisecondsSinceEpoch,
              batchExpiredDate: batchExpiredDate,
              material: material,
              materialDesign: designCodeId,
              batchNo: batchNo,
              product: product,
              quantity: quantity,
              isFastTrack: isFastTrack,
              status: PurchaseRequestDetailStatus.temporary,
              unit: unit,
              dueDate: dueDate,
              materialRequestFormId: '',
              createdAt: DateTime.now(),
              confirmAt: DateTime.now(),
              updatedAt: DateTime.now(),
              closeRequestFormAt: DateTime.now(),
              createdById: 0,
              updatedById: 0,
              confirmById: 0,
              closeRequestFormById: 0,
            );

            final newState = List<PurchaseRequestDetail>.from(state);

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
          final newState = List<PurchaseRequestDetail>.from(state)
            ..removeWhere((element) => element.id == id);
          emit(newState);
        },
        clear: () {
          emit(List.empty());
        },
      );
    });
  }
}
