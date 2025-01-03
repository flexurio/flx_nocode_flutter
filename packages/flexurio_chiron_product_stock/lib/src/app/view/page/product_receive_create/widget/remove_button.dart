import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveDetailRemoveButton extends StatelessWidget {
  const ProductReceiveDetailRemoveButton({
    required this.productReceiveDetail,
    super.key,
  });

  final ProductReceiveDetail productReceiveDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductReceiveBloc>();
        await _showRemoveDialog(context: context, bloc: bloc);
      },
    );
  }

  Future<bool?> _showRemoveDialog({
    required BuildContext context,
    required ProductReceiveBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.product;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: entity,
          label: productReceiveDetail.product.name,
          onConfirm: () {
            bloc.add(
              ProductReceiveEvent.productRemove(productReceiveDetail),
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
