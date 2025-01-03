import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_issue/widget/export_packaging_material_delivery_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDataTable extends StatelessWidget {
  const MaterialIssueDataTable({
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialIssueQueryBloc(isExternal: isExternal)
        ..add(const MaterialIssueQueryEvent.fetch()),
      child: MaterialIssueDataTable(isExternal: isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialIssueQueryBloc, MaterialIssueQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialIssue>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            pageOptions: state.maybeWhen(
              loading: (data) => data,
              loaded: (data) => data,
              orElse: PageOptions.empty,
            ),
            onRefresh: () => context
                .read<MaterialIssueQueryBloc>()
                .add(const MaterialIssueQueryEvent.fetch()),
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportPdf,
                children: {
                  // TODO(putra): add permission
                  null: MaterialIssueExportPdfButton.prepare(
                      isExternal: isExternal),
                  PermissionMaterialStock.materialIssueReportExportPdf:
                      MaterialIssueReportExportPdfButton(
                          isExternal: isExternal),
                },
              ),
              refreshButton,
              MaterialIssueCreateButton(isExternal: isExternal),
              MaterialIssueCreateAdditionalButton(isExternal: isExternal),
            ],
            onChanged: (pageOptions) {
              context
                  .read<MaterialIssueQueryBloc>()
                  .add(MaterialIssueQueryEvent.fetch(pageOptions: pageOptions));
            },
            columns: [
              DTColumn(
                widthFlex: 7.5,
                head: const DTHead(label: 'ID', backendColumn: 'id'),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: 'mi_type',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.miType.name),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'Department.id',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'Product.id',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.product.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'batch'.tr(),
                  backendColumn: 'BatchNo.id',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.batch.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'material_group'.tr(),
                  backendColumn: 'MaterialGroup.id',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.materialGroup.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'expired_date'.tr(),
                  backendColumn: 'product_expired_date',
                ),
                body: (materialIssue) => DataCell(
                  materialIssue.product.id == ''
                      ? Text('-')
                      : Text(
                          materialIssue.productionExpiredDate?.yMMMdHm ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'mi_date'.tr(),
                  backendColumn: 'mi_date',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.miDate.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (materialIssue) => DataCell(
                  Text(materialIssue.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (materialIssue) => DataCell(
                  Row(
                    children: [
                      MaterialIssueDetailPrintButton.prepare(
                        materialIssue: materialIssue,
                        isExternal: isExternal,
                      ),
                      if (materialIssue.materialGroup.id == 'KEMASAN')
                        ExportPackagingMaterialDeliveryPdfButton.prepare(
                          materialIssue: materialIssue,
                          isExternal: isExternal,
                        ),
                      materialIssue.product.id != '' ||
                              materialIssue.miType.id == 'PR3'
                          ? MaterialIssueDetailButton(
                              materialIssue: materialIssue,
                              product: materialIssue.product,
                              action: DataAction.create,
                              isExternal: isExternal,
                            )
                          : MaterialIssueDetailButtonNonMi(
                              materialIssue: materialIssue,
                              action: DataAction.createAdditional,
                              isExternal: isExternal,
                            ),
                      MaterialIssueDeleteButton.prepare(
                        materialIssue: materialIssue,
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
