import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductLocalRemoveButton extends StatelessWidget {
  const ProductLocalRemoveButton({
    required this.product,
    this.onPressed,
    super.key,
  });

  final ProductReturnDetail product;
  final void Function(ProductReturnDetail product)? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.productReturnDetail,
          label: '${product.product.name}',
          onConfirm: () {
            Navigator.pop(context, true);
          },
        );
      },
    ).then((value) {
      if ((value == true)) {
        onPressed!(product);
      }
      return null;
    });
  }
}
