import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import '../../sales_order_detail/sales_order_view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderViewButton extends StatelessWidget {
  const SalesOrderViewButton({
    required this.salesOrder,
    required this.isProductRequestOther,
    required this.bloc,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;
  final SalesOrder salesOrder;
  final SalesOrderQueryBloc bloc;
  final bool isProductRequestOther;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.view,
      onPressed: () {
        Navigator.push(
          context,
          SalesOrderViewPage.route(
            salesOrder: salesOrder,
            salesOrderQuery: bloc,
            isExternal: isExternal,
            isProductRequestOther: isProductRequestOther,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<SalesOrderQueryBloc>()
                .add(const SalesOrderQueryEvent.fetch());
          }
        });
      },
    );
  }
}
