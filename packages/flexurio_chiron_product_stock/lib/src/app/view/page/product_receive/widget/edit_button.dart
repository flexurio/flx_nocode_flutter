import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReceiveDetailEditButton extends StatelessWidget {
  const ProductReceiveDetailEditButton({
    required this.productReceiveDetail,
    required this.queryBloc,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final ProductReceiveDetail productReceiveDetail;
  final ProductReceiveDetailQueryBloc queryBloc;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProductStock.productReceiveEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final bloc = ProductReceiveBloc(isExternal: isExternal);
        final purchaseOrderDetailQueryBloc = PurchaseOrderDetailQueryBloc();

        await showDialog<bool?>(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                ProductReceiveDetailCreatePage.prepare(
                  productReceiveBloc: bloc,
                  productReceiveDetail: productReceiveDetail,
                  purchaseOrderDetailQueryBloc: purchaseOrderDetailQueryBloc,
                ),
              ],
            );
          },
        ).then((success) {
          if (success ?? false) {
            queryBloc.add(
              ProductReceiveDetailQueryEvent.fetch(
                productReceive: productReceiveDetail.productReceive,
              ),
            );
          }
        });
      },
    );
  }
}
