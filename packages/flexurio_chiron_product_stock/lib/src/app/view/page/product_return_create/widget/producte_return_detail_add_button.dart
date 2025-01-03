import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/detail_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnAddButton extends StatefulWidget {
  const ProductReturnAddButton({
    required this.productReturnBloc,
    super.key,
  });
  final ProductReturnBloc productReturnBloc;

  @override
  State<ProductReturnAddButton> createState() => _ProductReturnAddButtonState();
}

class _ProductReturnAddButtonState extends State<ProductReturnAddButton> {
  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      entity: Entity.productReturnDetail,
      action: DataAction.add,
      onPressed: () {
        _showAddDialog(context);
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog<ProductReturnDetail?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            ProductReturnDetailCreate.prepare(
              productReturnBloc: widget.productReturnBloc,
            ),
          ],
        );
      },
    ).then((products) {
      if (products != null) {
        context
            .read<ProductReturnBloc>()
            .add(ProductReturnEvent.productAdd(products: products));
      }
    });
  }
}
