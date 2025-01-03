import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required int id,
  }) {
    return BlocProvider(
      create: (context) => WorkHourShiftBloc(),
      child: DeleteButton._(id: id),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.workHourShiftDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<WorkHourShiftBloc>();
        final queryBloc = context.read<WorkHourShiftQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const WorkHourShiftQueryEvent.get());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    WorkHourShiftBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<WorkHourShiftBloc, WorkHourShiftState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () => Navigator.pop(context, true),
              orElse: () {},
            );
          },
          child: BlocBuilder<WorkHourShiftBloc, WorkHourShiftState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.workHourShift,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(WorkHourShiftEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
