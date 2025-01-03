import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.role,
  });

  static Widget prepare({
    required Role role,
  }) {
    return BlocProvider(
      create: (context) =>
          RoleBloc(accessToken: UserRepositoryApp.instance.token!),
      child: DeleteButton._(role: role),
    );
  }

  final Role role;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.roleDelete,
      action: DataAction.delete,
      onPressed: () async {
        final roleBloc = context.read<RoleBloc>();
        final queryBloc = context.read<RoleQueryBloc>();
        final success = await _showConfirmationDialog(context, roleBloc);
        if (success ?? false) {
          queryBloc.add(const RoleQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    RoleBloc roleBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<RoleBloc, RoleState>(
          bloc: roleBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.role);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<RoleBloc, RoleState>(
            bloc: roleBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.role,
                label: role.name,
                onConfirm: () {
                  roleBloc.add(
                    RoleEvent.delete(role: role),
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
