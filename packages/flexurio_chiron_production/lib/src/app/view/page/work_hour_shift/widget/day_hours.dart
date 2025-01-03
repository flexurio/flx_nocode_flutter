import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DayHours extends StatefulWidget {
  const DayHours({
    required this.day,
    super.key,
  });

  final Day day;

  @override
  State<DayHours> createState() => _DayHoursState();
}

class _DayHoursState extends State<DayHours> {
  final _timeFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {'#': RegExp('[0-9]')},
  );
  var _isOpen = false;
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  void _update() {
    final now = DateTime.now();
    final schedule = WorkHour(
      0,
      timeOfDayFromString(_startController.text),
      timeOfDayFromString(_endController.text),
      widget.day,
      now,
      now,
    );
    context
        .read<WorkHourShiftScheduleBloc>()
        .add(WorkHourShiftScheduleEvent.update(schedule));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<WorkHourShiftScheduleBloc, WorkHourShiftScheduleState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (days, initial) {
            if (initial && days.containsKey(widget.day.day)) {
              final day = days[widget.day.day]!;
              _isOpen = true;
              _startController.text = day.start.toTime;
              _endController.text = day.end.toTime;
              setState(() {});
            }
          },
          orElse: () {},
        );
      },
      child: SizedBox(
        height: 70,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 160,
                child: Text(widget.day.day),
              ),
              CupertinoSwitch(
                activeColor: theme.colorScheme.primary,
                value: _isOpen,
                onChanged: (value) {
                  setState(() => _isOpen = value);
                  if (!_isOpen) {
                    context.read<WorkHourShiftScheduleBloc>().add(
                          WorkHourShiftScheduleEvent.delete(
                            widget.day,
                          ),
                        );
                  }
                },
              ),
              SizedBox(
                width: 120,
                child: Row(
                  children: [
                    const Gap(6),
                    Text(_isOpen ? 'Open' : 'Closed'),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Visibility(
                  visible: _isOpen,
                  child: Row(
                    children: [
                      Expanded(
                        child: FTextFormField(
                          inputFormatters: [_timeFormatter],
                          hintText: '--:--',
                          controller: _startController,
                          onChanged: (_) => _update(),
                        ),
                      ),
                      const Gap(12),
                      const Text('To'),
                      const Gap(12),
                      Expanded(
                        child: FTextFormField(
                          inputFormatters: [_timeFormatter],
                          hintText: '--:--',
                          controller: _endController,
                          onChanged: (_) => _update(),
                        ),
                      ),
                    ],
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
