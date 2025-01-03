import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_selected/product_selected_bloc.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SelectBatch extends StatelessWidget {
  const SelectBatch({
    required this.onSelect,
    required this.batchByProduct,
    super.key,
  });

  final Map<String, List<ProductStockWithPrice>> batchByProduct;
  final void Function(ProductStockWithPrice?) onSelect;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectedBloc, CartItem?>(
      builder: (context, item) {
        if (item == null) return Container();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'select_data'.tr(
                namedArgs: {
                  'data': 'batch'.tr(),
                },
              )} ${item.product.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(12),
            SelectChip<ProductStockWithPrice>(
              axis: Axis.vertical,
              options: batchByProduct[item.product.id] ?? [],
              onChanged: onSelect,
              getLabel: (e) =>
                  '${e.batch} (${'stock'.tr()} ${e.quantityStock.toInt()} ${e.unit})',
            ),
          ],
        );
      },
    );
  }
}
