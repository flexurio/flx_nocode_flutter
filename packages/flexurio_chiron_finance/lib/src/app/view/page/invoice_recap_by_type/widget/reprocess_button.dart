import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReprocessButton extends StatelessWidget {
  const ReprocessButton._();

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceRecapByTypeBloc(),
      child: const ReprocessButton._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.reprocess;
    return LightButtonSmall(
      action: action,
      onPressed: () async {
        final bloc = context.read<InvoiceRecapByTypeBloc>();
        // final queryBloc = context.read<DepartmentQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc, action);
        if (success ?? false) {
          // queryBloc.add(const DepartmentQueryEvent.fetch());
        }
      },
      permission: PermissionFinance.invoiceRecapByTypeReprocess,
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    InvoiceRecapByTypeBloc bloc,
    DataAction action,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<InvoiceRecapByTypeBloc, InvoiceRecapByTypeState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  EntityFinance.invoiceRecapByType,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<InvoiceRecapByTypeBloc, InvoiceRecapByTypeState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: EntityFinance.invoiceRecapByType,
                onConfirm: () {
                  bloc.add(const InvoiceRecapByTypeEvent.reprocess());
                },
              );
            },
          ),
        );
      },
    );
  }
}
