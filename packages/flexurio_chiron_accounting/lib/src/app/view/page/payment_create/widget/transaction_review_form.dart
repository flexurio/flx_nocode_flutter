import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';

class TransactionCreateReviewForm extends StatefulWidget {
  const TransactionCreateReviewForm({
    this.onPrevious,
    this.payment,
    this.viewTransactionJournal,
    super.key,
  });

  final void Function()? onPrevious;
  final TransactionPayment? payment;
  final bool? viewTransactionJournal;

  @override
  State<TransactionCreateReviewForm> createState() =>
      _TransactionCreateReviewFormState();
}

class _TransactionCreateReviewFormState
    extends State<TransactionCreateReviewForm> {
  @override
  Widget build(BuildContext context) {
    return FormAction(
      children: [
        _buildPaymentInformation(),
        const Gap(24),
        const Divider(),
        const Gap(12),
        _buildJournalTable(),
        const Gap(48),
      ],
    );
  }

  RowFields _buildJournalTable() {
    return RowFields(
      children: [
        Column(
          children: [
            Text(
              'Journals'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Gap(12),
            ReviewFormTransactionsTable.prepare(
              transactionNo: widget.viewTransactionJournal == true
                  ? widget.payment!.paymentId!
                  : widget.payment!.transactionNo,
            ),
          ],
        ),
      ],
    );
  }

  Column _buildPaymentInformation() {
    return Column(
      children: [
        RowFields(
          children: [
            if (widget.viewTransactionJournal == true)
              TileDataVertical(
                label: 'Payment No'.tr(),
                child: Text(widget.payment?.paymentId ?? '-'),
              )
            else
              TileDataVertical(
                label: 'Transaction No'.tr(),
                child: Text(widget.payment?.transactionNo ?? ''),
              ),
            TileDataVertical(
              label: 'Transaction Date'.tr(),
              child: Text(widget.payment?.transactionDate.yMMMMd ?? '-'),
            ),
          ],
        ),
        RowFields(
          children: [
            if (widget.viewTransactionJournal == false)
              TileDataVertical(
                label: 'Order ID'.tr(),
                child: Text(widget.payment?.orderId ?? '-'),
              ),
            TileDataVertical(
              label: 'Invoice No'.tr(),
              child: Text(widget.payment?.invoiceNo ?? '-'),
            ),
            if (widget.viewTransactionJournal == true)
              TileDataVertical(
                label: 'supplier'.tr(),
                child: Text(widget.payment?.supplierName ?? '-'),
              ),
          ],
        ),
        RowFields(
          children: [
            if (widget.viewTransactionJournal == false)
              TileDataVertical(
                label: 'supplier'.tr(),
                child: Text(widget.payment?.supplierName ?? '-'),
              ),
            if (widget.viewTransactionJournal == false)
              TileDataVertical(
                label: 'Total'.tr(),
                child: Text(widget.payment?.total.format() ?? '-'),
              ),
          ],
        ),
        TileDataVertical(
          label: 'document'.tr(),
          child: Row(
            children: [
              InvoiceReceiveDocumentButton.byPurchaseOrderId(
                widget.payment!.orderId,
              )
            ],
          ),
        ),
      ],
    );
  }
}
