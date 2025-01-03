import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleCloseButton extends StatelessWidget {
  const ScheduleCloseButton({
    required this.schedule,
    required this.isExternal, super.key,
  });
  final bool isExternal;

  static Widget prepare({
    required Schedule schedule,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ScheduleBloc(
        isExternal: isExternal,
      ),
      child: ScheduleCloseButton(
        schedule: schedule,
        isExternal: isExternal,
      ),
    );
  }

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.close;
    return IconButtonSmall(
      permission: PermissionProduction.scheduleClose(isExternal: isExternal),
      action: action,
      onPressed: () async {
        final bloc = context.read<ScheduleBloc>();
        final queryBloc = context.read<ScheduleQueryBloc>();
        await _showCloseDialog(
          bloc: bloc,
          context: context,
          action: action,
        ).then((value) {
          if (value ?? false) {
            queryBloc.add(const ScheduleQueryEvent.fetch());
          }
        });
      },
    );
  }

  Future<bool?> _showCloseDialog({
    required BuildContext context,
    required ScheduleBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.schedule;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ScheduleBloc, ScheduleState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ScheduleBloc, ScheduleState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: schedule.startTime.yMMMMd,
                onConfirm: () {
                  bloc.add(ScheduleEvent.close(schedule: schedule));
                },
              );
            },
          ),
        );
      },
    );
  }
}
