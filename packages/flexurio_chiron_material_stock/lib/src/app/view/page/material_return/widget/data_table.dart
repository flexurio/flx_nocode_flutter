import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_query/material_return_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart'
    as model;
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/widget/create_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/widget/delete_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/widget/view_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/widget/print_button_pdf.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/widget/export_pdf_button.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnDataTable extends StatelessWidget {
  const MaterialReturnDataTable._({required this.isExternal});

  final bool isExternal;

  static Widget prepare({required bool isExternal}) {
    return BlocProvider(
      create: (context) => MaterialReturnQueryBloc()
        ..add(MaterialReturnQueryEvent.fetch(isExternal: isExternal)),
      child: MaterialReturnDataTable._(
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReturnQueryBloc, MaterialReturnQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.MaterialReturn>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<MaterialReturnQueryBloc>().add(
                    MaterialReturnQueryEvent.fetch(
                      pageOptions: pageOptions,
                      isExternal: isExternal,
                    ),
                  );
            },
            onRefresh: () => context
                .read<MaterialReturnQueryBloc>()
                .add(MaterialReturnQueryEvent.fetch(
                  isExternal: isExternal,
                )),
            actionRight: (refreshButton) => [
              refreshButton,
              MaterialReturnCreateButton(isExternal: isExternal),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'material_returns.id',
                ),
                body: (materialReturn) => DataCell(
                  Text(materialReturn.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'product_id'.tr(),
                  backendColumn: 'Product.id',
                ),
                body: (materialReturn) => DataCell(
                  Text(materialReturn.product.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'Product.name',
                ),
                body: (materialReturn) => DataCell(
                  Tooltip(
                    message: materialReturn.product.name,
                    child: Text(materialReturn.product.name),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'material_group'.tr(),
                  backendColumn: 'MaterialGroup.id',
                ),
                body: (materialReturn) =>
                    DataCell(Text(materialReturn.materialGroup.id)),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'batch'.tr(),
                  backendColumn: 'BatchNo.id',
                ),
                body: (materialReturn) => DataCell(
                  Text(materialReturn.productionOrder.id),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: 'ReturnType.name',
                ),
                body: (materialReturn) => DataCell(
                  Tooltip(
                    message: materialReturn.transactionType.name,
                    child: Text(materialReturn.transactionType.name),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'print'.tr(),
                  backendColumn: null,
                ),
                body: (materialReturn) =>
                    DataCell(BoolIcon(materialReturn.isPrint)),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'Department.name',
                ),
                body: (materialReturn) => DataCell(
                  Text(materialReturn.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (materialReturn) => DataCell(
                  Text(materialReturn.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (materialReturn) => DataCell(
                  Text(materialReturn.updateAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (materialReturn) => DataCell(
                  Row(
                    children: [
                      if (materialReturn.transactionType.id == 'PB')
                        ExportPdfButton.prepare(
                            materialReturn: materialReturn,
                            isExternal: isExternal),
                      MaterialReturnDetailPrintButton.prepare(
                          materialReturn, isExternal),
                      // if (materialIssue.product.id != '')
                      //   MaterialIssueDetailButton(
                      //     materialIssue: materialIssue,
                      //     product: materialIssue.product,
                      //     action: DataAction.create,
                      //   ),
                      MaterialReturnViewButton(
                        materialReturn: materialReturn,
                        isExternal: isExternal,
                      ),
                      MaterialReturnDeleteButton.prepare(
                        materialReturn: materialReturn,
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
    );
  }
}
