import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class TransactionNonOrderAddButton extends StatelessWidget {
  const TransactionNonOrderAddButton({required this.onAdd, super.key});

  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      entity: Entity.transactionNonOrder,
      action: DataAction.add,
      permission: null,
      onPressed: onAdd,
    );
  }
}
