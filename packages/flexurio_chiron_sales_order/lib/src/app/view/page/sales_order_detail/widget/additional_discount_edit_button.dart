import 'package:flexurio_chiron_sales_order/src/app/view/page/sales_order_additional_discount_edit/sales_order_additional_discount_edit_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';

class SalesOrderAdditionalDiscountEditButton extends StatelessWidget {
  const SalesOrderAdditionalDiscountEditButton({
    super.key,
    required this.salesOrderId,
    required this.onSuccess,
  });

  final String salesOrderId;
  final void Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: PermissionProductStock.salesOrderAdditionalDiscountEdit,
      action: DataAction.edit,
      title: 'Additional Discount',
      onPressed: () {
        Navigator.push(
          context,
          SalesOrderAdditionDiscountEditPage.route(salesOrderId: salesOrderId),
        ).then((value) {
          onSuccess();
        });
      },
    );
  }
}
