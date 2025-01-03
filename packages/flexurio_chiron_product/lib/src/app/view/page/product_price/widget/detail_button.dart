import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product_price.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_price/widget/detail_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductPriceDetailButton extends StatelessWidget {
  const ProductPriceDetailButton({
    required this.productPrice,
    super.key,
  });

  final ProductPrice productPrice;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.view,
      permission: PermissionProduct.productPriceViewMenu,
      onPressed: () async {
        await _showDetail(context, productPrice);
      },
    );
  }

  Future<bool?> _showDetail(BuildContext context, ProductPrice productPrice) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ProductPriceDetailPage(
          productPrice: productPrice,
        );
      },
    );
  }
}
