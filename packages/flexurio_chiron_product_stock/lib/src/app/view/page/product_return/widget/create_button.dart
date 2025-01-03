import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnCreateButton extends StatelessWidget {
  const ProductReturnCreateButton({required this.statusSelect, super.key});

  final ProductReturnStatus statusSelect;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProductStock.productReturnCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnCreatePage.prepare(),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductReturnQueryBloc>()
                .add(ProductReturnQueryEvent.fetch(
                  status: statusSelect.id,
                ));
          }
        });
      },
    );
  }
}
