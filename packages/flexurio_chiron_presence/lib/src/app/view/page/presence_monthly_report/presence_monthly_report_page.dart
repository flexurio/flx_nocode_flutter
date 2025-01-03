import 'package:flexurio_chiron_presence/src/app/bloc/presence_monthly_report_query/presence_monthly_report_query_bloc.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report/widget/legends.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report/widget/presence_report_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MonthlyPresenceReportPage extends StatelessWidget {
  const MonthlyPresenceReportPage._();

  static Widget prepare() {
    final now = DateTime.now();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PresenceMonthlyReportQueryBloc()
            ..add(
              PresenceMonthlyReportQueryEvent.get(now.year, now.month),
            ),
        ),
      ],
      child: const MonthlyPresenceReportPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FCard(
            child: Column(
              children: [
                const ActionButtons(),
                Expanded(
                  child: BlocBuilder<PresenceMonthlyReportQueryBloc,
                      PresenceMonthlyReportQueryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (presences, startDateTime) {
                          return PresenceReportTable(
                            presences: presences,
                            startDateTime: startDateTime,
                          );
                        },
                        orElse: CupertinoActivityIndicator.new,
                      );
                    },
                  ),
                ),
                const Legends(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PresenceLegend extends StatelessWidget {
  const PresenceLegend({
    required this.color,
    required this.label,
    super.key,
  });

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 8,
        ),
        const Gap(6),
        Text(label),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(paddingHorizontalPage),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            child: Center(
              child: MonthPicker(),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MonthPicker extends StatefulWidget {
  const MonthPicker({
    super.key,
  });

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _date = DateTime(now.year, now.month);
  }

  void _changeMonth(int add) {
    setState(() {
      _date = DateTime(_date.year, _date.month + add);
    });
    context.read<PresenceMonthlyReportQueryBloc>().add(
          PresenceMonthlyReportQueryEvent.get(_date.year, _date.month),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _changeMonth(-1);
          },
          icon: const Icon(
            FontAwesomeIcons.chevronLeft,
            size: 15,
          ),
        ),
        const Gap(24),
        SizedBox(
          width: 150,
          child: Center(
            child: Text(
              DateFormat('MMMM yyyy').format(_date),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        const Gap(24),
        IconButton(
          onPressed: () {
            _changeMonth(1);
          },
          icon: const Icon(
            FontAwesomeIcons.chevronRight,
            size: 15,
          ),
        ),
      ],
    );
  }
}
