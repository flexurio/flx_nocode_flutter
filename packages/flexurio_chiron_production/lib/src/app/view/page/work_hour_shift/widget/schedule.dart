import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ScheduleForm extends StatelessWidget {
  const ScheduleForm._();

  static Widget prepare({required int shiftId}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WorkHourShiftScheduleBloc(shiftId)
            ..add(const WorkHourShiftScheduleEvent.get()),
        ),
      ],
      child: const ScheduleForm._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkHourShiftScheduleBloc, WorkHourShiftScheduleState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_, initial) {
            if (!initial) {
              Toast(context).dataChanged(DataAction.edit, Entity.workHourShift);
              Navigator.pop(context, true);
            }
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocBuilder<WorkHourShiftScheduleBloc, WorkHourShiftScheduleState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Set Standard Hour',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Gap(12),
                const Text(
                  'configure the standard hour '
                  'of operation for this shift.',
                ),
                const SizedBox(height: 30),
                const DayHours(day: Day.monday),
                const DayHours(day: Day.tuesday),
                const DayHours(day: Day.wednesday),
                const DayHours(day: Day.thursday),
                const DayHours(day: Day.friday),
                const DayHours(day: Day.saturday),
                const DayHours(day: Day.sunday),
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      permission: null,
                      action: DataAction.cancel,
                      isSecondary: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Gap(12),
                    Button(
                      permission: null,
                      isInProgress: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      action: DataAction.edit,
                      onPressed: () {
                        context
                            .read<WorkHourShiftScheduleBloc>()
                            .add(const WorkHourShiftScheduleEvent.submit());
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

TimeOfDay timeOfDayFromString(String time) {
  final timeValues = time.split(':');
  final hour = int.parse(timeValues[0]);
  final minute = int.parse(timeValues[1]);
  return TimeOfDay(hour: hour, minute: minute);
}
