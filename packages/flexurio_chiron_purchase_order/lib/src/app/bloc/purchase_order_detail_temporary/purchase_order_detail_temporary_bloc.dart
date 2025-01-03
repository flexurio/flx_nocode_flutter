import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_detail_temporary_bloc.freezed.dart';

@freezed
class PurchaseOrderDetailTemporaryEvent
    with _$PurchaseOrderDetailTemporaryEvent {
  const factory PurchaseOrderDetailTemporaryEvent.add({
    required Material? material,
    required MaterialUnit materialUnit,
    required double quantity,
    required MaterialDesign design,
    required ProductionOrder batch,
    required bool ignoreDuplicate,
  }) = _Add;
  const factory PurchaseOrderDetailTemporaryEvent.addAll({
    required List<PurchaseOrderDetail> purchaseOrderDetails,
  }) = _AddAll;
  const factory PurchaseOrderDetailTemporaryEvent.remove({required int id}) =
      _Remove;
  const factory PurchaseOrderDetailTemporaryEvent.removeByIndex(
      {required int index}) = _RemoveByIndex;
  const factory PurchaseOrderDetailTemporaryEvent.clear() = _Clear;
}

class PurchaseOrderDetailTemporaryBloc
    extends Bloc<PurchaseOrderDetailTemporaryEvent, List<PurchaseOrderDetail>> {
  PurchaseOrderDetailTemporaryBloc() : super([]) {
    on<PurchaseOrderDetailTemporaryEvent>((event, emit) async {
      await event.when(
        addAll: (purchaseOrderDetails) {
          emit(List.from(purchaseOrderDetails));
        },
        add: (
          material,
          materialUnit,
          quantity,
          design,
          batch,
          ignoreDuplicate,
        ) async {
          try {
            var purchaseOrderDetail = PurchaseOrderDetail.empty().copyWith(
              productionOrder: batch,
              material: material,
              unit: materialUnit,
              quantity: quantity,
              materialDesign: design,
            );
            final newState = List<PurchaseOrderDetail>.from(state);
            final indexExist = newState.indexWhere(
              (element) =>
                  element.temporaryKey == purchaseOrderDetail.temporaryKey,
            );

            if (!ignoreDuplicate && indexExist > -1) {
              purchaseOrderDetail = purchaseOrderDetail.copyWith(
                quantity: newState[indexExist].quantity +
                    purchaseOrderDetail.quantity,
              );
              newState.removeAt(indexExist);
            }

            newState.add(purchaseOrderDetail);
            emit(newState);
          } catch (error) {
            return null;
          }
        },
        remove: (id) {
          final newState = List<PurchaseOrderDetail>.from(state)
            ..removeWhere((element) => element.id == id);
          emit(newState);
        },
        removeByIndex: (index) {
          final newState = List<PurchaseOrderDetail>.from(state)
            ..removeAt(index);
          emit(newState);
        },
        clear: () {
          emit(List.empty());
        },
      );
    });
  }
}
