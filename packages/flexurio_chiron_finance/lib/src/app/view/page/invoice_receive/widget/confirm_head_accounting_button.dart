import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive/invoice_receive_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_query/invoice_receive_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveApproveButton extends StatelessWidget {
  const InvoiceReceiveApproveButton({required this.invoiceReceive, super.key});

  final InvoiceReceive invoiceReceive;

  static Widget prepare({
    required InvoiceReceive invoiceReceive,
  }) {
    return BlocProvider(
      create: (context) => InvoiceReceiveBloc(),
      child: InvoiceReceiveApproveButton(
        invoiceReceive: invoiceReceive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: Permission.invoiceReceiveApproveHeadAccounting,
      action: DataAction.approve,
      onPressed: () async {
        final bloc = context.read<InvoiceReceiveBloc>();
        final queryBloc = context.read<InvoiceReceiveQueryBloc>();
        final success = await _showDeleteDialog(context: context, bloc: bloc);
        if (success ?? false) {
          queryBloc.add(InvoiceReceiveQueryEvent.fetchById(invoiceReceive.id));
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required InvoiceReceiveBloc bloc,
  }) {
    final entity = Entity.invoiceReceive;
    const action = DataAction.approve;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<InvoiceReceiveBloc, InvoiceReceiveState>(
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
          child: BlocBuilder<InvoiceReceiveBloc, InvoiceReceiveState>(
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
                label: invoiceReceive.id,
                onConfirm: () {
                  bloc.add(
                    InvoiceReceiveEvent.approveHeadAccounting(
                      invoiceReceive: invoiceReceive,
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
