import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import '../../sales_order_create/sales_order_create_page.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderCreateButton extends StatelessWidget {
  const SalesOrderCreateButton({
    super.key,
    required this.isExternal,
    required this.isProductRequestOther,
  });
  final bool isExternal;
  final bool isProductRequestOther;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: isProductRequestOther ?
          PermissionProductStock.productRequestOtherCreate :
          PermissionProductStock.salesOrderCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<SalesOrderQueryBloc>();
        final success = await Navigator.push(
          context,
          SalesOrderCreatePage.route(
              isProductRequestOther: isProductRequestOther),
        );
        if (success ?? false) {
          queryBloc.add(const SalesOrderQueryEvent.fetch());
        }
      },
    );
  }
}
