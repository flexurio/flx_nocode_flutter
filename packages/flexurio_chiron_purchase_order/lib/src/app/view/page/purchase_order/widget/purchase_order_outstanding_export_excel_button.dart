import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_outstanding_query/purchase_order_outstanding_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_outstanding.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class PurchaseOrderOutstandingExportExcelButton extends StatefulWidget {
  const PurchaseOrderOutstandingExportExcelButton({super.key});

  @override
  State<PurchaseOrderOutstandingExportExcelButton> createState() => _PurchaseOrderOutstandingExportExcelButtonState();
}

class _PurchaseOrderOutstandingExportExcelButtonState extends State<PurchaseOrderOutstandingExportExcelButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderOutstandingQueryBloc, PurchaseOrderOutstandingQueryState>(
      bloc: PurchaseOrderOutstandingQueryBloc()..add(
        PurchaseOrderOutstandingQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(
            sortBy: 'purchase_order_date',
          ),
        ),
      ),
      builder: (context, state) {
        return LightButtonSmall(
          action: DataAction.exportExcel,
          permission: null,
          status: state.maybeWhen(
            loading: (_) => Status.progress,
            loaded: (_) => Status.loaded,
            orElse: () => Status.error,
          ),
          onPressed: () async {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (purchaseOrderOutstanding) {
                final bytes = simpleExcel<PurchaseOrderOutstanding>(
                  context: context,
                  data: purchaseOrderOutstanding.data,
                  columns: [
                    TColumn(
                      title: 'Material'.tr(),
                      numeric: true,
                      builder: (data, index) => data.materialName,
                    ),
                    TColumn(
                      title: 'Divisi Name'.tr(),
                      numeric: true,
                      builder: (data, index) => data.divisi,
                    ),
                    TColumn(
                      title: 'MatGroup'.tr(),
                      numeric: true,
                      builder: (data, index) => data.materialGroupId,
                    ),
                    TColumn(
                      title: 'No MR'.tr(),
                      numeric: true,
                      builder: (data, index) => data.materialRequestId,
                    ),
                    TColumn(
                      title: 'Tgl MR'.tr(),
                      numeric: true,
                      builder: (data, index) => DateFormat('yyyyMMdd').format(data.materialRequestDate),
                    ),
                    TColumn(
                      title: 'Periode MR'.tr(),
                      numeric: true,
                      builder: (data, index) => data.periodMaterialRequest,
                    ),
                    TColumn(
                      title: 'Qty Pesan'.tr(),
                      numeric: true,
                      builder: (data, index) => data.quantityPo.format(),
                    ),
                    TColumn(
                      title: 'Value'.tr(),
                      numeric: true,
                      builder: (data, index) => data.value.format(),
                    ),
                    TColumn(
                      title: 'Satuan'.tr(),
                      numeric: true,
                      builder: (data, index) => data.unitId,
                    ),
                    TColumn(
                      title: 'Periode-TglButuh'.tr(),
                      numeric: true,
                      builder: (data, index) => '${data.periodDateOfNeed}-${DateFormat('yyyyMMdd').format(data.dateOfNeed)}',
                    ),
                    TColumn(
                      title: 'Tgl Tempo'.tr(),
                      numeric: true,
                      builder: (data, index) => DateFormat('yyyyMMdd').format(data.materialRequestDueDate),
                    ),
                    TColumn(
                      title: 'Delivery Date(PO)'.tr(),
                      numeric: true,
                      builder: (data, index) => DateFormat('yyyyMMdd').format(data.materialReceiveDate),
                    ),
                    TColumn(
                      title: 'No PO'.tr(),
                      numeric: true,
                      builder: (data, index) => data.purchaseOrderId,
                    ),
                    TColumn(
                      title: 'Tgl PO'.tr(),
                      numeric: true,
                      builder: (data, index) => DateFormat('yyyyMMdd').format(data.purchaseOrderDate),
                    ),
                    TColumn(
                      title: 'No LPB'.tr(),
                      numeric: true,
                      builder: (data, index) => data.transactionId,
                    ),
                    TColumn(
                      title: 'Terima'.tr(),
                      numeric: true,
                      builder: (data, index) => data.quantityReceivedConverted.format(),
                    ),
                    TColumn(
                      title: 'TglTerima'.tr(),
                      numeric: true,
                      builder: (data, index) => DateFormat('yyyyMMdd').format(data.materialReceiveDate),
                    ),
                    TColumn(
                      title: 'Tgl Tempo QC'.tr(),
                      numeric: true,
                      builder: (data, index) => '',
                    ),
                    TColumn(
                      title: 'QtyRelease'.tr(),
                      numeric: true,
                      builder: (data, index) => data.quantityReleaseConverted.format(),
                    ),
                    TColumn(
                      title: 'QtyReject'.tr(),
                      numeric: true,
                      builder: (data, index) => data.quantityRejectConverted.format(),
                    ),
                    TColumn(
                      title: 'QtyKarantina'.tr(),
                      numeric: true,
                      builder: (data, index) => data.quantityQuarantine.format(),
                    ),
                    TColumn(
                      title: 'ReleaseDate'.tr(),
                      numeric: true,
                      builder: (data, index) => data.releaseDate.ddMMyyyySlash,
                    ),
                    TColumn(
                      title: 'NA'.tr(),
                      numeric: true,
                      builder: (data, index) => data.na,
                    ),
                    TColumn(
                      title: 'Estimasi'.tr(),
                      numeric: true,
                      builder: (data, index) => '',
                    ),
                    TColumn(
                      title: 'Ket'.tr(),
                      numeric: true,
                      builder: (data, index) => data.purchaseOrderDescription,
                    ),
                    TColumn(
                      title: 'Supplier'.tr(),
                      numeric: true,
                      builder: (data, index) => data.supplierName,
                    ),
                    TColumn(
                      title: 'Design Baru'.tr(),
                      numeric: true,
                      builder: (data, index) => data.designCodeId,
                    ),
                    TColumn(
                      title: 'Status MR'.tr(),
                      numeric: true,
                      builder: (data, index) => data.purchaseOrderStatus,
                    ),
                  ],
                );
                saveFile(bytes, 'Report_Outstanding_Purchase_Order.xlsx');
              },
            );
          },
        );
      },
    );
  }
}
