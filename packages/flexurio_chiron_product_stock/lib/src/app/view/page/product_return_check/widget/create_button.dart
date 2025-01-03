import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnCheckCreateButton extends StatelessWidget {
  const ProductReturnCheckCreateButton({
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
    return Button.small(
      permission: PermissionProductStock.productReturnCheckCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnCheckCreatePage.prepare(
              productReturn: productReturn,
              productReturnDetail: productReturnDetail,
              productReturnDetailQueryBloc: productReturnDetailQueryBloc,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<ProductReturnCheckQueryBloc>().add(
                ProductReturnCheckQueryEvent.fetch(
                    productReturnId: productReturn.id,
                    productId: productReturnDetail.product.id,
                    batchId: productReturnDetail.batchNo.id));
            productReturnDetailQueryBloc.add(
                ProductReturnDetailQueryEvent.fetchById(
                    productReturnId: productReturn.id,
                    idDetail: productReturnDetail.id));
          }
        });
      },
    );
  }
}
