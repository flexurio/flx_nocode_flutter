import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductPricePage extends StatelessWidget {
  const ProductPricePage._({
    required this.product,
  });
  final Product product;

  static Route<void> route({
    required Product product,
  }) {
    return MaterialPageRoute(
      builder: (context) => Material(
        color: Colors.transparent,
        child: ProductPricePage._(
          product: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        Row(
          children: [
            BackButtonWithTitle(title: product.name),
          ],
        ),
        TitlePage(entity: Entity.productPrice),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductPriceDataTable.route(
            product: product,
          ),
        ),
      ],
    );
  }
}
