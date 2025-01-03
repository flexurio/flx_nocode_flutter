import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderDetailDeleteButton extends StatefulWidget {
  const SalesOrderDetailDeleteButton({
    required this.salesOrderDetail,
    required this.bloc,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required SalesOrderDetail salesOrderDetail,
    required SalesOrderDetailBloc bloc,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => SalesOrderBloc(),
      child: SalesOrderDetailDeleteButton(
        salesOrderDetail: salesOrderDetail,
        bloc: bloc,
        isExternal: isExternal,
      ),
    );
  }

  final SalesOrderDetail salesOrderDetail;
  final SalesOrderDetailBloc bloc;

  @override
  State<SalesOrderDetailDeleteButton> createState() =>
      _SalesOrderDetailButtonDeleteState();
}

class _SalesOrderDetailButtonDeleteState
    extends State<SalesOrderDetailDeleteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProductStock.salesOrderDelete(
          isExternal: widget.isExternal),
      action: DataAction.delete,
      onPressed: () async {
        final salesOrderDetailBloc = context.read<SalesOrderDetailBloc>();
        final oldBloc = widget.bloc;
        final success = await _showApproveDialog(context, salesOrderDetailBloc);
        if (success ?? false) {
          oldBloc.add(
            SalesOrderDetailEvent.fetchById(
                salesOrderDetail: widget.salesOrderDetail),
          );
        }
      },
    );
  }

  Future<bool?> _showApproveDialog(
    BuildContext context,
    SalesOrderDetailBloc salesOrderDetailBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final salesOrderDetail = widget.salesOrderDetail;
        return BlocListener<SalesOrderDetailBloc, SalesOrderDetailState>(
          bloc: salesOrderDetailBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (isTrue) {
                if (isTrue) {
                  Toast(context).dataChanged(action, Entity.salesOrderDetail);
                  Navigator.pop(context, true);
                }
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<SalesOrderDetailBloc, SalesOrderDetailState>(
            bloc: salesOrderDetailBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.salesOrderDetail,
                label: salesOrderDetail.batchNoId,
                onConfirm: () {
                  salesOrderDetailBloc
                      .add(SalesOrderDetailEvent.delete(salesOrderDetail));
                },
              );
            },
          ),
        );
      },
    );
  }
}
