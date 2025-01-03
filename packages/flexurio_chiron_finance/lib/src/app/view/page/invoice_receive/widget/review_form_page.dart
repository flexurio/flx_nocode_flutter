import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/document_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InvoiceReceiveReviewFormPage extends StatefulWidget {
  const InvoiceReceiveReviewFormPage({
    required this.invoiceReceive,
    super.key,
  });

  final InvoiceReceive invoiceReceive;

  @override
  State<InvoiceReceiveReviewFormPage> createState() => _InvoiceReceiveReviewFormPageState();
}

class _InvoiceReceiveReviewFormPageState extends State<InvoiceReceiveReviewFormPage> {
  @override
  Widget build(BuildContext context) {
    return FormAction(
            children: [
              RowFields(
                children: [
                  Column(
                    children: [
                      TileDataVertical(
                        label: 'invoice_number'.tr(),
                        child: Text(widget.invoiceReceive.id),
                      ),
                      TileDataVertical(
                        label: 'transaction_number'.tr(),
                        child: Text(widget.invoiceReceive.transactionId),
                      ),
                      TileDataVertical(
                        label: 'Supplier',
                        child: Text(widget.invoiceReceive.supplier.name),
                      ),
                      TileDataVertical(
                        label: 'delivery_order'.tr(),
                        child: Text(widget.invoiceReceive.deliveryOrderId),
                      ),
                      TileDataVertical(
                        label: 'tax_invoice_number'.tr(),
                        child: Text(widget.invoiceReceive.taxInvoiceNo),
                      ),
                      TileDataVertical(
                        label: 'term_of_payment'.tr(),
                        child: Text(
                          widget.invoiceReceive.termOfPayment.toString(),
                        ),
                      ),
                      TileDataVertical(
                        label: 'received_by_corporate_service_on'.tr(),
                        child: Text(
                          widget.invoiceReceive.receiveByServiceAt
                                  ?.yMMMdHm ??
                              '-',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TileDataVertical(
                        label: 'invoice_date'.tr(),
                        child: Text(
                          widget.invoiceReceive.invoiceDate.yMMMdHm,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Purchase Order',
                        child: Text(
                          widget.invoiceReceive.purchaseOrder.id,
                        ),
                      ),
                      TileDataVertical(
                        label: 'rate'.tr(),
                        child: Text(
                          widget.invoiceReceive.rate.toString(),
                        ),
                      ),
                      TileDataVertical(
                        label: 'delivery_order_date'.tr(),
                        child: Text(
                          widget.invoiceReceive.deliveryOrderDate.yMMMd,
                        ),
                      ),
                      TileDataVertical(
                        label: 'tax_invoice_date'.tr(),
                        child: Text(
                          widget.invoiceReceive.taxInvoiceDate.yMMMd,
                        ),
                      ),
                      TileDataVertical(
                        label: 'due_date'.tr(),
                        child: Text(
                          widget.invoiceReceive.dueDate.yMMMd,
                        ),
                      ),
                      TileDataVertical(
                        label: 'received_by_finance_on'.tr(),
                        child: Text(
                          widget.invoiceReceive.receiveByFinanceAt
                                  ?.yMMMdHm ??
                              '-',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(12),
              const Divider(),
              const Gap(12),
              RowFields(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      InvoiceReceiveDocumentButton.byInvoiceReceive(
                        widget.invoiceReceive,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TileDataHorizontal(
                        label: 'Subtotal',
                        child: Text(
                          widget.invoiceReceive.subtotal.format(),
                        ),
                      ),
                      TileDataHorizontal(
                        label: 'Percent PPN',
                        child: Text(widget.invoiceReceive.ppn.label),
                      ),
                      TileDataHorizontal(
                        label: 'Percent PPh',
                        child: Text('${widget.invoiceReceive.pph.taxPercent} %'),
                      ),
                      TileDataHorizontal(
                        label: 'Total',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(
                          widget.invoiceReceive.total.format(),
                          style: const TextStyle(fontSize: 24),
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
