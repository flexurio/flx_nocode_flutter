import 'package:flexurio_chiron_company/src/app/bloc/office/office_bloc.dart';
import 'package:flexurio_chiron_company/src/app/bloc/office_query/office_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeDeleteButton extends StatelessWidget {
  const OfficeDeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required int id,
  }) {
    return BlocProvider(
      create: (context) => OfficeBloc(),
      child: OfficeDeleteButton._(id: id),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.officeDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<OfficeBloc>();
        final queryBloc = context.read<OfficeQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const OfficeQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    OfficeBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<OfficeBloc, OfficeState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () => Navigator.pop(context, true),
              orElse: () {},
            );
          },
          child: BlocBuilder<OfficeBloc, OfficeState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.office,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(OfficeEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
