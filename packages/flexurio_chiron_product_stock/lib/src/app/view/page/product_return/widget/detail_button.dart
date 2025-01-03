import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnDetailButton extends StatelessWidget {
  const ProductReturnDetailButton(
      {required this.productReturn,
      required this.productReturnDetailQueryBloc,
      super.key});

  final ProductReturn productReturn;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.viewDetail,
      onPressed: () async {
        await Navigator.push(
          context,
          ProductReturnDetailPage.route(
            productReturn: productReturn,
            productReturnDetailQueryBloc: productReturnDetailQueryBloc,
          ),
        ).then((value) => productReturnDetailQueryBloc.add(
            ProductReturnDetailQueryEvent.fetch(
                productReturnId: productReturn.id,
                pageOptions: PageOptions.emptyNoLimit())));
      },
    );
  }
}
