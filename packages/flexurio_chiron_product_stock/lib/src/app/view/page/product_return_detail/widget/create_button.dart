import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDetailCreateButton extends StatelessWidget {
  const ProductReturnDetailCreateButton({
    required this.productReturn,
    super.key,
  });

  final ProductReturn productReturn;

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: PermissionProductStock.productReturnDetailCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnDetailCreatePage.prepare(
              productReturn: productReturn,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductReturnDetailQueryBloc>()
                .add(ProductReturnDetailQueryEvent.fetch(productReturnId: productReturn.id));
          }
        });
      },
    );
  }
}
