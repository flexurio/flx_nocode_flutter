import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderConfirmButton extends StatefulWidget {
  const SalesOrderConfirmButton({
    required this.salesOrder,
    super.key,
    required this.isExternal,
    required this.onConfirm,
    required this.isProductRequestOther,
  });
  final bool isExternal;
  final void Function() onConfirm;
  final bool isProductRequestOther;

  static Widget prepare({
    required SalesOrder salesOrder,
    required bool isExternal,
    required void Function() onConfirm,
    required bool isProductRequestOther,
  }) {
    return BlocProvider(
      create: (context) => SalesOrderBloc(),
      child: SalesOrderConfirmButton(
        salesOrder: salesOrder,
        isExternal: isExternal,
        onConfirm: onConfirm,
        isProductRequestOther: isProductRequestOther,
      ),
    );
  }

  final SalesOrder salesOrder;

  @override
  State<SalesOrderConfirmButton> createState() =>
      _SalesOrderButtonConfirmState();
}

class _SalesOrderButtonConfirmState extends State<SalesOrderConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: widget.isProductRequestOther
          ? PermissionProductStock.productRequestOtherConfirm
          : PermissionProductStock.salesOrderConfirm(
              isExternal: widget.isExternal,
            ),
      action: DataAction.confirm,
      onPressed: () async {
        final salesOrderBloc = context.read<SalesOrderBloc>();
        await _showApproveDialog(context, salesOrderBloc);
      },
    );
  }

  Future<bool?> _showApproveDialog(
    BuildContext context,
    SalesOrderBloc salesOrderBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.confirm;
        final salesOrder = widget.salesOrder;
        return BlocListener<SalesOrderBloc, SalesOrderState>(
          bloc: salesOrderBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.salesOrder);
                widget.onConfirm();
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<SalesOrderBloc, SalesOrderState>(
            bloc: salesOrderBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.salesOrder,
                label: salesOrder.id,
                onConfirm: () {
                  salesOrderBloc.add(SalesOrderEvent.confirm(salesOrder));
                },
              );
            },
          ),
        );
      },
    );
  }
}
