import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountGroupDeleteButton extends StatelessWidget {
  const ChartOfAccountGroupDeleteButton({
    required this.chartOfAccountGroup,
    super.key,
  });

  static Widget prepare({
    required ChartOfAccountGroup chartOfAccountGroup,
  }) {
    return BlocProvider(
      create: (context) => ChartOfAccountGroupBloc(),
      child: ChartOfAccountGroupDeleteButton(
        chartOfAccountGroup: chartOfAccountGroup,
      ),
    );
  }

  final ChartOfAccountGroup chartOfAccountGroup;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionAccounting.chartOfAccountGroupDelete,
      action: DataAction.delete,
      onPressed: () {
        final bloc = context.read<ChartOfAccountGroupBloc>();
        final queryBloc = context.read<ChartOfAccountGroupQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          const action = DataAction.delete;
          final entity = Entity.chartOfAccountGroup;
          if (value ?? false) {
            queryBloc.add(ChartOfAccountGroupQueryEvent.fetch());
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
    ChartOfAccountGroupBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.chartOfAccountGroup;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ChartOfAccountGroupBloc, ChartOfAccountGroupState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(DataAction.delete, Entity.chartOfAccountGroup);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ChartOfAccountGroupBloc, ChartOfAccountGroupState>(
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
                label: chartOfAccountGroup.name,
                onConfirm: () {
                  bloc.add(
                    ChartOfAccountGroupEvent.delete(
                      id: chartOfAccountGroup.id,
                    ),
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
