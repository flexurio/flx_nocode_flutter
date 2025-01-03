import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.department,
  });

  static Widget prepare({
    required Department department,
  }) {
    return BlocProvider(
      create: (context) => DepartmentBloc(),
      child: DeleteButton._(department: department),
    );
  }

  final Department department;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      onPressed: () async {
        final departmentBloc = context.read<DepartmentBloc>();
        final queryBloc = context.read<DepartmentQueryBloc>();
        final success = await _showConfirmationDialog(context, departmentBloc);
        if (success ?? false) {
          queryBloc.add(const DepartmentQueryEvent.fetch());
        }
      },
      permission: Permission.departmentDelete,
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    DepartmentBloc departmentBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<DepartmentBloc, DepartmentState>(
          bloc: departmentBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.department);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<DepartmentBloc, DepartmentState>(
            bloc: departmentBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.department,
                label: department.name,
                onConfirm: () {
                  departmentBloc.add(
                    DepartmentEvent.delete(department: department),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
