import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteCreateButton extends StatelessWidget {
  const ProductReturnNoteCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProductStock.productReturnNoteCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnNoteCreatePage.prepare(),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductReturnNoteQueryBloc>()
                .add(const ProductReturnNoteQueryEvent.fetch());
          }
        });
      },
    );
  }
}
