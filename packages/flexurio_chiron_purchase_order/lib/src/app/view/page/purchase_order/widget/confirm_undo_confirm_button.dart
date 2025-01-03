import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderUndoConfirmButton extends StatelessWidget {
  const PurchaseOrderUndoConfirmButton._({
    required this.purchaseOrder,
  });

  static Widget prepare({
    required PurchaseOrder purchaseOrder,
  }) {
    return BlocProvider(
      create: (context) => PurchaseOrderBloc(),
      child: PurchaseOrderUndoConfirmButton._(purchaseOrder: purchaseOrder),
    );
  }

  final PurchaseOrder purchaseOrder;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.undoConfirm;
    return IconButtonSmall(
      permission: PermissionPurchaseOrder.purchaseOrderConfirm,
      action: action,
      onPressed: () async {
        final bloc = context.read<PurchaseOrderBloc>();
        final queryBloc = context.read<PurchaseOrderQueryBloc>();
        final success = await _showDeleteDialog(
          bloc: bloc,
          context: context,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(const PurchaseOrderQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required PurchaseOrderBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.purchaseOrder;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: purchaseOrder.id,
                onConfirm: () {
                  bloc.add(PurchaseOrderEvent.undoConfirm(purchaseOrder));
                },
              );
            },
          ),
        );
      },
    );
  }
}
