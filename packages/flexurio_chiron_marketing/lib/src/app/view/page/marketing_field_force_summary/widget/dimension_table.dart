import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_query/field_force_summary_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DimensionTable extends StatefulWidget {
  const DimensionTable({
    required this.listSummary,
    required this.areaCode,
    required this.periodStart,
    required this.periodEnd,
    required this.summaryBloc,
    required this.flag,
    required this.onFlagChanged,
    required this.onSelectedRow,
    required this.label,
    super.key,
  });

  final String areaCode;
  final DateTime periodStart;
  final DateTime periodEnd;
  final FieldForceSummaryFlag flag;
  final (String?, String?) Function(FieldForceSummary) label;
  final void Function(FieldForceSummary summary, FieldForceSummaryFlag flag)
      onSelectedRow;
  final void Function(FieldForceSummaryFlag)? onFlagChanged;

  static Widget prepare({
    required FieldForceSummaryQueryBloc summaryBloc,
    required List<FieldForceSummaryWithDelta> data,
    required String areaCode,
    required DateTime periodStart,
    required DateTime periodEnd,
    required FieldForceSummaryFlag flag,
    required (String?, String?) Function(FieldForceSummary) label,
    required void Function(
      FieldForceSummary summary,
      FieldForceSummaryFlag flag,
    ) onSelectedRow,
    required void Function(FieldForceSummaryFlag)? onFlagChanged,
  }) {
    return SizedBox(
      height: 400,
      child: DimensionTable(
        label: label,
        listSummary: data,
        periodEnd: periodEnd,
        periodStart: periodStart,
        areaCode: areaCode,
        summaryBloc: summaryBloc,
        flag: flag,
        onFlagChanged: onFlagChanged,
        onSelectedRow: onSelectedRow,
      ),
    );
  }

  final List<FieldForceSummaryWithDelta>? listSummary;
  final FieldForceSummaryQueryBloc summaryBloc;

  @override
  State<DimensionTable> createState() => _DimensionTableState();
}

class _DimensionTableState extends State<DimensionTable> {
  final _headers = <String>['Code', 'Name', 'ΔN-1', 'ΔN-2', 'ΔN-3', 'Amount'];
  var _sortIndex = 2;
  var _ascending = true;

  @override
  Widget build(BuildContext context) {
    final listSummarySorted =
        List<FieldForceSummaryWithDelta>.from(widget.listSummary!)
          ..sort((a, b) {
            final (idA, nameA) = widget.label(a.summary);
            final (idB, nameB) = widget.label(b.summary);

            if (_ascending) {
              switch (_sortIndex) {
                case 0:
                  return idA!.compareTo(idB!);
                case 1:
                  return nameA!.compareTo(nameB!);
                case 2:
                  return a.deltaN1.compareTo(b.deltaN1);
                case 3:
                  return a.deltaN2.compareTo(b.deltaN2);
                case 4:
                  return a.deltaN3.compareTo(b.deltaN3);
                default:
                  return double.parse(a.summary.amount)
                      .compareTo(double.parse(b.summary.amount));
              }
            } else {
              switch (_sortIndex) {
                case 0:
                  return idB!.compareTo(idA!);
                case 1:
                  return nameB!.compareTo(nameA!);
                case 2:
                  return b.deltaN1.compareTo(a.deltaN1);
                case 3:
                  return b.deltaN2.compareTo(a.deltaN2);
                case 4:
                  return b.deltaN3.compareTo(a.deltaN3);
                default:
                  return double.parse(b.summary.amount)
                      .compareTo(double.parse(a.summary.amount));
              }
            }
          });

    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    Widget buildTableHeader(
      int labelIndex,
      MainAxisAlignment mainAxisAlignment,
    ) {
      const headerTableStyle =
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
      return InkWell(
        onTap: () {
          if (_sortIndex == labelIndex) {
            _ascending = !_ascending;
          } else {
            _sortIndex = labelIndex;
          }
          setState(() {});
        },
        child: Container(
          color: primaryColor.withOpacity(.8),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Text(
                _headers[labelIndex],
                style: headerTableStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Visibility(
                visible: _sortIndex == labelIndex,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    _ascending ? Icons.arrow_downward : Icons.arrow_upward,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FlagTitle(flag: widget.flag, onFlagChanged: widget.onFlagChanged),
        const SizedBox(height: 28),
        Expanded(
          child: ColoredBox(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: buildTableHeader(0, MainAxisAlignment.start),
                    ),
                    Expanded(
                      child: buildTableHeader(1, MainAxisAlignment.start),
                    ),
                    SizedBox(
                      width: 66,
                      child: buildTableHeader(2, MainAxisAlignment.end),
                    ),
                    SizedBox(
                      width: 66,
                      child: buildTableHeader(3, MainAxisAlignment.end),
                    ),
                    SizedBox(
                      width: 66,
                      child: buildTableHeader(4, MainAxisAlignment.end),
                    ),
                    SizedBox(
                      width: 66,
                      child: buildTableHeader(5, MainAxisAlignment.end),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listSummarySorted.length,
                    itemBuilder: (context, index) {
                      final (id, name) =
                          widget.label(listSummarySorted[index].summary);
                      return Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () => widget.onSelectedRow(
                            listSummarySorted[index].summary,
                            widget.flag,
                          ),
                          hoverColor: primaryColor.withOpacity(.2),
                          child: ColoredBox(
                            color: primaryColor
                                .withOpacity(index.isEven ? .08 : 0),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  width: 80,
                                  child: Text(
                                    id ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: Tooltip(
                                      message: name ?? '',
                                      child: Text(
                                        name ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  width: 66,
                                  child: Text(
                                    listSummarySorted[index].deltaN1.compact,
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  width: 66,
                                  child: Text(
                                    listSummarySorted[index].deltaN2.compact,
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  width: 66,
                                  child: Text(
                                    listSummarySorted[index].deltaN3.compact,
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  width: 66,
                                  child: Text(
                                    double.parse(
                                      listSummarySorted[index].summary.amount,
                                    ).compact,
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FlagTitle extends StatelessWidget {
  const _FlagTitle({
    required this.flag,
    required this.onFlagChanged,
  });

  final FieldForceSummaryFlag flag;
  final void Function(FieldForceSummaryFlag)? onFlagChanged;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onFlagChanged == null,
      child: PopupMenuButton(
        onSelected: onFlagChanged,
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: FieldForceSummaryFlag.outlet,
            child: Text('Outlet'),
          ),
          const PopupMenuItem(
            value: FieldForceSummaryFlag.customer,
            child: Text('Customer'),
          ),
          const PopupMenuItem(
            value: FieldForceSummaryFlag.product,
            child: Text('Product'),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              flag.icon,
              const Gap(24),
              Text(
                flag.label,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Gap(8),
              Visibility(
                visible: onFlagChanged != null,
                child: const Icon(FontAwesomeIcons.caretDown, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
