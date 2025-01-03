import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnCheckFromLocalDeleteButton extends StatelessWidget {
  const ProductReturnCheckFromLocalDeleteButton({
    required this.product,
    required this.onDelete,
    super.key,
  });

  final ProductReturnCheck product;
  final void Function() onDelete;

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
          data: Entity.productReturnCheck,
          label: product.productId.name,
          onConfirm: () {
            // bloc.add(event);
            onDelete();
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
