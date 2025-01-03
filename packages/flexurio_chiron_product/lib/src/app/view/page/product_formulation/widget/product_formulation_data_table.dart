import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/export_excel_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_create_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_delete_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_detail_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_update_button.dart';

import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationDataTable extends StatelessWidget {
  const ProductFormulationDataTable({
    required this.formulationDetailQueryBloc,
    required this.onRefresh,
    required this.isExternal,
    super.key,
  });

  final ProductFormulationDetailQueryBloc formulationDetailQueryBloc;
  final void Function() onRefresh;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: BlocBuilder<ProductFormulationDetailQueryBloc,
          ProductFormulationDetailQueryState>(
        bloc: formulationDetailQueryBloc,
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DataTableSet2<ProductFormulationDetail>(
              scrollController: ScrollController(),
              onRefresh: () {
                context
                    .read<ProductFormulationQueryBloc>()
                    .add(const ProductFormulationQueryEvent.fetch());
                onRefresh();
              },
              key: ValueKey(state.hashCode),
              status: state.maybeWhen(
                orElse: () => Status.loaded,
                loading: () => Status.progress,
                loaded: (details) => Status.loaded,
              ),
              data: state.maybeWhen(
                loaded: (formulationDetails) => formulationDetails,
                orElse: () => [],
              ),
              title: Entity.billOfMaterial.title,
              search: (productFormulation) => [
                productFormulation.id.toString(),
                productFormulation.formulation.product.id,
                productFormulation.formulation.scale.name,
                productFormulation.formulation.type.name,
                productFormulation.formulation.quantity.toString(),
                productFormulation.formulation.unit,
                productFormulation.formulation.product.name,
                productFormulation.formulation.scale.productFormulationScale,
              ],
              actionRight: (refreshButton) => [
                BillOfMaterialExportExcelButton(isExternal: isExternal),
                refreshButton,
                ProductFormulationCreateButton(isExternal: isExternal),
              ],
              columns: [
                DTColumnXX(
                  head: DTHeadXX(
                    label: const Text('ID'),
                    sortNum: (productFormulation) => productFormulation.id,
                  ),
                  body: (productFormulation) => DataCell(
                    Text(productFormulation.id.toString()),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('product_id'.tr()),
                    sortString: (productFormulation) =>
                        productFormulation.formulation.product.id,
                  ),
                  body: (productFormulation) => DataCell(
                    Text(productFormulation.formulation.product.id),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('product_name'.tr()),
                    sortString: (productFormulation) =>
                        productFormulation.formulation.product.name,
                  ),
                  body: (productFormulation) => DataCell(
                    Text(productFormulation.formulation.product.name),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('type'.tr()),
                    sortString: (type) =>
                        type.formulation.type.productFormulationType,
                  ),
                  body: (type) => DataCell(
                    Text(type.formulation.type.productFormulationType),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('scale'.tr()),
                    sortString: (scale) =>
                        scale.formulation.scale.productFormulationScale,
                  ),
                  body: (scale) => DataCell(
                    Text(scale.formulation.scale.productFormulationScale),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('material_group'.tr()),
                    sortString: (material) =>
                        material.formulation.type.productFormulationType,
                  ),
                  body: (material) => DataCell(
                    Text(material.formulation.type.productFormulationType),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('quantity'.tr()),
                    sortNum: (quantity) => quantity.quantity,
                  ),
                  body: (quantity) => DataCell(
                    Text(quantity.quantity.toString()),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: const Text('Unit'),
                    sortString: (unit) => unit.formulation.unit,
                  ),
                  body: (unit) => DataCell(
                    Text(unit.formulation.unit),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('active'.tr()),
                  ),
                  body: (active) {
                    return DataCell(
                      SizedBox(
                        child: BoolIcon(active.formulation.isActive),
                      ),
                    );
                  },
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('created_at'.tr()),
                    sortNum: (productFormulation) =>
                        productFormulation.createdAt.millisecond,
                  ),
                  body: (productFormulation) => DataCell(
                    Text(
                      productFormulation.createdAt.yMMMdHm,
                    ),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('updated_at'.tr()),
                    sortNum: (productFormulation) =>
                        productFormulation.updatedAt.millisecond,
                  ),
                  body: (productFormulation) => DataCell(
                    Text(
                      productFormulation.updatedAt.yMMMdHm,
                    ),
                  ),
                ),
                DTColumnXX(
                  head: DTHeadXX(
                    label: Text('actions'.tr()),
                  ),
                  body: (productFormulation) => DataCell(
                    Row(
                      children: [
                        if (productFormulation.formulation.isConfirm == false)
                          ProductFormulationUpdateButton(
                              productFormulation:
                                  productFormulation.formulation,
                              isExternal: isExternal),
                        ProductFormulationDetailButton(
                            productFormulation: productFormulation.formulation,
                            isExternal: isExternal),
                        if (productFormulation.formulation.isConfirm == false)
                          ProductFormulationDeleteButton.prepare(
                            id: productFormulation.id,
                            isExternal: isExternal,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
