import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force.dart';
import 'package:flexurio_chiron_marketing/src/app/util/summary_field_force_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryFieldForceReportData extends StatefulWidget {
  const SummaryFieldForceReportData({
    required this.summaryFieldForces,
    required this.periodStart,
    required this.periodEnd,
    required this.areaCode,
    required this.jab,
    super.key,
  });

  final List<SummaryFieldForceGrade1> summaryFieldForces;
  final int periodStart;
  final int periodEnd;
  final String areaCode;
  final String jab;

  @override
  State<SummaryFieldForceReportData> createState() =>
      _SummaryFieldForceReportDataState();
}

class _SummaryFieldForceReportDataState
    extends State<SummaryFieldForceReportData> {
  final summaryFieldForceGradeVisibility = <String>[];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    final borderSide = BorderSide(color: Colors.grey.shade200);
    const contentCellHeight = 50.0;
    const contentCellWidth = 200.0;
    const stickyLegendWidth = 420.0;
    const stickyLegendHeight = 50.0;

    final titlePeriod = widget.summaryFieldForces[0].amounts;
    final titleLength = titlePeriod!.keys.length;

    Container buildSummaryFieldForceName({
      required String name,
      required String id,
      required int indentation,
      required bool hasChildren,
      bool borderTop = true,
      bool borderBottom = false,
    }) {
      final visible = summaryFieldForceGradeVisibility.contains(id);
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
                    summaryFieldForceGradeVisibility.remove(id);
                  } else {
                    summaryFieldForceGradeVisibility.add(id);
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

    Widget buildRowTitleSummaryFFsGrade3(
      int row,
      int index2,
      int index3,
      String id,
    ) {
      final id3 = '$id.$index2.$index3';
      final visible = summaryFieldForceGradeVisibility.contains(id3);
      return Column(
        children: [
          buildSummaryFieldForceName(
            hasChildren: widget.summaryFieldForces[row].children[index2]
                .children[index3].children.isNotEmpty,
            name: widget.summaryFieldForces[row].children[index2]
                .children[index3].category,
            id: id3,
            indentation: 3,
          ),
          ...List.generate(
            widget.summaryFieldForces[row].children[index2].children[index3]
                .children.length,
            (index4) {
              return Visibility(
                visible: visible,
                child: buildSummaryFieldForceName(
                  hasChildren: false,
                  name: widget.summaryFieldForces[row].children[index2]
                      .children[index3].children[index4].category,
                  id: '$id.$index2.$index3.$index4',
                  indentation: 4,
                ),
              );
            },
          ),
        ],
      );
    }

    Widget buildRowTitleSummaryFFsGrade2(
      int row,
      int index2,
      String id,
    ) {
      final id2 = '$id.$index2';
      final visible = summaryFieldForceGradeVisibility.contains(id2);
      return Column(
        children: [
          buildSummaryFieldForceName(
            hasChildren: widget
                .summaryFieldForces[row].children[index2].children.isNotEmpty,
            name: widget.summaryFieldForces[row].children[index2].category,
            id: id2,
            indentation: 2,
          ),
          ...List.generate(
            widget.summaryFieldForces[row].children[index2].children.length,
            (index3) => Visibility(
              visible: visible,
              child: buildRowTitleSummaryFFsGrade3(
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

    Widget buildRowTitleSummaryFFsGrade1(int row) {
      final id = '$row';
      final visible = summaryFieldForceGradeVisibility.contains(id);
      return Column(
        children: [
          buildSummaryFieldForceName(
            name: widget.summaryFieldForces[row].category,
            id: id,
            indentation: 1,
            borderTop: row != 0,
            hasChildren: widget.summaryFieldForces[row].children.isNotEmpty,
          ),
          ...List.generate(
            widget.summaryFieldForces[row].children.length,
            (index2) => Visibility(
              visible: visible,
              child: buildRowTitleSummaryFFsGrade2(row, index2, id),
            ),
          ),
        ],
      );
    }

    Container buildColumnsTitle(int i) {
      final data = widget.summaryFieldForces[0].amounts;
      final dataKey =
          '${DateFormat('MMMM').format(data!.keys.toList()[i])} ${data.keys.toList()[i].year}';

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
                dataKey,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildSummaryFFsValue({
      required SummaryFieldForce summaryFieldForce,
      required int month,
      bool borderTop = false,
      bool borderLeft = false,
    }) {
      String value;

      if (summaryFieldForce.categoryParent == 'QTY') {
        if (summaryFieldForce.typeRow != 'one') {
          value = summaryFieldForce.getValueByMonth(month).round().toString();
        } else {
          value = '';
        }
      } else if (summaryFieldForce.categoryParent == 'SKI') {
        if (summaryFieldForce.typeRow != 'one') {
          if (summaryFieldForce.category == 'KU') {
            value = summaryFieldForce
                .getValueByMonth(month)
                .idr
                .replaceAll(',00', '');
          } else {
            value = summaryFieldForce.getValueByMonth(month).toString();
          }
        } else {
          value = '';
        }
      } else if (summaryFieldForce.categoryParent == 'SALES VS TARGET %') {
        value = '${summaryFieldForce.getValueByMonth(month)} %';
      } else if (summaryFieldForce.categoryParent == 'STOCK') {
        if (summaryFieldForce.typeRow == 'two') {
          if (summaryFieldForce.category == 'PRODUCT') {
            value = '';
          } else {
            value = summaryFieldForce
                .getValueByMonth(month)
                .idr
                .replaceAll(',00', '');
          }
        } else {
          value = summaryFieldForce
              .getValueByMonth(month)
              .idr
              .replaceAll(',00', '');
        }
      } else if (summaryFieldForce.categoryParent == 'SALES') {
        if (summaryFieldForce.typeRow == 'two') {
          if (summaryFieldForce.category == 'PRODUCT') {
            value = '';
          } else {
            value = summaryFieldForce
                .getValueByMonth(month)
                .idr
                .replaceAll(',00', '');
          }
        } else {
          value = summaryFieldForce
              .getValueByMonth(month)
              .idr
              .replaceAll(',00', '');
        }
      } else if (summaryFieldForce.categoryParent == 'EBITDA') {
        if (summaryFieldForce.typeRow == 'two') {
          if (summaryFieldForce.category == 'MTD %' ||
              summaryFieldForce.category == 'YTD %') {
            value = '';
          } else {
            value = summaryFieldForce
                .getValueByMonth(month)
                .idr
                .replaceAll(',00', '');
          }
        } else if (summaryFieldForce.typeRow == 'one') {
          value = '';
        } else {
          if (summaryFieldForce.typeRow == 'three' ||
              summaryFieldForce.typeRow == 'four') {
            if (summaryFieldForce.category == 'COGS VS SALES') {
              value = '';
            } else if (summaryFieldForce.flag == 'MTD %' ||
                summaryFieldForce.flag == 'YTD %') {
              final valuePercent = summaryFieldForce.getValueByMonth(month);
              if (valuePercent >= 100) {
                value = '${valuePercent.toStringAsFixed(0)} %';
              } else {
                value = '${valuePercent.toStringAsFixed(2)} %';
              }
            } else {
              value = summaryFieldForce
                  .getValueByMonth(month)
                  .idr
                  .replaceAll(',00', '');
            }
          } else {
            value = summaryFieldForce
                .getValueByMonth(month)
                .idr
                .replaceAll(',00', '');
          }
        }
      } else {
        value =
            summaryFieldForce.getValueByMonth(month).idr.replaceAll(',00', '');
      }
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
              child: Container(
                padding: const EdgeInsets.all(6),
                child: Text(
                  value,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildRowValueSummaryFFsGrade3(
      int id,
      int index2,
      int index3,
      int column,
    ) {
      final id3 = '$id.$index2.$index3';
      final visible = summaryFieldForceGradeVisibility.contains(id3);
      return Column(
        children: [
          buildSummaryFFsValue(
            summaryFieldForce:
                widget.summaryFieldForces[id].children[index2].children[index3],
            borderTop: true,
            borderLeft: column != 0,
            month: column,
            // month: column + 1,
          ),
          ...List.generate(
            widget.summaryFieldForces[id].children[index2].children[index3]
                .children.length,
            (index4) {
              return Visibility(
                visible: visible,
                child: buildSummaryFFsValue(
                  summaryFieldForce: widget.summaryFieldForces[id]
                      .children[index2].children[index3].children[index4],
                  borderTop: true,
                  borderLeft: column != 0,
                  month: column,
                  // month: column + 1,
                ),
              );
            },
          ),
        ],
      );
    }

    Widget buildRowValueSummaryFFsGrade2(
      int id,
      int index2,
      int column,
    ) {
      final id2 = '$id.$index2';
      final visible = summaryFieldForceGradeVisibility.contains(id2);
      return Column(
        children: [
          buildSummaryFFsValue(
            summaryFieldForce: widget.summaryFieldForces[id].children[index2],
            borderTop: true,
            borderLeft: column != 0,
            month: column,
            // month: column + 1,
          ),
          ...List.generate(
            widget.summaryFieldForces[id].children[index2].children.length,
            (index3) => Visibility(
              visible: visible,
              child: buildRowValueSummaryFFsGrade3(
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

    Widget buildRowValueSummaryFFsGrade1(int row, int column) {
      final id = '$row';
      final visible = summaryFieldForceGradeVisibility.contains(id);
      final valueFlagAll = summaryFieldForceFlagAll;
      SummaryFieldForce valueFirst = widget.summaryFieldForces[row];
      final index = valueFlagAll
          .indexWhere((item) => item.category == valueFirst.category);
      if (index != -1) {
        valueFirst = valueFlagAll[index];
      }
      return Column(
        children: [
          buildSummaryFFsValue(
            summaryFieldForce: valueFirst,
            borderTop: row != 0,
            borderLeft: column != 0,
            month: column,
          ),
          ...List.generate(
            widget.summaryFieldForces[row].children.length,
            (index) => Visibility(
              visible: visible,
              child: buildRowValueSummaryFFsGrade2(row, index, column),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      child: FCard(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        key: UniqueKey(),
                        children: List.generate(
                          widget.summaryFieldForces.length,
                          buildRowTitleSummaryFFsGrade1,
                        ),
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          titleLength,
                          (index) {
                            return Column(
                              children: [
                                buildColumnsTitle(index),
                                SizedBox(
                                  child: SizedBox(
                                    width: contentCellWidth,
                                    child: Column(
                                      key: UniqueKey(),
                                      children: List.generate(
                                          widget.summaryFieldForces.length,
                                          (row) {
                                        return buildRowValueSummaryFFsGrade1(
                                          row,
                                          index,
                                        );
                                      }),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
