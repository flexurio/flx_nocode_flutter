import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceDetailCreateButton extends StatelessWidget {
  const ProductPriceDetailCreateButton({
    required this.product,
    required this.productPrice,
    super.key,
  });

  final Product product;
  final ProductPrice productPrice;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.insertPrice,
      permission: PermissionProduct.productPriceCreate,
      onPressed: () {
        Navigator.push(
          context,
          ProductPriceDetailCreatePage.route(
            product: product,
            productPrice: productPrice,
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<ProductPriceQueryBloc>().add(
                  ProductPriceQueryEvent.fetch(product: product),
                );
          }
        });
      },
    );
  }
}
