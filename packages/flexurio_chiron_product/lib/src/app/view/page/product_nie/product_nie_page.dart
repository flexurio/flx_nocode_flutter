import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductNiePage extends StatelessWidget {
  const ProductNiePage._({this.product});

  final Product? product;

  static Route<void> route({
    required Product? product,
  }) {
    return MaterialPageRoute(
      builder: (context) => ProductNiePage._(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        const Row(
          children: [
            BackButton(),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ProductNieDataTable.prepare(
                        product: product,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
