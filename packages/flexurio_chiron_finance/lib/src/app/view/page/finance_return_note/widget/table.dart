import 'package:flexurio_chiron_finance/src/app/model/finance_return_note.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

final financeReturnHeaders = [
  'CNJ No.',
  'SRP No.',
  'return_note'.tr(),
  'Delivery No.',
  'delivery_date'.tr(),
  'Tax Invoice No.',
  'Customer',
  'No. Reference',
  'Division',
  'Product',
  'Quantity',
  'Unit',
  'Unit Price',
  'Price',
  'Discount (%)',
  'D.P.P',
  'P.P.N',
  'Total',
  'Expired Date',
  'Batch',
];

class TableFinanceReturn extends StatelessWidget {
  const TableFinanceReturn({
    required this.items,
    super.key,
  });

  final List<FinanceReturnNote> items;

  @override
  Widget build(BuildContext context) {
    const cellPadding = EdgeInsets.all(12);
    const cellHeight = 42.0;
    final columnsWidth = <double>[
      150,
      130,
      100,
      140,
      110,
      150,
      250,
      150,
      250,
      200,
      80,
      50,
      150,
      150,
      100,
      150,
      90,
      150,
      100,
      100,
    ];

    final columnRightAlign = [10, 12, 13, 14, 15, 16, 17];

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: columnsWidth.first,
        rightHandSideColumnWidth:
            columnsWidth.reduce((a, b) => a + b) - columnsWidth.first,
        isFixedHeader: true,
        headerWidgets: List.generate(
          financeReturnHeaders.length,
          (index) => SizedBox(
            height: cellHeight,
            width: columnsWidth[index],
            child: Align(
              alignment: columnRightAlign.contains(index)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                padding: cellPadding,
                child: Text(
                  financeReturnHeaders[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        leftSideItemBuilder: (context, index) {
          return Padding(
            padding: cellPadding,
            child: Text(items[index].cnjNo),
          );
        },
        rightSideItemBuilder: (context, index) {
          final item = items[index];
          final dateFormat = DateFormat.yMMMd();
          var column = 1;
          return Row(
            children: [
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.srpNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.returnNote,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.deliveryNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    dateFormat.format(item.deliveryDate),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.taxInvoiceNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.customer,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.referenceNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.division,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.product,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.quantity.toString(),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.unit,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(item.unitPrice.idr, textAlign: TextAlign.right),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.price.idr,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.discountPercent.toStringAsFixed(2),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.dpp.idr,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.ppn.toStringAsFixed(2),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.total.idr,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    dateFormat.format(item.expiredDate),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.batch,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: items.length,
        rowSeparatorWidget: Divider(
          color: Colors.grey.shade300,
          height: 1,
          thickness: 0,
        ),
      ),
    );
  }
}
