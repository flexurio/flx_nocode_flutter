import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/export_excel_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_create_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_delete_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_detail_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_update_button.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillOfMaterialDataTable extends StatelessWidget {
  const BillOfMaterialDataTable(
      {required this.queryBloc, required this.isExternal, super.key});

  final ProductFormulationQueryBloc queryBloc;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: BlocBuilder<ProductFormulationQueryBloc,
          ProductFormulationQueryState>(
        bloc: queryBloc,
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DataTableBackend<ProductFormulation>(
              freezeFirstColumn: true,
              freezeLastColumn: true,
              pageOptions: state.maybeWhen(
                loaded: (data) => data,
                loading: (data) => data,
                orElse: PageOptions.empty,
              ),
              onRefresh: () => context
                  .read<ProductFormulationQueryBloc>()
                  .add(const ProductFormulationQueryEvent.fetch()),
              key: ValueKey(state.hashCode),
              status: state.maybeWhen(
                orElse: () => Status.error,
                loading: (_) => Status.progress,
                loaded: (productFormulations) => Status.loaded,
              ),
              actionRight: (refreshButton) => [
                BillOfMaterialExportExcelButton(isExternal: isExternal),
                refreshButton,
                ProductFormulationCreateButton(isExternal: isExternal),
              ],
              columns: [
                DTColumn(
                  widthFlex: 12,
                  head: const DTHead(
                    label: 'ID',
                    backendColumn: 'formulations.name',
                  ),
                  body: (productFormulation) => DataCell(
                    Text(productFormulation.name ?? '-'),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'product_id'.tr(),
                    backendColumn: 'Product.id',
                  ),
                  body: (productFormulation) => DataCell(
                    Text(productFormulation.product.id),
                  ),
                ),
                DTColumn(
                  widthFlex: 10,
                  head: DTHead(
                    label: 'product_name'.tr(),
                    backendColumn: 'Product.name',
                  ),
                  body: (productFormulation) => DataCell(
                    Text(productFormulation.product.name),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'type'.tr(),
                    backendColumn: 'formulations.type',
                  ),
                  body: (type) => DataCell(
                    Text(type.type.productFormulationType),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'scale'.tr(),
                    backendColumn: 'formulations.scale',
                  ),
                  body: (scale) => DataCell(
                    Text(scale.scale.productFormulationScale),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'material_group'.tr(),
                    backendColumn: 'formulations.type',
                  ),
                  body: (material) => DataCell(
                    Text(material.type.productFormulationType),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'quantity'.tr(),
                    backendColumn: 'formulations.quantity',
                  ),
                  body: (quantity) => DataCell(
                    Text(quantity.quantity.toString()),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: const DTHead(
                    label: 'Unit',
                    backendColumn: 'formulations.unit_id',
                  ),
                  body: (unit) => DataCell(
                    Text(unit.unit),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'active'.tr(),
                    backendColumn: 'formulations.is_active',
                  ),
                  body: (active) {
                    return DataCell(
                      SizedBox(
                        child: BoolIcon(active.isActive),
                      ),
                    );
                  },
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'created_at'.tr(),
                    backendColumn: 'created_at',
                  ),
                  body: (productFormulation) => DataCell(
                    Text(
                      productFormulation.createdAt.yMMMdHm,
                    ),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'updated_at'.tr(),
                    backendColumn: 'updated_at',
                  ),
                  body: (productFormulation) => DataCell(
                    Text(
                      productFormulation.updatedAt.yMMMdHm,
                    ),
                  ),
                ),
                DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'actions'.tr(),
                    backendColumn: null,
                  ),
                  body: (productFormulation) => DataCell(
                    Row(
                      children: [
                        if (productFormulation.isConfirm == false)
                          ProductFormulationUpdateButton(
                            productFormulation: productFormulation,
                            isExternal: isExternal,
                          ),
                        ProductFormulationDetailButton(
                          productFormulation: productFormulation,
                          isExternal: isExternal,
                        ),
                        if (productFormulation.isConfirm == false)
                          ProductFormulationDeleteButton.prepare(
                            id: productFormulation.id,
                            isExternal: isExternal,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (pageOptions) {
                context.read<ProductFormulationQueryBloc>().add(
                      ProductFormulationQueryEvent.fetch(
                        pageOptions: pageOptions,
                      ),
                    );
              },
            ),
          );
        },
      ),
    );
  }
}
