import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_create/widget/remove_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveDetailTable extends StatelessWidget {
  const ProductReceiveDetailTable({super.key, this.canEdit = false});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
      builder: (context, state) {
        return YuhuTable<ProductReceiveDetail>(
          width: 1000,
          freezeFirstColumn: true,
          freezeLastColumn: true,
          columns: [
            TableColumn(
              width: 95,
              title: 'Product ID',
              builder: (productRequestDetail, _) {
                return Text(productRequestDetail.product.id);
              },
            ),
            TableColumn(
              width: 150,
              title: 'Product Name',
              builder: (productRequestDetail, _) {
                return Text(productRequestDetail.product.name);
              },
            ),
            TableColumn(
              width: 150,
              title: 'batch_no'.tr(),
              builder: (productRequestDetail, _) {
                return Text(productRequestDetail.productionOrder.id);
              },
            ),
            TableColumn(
              width: 150,
              title: 'expired_date'.tr(),
              builder: (productRequestDetail, _) {
                return Text(productRequestDetail.expiredDate.yMMMMd);
              },
            ),
            TableColumn(
              title: 'Quantity',
              width: 78,
              alignment: Alignment.centerRight,
              builder: (productRequestDetail, _) {
                return Text('${productRequestDetail.quantity}');
              },
            ),
            TableColumn(
              title: 'Unit',
              width: 100,
              builder: (productRequestDetail, _) {
                return Text(productRequestDetail.unit.id);
              },
            ),
            TableColumn(
              width: 140,
              title: 'Status',
              builder: (productRequestDetail, _) {
                return ChipType(productRequestDetail.status);
              },
            ),
            TableColumn(
              width: 200,
              title: 'Warehouse',
              builder: (productRequestDetail, index) {
                return ChipType(
                  productRequestDetail.warehouse,
                );
              },
            ),
            if (canEdit)
              TableColumn(
                width: 150,
                title: 'Actions',
                builder: (productRequestDetail, index) {
                  return ProductReceiveDetailRemoveButton(
                    productReceiveDetail: productRequestDetail,
                  );
                },
              ),
          ],
          data: state.maybeWhen(
            initial: (productRequestDetail, _) => productRequestDetail,
            orElse: () => [],
          ),
        );
      },
    );
  }
}
