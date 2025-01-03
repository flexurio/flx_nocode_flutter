import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceCreateButton extends StatelessWidget {
  const ProductPriceCreateButton({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProduct.productPriceCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductPriceQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductPriceCreatePage.route(product: product),
        );
        if (success ?? false) {
          queryBloc.add(ProductPriceQueryEvent.fetch(product: product));
        }
      },
    );
  }
}
