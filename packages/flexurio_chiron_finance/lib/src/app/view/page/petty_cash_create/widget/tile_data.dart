import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal_accounting_view/transaction_journal_view_page.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class TileDataPettyCash extends StatelessWidget {
  const TileDataPettyCash({required this.pettyCash, super.key});

  final PettyCash pettyCash;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowFields(
          children: [
            TileDataVertical(
              label: 'ID',
              child: Text(pettyCash.id).canCopy(),
            ),
            TileDataVertical(
              label: 'Status',
              child: ChipType(pettyCash.status),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'created_by'.tr(),
              child: GetNameUser(userId: pettyCash.createdById),
            ),
            TileDataVertical(
              label: 'created_at'.tr(),
              child: Text(pettyCash.createdAt.yMMMdHm),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'realization_no'.tr(),
              child: TextLink(
                pettyCash.realizationNo ?? '-',
                canCopy: true,
                onTap: pettyCash.realizationNo == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          TransactionJournalAccountingViewPage2.route(
                            transactionNo: pettyCash.realizationNo!,
                          ),
                        );
                      },
              ),
            ),
            TileDataVertical(
              label: 'amount'.tr(),
              child: Text(pettyCash.amount.format()),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'recipient'.tr(),
              child: Text(
                  pettyCash.recipient.isNotEmpty ? pettyCash.recipient : '-'),
            ),
            TileDataVertical(
              label: 'return_amount'.tr(),
              child: Text(pettyCash.returnAmount?.format() ?? '-'),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'document_receive_by'.tr(),
              child: Text((pettyCash.documentReceiveBy != null &&
                      pettyCash.documentReceiveBy != 0)
                  ? pettyCash.documentReceiveBy.toString()
                  : '-'),
            ),
            TileDataVertical(
              label: 'document_receive_at'.tr(),
              child: Text(pettyCash.documentReceiveAt?.yMMMdHm ?? '-'),
            ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'approve_finance_at'.tr(),
              child: Text(pettyCash.approveFinanceAt.yMMMdHm),
            ),
            pettyCash.vehicleRent.id.isNotEmpty
                ? TileDataVertical(
                    label: 'vehicle_rent_id'.tr(),
                    child: Text(pettyCash.vehicleRent.id),
                  )
                : TileDataVertical(
                    label: 'purchase_order_id'.tr(),
                    child: Text(pettyCash.purchaseOrder.id),
                  ),
          ],
        ),
        RowFields(
          children: [
            TileDataVertical(
              label: 'description'.tr(),
              child: Text(pettyCash.description ?? '-'),
            ),
            SizedBox.shrink()
          ],
        ),
      ],
    );
  }
}
