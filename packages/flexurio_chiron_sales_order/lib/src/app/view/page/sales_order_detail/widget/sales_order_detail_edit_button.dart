import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'sales_order_detail_edit_page.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class SalesOrderDetailEditButton extends StatelessWidget {
  const SalesOrderDetailEditButton({
    required this.salesOrder,
    required this.salesOrderDetail,
    required this.bloc,
    required this.blocDetail,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final SalesOrder salesOrder;
  final SalesOrderDetail salesOrderDetail;
  final SalesOrderQueryBloc bloc;
  final SalesOrderDetailBloc blocDetail;
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProductStock.salesOrderEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          SalesOrderDetailEditPage.route(
            salesOrder: salesOrder,
            salesOrderDetail: salesOrderDetail,
            bloc: bloc,
            salesOrderDetailBloc: blocDetail,
            isExternal: isExternal,
          ),
        );
        if (success ?? false) {
          blocDetail.add(SalesOrderDetailEvent.fetch(salesOrder: salesOrder));
        }
      },
    );
  }
}
