import 'package:flexurio_chiron_product/src/app/bloc/product_group_query/product_group_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart'
    as model;
import 'package:flexurio_chiron_product/src/app/view/page/product_group/widget/product_group_create_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_group/widget/product_group_delete_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGroupDataTable extends StatelessWidget {
  const ProductGroupDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (_) =>
          ProductGroupQueryBloc()..add(const ProductGroupQueryEvent.fetch()),
      child: const ProductGroupDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductGroupQueryBloc, ProductGroupQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<model.ProductGroup>(
            title: Entity.productGroup.title,
            actionRight: (refreshButton) => [
              refreshButton,
              const ProductGroupCreateButton(),
            ],
            search: (productGroup) => [productGroup.id],
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            onRefresh: () => context
                .read<ProductGroupQueryBloc>()
                .add(const ProductGroupQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            data: state.maybeWhen(
              loaded: (productGroups) {
                return productGroups;
              },
              orElse: () => [],
            ),
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('ID'),
                  sortString: (productGroup) => productGroup.id,
                ),
                body: (productGroup) => DataCell(
                  Text(
                    productGroup.id,
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (productGroup) =>
                      productGroup.createdAt.millisecondsSinceEpoch,
                ),
                body: (productGroup) => DataCell(
                  Text(productGroup.createdAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Updated At'),
                  sortNum: (productGroup) =>
                      productGroup.updatedAt.millisecondsSinceEpoch,
                ),
                body: (productGroup) => DataCell(
                  Text(
                    productGroup.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnXX(
                head: const DTHeadXX(
                  label: Text('Action'),
                ),
                body: (productGroup) => DataCell(
                  ProductGroupDeleteButton.prepare(id: productGroup.id),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
