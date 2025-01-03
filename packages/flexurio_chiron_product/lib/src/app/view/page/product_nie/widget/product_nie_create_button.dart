import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductNieCreateButton extends StatelessWidget {
  const ProductNieCreateButton({
    required this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: PermissionProduct.productNieCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductNieQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductNieCreatePage.route(product: product),
        );
        if (success ?? false) {
          queryBloc.add(ProductNieQueryEvent.get(productId: product?.id));
        }
      },
    );
  }
}
