import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order/widget/purchase_order_outstanding_export_excel_button.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order/widget/purchase_order_outstanding_product_export_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderDataTable extends StatefulWidget {
  const PurchaseOrderDataTable({super.key});

  @override
  State<PurchaseOrderDataTable> createState() => _PurchaseOrderDataTableState();
}

class _PurchaseOrderDataTableState extends State<PurchaseOrderDataTable> {
  var _status = PurchaseOrderStatus.input;

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<PurchaseOrderQueryBloc>();

    return BlocBuilder<PurchaseOrderQueryBloc, PurchaseOrderQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<PurchaseOrder>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onChanged: (pageOptions) {
              queryBloc.add(
                PurchaseOrderQueryEvent.fetch(pageOptions: pageOptions),
              );
            },
            onRefresh: () =>
                queryBloc.add(const PurchaseOrderQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              const PurchaseOrderOutstandingExportExcelButton(),
              const PurchaseOrderOutstandingProductExportExcelButton(),
              const PurchaseOrderExportExcelButton(),
              const PurchaseOrderRejectExportExcelButton(),
              refreshButton,
              const PurchaseOrderCreateButton(),
            ],
            actionLeft: [
              DropDownSmall<PurchaseOrderStatus>(
                key: ValueKey(_status),
                initialValue: _status,
                labelText: 'Status',
                itemAsString: (status) => status.label,
                items: PurchaseOrderStatus.list,
                onChanged: (status) {
                  if (status != null) {
                    _status = status;
                    queryBloc.add(
                      PurchaseOrderQueryEvent.fetch(status: [status]),
                    );
                  }
                },
              ),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (purchaseOrder) =>
                    DataCell(Text(purchaseOrder.id).canCopy()),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'MaterialRequest.id',
                  label: 'Purchase Request ID',
                ),
                body: (purchaseOrder) => DataCell(
                  Text(purchaseOrder.materialRequest.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 9,
                head: const DTHead(
                  backendColumn: 'status',
                  label: 'Status',
                ),
                body: (purchaseOrder) => DataCell(
                  ChipType(purchaseOrder.status),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'Supplier.name',
                  label: 'supplier'.tr(),
                ),
                body: (purchaseOrder) =>
                    DataCell(Text(purchaseOrder.supplier.name)),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'MaterialRequest__Vendor.name',
                  label: 'manufacturer'.tr(),
                ),
                body: (purchaseOrder) => DataCell(
                  Text(purchaseOrder.materialRequest.vendor?.name ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'delivery_date',
                  label: 'delivery_date'.tr(),
                ),
                body: (purchaseOrder) =>
                    DataCell(Text(purchaseOrder.deliveryDate.yMMMd)),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'total',
                  label: 'Total',
                  numeric: true,
                ),
                body: (purchaseOrder) => DataCell(
                  Text(purchaseOrder.total.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'created_by_id',
                  label: 'created_by'.tr(),
                ),
                body: (purchaseOrder) => DataCell(
                  GetNameUser(userId: purchaseOrder.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                ),
                body: (purchaseOrder) => DataCell(
                  Text(
                    purchaseOrder.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'updated_by_id',
                  label: 'updated_by'.tr(),
                ),
                body: (purchaseOrder) => DataCell(
                  GetNameUser(userId: purchaseOrder.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                ),
                body: (purchaseOrder) => DataCell(
                  Text(purchaseOrder.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(label: 'actions'.tr(), backendColumn: ''),
                body: (purchaseOrder) => DataCell(
                  Row(
                    children: [
                      if (purchaseOrder.status ==
                          PurchaseOrderStatus.accountingConfirm)
                        ExportPdfButton.prepare(purchaseOrder),
                      PurchaseOrderViewButton(purchaseOrder: purchaseOrder),
                      if (purchaseOrder.status == PurchaseOrderStatus.input &&
                          purchaseOrder.createdById ==
                              UserRepositoryApp.instance.userApp!.id)
                        PurchaseOrderDeleteButton.prepare(
                          purchaseOrder: purchaseOrder,
                        ),
                      if (purchaseOrder.status ==
                          PurchaseOrderStatus.nextShipping)
                        PurchaseOrderCloseButton.prepare(
                          purchaseOrder: purchaseOrder,
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
