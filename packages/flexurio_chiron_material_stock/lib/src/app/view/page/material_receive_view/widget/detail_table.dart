import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/analysis_detail_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/reject_detail_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/release_detail_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_view/widget/detail_retest_button.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailTable extends StatelessWidget {
  const MaterialReceiveDetailTable({
    super.key,
    required this.materialReceive,
    required this.isExternal,
    required this.purchaseOrderDetail,
  });

  final MaterialReceive materialReceive;
  final bool isExternal;
  final PurchaseOrderDetail purchaseOrderDetail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReceiveDetailQueryBloc,
        MaterialReceiveDetailQueryState>(
      builder: (context, state) {
        return DataTableBackend<MaterialReceiveDetail>(
          onRefresh: () {
            context.read<MaterialReceiveDetailQueryBloc>().add(
                  MaterialReceiveDetailQueryEvent.fetch(
                    period: DateTime.now(),
                    materialReceive: materialReceive,
                  ),
                );
          },
          key: ValueKey(state.hashCode),
          pageOptions: state.maybeWhen(
            orElse: PageOptions.empty,
            loading: (pageOptions) => pageOptions,
            loaded: (pageOptions) => pageOptions,
          ),
          actionRight: (refreshButton) => [refreshButton],
          onChanged: (pageOptions) {
            context.read<MaterialReceiveDetailQueryBloc>().add(
                  MaterialReceiveDetailQueryEvent.fetch(
                    period: DateTime.now(),
                    pageOptions: pageOptions,
                    materialReceive: materialReceive,
                  ),
                );
          },
          status: state.maybeWhen(
            loaded: (_) => Status.loaded,
            loading: (_) => Status.progress,
            orElse: () => Status.error,
          ),
          columns: [
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'Material ID', backendColumn: 'material_id'),
              body: (materialReceive) => DataCell(
                Text(
                  materialReceive.material.id,
                ),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'name'.tr(), backendColumn: 'material_id'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.material.name),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'batch'.tr(), backendColumn: 'batch_no'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.batchNo),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'Barcode', backendColumn: 'barcode_no'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.barcodeNo),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'NA', backendColumn: 'na'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.na),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'vat_number'.tr(), backendColumn: 'vat_no'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.vatNo.format()),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'vat_total'.tr(), backendColumn: 'vat_total'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.vatTotal.format()),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'quantity'.tr(), backendColumn: 'quantity'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.quantity.format()),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'total_quantity'.tr(),
                backendColumn: 'total_quantity',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.totalQuantity.format()),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'batch'.tr(), backendColumn: 'batch_no'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.batchNo),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'Unit', backendColumn: 'unit_id'),
              body: (materialReceive) => DataCell(
                Text(materialReceive.materialUnit.id),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(label: 'quantity_po'.tr(), backendColumn: null),
              body: (materialReceive) => DataCell(
                Text(
                  purchaseOrderDetail.quantity.toString().isEmpty
                      ? '0'
                      : purchaseOrderDetail.quantity.toString(),
                ),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'design_code'.tr(),
                backendColumn: 'material_design_id',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.materialDesign?.designCode ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'expired_date'.tr(),
                backendColumn: 'expired_date',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.expiredDate?.yMMMMd ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'best_before'.tr(),
                backendColumn: 'best_before',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.bestBefore?.yMMMMd ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'mfg_date'.tr(),
                backendColumn: 'manufacturing_date',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.manufacturingDate?.yMMMMd ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'retest_date'.tr(),
                backendColumn: 'retest_date',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.retestDate?.yMMMMd ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'retest_date_quality_control'.tr(),
                backendColumn: 'retest_date_qc',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.retestDateQualityControl?.yMMMMd ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'shelf_life'.tr(),
                backendColumn: 'shelf_life',
              ),
              body: (materialReceive) => DataCell(
                Text(materialReceive.shelfLife?.yMMMMd ?? '-'),
              ),
            ),
            DTColumn(
              widthFlex: 8,
              head: DTHead(
                label: 'Status',
                backendColumn: 'status',
              ),
              body: (materialReceive) => DataCell(
                ChipType(materialReceive.materialStatus),
              ),
            ),
            DTColumn(
              widthFlex: 12,
              head: DTHead(
                label: 'actions'.tr(),
                backendColumn: null,
              ),
              body: _buildActions,
            ),
          ],
        );
      },
    );
  }

  DataCell _buildActions(materialReceiveDetail) {
    final isQuarantine = materialReceiveDetail.materialStatus.isQuarantine;
    final isRelease = materialReceiveDetail.materialStatus.isRelease;
    final isSpecificMaterialGroup = ['BAKU', 'BANTU', 'KEMASAN']
        .contains(materialReceiveDetail.materialReceive.materialGroup.id);

    return DataCell(
      Row(
        children: [
          if (isRelease) _buildRetestButton(materialReceiveDetail),
          _buildEditButton(materialReceiveDetail),
          if (isQuarantine && isSpecificMaterialGroup)
            _buildAnalysisButton(materialReceiveDetail),
          if (isQuarantine && isSpecificMaterialGroup)
            _buildReleaseButton(materialReceiveDetail),
          if (isQuarantine && isSpecificMaterialGroup)
            _buildRejectButton(materialReceiveDetail)
        ],
      ),
    );
  }

  Widget _buildRejectButton(MaterialReceiveDetail materialReceiveDetail) {
    return MaterialReceiveDetailRejectButton(
      detail: materialReceiveDetail,
      materialReceive: materialReceive,
      isExternal: isExternal,
    );
  }

  Widget _buildReleaseButton(
    MaterialReceiveDetail materialReceiveDetail,
  ) {
    return MaterialReceiveDetailReleaseButton(
      detail: materialReceiveDetail,
      materialReceive: materialReceive,
      isExternal: isExternal,
    );
  }

  Widget _buildRetestButton(
    MaterialReceiveDetail materialReceiveDetail,
  ) {
    return MaterialReceiveDetailRetestButton(
      detail: materialReceiveDetail,
      materialReceive: materialReceive,
      isExternal: isExternal,
    );
  }

  Widget _buildAnalysisButton(MaterialReceiveDetail materialReceiveDetail) {
    return MaterialReceiveDetailAnalysisButton(
      isExternal: isExternal,
      materialReceive: materialReceive,
      materialReceiveDetail: materialReceiveDetail,
    );
  }

  Widget _buildEditButton(MaterialReceiveDetail materialReceiveDetail) {
    return MaterialReceiveDetailEditButton(
      materialReceive: materialReceive,
      materialReceiveDetail: materialReceiveDetail,
      type: materialReceiveDetail.materialReceive.type,
      isExternal: isExternal,
    );
  }
}
