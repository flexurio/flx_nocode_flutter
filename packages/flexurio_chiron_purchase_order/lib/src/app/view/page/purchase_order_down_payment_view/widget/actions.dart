import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/permission.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_down_payment_view/purchase_order_down_payment_view_page.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_view/widget/reject_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseOrderActions extends StatelessWidget {
  const PurchaseOrderActions({
    Key? key,
    required this.purchaseOrder,
    required this.isLoading,
    required this.purchaseOrderBloc,
    required this.onPrevious,
    required this.onFinish,
  }) : super(key: key);
  final PurchaseOrder? purchaseOrder;
  final bool isLoading;
  final PurchaseOrderBloc purchaseOrderBloc;
  final void Function() onPrevious;
  final void Function() onFinish;

  @override
  Widget build(BuildContext context) {
    Future<bool?> showDialogClosePurchaseOrder(
      BuildContext context,
      PurchaseOrderBloc bloc,
    ) {
      final entity = Entity.purchaseOrder;
      const action = DataAction.closePO;
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
                  label: purchaseOrder!.id,
                  onConfirm: () {
                    bloc.add(PurchaseOrderEvent.close(purchaseOrder!));
                  },
                );
              },
            ),
          );
        },
      );
    }

    Widget buildButtonClose() => LightButton(
          permission: PermissionPurchaseOrder.purchaseOrderClose,
          isInProgress: isLoading,
          action: DataAction.closePO,
          onPressed: () async {
            await showDialogClosePurchaseOrder(context, purchaseOrderBloc);
          },
        );

    Widget buildButtonPrevious() => Button(
          permission: null,
          isSecondary: true,
          isInProgress: isLoading,
          action: DataAction.back,
          onPressed: () {
            onPrevious();
          },
        );

    Widget buildButtonFinish() => Button(
          permission: null,
          isInProgress: isLoading,
          action: DataAction.finish,
          onPressed: () {
            onFinish();
          },
        );

    Widget buildButtonConfirm() => LightButton(
          permission: PermissionPurchaseOrder.purchaseOrderConfirm,
          isInProgress: isLoading,
          action: DataAction.confirm,
          onPressed: () {
            purchaseOrderBloc.add(PurchaseOrderEvent.confirm(purchaseOrder!));
          },
        );

    Widget buildButtonUndoConfirm() => LightButton(
          permission: PermissionPurchaseOrder.purchaseOrderConfirm,
          isInProgress: isLoading,
          action: DataAction.undoConfirm,
          onPressed: () {
            purchaseOrderBloc
                .add(PurchaseOrderEvent.undoConfirm(purchaseOrder!));
          },
        );

    Widget buildButtonViewDownPayment() => LightButton(
          permission: PermissionPurchaseOrder.purchaseOrderDownPaymentViewMenu,
          isInProgress: isLoading,
          action: DataAction.view,
          entity: Entity.purchaseOrderDownPayment,
          onPressed: () {
            if (purchaseOrder == null) {
              Toast(context)
                  .fail(ErrorMessage.fieldNotFound(Entity.purchaseOrder.title));
              return;
            }

            Navigator.push(
              context,
              PurchaseOrderDownPaymentViewPage.route(
                purchaseOrder: purchaseOrder!,
              ),
            );
          },
        );

    Widget buildButtonAccountingReject() => PurchaseOrderAccountingRejectButton(
          purchaseOrder: purchaseOrder!,
          isLoading: isLoading,
        );
    Widget buildButtonAccountingConfirm() => LightButton(
          permission: PermissionPurchaseOrder.purchaseOrderConfirmAccounting,
          isInProgress: isLoading,
          action: DataAction.accountingConfirm,
          onPressed: () {
            purchaseOrderBloc.add(
              PurchaseOrderEvent.accountingConfirm(purchaseOrder!),
            );
          },
        );

    Widget buildButtonUndoConfirmAccounting() => LightButton(
          permission: PermissionPurchaseOrder.purchaseOrderConfirmAccounting,
          isInProgress: isLoading,
          action: DataAction.undoConfirmAccounting,
          onPressed: () {
            purchaseOrderBloc.add(
              PurchaseOrderEvent.accountingUndoConfirm(
                purchaseOrder!,
              ),
            );
          },
        );

    return Row(
      children: [
        if (purchaseOrder == null) ...[
          buildButtonPrevious(),
          const Gap(12),
          buildButtonFinish(),
        ],
        if (purchaseOrder != null && purchaseOrder!.status.isConfirmAccounting) ...[
          buildButtonViewDownPayment(),
          const Gap(12),
        ],
        if (purchaseOrder?.status.isInput ?? false) ...[
          buildButtonConfirm(),
        ],
        if (purchaseOrder?.status.isConfirmManager ?? false) ...[
          buildButtonUndoConfirm(),
          const Gap(12),
          buildButtonAccountingReject(),
          const Gap(12),
          buildButtonAccountingConfirm(),
        ],
        if (purchaseOrder?.status.isConfirmAccounting ?? false) ...[
          buildButtonUndoConfirmAccounting(),
          const Gap(12),
          buildButtonClose(),
        ]
      ],
    );
  }
}
