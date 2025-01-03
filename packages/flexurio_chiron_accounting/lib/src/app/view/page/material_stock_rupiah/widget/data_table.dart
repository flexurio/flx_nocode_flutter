import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/material_return_rupiah_export_pdf_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/material_status_rupiah_export_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialStockRupiahDataTable extends StatefulWidget {
  const MaterialStockRupiahDataTable({super.key});

  @override
  State<MaterialStockRupiahDataTable> createState() =>
      _MaterialStockRupiahDataTableState();
}

class _MaterialStockRupiahDataTableState
    extends State<MaterialStockRupiahDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialStockRupiahQueryBloc>();
    return BlocBuilder<MaterialStockRupiahQueryBloc,
        MaterialStockRupiahQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialStockRupiah>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                MaterialStockRupiahQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'date'),
                ),
              );
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<MaterialStockRupiahQueryBloc>().add(
                    MaterialStockRupiahQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(sortBy: 'date'),
            ),
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportPdf,
                children: {
                  PermissionAccounting.materialMutationRupiahExportPdf:
                      const MaterialMutationRupiahExportPdfButton(),
                  PermissionAccounting.materialUsageSummaryRupiahExportPdf:
                      const MaterialUsageSummaryRupiahExportPdfButton(),
                  PermissionAccounting.materialStockCardRupiahExportPdf:
                      const MaterialStockCardRupiahExportPdfButton(),
                  PermissionAccounting.materialReceiptSummaryRupiahExportPdf:
                      const MaterialReceiptSummaryRupiahExportPdfButton(),
                  PermissionAccounting
                          .materialReceiptDetailSummaryByPurchaseOrderExportPdf:
                      const MaterialReceiptDetailSummaryPurchaseOrderExportPdfButton(),
                  PermissionAccounting.materialLoansBorrowingsExportPdf:
                      const MaterialLoansBorrowingsExportPdfButton(),
                  PermissionAccounting.materialMutationLoansBorrowingsExportPdf:
                      const MaterialMutationLoansBorrowingsExportPdfButton(),
                },
              ),
              const MaterialStatusRupiahExportPdfButton(),
              const MaterialReturnRupiahExportPdfButton(),
              LightButtonSmallGroup(
                action: DataAction.exportPdfMaterialUsageBatch,
                children: {
                  PermissionAccounting.materialUsageBatchExportPdf:
                      const MaterialUsageBatchExportPdfButton(),
                  PermissionAccounting.materialUsageBatchGlobalExportPdf:
                      const MaterialUsageBatchGlobalExportPdfButton(),
                  PermissionAccounting.materialUsageBatchDetailExportPdf:
                      const MaterialUsageBatchDetailExportPdfButton(),
                },
              ),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'material_name'.tr(),
                  backendColumn: 'material_name',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.materialName),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'initial_quantity'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'B'
                        ? materialStockInRupiah.quantity.format()
                        : '0.00000',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'initial_value'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'B'
                        ? materialStockInRupiah.value.format()
                        : '0.00',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'qty_in'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'D'
                        ? materialStockInRupiah.value.format()
                        : '0.00000',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'entry_value'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'D'
                        ? materialStockInRupiah.value.format()
                        : '0.00',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'qty_out'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'C'
                        ? materialStockInRupiah.quantity.format()
                        : '0.00000',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'outgoing_value'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'C'
                        ? materialStockInRupiah.value.format()
                        : '0.00',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'remaining_qty'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'E'
                        ? materialStockInRupiah.quantity.format()
                        : '0.00000',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'residual_value'.tr(),
                  backendColumn: '',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(
                    materialStockInRupiah.dk == 'E'
                        ? materialStockInRupiah.value.format()
                        : '0.00',
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
