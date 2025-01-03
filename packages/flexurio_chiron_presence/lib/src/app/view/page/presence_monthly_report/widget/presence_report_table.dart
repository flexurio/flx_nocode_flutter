import 'package:flexurio_chiron_presence/src/app/model/presence.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class PresenceReportTable extends StatelessWidget {
  const PresenceReportTable({
    required this.presences,
    required this.startDateTime,
    super.key,
  });

  final Map<String, Map<int, Presence>> presences;
  final DateTime startDateTime;

  @override
  Widget build(BuildContext context) {
    final scrollController = LinkedScrollControllerGroup();
    final borderSide = BorderSide(color: Colors.grey.shade200);
    const contentCellHeight = 70.0;
    const contentCellWidth = 120.0;
    const stickyLegendWidth = 300.0;
    const stickyLegendHeight = 60.0;

    final users = presences.keys.toList();

    final lastDayOfMonth =
        DateTime(startDateTime.year, startDateTime.month + 1, 0).day;

    Container buildColumnsTitle(int i) {
      final date = DateTime(startDateTime.year, startDateTime.month, 1 + i);
      return Container(
        height: stickyLegendHeight,
        width: contentCellWidth,
        decoration: BoxDecoration(
          color: date.isWeekend ? Colors.yellow.shade50 : null,
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
                DateFormat('MMM dd').format(date),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('EEE').format(date),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Container buildRowsTitle(int row) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingHorizontalPage,
          vertical: 12,
        ),
        alignment: Alignment.centerLeft,
        height: contentCellHeight,
        width: stickyLegendWidth,
        decoration: BoxDecoration(
          border: Border(
            top: row == 0 ? BorderSide.none : borderSide,
            right: borderSide,
          ),
        ),
        child: Text(users[row]),
      );
    }

    Container buildContentCell(int row, int column) {
      final presence = presences[users[row]]?[column + 1];
      final isWeekend =
          DateTime(startDateTime.year, startDateTime.month, 1 + column)
              .isWeekend;
      return Container(
        height: contentCellHeight,
        width: contentCellWidth,
        decoration: BoxDecoration(
          color: isWeekend ? Colors.yellow.shade50 : null,
          border: Border(
            top: row == 0 ? BorderSide.none : borderSide,
            left: column == 0 ? BorderSide.none : borderSide,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                '${presence?.inTime ?? '--:--'}\n'
                '${presence?.outTime ?? '--:--'}',
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 30,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: presence != null
                      ? ('08:00'.compareTo(presence.inTime!) < 0
                          ? Colors.orange.shade300
                          : Colors.lightGreen[300])
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 4,
              ),
            ),
          ],
        ),
      );
    }

    return DecoratedBox(
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
                    vertical: 12,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Employee',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController.addAndGet(),
                    itemBuilder: (context, index) {
                      return buildRowsTitle(index);
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
                  itemCount: lastDayOfMonth,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        buildColumnsTitle(index),
                        Expanded(
                          child: SizedBox(
                            width: contentCellWidth,
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: ListView(
                                controller: scrollController.addAndGet(),
                                children: List.generate(users.length, (row) {
                                  return buildContentCell(row, index);
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
    );
  }
}
