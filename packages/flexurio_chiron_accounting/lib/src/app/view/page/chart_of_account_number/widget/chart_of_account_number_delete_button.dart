import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountNumberDeleteButton extends StatelessWidget {
  const ChartOfAccountNumberDeleteButton({
    required this.chartOfAccountNumber,
    super.key,
  });

  static Widget prepare({
    required ChartOfAccountNumber chartOfAccountNumber,
  }) {
    return BlocProvider(
      create: (context) => ChartOfAccountNumberBloc(),
      child: ChartOfAccountNumberDeleteButton(
        chartOfAccountNumber: chartOfAccountNumber,
      ),
    );
  }

  final ChartOfAccountNumber chartOfAccountNumber;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = Entity.chartOfAccountNumber;
    return IconButtonSmall(
      permission: PermissionAccounting.chartOfAccountDelete,
      action: action,
      onPressed: () {
        final bloc = context.read<ChartOfAccountNumberBloc>();
        final queryBloc = context.read<ChartOfAccountNumberQueryBloc>();
        _showDeleteDialog(context, bloc).then(
          (value) {
            if (value ?? false) {
              queryBloc.add(ChartOfAccountNumberQueryEvent.fetch());
            }
            return () {
              Toast(context).dataChanged(action, entity);
              Navigator.pop(context, true);
            };
          },
        );
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    ChartOfAccountNumberBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.chartOfAccountNumber;
    return showDialog(
      context: context,
      builder: (context) {
        return BlocListener<ChartOfAccountNumberBloc,
            ChartOfAccountNumberState>(
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
          child:
              BlocBuilder<ChartOfAccountNumberBloc, ChartOfAccountNumberState>(
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
                label: chartOfAccountNumber.name,
                onConfirm: () {
                  bloc.add(
                    ChartOfAccountNumberEvent.delete(
                      id: chartOfAccountNumber.id,
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
