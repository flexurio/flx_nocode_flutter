import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderAccountingRejectButton extends StatelessWidget {
  const PurchaseOrderAccountingRejectButton({
    required this.purchaseOrder,
    required this.isLoading,
    super.key,
  });

  final PurchaseOrder purchaseOrder;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.accountingReject;
    return Button(
      permission: null,
      isInProgress: isLoading,
      color: Colors.red,
      action: action,
      onPressed: () async {
        final bloc = context.read<PurchaseOrderBloc>();
        await _showDialog(bloc: bloc, context: context, action: action);
      },
    );
  }

  Future<bool?> _showDialog({
    required BuildContext context,
    required PurchaseOrderBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.purchaseOrder;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardConfirmationWithExplanation(
          isProgress: false,
          action: action,
          data: entity,
          label: purchaseOrder.id,
          onConfirm: (explanation) {
            bloc.add(
              PurchaseOrderEvent.accountingReject(
                purchaseOrder,
                explanation,
              ),
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
