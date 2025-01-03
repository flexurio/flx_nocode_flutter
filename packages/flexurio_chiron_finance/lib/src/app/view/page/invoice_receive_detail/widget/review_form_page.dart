import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class InvoiceReceiveDetailReviewFormPage extends StatefulWidget {
  const InvoiceReceiveDetailReviewFormPage({
    required this.invoiceReceiveDetail,
    super.key,
  });

  final InvoiceReceiveDetail invoiceReceiveDetail;

  @override
  State<InvoiceReceiveDetailReviewFormPage> createState() =>
      _InvoiceReceiveDetailReviewFormPageState();
}

class _InvoiceReceiveDetailReviewFormPageState
    extends State<InvoiceReceiveDetailReviewFormPage> {
  @override
  Widget build(BuildContext context) {
    return FormAction(
      children: [
        RowFields(
          children: [
            Column(
              children: [
                TileDataVertical(
                  label: 'product_code'.tr(),
                  child: Text(widget.invoiceReceiveDetail.product.id.isEmpty
                      ? '-'
                      : widget.invoiceReceiveDetail.product.id),
                ),
                TileDataVertical(
                  label: 'material_code'.tr(),
                  child: Text(widget.invoiceReceiveDetail.material.id.isEmpty
                      ? '-'
                      : widget.invoiceReceiveDetail.material.id),
                ),
                TileDataVertical(
                  label: 'quantity'.tr(),
                  child: Text(
                      widget.invoiceReceiveDetail.qtyInvoice.toString().isEmpty
                          ? '-'
                          : widget.invoiceReceiveDetail.qtyInvoice.toString()),
                ),
                TileDataVertical(
                  label: 'price'.tr(),
                  child: Text(widget.invoiceReceiveDetail.price.format().isEmpty
                      ? '-'
                      : widget.invoiceReceiveDetail.price.format()),
                ),
              ],
            ),
            Column(
              children: [
                TileDataVertical(
                  label: 'product_name'.tr(),
                  child: Text(
                    widget.invoiceReceiveDetail.product.name.isEmpty
                        ? '-'
                        : widget.invoiceReceiveDetail.product.name,
                  ),
                ),
                TileDataVertical(
                  label: 'material_name'.tr(),
                  child: Text(
                    widget.invoiceReceiveDetail.material.name.isEmpty
                        ? '-'
                        : widget.invoiceReceiveDetail.material.name,
                  ),
                ),
                TileDataVertical(
                  label: 'unit'.tr(),
                  child: Text(
                    widget.invoiceReceiveDetail.unitId.toString().isEmpty
                        ? '-'
                        : widget.invoiceReceiveDetail.unitId.toString(),
                  ),
                ),
                TileDataVertical(
                  label: 'total'.tr(),
                  child: Text(
                    widget.invoiceReceiveDetail.total.format().isEmpty
                        ? '-'
                        : widget.invoiceReceiveDetail.total.format(),
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
