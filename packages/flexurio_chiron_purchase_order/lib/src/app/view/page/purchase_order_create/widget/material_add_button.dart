import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/material_add_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.initialQuantity,
    super.key,
  });

  final double initialQuantity;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.purchaseOrder,
      onPressed: () => _showCreateDialog(context),
    );
  }

  Future<void> _showCreateDialog(BuildContext context) async {
    final temporaryBloc = context.read<MaterialRequestDetailTemporaryBloc>();
    final materialRequestDetail = await showDialog<PurchaseRequestDetail?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            MaterialAddForm.prepare(initialQuantity),
          ],
        );
      },
    );
    if (materialRequestDetail != null) {
      temporaryBloc.add(
        MaterialRequestDetailTemporaryEvent.add(
          unit: materialRequestDetail.material!.materialUnit,
          material: materialRequestDetail.material,
          materialDesign: materialRequestDetail.materialDesign,
          product: materialRequestDetail.product,
          batchNo: materialRequestDetail.batchNo,
          quantity: materialRequestDetail.quantity,
          isFastTrack: materialRequestDetail.isFastTrack,
          dueDate: materialRequestDetail.dueDate,
          batchExpiredDate: materialRequestDetail.batchExpiredDate,
        ),
      );
    }
  }
}
