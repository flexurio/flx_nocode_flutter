import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDeleteButton extends StatelessWidget {
  const ScheduleDeleteButton({
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
      child: ScheduleDeleteButton(
        schedule: schedule,
        isExternal: isExternal,
      ),
    );
  }

  final Schedule schedule;
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.scheduleDelete(isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () {
        final bloc = context.read<ScheduleBloc>();
        final queryBloc = context.read<ScheduleQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          const action = DataAction.delete;
          final entity = Entity.schedule;
          if (value ?? false) {
            queryBloc.add(const ScheduleQueryEvent.fetch());
          }
          return () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          };
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    ScheduleBloc bloc,
  ) {
    const action = DataAction.delete;
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
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: schedule.startTime.yMMMMd,
                onConfirm: () {
                  bloc.add(ScheduleEvent.delete(schedule: schedule));
                },
              );
            },
          ),
        );
      },
    );
  }
}
