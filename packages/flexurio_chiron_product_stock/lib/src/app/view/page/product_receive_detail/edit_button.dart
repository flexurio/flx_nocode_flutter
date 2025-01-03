import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_detail/edit_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReceiveEditButton extends StatelessWidget {
  const ProductReceiveEditButton({
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
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                ProductReceiveHeaderEditPageX.prepare(
                  productReceiveDetail: productReceiveDetail,
                  isExternal: isExternal,
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
