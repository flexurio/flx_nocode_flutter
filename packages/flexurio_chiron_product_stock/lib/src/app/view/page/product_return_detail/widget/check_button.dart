import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnDetailCheckButton extends StatelessWidget {
  const ProductReturnDetailCheckButton({
    required this.productReturn,
    required this.productReturnDetail,
    required this.productReturnDetailQueryBloc,
    super.key,
  });

  final ProductReturn productReturn;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: PermissionProductStock.productReturnCheckViewMenu,
      onPressed: () async {
        await Navigator.push(
          context,
          ProductReturnCheckPage.route(
            productReturn: productReturn,
            productReturnDetail: productReturnDetail,
            productReturnDetailQueryBloc: productReturnDetailQueryBloc,
          ),
        );
      },
      action: DataAction.check,
    );
  }
}
