import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/accounting_cogs_process_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/accounting_cogs_report_data_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class AccountingCogsReportData extends StatefulWidget {
  const AccountingCogsReportData({
    required this.cogs,
    required this.year,
    required this.division,
    super.key,
  });

  final List<CogsGrade1> cogs;
  final int year;
  final Company division;

  @override
  State<AccountingCogsReportData> createState() =>
      _AccountingCogsReportDataState();
}

class _AccountingCogsReportDataState extends State<AccountingCogsReportData> {
  final cogsGradeVisibility = <String>[];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    final scrollController = LinkedScrollControllerGroup();
    final borderSide = BorderSide(color: Colors.grey.shade200);
    const contentCellHeight = 50.0;
    const contentCellWidth = 200.0;
    const stickyLegendWidth = 420.0;
    const stickyLegendHeight = 50.0;

    Container buildCogsName({
      required String name,
      required String id,
      required int indentation,
      required bool hasChildren,
      bool borderTop = true,
      bool borderBottom = false,
    }) {
      final visible = cogsGradeVisibility.contains(id);
      return Container(
        padding: EdgeInsets.only(
          left: paddingHorizontalPage * indentation,
          right: 12,
        ),
        alignment: Alignment.centerLeft,
        height: contentCellHeight,
        width: stickyLegendWidth,
        decoration: BoxDecoration(
          border: Border(
            top: borderTop ? borderSide : BorderSide.none,
            right: borderSide,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: visible ? primaryColor : null,
                  fontWeight: visible ? FontWeight.bold : null,
                ),
              ),
            ),
            Visibility(
              visible: hasChildren,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                onTap: () {
                  if (visible) {
                    cogsGradeVisibility.remove(id);
                  } else {
                    cogsGradeVisibility.add(id);
                  }
                  setState(() {});
                },
                child: Icon(
                  visible
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: visible ? primaryColor : null,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildRowTitleCogsGrade3(int row, int index2, int index3, String id) {
      final id3 = '$id.$index2.$index3';
      final visible = cogsGradeVisibility.contains(id3);
      return Column(
        children: [
          buildCogsName(
            hasChildren: widget.cogs[row].children[index2].children[index3]
                .children.isNotEmpty,
            name: widget.cogs[row].children[index2].children[index3].name,
            id: id3,
            indentation: 3,
          ),
          ...List.generate(
            widget.cogs[row].children[index2].children[index3].children.length,
            (index4) {
              return Visibility(
                visible: visible,
                child: buildCogsName(
                  hasChildren: false,
                  name: widget.cogs[row].children[index2].children[index3]
                      .children[index4].name,
                  id: '$id.$index2.$index3.$index4',
                  indentation: 4,
                ),
              );
            },
          ),
        ],
      );
    }

    Widget buildRowTitleCogsGrade2(
      int row,
      int index2,
      String id,
    ) {
      final id2 = '$id.$index2';
      final visible = cogsGradeVisibility.contains(id2);
      return Column(
        children: [
          buildCogsName(
            hasChildren: widget.cogs[row].children[index2].children.isNotEmpty,
            name: widget.cogs[row].children[index2].name,
            id: id2,
            indentation: 2,
          ),
          ...List.generate(
            widget.cogs[row].children[index2].children.length,
            (index3) => Visibility(
              visible: visible,
              child: buildRowTitleCogsGrade3(
                row,
                index2,
                index3,
                id,
              ),
            ),
          ),
        ],
      );
    }

    Widget buildRowTitleCogsGrade1(int row) {
      final id = '$row';
      final visible = cogsGradeVisibility.contains(id);
      return Column(
        children: [
          buildCogsName(
            name: widget.cogs[row].name,
            id: id,
            indentation: 1,
            borderTop: row != 0,
            hasChildren: widget.cogs[row].children.isNotEmpty,
          ),
          ...List.generate(
            widget.cogs[row].children.length,
            (index2) => Visibility(
              visible: visible,
              child: buildRowTitleCogsGrade2(row, index2, id),
            ),
          ),
        ],
      );
    }

    Container buildColumnsTitle(int i) {
      final now = DateTime.now();
      final data = DateTime(now.year, i + 1);
      return Container(
        height: stickyLegendHeight,
        width: contentCellWidth,
        decoration: BoxDecoration(
          border: Border(
            top: borderSide,
            bottom: borderSide,
            left: i == 0 ? BorderSide.none : borderSide,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('MMMM').format(data),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildCogsValue({
      required Cogs cogs,
      required int month,
      bool borderTop = false,
      bool borderLeft = false,
    }) {
      return Container(
        height: contentCellHeight,
        width: contentCellWidth,
        padding:
            const EdgeInsets.symmetric(horizontal: paddingHorizontalPage - 6),
        decoration: BoxDecoration(
          border: Border(
            top: borderTop ? borderSide : BorderSide.none,
            left: borderLeft ? borderSide : BorderSide.none,
          ),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: cogs.categoryId == null
                  ? null
                  : () {
                      showDialog<void>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            scrollable: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radiusPopup),
                            ),
                            insetPadding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 48,
                            ),
                            content: AccountingCogsReportDataDetail.prepare(
                              cogs: cogs,
                              year: widget.year,
                              month: month,
                              division: widget.division,
                              cogsDetailHeader: _getCogsDetailHeader(cogs.name),
                            ),
                          );
                        },
                      );
                    },
              child: Container(
                decoration: cogs.categoryId == null
                    ? null
                    : BoxDecoration(color: Colors.orange.shade50),
                padding: const EdgeInsets.all(6),
                child: Text(
                  cogs.getValueByMonth(month).idr,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildRowValueCogsGrade3(
      int id,
      int index2,
      int index3,
      int column,
    ) {
      final id3 = '$id.$index2.$index3';
      final visible = cogsGradeVisibility.contains(id3);
      return Column(
        children: [
          buildCogsValue(
            cogs: widget.cogs[id].children[index2].children[index3],
            borderTop: true,
            borderLeft: column != 0,
            month: column + 1,
          ),
          ...List.generate(
            widget.cogs[id].children[index2].children[index3].children.length,
            (index4) {
              return Visibility(
                visible: visible,
                child: buildCogsValue(
                  cogs: widget.cogs[id].children[index2].children[index3]
                      .children[index4],
                  borderTop: true,
                  borderLeft: column != 0,
                  month: column + 1,
                ),
              );
            },
          ),
        ],
      );
    }

    Widget buildRowValueCogsGrade2(
      int id,
      int index2,
      int column,
    ) {
      final id2 = '$id.$index2';
      final visible = cogsGradeVisibility.contains(id2);
      return Column(
        children: [
          buildCogsValue(
            cogs: widget.cogs[id].children[index2],
            borderTop: true,
            borderLeft: column != 0,
            month: column + 1,
          ),
          ...List.generate(
            widget.cogs[id].children[index2].children.length,
            (index3) => Visibility(
              visible: visible,
              child: buildRowValueCogsGrade3(
                id,
                index2,
                index3,
                column,
              ),
            ),
          ),
        ],
      );
    }

    Widget buildRowValueCogsGrade1(int row, int column) {
      final id = '$row';
      final visible = cogsGradeVisibility.contains(id);
      return Column(
        children: [
          buildCogsValue(
            cogs: widget.cogs[row],
            borderTop: row != 0,
            borderLeft: column != 0,
            month: column + 1,
          ),
          ...List.generate(
            widget.cogs[row].children.length,
            (index) => Visibility(
              visible: visible,
              child: buildRowValueCogsGrade2(row, index, column),
            ),
          ),
        ],
      );
    }

    return FCard(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: borderSide,
            top: borderSide,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: stickyLegendWidth,
              child: Column(
                children: [
                  Container(
                    height: stickyLegendHeight,
                    width: stickyLegendWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: borderSide,
                        right: borderSide,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingHorizontalPage,
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        Text(
                          'Transactions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        AccountingCogsProcessButton(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      key: UniqueKey(),
                      controller: scrollController.addAndGet(),
                      itemCount: widget.cogs.length,
                      itemBuilder: (context, index) {
                        return buildRowTitleCogsGrade1(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: Scrollbar(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          buildColumnsTitle(index),
                          Expanded(
                            child: SizedBox(
                              width: contentCellWidth,
                              child: ScrollConfiguration(
                                behavior:
                                    ScrollConfiguration.of(context).copyWith(
                                  scrollbars: false,
                                ),
                                child: ListView(
                                  key: UniqueKey(),
                                  controller: scrollController.addAndGet(),
                                  children:
                                      List.generate(widget.cogs.length, (row) {
                                    return buildRowValueCogsGrade1(
                                      row,
                                      index,
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CogsDetailHeader _getCogsDetailHeader(String cogsDetailName) {
    if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.purchaseBloodStop.category.toLowerCase()) {
      return CogsDetailHeader.purchaseBloodStop;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.beginningBalanceWip.category.toLowerCase()) {
      return CogsDetailHeader.beginningBalanceWip;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.jasaMaklonProductEthical.category.toLowerCase()) {
      return CogsDetailHeader.jasaMaklonProductEthical;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.endingBalanceWip.category.toLowerCase()) {
      return CogsDetailHeader.endingBalanceWip;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.purchaseEthicalFromTl.category.toLowerCase()) {
      return CogsDetailHeader.purchaseEthicalFromTl;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.beginningBalanceFg.category.toLowerCase()) {
      return CogsDetailHeader.beginningBalanceFg;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.otherFgOut.category.toLowerCase()) {
      return CogsDetailHeader.otherFgOut;
    } else if (cogsDetailName.toLowerCase() ==
        CogsDetailHeader.totalMaterialUsed.category.toLowerCase()) {
      return CogsDetailHeader.totalMaterialUsed;
    } else {
      return CogsDetailHeader.allHeader;
    }
  }
}
