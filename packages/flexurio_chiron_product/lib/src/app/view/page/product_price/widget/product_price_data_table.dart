import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceDataTable extends StatelessWidget {
  const ProductPriceDataTable._({
    required this.product,
  });

  final Product product;

  static Widget route({
    required Product product,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductPriceQueryBloc()
            ..add(ProductPriceQueryEvent.fetch(product: product)),
        ),
      ],
      child: ProductPriceDataTable._(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPriceQueryBloc, ProductPriceQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<ProductPrice>(
            status: state.maybeWhen(
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<ProductPriceQueryBloc>()
                .add(ProductPriceQueryEvent.fetch(product: product)),
            key: ValueKey(state.hashCode),
            data: state.maybeWhen(
              loaded: (productPrice) {
                return productPrice;
              },
              orElse: () => [],
            ),
            title: '${Entity.productPrice.title} - ${product.name}',
            search: (productPrice) => [
              productPrice.id.toString(),
              productPrice.name,
              productPrice.createdAt.toString(),
              productPrice.updateAt.toString(),
              productPrice.price.toString(),
              productPrice.primaryPrice.toString(),
              productPrice.bonusPrice.toString(),
              productPrice.stripPrice.toString(),
              productPrice.tabletPrice.toString(),
            ],
            actionRight: (refreshButton) => [
              refreshButton,
              ProductPriceCreateButton(product: product),
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Start Date'),
                  sortNum: (productPrice) => productPrice.startDate.millisecond,
                ),
                body: (productPrice) => DataCell(
                  Text(productPrice.startDate.yMMMd),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('End Date'),
                  sortNum: (productPrice) => productPrice.endDate != null
                      ? productPrice.endDate!.millisecond
                      : 0,
                ),
                body: (productPrice) => DataCell(
                  Text(
                    productPrice.endDate != null
                        ? productPrice.endDate!.yMMMMd
                        : '-',
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Usability'),
                  sortNum: (productPrice) =>
                      productPrice.endDate?.millisecondsSinceEpoch ?? 0,
                ),
                body: (productPrice) {
                  return DataCell(
                    Text(productPrice.endDate?.yMMMMd ?? '-'),
                  );
                },
              ),
              DTColumnXX(
                head: DTHeadXX(
                  sortNum: (productPrice) => productPrice.price,
                  label: const Text('Price'),
                ),
                body: (productPrice) {
                  return DataCell(
                    Text(productPrice.price.idr),
                  );
                },
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Primary Price'),
                  sortNum: (productPrice) => productPrice.primaryPrice,
                ),
                body: (productPrice) => DataCell(
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(productPrice.primaryPrice.idr),
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Bonus Price'),
                  sortNum: (productPrice) => productPrice.bonusPrice,
                ),
                body: (productPrice) => DataCell(
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(productPrice.bonusPrice.idr),
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Strip Price'),
                  sortNum: (productPrice) => productPrice.stripPrice,
                ),
                body: (productPrice) => DataCell(
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(productPrice.stripPrice.idr),
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Tablet Price'),
                  sortNum: (productPrice) => productPrice.tabletPrice,
                ),
                body: (productPrice) => DataCell(
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(productPrice.tabletPrice.idr),
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (productPrice) => productPrice.createdAt.millisecond,
                ),
                body: (productPrice) => DataCell(
                  Text(productPrice.createdAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Updated At'),
                  sortNum: (productPrice) => productPrice.updateAt.millisecond,
                ),
                body: (productPrice) => DataCell(
                  Text(productPrice.updateAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: const DTHeadXX(
                  label: Text('Actions'),
                ),
                body: (productPrice) => DataCell(
                  Row(
                    children: [
                      ProductPriceDetailCreateButton(
                        product: product,
                        productPrice: productPrice,
                      ),
                      ProductPriceDetailButton(
                        productPrice: productPrice,
                      ),
                      ProductPriceDeleteButton.prepare(
                        productPrice: productPrice,
                        product: product,
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
