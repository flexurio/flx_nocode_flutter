import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_price/product_price_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductPriceButton extends StatelessWidget {
  const ProductPriceButton({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduct.productPriceViewMenu,
      action: DataAction.showPrice,
      onPressed: () {
        Navigator.push(
          context,
          ProductPricePage.route(
            product: product,
          ),
        );
      },
    );
  }
}
