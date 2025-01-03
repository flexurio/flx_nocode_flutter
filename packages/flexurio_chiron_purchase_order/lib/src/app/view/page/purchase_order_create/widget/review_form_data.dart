import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/document_button.dart';

class ReviewFormData extends StatelessWidget {
  const ReviewFormData({
    required this.purchaseOrderFormSupplier,
    required this.purchaseOrderFormDiscount,
    required this.purchaseOrder,
    required this.purchaseOrderBloc,
    super.key,
  });

  final PurchaseOrder? purchaseOrder;
  final PurchaseOrderFormSupplier purchaseOrderFormSupplier;
  final PurchaseOrderFormDiscount purchaseOrderFormDiscount;
  final PurchaseOrderBloc purchaseOrderBloc;

  @override
  Widget build(BuildContext context) {
    final canEdit = purchaseOrder != null &&
        purchaseOrder!.status == PurchaseOrderStatus.input;

    return Column(
      children: [
        if (purchaseOrder != null)
          Column(
            children: [
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'ID',
                    child: Text(purchaseOrder!.id).canCopy(),
                  ),
                  TileDataVertical(
                    label: 'Status',
                    child: ChipType(purchaseOrder!.status),
                  ),
                ],
              ),
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'created_by'.tr(),
                    child: GetNameUser(userId: purchaseOrder!.createdById),
                  ),
                  TileDataVertical(
                    label: 'Vendor',
                    child: Text(
                      purchaseOrder!.materialRequest.vendor?.name ?? '-',
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        if (canEdit)
          Align(
            alignment: Alignment.centerRight,
            child: IconButtonSmall(
              permission: PermissionPurchaseOrder.purchaseOrderEdit,
              onPressed: () {
                Navigator.push(
                  context,
                  PurchaseOrderSupplierFormEditPage.route(
                    purchaseOrder: purchaseOrder!,
                    purchaseOrderBloc: purchaseOrderBloc,
                  ),
                );
              },
              action: DataAction.edit,
            ),
          ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Purchase Request ID',
              child:
                  Text(purchaseOrderFormSupplier.materialRequest.id).canCopy(),
            ),
            TileDataVertical(
              label: 'Supplier',
              child: Text(purchaseOrderFormSupplier.supplier.name),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Attention',
              child: Text(purchaseOrderFormSupplier.supplier.pic),
            ),
            TileDataVertical(
              label: 'address'.tr(),
              child: Text(purchaseOrderFormSupplier.supplier.address),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Fax',
              child: Text(purchaseOrderFormSupplier.supplier.fax),
            ),
            TileDataVertical(
              label: 'Phone',
              child: Text(purchaseOrderFormSupplier.supplier.phone),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'currency'.tr(),
              child: Text(purchaseOrderFormSupplier.currency.id),
            ),
            TileDataVertical(
              label: 'delivery_date'.tr(),
              child: Text(purchaseOrderFormSupplier.deliveryDate.yMMMMd),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'Quotation No.',
              child: Text(purchaseOrderFormSupplier.quotationNo),
            ),
            TileDataVertical(
              label: 'Revision',
              child: Text('${purchaseOrderFormSupplier.revisionNo}'),
            ),
          ],
        ),
        if (purchaseOrder != null)
          TileDataVertical(
            label: 'document'.tr(),
            child: Row(
              children: [
                InvoiceReceiveDocumentButton.byPurchaseOrderId(
                  purchaseOrder!.id,
                )
              ],
            ),
          ),
        const Divider(),
        if (canEdit)
          Align(
            alignment: Alignment.centerRight,
            child: IconButtonSmall(
              permission: PermissionPurchaseOrder.purchaseOrderEdit,
              onPressed: () {
                Navigator.push(
                  context,
                  PurchaseOrderDiscountPpnFormEditPage.route(
                    purchaseOrder: purchaseOrder!,
                    purchaseOrderBloc: purchaseOrderBloc,
                  ),
                );
              },
              action: DataAction.edit,
            ),
          ),
        RowFields(
          children: [
            Column(
              children: [
                TileDataVertical(
                  label: 'Payment Type',
                  child: ChipType(
                    purchaseOrderFormDiscount.paymentType,
                  ),
                ),
                TileDataVertical(
                  label: 'PPH',
                  child: ChipType(purchaseOrderFormDiscount.taxType),
                ),
              ],
            ),
            Column(
              children: [
                TileDataVertical(
                  label: 'Note',
                  child: Text(purchaseOrderFormDiscount.description),
                ),
                Visibility(
                  visible: purchaseOrderFormDiscount.paymentType ==
                      PurchaseOrderPaymentType.termOfPayment,
                  child: TileDataVertical(
                    label: 'Term of Payment',
                    child: Text(
                      '${purchaseOrderFormDiscount.termOfPayment} days',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
