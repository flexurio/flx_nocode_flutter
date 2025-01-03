import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductFormulationTable extends StatelessWidget {
  const ProductFormulationTable._(this.product);

  final Product? product;

  static Route<bool?> route({
    Product? product,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          if (product != null)
            BlocProvider(
              create: (context) =>
                  ProductFormulationQueryBloc(isExternal: isExternal)
                    ..add(ProductFormulationQueryEvent.fetch(product: product)),
            ),
        ],
        child: ProductFormulationTable._(product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormulationQueryBloc,
        ProductFormulationQueryState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            SingleFormPanel(
              actions: const [],
              size: SingleFormPanelSize.large,
              formKey: GlobalKey(),
              action: DataAction.create,
              entity: Entity.billOfMaterial,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: DataTableSetJanganDipakaiLagi<
                                  ProductFormulation>(
                                isError: state.maybeWhen(
                                  error: (_) => true,
                                  orElse: () => false,
                                ),
                                onRefresh: () => context
                                    .read<ProductFormulationQueryBloc>()
                                    .add(
                                      ProductFormulationQueryEvent.fetch(
                                        product: product,
                                      ),
                                    ),
                                key: ValueKey(state.hashCode),
                                isProgress: state.maybeWhen(
                                  loading: (_) => true,
                                  orElse: () => false,
                                ),
                                data: state.maybeWhen(
                                  loaded: (tickets) {
                                    return tickets.data;
                                  },
                                  orElse: () => [],
                                ),
                                title: '${product?.name} Formulation',
                                search: (productFormulation) => [
                                  productFormulation.product.id,
                                  productFormulation.scale.name,
                                  productFormulation.type.name,
                                  productFormulation.quantity.toString(),
                                  productFormulation.unit,
                                ],
                                actionRight: const [],
                                columns: [
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: const Text('Product'),
                                      sortString: (productFormulation) =>
                                          productFormulation.product.id,
                                    ),
                                    body: (productFormulation) => DataCell(
                                      Text(productFormulation.product.id),
                                    ),
                                  ),
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: const Text('Scale'),
                                      sortString: (scale) => scale.scale.name,
                                    ),
                                    body: (scale) => DataCell(
                                      Text(scale.scale.name),
                                    ),
                                  ),
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: const Text('Material Group'),
                                      sortString: (material) =>
                                          material.type.name,
                                    ),
                                    body: (material) => DataCell(
                                      Text(material.type.name),
                                    ),
                                  ),
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: const Text('Quantity'),
                                      sortString: (quantity) =>
                                          quantity.quantity.toString(),
                                    ),
                                    body: (quantity) => DataCell(
                                      Text(quantity.quantity.toString()),
                                    ),
                                  ),
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: const Text('Unit'),
                                      sortString: (unit) => unit.unit,
                                    ),
                                    body: (unit) => DataCell(
                                      Text(unit.unit),
                                    ),
                                  ),
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: Text('created_at'.tr()),
                                      sortNum: (productFormulation) =>
                                          productFormulation
                                              .createdAt.millisecond,
                                    ),
                                    body: (productFormulation) => DataCell(
                                      Text(
                                        productFormulation.createdAt.yMMMdHm,
                                      ),
                                    ),
                                  ),
                                  DTColumnX(
                                    head: DTHeadX(
                                      label: const Text('Updated At'),
                                      sortNum: (productFormulation) =>
                                          productFormulation
                                              .updatedAt.millisecond,
                                    ),
                                    body: (productFormulation) => DataCell(
                                      Text(
                                        productFormulation.updatedAt.yMMMdHm,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
