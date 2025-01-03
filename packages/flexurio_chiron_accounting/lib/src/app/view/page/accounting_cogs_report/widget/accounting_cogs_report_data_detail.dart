import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/accounting_cogs_detail_query/accounting_cogs_detail_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/util/excel_cogs.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/export_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AccountingCogsReportDataDetail extends StatelessWidget {
  const AccountingCogsReportDataDetail._({
    required this.cogs,
    required this.division,
    required this.month,
    required this.year,
    required this.cogsDetailHeader,
  });
  final Cogs cogs;
  final int year;
  final int month;
  final Company division;
  final CogsDetailHeader cogsDetailHeader;

  static Widget prepare({
    required Cogs cogs,
    required int year,
    required int month,
    required Company division,
    required CogsDetailHeader cogsDetailHeader,
  }) {
    return BlocProvider(
      create: (context) => AccountingCogsDetailQueryBloc()
        ..add(
          AccountingCogsDetailQueryEvent.fetch(
            categoryId: int.parse(cogs.categoryId!),
            month: month,
            year: year,
            division: division.id,
          ),
        ),
      child: AccountingCogsReportDataDetail._(
        cogs: cogs,
        division: division,
        month: month,
        year: year,
        cogsDetailHeader: cogsDetailHeader,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            BlocBuilder<AccountingCogsDetailQueryBloc,
                AccountingCogsDetailQueryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: SizedBox.shrink,
                  loaded: (cogsDetails) => Visibility(
                    visible: cogsDetails.isNotEmpty,
                    child: ExportCogsDetailExcelButton(
                      excelCogsDetailValue: ExcelCogsDetailValue(
                        period:
                            DateFormat('yyyyMM').format(DateTime(year, month)),
                        division: division.name,
                        typeName: cogs.name,
                        cogsDetails: cogsDetails,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const Gap(12),
        const Text(
          'Accurately Track Your Cost of Goods Sold (COGS): A Detailed '
          'Transaction Log for Transparent Financial Reporting.',
        ),
        const Gap(24),
        BlocBuilder<AccountingCogsDetailQueryBloc,
            AccountingCogsDetailQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (cogsDetails) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                            cogsDetailHeader.headers.length,
                            (index) => CellTable(
                              title: cogsDetailHeader.headers[index].label,
                              isHeader: true,
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(cogsDetails.length, (index) {
                        final cogsDetail = cogsDetails[index];
                        return Row(
                          children: [
                            CellTable(
                              title: cogsDetail.transaction,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.transactionNo),
                            ),
                            CellTable(
                              title: cogsDetail.purchaseOrder,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.purchaseOrderNo),
                            ),
                            CellTable(
                              title: cogsDetail.productId,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.productId),
                            ),
                            CellTable(
                              title: cogsDetail.productName,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.productName),
                            ),
                            CellTable(
                              title: cogsDetail.batch,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.batchNo),
                            ),
                            CellTable(
                              title: cogsDetail.materialId,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.materialId),
                            ),
                            CellTable(
                              title: cogsDetail.materialName,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.materialName),
                            ),
                            CellTable(
                              title: cogsDetail.na,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.na),
                            ),
                            CellTable(
                              title: cogsDetail.quantity.toString(),
                              isNum: true,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.quantity),
                            ),
                            CellTable(
                              title: cogsDetail.price.idr,
                              isNum: true,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.price),
                            ),
                            CellTable(
                              title: cogsDetail.value.idr,
                              isNum: true,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.value),
                            ),
                            CellTable(
                              title: cogsDetail.remark,
                              isVisible: cogsDetailHeader.headers
                                  .contains(CogsDetailColumn.remark),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                );
              },
              orElse: () => const Center(child: CupertinoActivityIndicator()),
            );
          },
        ),
      ],
    );
  }
}

class CellTable extends StatelessWidget {
  const CellTable({
    required this.title,
    super.key,
    this.borderSide = true,
    this.isHeader = false,
    this.isNum = false,
    this.isVisible = true,
  });
  final String title;
  final bool borderSide;
  final bool isHeader;
  final bool isNum;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final fBorderSide = BorderSide(color: Colors.grey.shade200);
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          border: Border(
            bottom: fBorderSide,
            left: borderSide ? fBorderSide : BorderSide.none,
          ),
        ),
        child: Align(
          alignment: isHeader
              ? Alignment.center
              : isNum
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }
}

class CogsDetailListTile extends StatelessWidget {
  const CogsDetailListTile({
    required this.cogsDetail,
    super.key,
  });

  final CogsDetail cogsDetail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return ListTile(
      title: Text(
        cogsDetail.transaction,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        cogsDetail.value.idr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
      subtitle: Text('${cogsDetail.quantity} × ${cogsDetail.price.idr}'),
    );
  }
}

enum CogsDetailHeader {
  beginningBalanceWip(
    [
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      CogsDetailColumn.quantity,
      CogsDetailColumn.value,
    ],
    'Beginning balance, WIP',
  ),
  endingBalanceWip(
    [
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      CogsDetailColumn.quantity,
      CogsDetailColumn.value,
    ],
    'Ending balance, WIP',
  ),
  jasaMaklonProductEthical(
    [
      CogsDetailColumn.transactionNo,
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      CogsDetailColumn.quantity,
      CogsDetailColumn.value,
    ],
    'Jasa maklon produk Ethical TL di MF',
  ),
  purchaseBloodStop(
    [
      CogsDetailColumn.purchaseOrderNo,
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      //BBX
      CogsDetailColumn.quantity,
      CogsDetailColumn.price,
      CogsDetailColumn.value,
    ],
    'Purchase BloodSTOP',
  ),
  purchaseEthicalFromTl(
    [
      CogsDetailColumn.purchaseOrderNo,
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      //BBP
      CogsDetailColumn.quantity,
      CogsDetailColumn.price,
      CogsDetailColumn.value,
    ],
    'Purhase Ethical from TL',
  ),
  beginningBalanceFg(
    [
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      //HPP
      CogsDetailColumn.quantity,
      CogsDetailColumn.value,
    ],
    'Beginning balance, FG',
  ),
  otherFgOut(
    [
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      //HPP
      CogsDetailColumn.quantity,
      CogsDetailColumn.value,
      //Ditambahkan keluar untuk apa
    ],
    'Others FG Out',
  ),
  totalMaterialUsed(
    [
      CogsDetailColumn.batchNo,
      CogsDetailColumn.materialName,
      //HPP
      CogsDetailColumn.quantity,
      CogsDetailColumn.value,
      //Ditambahkan keluar untuk apa
    ],
    'TOTAL MATERIAL USED',
  ),
  allHeader(
    [
      CogsDetailColumn.transactionNo,
      CogsDetailColumn.purchaseOrderNo,
      CogsDetailColumn.productId,
      CogsDetailColumn.productName,
      CogsDetailColumn.batchNo,
      CogsDetailColumn.materialId,
      CogsDetailColumn.materialName,
      CogsDetailColumn.na,
      CogsDetailColumn.quantity,
      CogsDetailColumn.price,
      CogsDetailColumn.value,
      CogsDetailColumn.remark,
    ],
    'All Header',
  );

  const CogsDetailHeader(this.headers, this.category);
  final List<CogsDetailColumn> headers;
  final String category;
}

enum CogsDetailColumn {
  transactionNo('Transaction No'),
  purchaseOrderNo('Purchase Order No'),
  productId('Product ID'),
  productName('Product Name'),
  batchNo('Batch No'),
  materialId('Material ID'),
  materialName('Material Name'),
  na('NA'),
  quantity('Quantity'),
  price('Price'),
  value('Value'),
  remark('Remark');

  const CogsDetailColumn(this.label);
  final String label;
}
