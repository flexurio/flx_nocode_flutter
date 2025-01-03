import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailTemporaryRemoveButton extends StatelessWidget {
  const MaterialReceiveDetailTemporaryRemoveButton._({
    required this.purchaseOrderDetail,
    required this.onRemoveDetail,
    required this.isExternal,
  });

  final PurchaseOrderDetail purchaseOrderDetail;
  final void Function() onRemoveDetail;
  final bool isExternal;

  static Widget prepare({
    required PurchaseOrderDetail purchaseOrderDetail,
    required void Function() onRemoveDetail,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => PurchaseOrderDetailTemporaryBloc(),
      child: MaterialReceiveDetailTemporaryRemoveButton._(
        purchaseOrderDetail: purchaseOrderDetail,
        onRemoveDetail: onRemoveDetail,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialReceiveDetailDelete(
          isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () async {
        await _showRemoveDialog(context: context);
      },
    );
  }

  Future<bool?> _showRemoveDialog({
    required BuildContext context,
  }) {
    final bloc = context.read<PurchaseOrderDetailTemporaryBloc>();
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialReceive;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: entity,
          onConfirm: () {
            bloc.add(
              PurchaseOrderDetailTemporaryEvent.remove(
                id: purchaseOrderDetail.id,
              ),
            );
            onRemoveDetail();
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
