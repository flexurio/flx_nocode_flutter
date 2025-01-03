import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnEditButton extends StatelessWidget {
  const ProductReturnEditButton({required this.productReturn, super.key});

  final ProductReturn productReturn;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: PermissionProductStock.productReturnEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnEditPage.prepare(
              productReturn: productReturn,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductReturnQueryBloc>()
                .add(ProductReturnQueryEvent.fetchById(productReturn.id));
          }
        });
      },
    );
  }
}
