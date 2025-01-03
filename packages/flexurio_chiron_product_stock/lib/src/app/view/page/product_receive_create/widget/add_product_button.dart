import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    this.type,
    super.key,
  });

  final ProductReceiveType? type;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.product,
      onPressed: () => _showCreateDialog(context),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final purchaseOrderDetailQueryBloc =
        context.read<PurchaseOrderDetailQueryBloc>();
    final productReceiveBloc = context.read<ProductReceiveBloc>();
    showDialog<ProductReceiveDetail?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            ProductReceiveDetailCreatePage.prepare(
              type: type,
              productReceiveBloc: productReceiveBloc,
              purchaseOrderDetailQueryBloc: purchaseOrderDetailQueryBloc,
            ),
          ],
        );
      },
    ).then((productReceiveDetail) {
      if (productReceiveDetail != null) {
        context
            .read<ProductReceiveBloc>()
            .add(ProductReceiveEvent.productAdd(productReceiveDetail));
      }
    });
  }
}
