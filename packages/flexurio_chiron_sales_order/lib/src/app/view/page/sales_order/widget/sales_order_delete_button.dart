import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderDeleteButton extends StatefulWidget {
  const SalesOrderDeleteButton({
    required this.salesOrder,
    required this.bloc,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required SalesOrder salesOrder,
    required SalesOrderQueryBloc bloc,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => SalesOrderBloc(),
      child: SalesOrderDeleteButton(
        salesOrder: salesOrder,
        bloc: bloc,
        isExternal: isExternal,
      ),
    );
  }

  final SalesOrder salesOrder;
  final SalesOrderQueryBloc bloc;

  @override
  State<SalesOrderDeleteButton> createState() => _SalesOrderButtonDeleteState();
}

class _SalesOrderButtonDeleteState extends State<SalesOrderDeleteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProductStock.salesOrderDelete(
          isExternal: widget.isExternal),
      action: DataAction.delete,
      onPressed: () async {
        final salesOrderBloc = context.read<SalesOrderBloc>();
        final salesOrderQueryBloc = widget.bloc;
        final success = await _showApproveDialog(context, salesOrderBloc);
        if (success ?? false) {
          salesOrderQueryBloc.add(
            const SalesOrderQueryEvent.fetch(),
          );
        }
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
        const action = DataAction.delete;
        final salesOrder = widget.salesOrder;
        return BlocListener<SalesOrderBloc, SalesOrderState>(
          bloc: salesOrderBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.salesOrder);
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
                  salesOrderBloc.add(SalesOrderEvent.delete(salesOrder));
                },
              );
            },
          ),
        );
      },
    );
  }
}
