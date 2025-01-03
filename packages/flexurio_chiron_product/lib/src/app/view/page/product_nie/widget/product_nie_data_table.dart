import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductNieDataTable extends StatelessWidget {
  const ProductNieDataTable._(this.product);

  final Product product;

  static Widget prepare({
    required Product? product,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductNieQueryBloc()
            ..add(
              ProductNieQueryEvent.get(
                productId: product!.id,
              ),
            ),
        ),
      ],
      child: ProductNieDataTable._(product!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductNieQueryBloc, ProductNieQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSetJanganDipakaiLagi<ProductNie>(
            isError: state.maybeWhen(error: (_) => true, orElse: () => false),
            onRefresh: () => context
                .read<ProductNieQueryBloc>()
                .add(ProductNieQueryEvent.get(productId: product.id)),
            key: ValueKey(state.hashCode),
            isProgress: state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
            data: state.maybeWhen(
              loaded: (productNie) {
                return productNie;
              },
              orElse: () => [],
            ),
            title: '${product.name} NIE',
            search: (productNie) => [
              productNie.id,
              productNie.publisher,
              productNie.periodStart.toString(),
              productNie.periodEnd.toString(),
            ],
            actionRight: [
              ProductNieCreateButton(product: product),
            ],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: const Text('NIE'),
                  sortString: (productNie) => productNie.id,
                ),
                body: (productNie) => DataCell(
                  Text(
                    productNie.id.toUpperCase(),
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Category'),
                  sortString: (productNie) => productNie.category.label,
                ),
                body: (productNie) => DataCell(
                  ChipType(productNie.category),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Period Start'),
                  sortNum: (productNie) => productNie.periodStart.millisecond,
                ),
                body: (productNie) => DataCell(
                  Text(productNie.periodStart.yMMMd),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Period End'),
                  sortNum: (productNie) => productNie.periodEnd.millisecond,
                ),
                body: (productNie) => DataCell(
                  Text(productNie.periodEnd.yMMMd),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Publisher'),
                  sortString: (productNie) => productNie.publisher,
                ),
                body: (productNie) => DataCell(
                  Text(productNie.publisher),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: Text('created_at'.tr()),
                  sortNum: (productNie) =>
                      productNie.createAt.millisecondsSinceEpoch,
                ),
                body: (productNie) => DataCell(
                  Text(productNie.createAt.yMMMdHm),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Updated At'),
                  sortNum: (product) =>
                      product.updatedAt.millisecondsSinceEpoch,
                ),
                body: (productNie) => DataCell(
                  Text(productNie.updatedAt.yMMMdHm),
                ),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Actions'),
                ),
                body: (productNie) => DataCell(
                  Row(
                    children: [
                      ProductNieDeleteButton.prepare(
                        productNie: productNie,
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
