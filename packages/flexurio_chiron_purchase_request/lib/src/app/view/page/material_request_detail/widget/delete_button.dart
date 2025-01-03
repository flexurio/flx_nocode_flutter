import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDetailTemporaryDeleteButton extends StatelessWidget {
  const MaterialRequestDetailTemporaryDeleteButton({
    required this.materialRequestDetail,
    super.key,
  });

  final PurchaseRequestDetail materialRequestDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.purchaseRequestDelete,
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    final bloc = context.read<MaterialRequestDetailTemporaryBloc>();
    final event =
        MaterialRequestDetailTemporaryEvent.remove(materialRequestDetail.id);
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.material,
          label: materialRequestDetail.material?.name ??
              materialRequestDetail.product?.name ??
              '',
          onConfirm: () {
            bloc.add(event);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
