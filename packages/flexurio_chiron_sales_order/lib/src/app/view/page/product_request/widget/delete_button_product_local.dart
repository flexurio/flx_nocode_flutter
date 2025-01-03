import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestDetailFromLocalDeleteButton extends StatelessWidget {
  const ProductRequestDetailFromLocalDeleteButton({
    required this.detail,
    super.key,
  });

  final ProductRequestDetail detail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productRequestDelete,
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    final bloc = context.read<ProductRequestBloc>();
    final event = ProductRequestEvent.remove(detail);
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.productRequestDetail,
          label: detail.product!.name,
          onConfirm: () {
            bloc.add(event);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
