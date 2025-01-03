import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionServiceOrderDataTable extends StatelessWidget {
  const ProductionServiceOrderDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionServiceOrderQueryBloc()
            ..add(const ProductionServiceOrderQueryEvent.fetch()),
        ),
      ],
      child: const ProductionServiceOrderDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductionServiceOrderQueryBloc,
        ProductionServiceOrderQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSetJanganDipakaiLagi<ProductionServiceOrder>(
            isError: state.maybeWhen(error: (_) => true, orElse: () => false),
            onRefresh: () => context
                .read<ProductionServiceOrderQueryBloc>()
                .add(const ProductionServiceOrderQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            isProgress: state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
            data: state.maybeWhen(
              loaded: (productionServiceOrders) {
                return productionServiceOrders;
              },
              orElse: () => [],
            ),
            title: Entity.productionServiceOrder.title,
            search: (productionServiceOrder) => [
              productionServiceOrder.id,
              productionServiceOrder.productId,
              productionServiceOrder.productName,
              productionServiceOrder.batchNo,
              productionServiceOrder.productScale.label,
              productionServiceOrder.productStatus.label,
              productionServiceOrder.productId,
            ],
            actionRight: const [
              ProductionServiceOrderCreateButton(),
            ],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Product ID'),
                  sortString: (productionOrder) => productionOrder.productId,
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.productId),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Product Name'),
                  sortString: (productionOrder) => productionOrder.productName,
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.productName),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Batch'),
                  sortString: (productionOrder) => productionOrder.batchNo,
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.batchNo),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Status'),
                  sortString: (productionOrder) =>
                      productionOrder.productStatus.label,
                ),
                body: (productionOrder) => DataCell(
                  ChipType(productionOrder.productStatus),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Expired Date'),
                  sortNum: (productionOrder) =>
                      productionOrder.expirationDate.millisecondsSinceEpoch,
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.expirationDate.yMMMd),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Scale'),
                  sortString: (productionOrder) =>
                      productionOrder.productScale.label,
                ),
                body: (productionOrder) => DataCell(
                  ChipType(productionOrder.productScale),
                ),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Bulk / Ruahan'),
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isBulk),
                    ),
                  );
                },
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Rework'),
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isRework),
                    ),
                  );
                },
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Cancel Rework'),
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isCancel),
                    ),
                  );
                },
              ),
              DTColumnX(
                head: DTHeadX(
                  label: Text('created_at'.tr()),
                  sortNum: (productionServiceOrder) =>
                      productionServiceOrder.createdAt.millisecond,
                ),
                body: (productionServiceOrder) => DataCell(
                  Text(
                    productionServiceOrder.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Updated At'),
                  sortNum: (productionServiceOrder) =>
                      productionServiceOrder.updatedAt.millisecond,
                ),
                body: (productionServiceOrder) => DataCell(
                  Text(
                    productionServiceOrder.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Actions'),
                ),
                body: (productionServiceOrder) => DataCell(
                  Row(
                    children: [
                      if (productionServiceOrder.isRework)
                        ProductionServiceOrderCancelReworkButton.prepare(
                          productionServiceOrder: productionServiceOrder,
                        ),
                      if (!productionServiceOrder.isRework &&
                          !productionServiceOrder.isCancel)
                        ProductionServiceOrderReworkButton.prepare(
                          productionServiceOrder: productionServiceOrder,
                        ),
                      if (!productionServiceOrder.isRework &&
                          !productionServiceOrder.isCancel)
                        ProductionServiceOrderEditButton(
                          productionServiceOrder: productionServiceOrder,
                        ),
                      if (!productionServiceOrder.isRework &&
                          !productionServiceOrder.isCancel)
                        ProductionServiceOrderDeleteButton.prepare(
                          productionServiceOrder: productionServiceOrder,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
