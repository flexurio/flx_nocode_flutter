import 'package:flexurio_chiron_presence/src/app/model/presence_employee.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

final presenceHeaders = [
  'date'.tr(),
  'Office',
  'Work Hour',
  'Time In',
  'Time Out',
  'In Late',
  'Out Early',
  'Total',
  'Note',
];

class TablePresence extends StatelessWidget {
  const TablePresence({
    required this.presences,
    required this.dateTime,
    super.key,
  });

  final Map<int, PresenceEmployee?> presences;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    const cellPadding = EdgeInsets.all(12);
    const cellHeight = 42.0;
    final columnsWidth = <double>[
      180,
      150,
      100,
      80,
      80,
      80,
      80,
      80,
      600,
    ];

    const columnRightAlign = [3, 4, 5, 6, 7];

    final keys = presences.keys.toList();
    final values = presences.values.toList();

    return HorizontalDataTable(
      leftHandSideColumnWidth: columnsWidth.first,
      rightHandSideColumnWidth:
          columnsWidth.reduce((a, b) => a + b) - columnsWidth.first,
      isFixedHeader: true,
      headerWidgets: List.generate(
        presenceHeaders.length,
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
                presenceHeaders[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      leftSideItemBuilder: (context, index) {
        final date = DateTime(dateTime.year, dateTime.month, keys[index]);

        return Container(
          color: date.isWeekend ? Colors.yellow.shade50 : null,
          child: Row(
            children: [
              Padding(
                padding: cellPadding,
                child: Text(DateFormat('yyyy/MM/dd, EEEE').format(date)),
              ),
            ],
          ),
        );
      },
      rightSideItemBuilder: (context, index) {
        final presence = values[index];
        late Widget child;

        if (presence == null) {
          child = const Row(
            children: [SizedBox(height: cellHeight)],
          );
        } else {
          var column = 1;
          child = Row(
            children: [
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(presence.office.name),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('08:00-17:00'),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    presence.inTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    presence.outTime ?? '--:--',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: _InLateText(presence),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: _InOutEarlyText(presence),
                ),
              ),
              SizedBox(
                width: columnsWidth[column++],
                height: cellHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    presence.total?.toText ?? '--:--',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          );
        }

        final date = DateTime(dateTime.year, dateTime.month, keys[index]);
        return Container(
          color: date.isWeekend ? Colors.yellow.shade50 : null,
          child: child,
        );
      },
      itemCount: keys.length,
      rowSeparatorWidget: Divider(
        color: Colors.grey.shade300,
        height: 1,
        thickness: 0,
      ),
    );
  }
}

class _InLateText extends StatelessWidget {
  const _InLateText(this.presence);

  final PresenceEmployee presence;

  @override
  Widget build(BuildContext context) {
    return Text(
      presence.inLate.toText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: presence.isInLate ? Colors.green : Colors.red,
      ),
    );
  }
}

class _InOutEarlyText extends StatelessWidget {
  const _InOutEarlyText(this.presence);

  final PresenceEmployee presence;

  @override
  Widget build(BuildContext context) {
    Color? color;
    if (presence.outEarly != null) {
      color = presence.isOutEarly! ? Colors.red : Colors.green;
    }

    return Text(
      presence.outEarly?.toText ?? '--:--',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: color,
      ),
    );
  }
}
